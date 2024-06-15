{------------------------------------------------------------------------------}
{ # PostoABC - Lançamento de Abastecimento                                     }
{   - permite lançar registros de abastecimentos                               }
{ Gustavo Espíndola - 14/06/2024                                               }
{------------------------------------------------------------------------------}


unit uAbastecimento;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastro,
   Vcl.Menus, Data.DB, FireDAC.Stan.Intf, FireDAC.Comp.Client, Vcl.StdCtrls,
   Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, FireDAC.Stan.Option,
   FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
   FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   uDMPrincipal, Math, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

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
      qBombasCODIGO: TIntegerField;
      qBombasNOME: TStringField;
      qBombasCOMB: TStringField;
      qBombasPRECO_LITRO: TBCDField;
      qAbastecimento: TFDQuery;
      qAbastecimentoCODIGO: TIntegerField;
      qAbastecimentoDATA: TDateField;
      qAbastecimentoHORA: TTimeField;
      qAbastecimentoCODIGO_BOMBA: TIntegerField;
      qAbastecimentoLITROS: TBCDField;
      qAbastecimentoVALOR: TBCDField;
      qAbastecimentoIMPOSTO: TBCDField;
      btnPreco: TBitBtn;
    grid: TDBGrid;
    qAbastecimentoNOME: TStringField;
      procedure btnInserirClick(Sender: TObject);
      procedure btnGravarClick(Sender: TObject);
      procedure edLitragemKeyPress(Sender: TObject; var Key: Char);
      procedure edLitragemChange(Sender: TObject);
      procedure qAbastecimentoAfterScroll(DataSet: TDataSet);
      procedure btnPrecoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
   private
      procedure KeyPressNumerico(Sender: TObject; var Key: Char);
    procedure controlaGrid(bHabilita: Boolean);
    { Private declarations }
   public
    { Public declarations }
      constructor Create(AOwner: TComponent); override;
   end;

var
   frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

uses
   uFuncoes, uCombustivel;

{ TfrmAbastecimento }

constructor TfrmAbastecimento.Create(AOwner: TComponent);
begin
   { Criando form de Abastecimentos }
   inherited Create(AOwner, 'ABASTECIMENTO');

   DataSource.DataSet := qAbastecimento;

   edData.DateTime := Now;

   qAbastecimento.Open;
   qBombas.Open;

   { Posiciona no último registro }
   qAbastecimento.Last;
end;

procedure TfrmAbastecimento.edLitragemChange(Sender: TObject);
var
   nValor: Double;
begin
   inherited;

   if not qBombas.Active then
      Exit;

   if not (qAbastecimento.State in [dsEdit, dsInsert]) then
      Exit;

   { Cálculo do Imposto }
   with qAbastecimento do
   begin
      nValor := StrToFloatDef(edLitragem.Text, 0);
      nValor := RoundTo(nValor, -3);

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
   { Validação numérica (float) }
   validaFloat(Sender, Key);
end;

procedure TfrmAbastecimento.btnPrecoClick(Sender: TObject);
begin
   inherited;
   { Chama Cadastro de Combustíveis }
   frmCombustivel := TfrmCombustivel.Create(Self);
   frmCombustivel.ShowModal;

   { Atualiza possíveis alterações no preço }
   qBombas.Refresh;
end;

procedure TfrmAbastecimento.btnAlterarClick(Sender: TObject);
begin
   inherited;
   controlaGrid(False);
end;

procedure TfrmAbastecimento.btnCancelarClick(Sender: TObject);
begin
   inherited;
   controlaGrid(True);
end;

procedure TfrmAbastecimento.btnExcluirClick(Sender: TObject);
begin
  inherited;
  controlaGrid(True);
end;

procedure TfrmAbastecimento.btnGravarClick(Sender: TObject);
begin
   { Gravando abastecimento }
   with qAbastecimento do
   begin
      //Validações
      if FieldByName('CODIGO_BOMBA').AsInteger <= 0 then
      begin
         ShowInfo('Informe a Bomba do Abastecimento.');
         if cbBomba.CanFocus then
            cbBomba.SetFocus;
         Exit;
      end;

      if FieldByName('LITROS').asFloat <= 0 then
      begin
         ShowInfo('Informe a Quantidade de Litros do Abastecimento.');
         if edLitragem.CanFocus then
            edLitragem.SetFocus;
         Exit;
      end;

      if edData.DateTime > Now then
      begin
         ShowInfo('Não é possível informar uma data/hora futura.');
         if edData.CanFocus then
            edData.SetFocus;
         Exit;
      end;

      //Atribui data e hora ao dataset
      FieldByName('DATA').AsDateTime := edData.Date;
      FieldByName('HORA').AsDateTime := edData.Time;
   end;

   //Gravação na herança
   inherited;

   controlaGrid(True);
end;

procedure TfrmAbastecimento.controlaGrid(bHabilita:Boolean);
begin
   grid.Enabled := bHabilita;
   if grid.Enabled then
      grid.Color := clWhite
   else
      grid.Color := clBtnFace;
   grid.Repaint;
end;

procedure TfrmAbastecimento.btnInserirClick(Sender: TObject);
begin
   { Inserindo Abastecimento }
   inherited;

   //Atribui valores iniciais
   edData.DateTime := Now;
   if not qBombas.Active then
   begin
      qBombas.Open;
      qAbastecimento.FieldByName('CODIGO_BOMBA').asInteger := 1;
   end;

   //Foco inicial
   if cbBomba.CanFocus then
   begin
      cbBomba.SetFocus;
      cbBomba.DropDown;
   end;

   controlaGrid(False);
end;

procedure TfrmAbastecimento.KeyPressNumerico(Sender: TObject; var Key: Char);
begin
   inherited;
end;

procedure TfrmAbastecimento.qAbastecimentoAfterScroll(DataSet: TDataSet);
begin
   inherited;
   //Atribui data e hora ao componente
   with qAbastecimento do
   begin
      if not IsEmpty then
      begin
         edtCodigo.Text := FieldByName('CODIGO').AsString;
         if FieldByName('DATA').AsDateTime > 0 then
            edData.Date := FieldByName('DATA').AsDateTime;
         if FieldByName('HORA').AsDateTime > 0 then
            edData.Time := FieldByName('HORA').AsDateTime;
      end;
   end;
end;

end.

