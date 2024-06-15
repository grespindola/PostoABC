
{------------------------------------------------------------------------------}
{ - PostoABC - Lançamento de Abastecimento                                     }
{   - permite lançar registros de abastecimentos                               }
{ Gustavo Espíndola - 14/06/2024                                               }
{------------------------------------------------------------------------------}


unit uAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastro, cxGraphics, cxLookAndFeels,
  Vcl.Menus, Data.DB, FireDAC.Stan.Intf, FireDAC.Comp.Client,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, AbastecimentoDAO, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, uDMPrincipal, Math;

type
  TfrmAbastecimento = class(TfrmCadastro)
    Label2: TLabel;
    edData: TDateTimePicker;
    Label1: TLabel;
    cbBomba: TDBLookupComboBox;
    qBombas: TFDQuery;
    dsBombas: TDataSource;
    edCombustivel: TDBEdit;
    Label3: TLabel;
    edPrecoLitro: TDBEdit;
    Label4: TLabel;
    edLitragem: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    edValorAbastecido: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edValorImposto: TDBEdit;
    Label10: TLabel;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure qBombasAfterScroll(DataSet: TDataSet);
    procedure edLitragemKeyPress(Sender: TObject; var Key: Char);
    procedure edLitragemChange(Sender: TObject);
    procedure qBombasAfterOpen(DataSet: TDataSet);

  private
    procedure KeyPressNumerico(Sender: TObject; var Key: Char);
    { Private declarations }
  public
    { Public declarations }
    AbaDAO : TAbastecimentoDAO;
    Constructor Create(AOwner: TComponent); Override;
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

uses uFuncoes;

{ TfrmAbastecimento }

constructor TfrmAbastecimento.Create(AOwner: TComponent);
begin
   AbaDAO := TAbastecimentoDAO.Create(DMPrincipal.FDConexao, Transacao);
   inherited Create(AOwner, AbaDAO, 'ABASTECIMENTO');

   if Datasource.DataSet.RecordCount > 0 then
      qBombas.Open;

   edData.DateTime := Now;
end;

procedure TfrmAbastecimento.edLitragemChange(Sender: TObject);
var
   nValor : Double;
begin
   inherited;
   nValor := StrToFloatDef(edLitragem.Text, 0);
   nValor := RoundTo(nValor, -3);

   if not qBombas.Active then
      Exit;
   if not btnGravar.Enabled then
      Exit;

   with Datasource.DataSet do
   begin
      if nValor > 0 then
      begin
         FieldByName('VALOR').AsFloat := nValor *
            qBombas.FieldByName('PRECO_LITRO').AsFloat;
         FieldByName('IMPOSTO').AsFloat := FieldByName('VALOR').AsFloat * 0.13;
      end
      else
      begin
         FieldByName('VALOR').AsFloat := 0;
         FieldByName('IMPOSTO').AsFloat := 0;
      end;
   end;
end;

procedure TfrmAbastecimento.edLitragemKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   validaFloat(sender, key);
end;

procedure TfrmAbastecimento.btnGravarClick(Sender: TObject);
begin
   with Datasource.DataSet do
   begin
      FieldByName('DATA').AsDateTime := edData.Date;
      FieldByName('HORA').AsDateTime := edData.Time;
   end;
   inherited;
end;

procedure TfrmAbastecimento.btnInserirClick(Sender: TObject);
begin
   inherited;

   edData.DateTime := Now;
   if not qBombas.Active then
   begin
      qBombas.Open;
      Datasource.DataSet.FieldByName('CODIGO_BOMBA').asInteger := 1;
   end;
   Datasource.DataSet.AfterScroll := qBombasAfterScroll;
   Datasource.DataSet.AfterOpen := qBombasAfterOpen;
   if cbBomba.CanFocus then
      cbBomba.SetFocus;
end;

procedure TfrmAbastecimento.btnPesquisarClick(Sender: TObject);
begin
   inherited;
   Pesquisar(Self, FTabela,
            'Código|&Número|Descrição|Tipo',
            'CODIGO|NUMERO|DESCRICAO|(CASE WHEN TIPO = 1 THEN ''Horário'' ELSE ''Consumo'' END)',
            'I|I|S|SS', 'ABASTECIMENTO',edtCodigo);
end;

procedure TfrmAbastecimento.KeyPressNumerico(Sender: TObject; var Key: Char);
begin
   inherited;
end;

procedure TfrmAbastecimento.qBombasAfterOpen(DataSet: TDataSet);
begin
   inherited;
   with Datasource.DataSet do
   begin

      TFloatField(FieldByName('LITROS')).Precision := 3;
      TFloatField(qBombas.FieldByName('PRECO_LITRO')).Precision := 3;
      TFloatField(FieldByName('VALOR')).Precision := 3;

      TFloatField(FieldByName('LITROS')).DisplayFormat := '0.000';
      TFloatField(qBombas.FieldByName('PRECO_LITRO')).DisplayFormat := '0.000';
      TFloatField(FieldByName('VALOR')).DisplayFormat := '0.000';

      TFloatField(FieldByName('LITROS')).EditFormat := '0.000';
      TFloatField(qBombas.FieldByName('PRECO_LITRO')).EditFormat := '0.000';
      TFloatField(FieldByName('VALOR')).EditFormat := '0.000';
   end;
end;

procedure TfrmAbastecimento.qBombasAfterScroll(DataSet: TDataSet);
begin
   inherited;
   with Datasource.DataSet do
   begin
      if not IsEmpty then
      begin
         if FieldByName('DATA').AsDateTime > 0 then
            edData.Date := FieldByName('DATA').AsDateTime;
         if FieldByName('HORA').AsDateTime > 0 then
            edData.Time := FieldByName('HORA').AsDateTime;
      end;
   end;
end;

end.
