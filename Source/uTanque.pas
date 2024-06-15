{------------------------------------------------------------------------------}
{ # PostoABC - Lançamento de Tanques                                           }
{   - permite lançar registros de Tanques                                      }
{ Gustavo Espíndola - 15/06/2024                                               }
{------------------------------------------------------------------------------}


unit uTanque;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastro,
   Vcl.Menus, Data.DB, FireDAC.Stan.Intf, FireDAC.Comp.Client, Vcl.StdCtrls,
   Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, FireDAC.Stan.Option,
   FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
   FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
   uDMPrincipal, Math, Vcl.Buttons;

type
   TfrmTanque = class(TfrmCadastro)
      Label5: TLabel;
      Label6: TLabel;
      qTanque: TFDQuery;
      edNome: TDBEdit;
      Label1: TLabel;
      qCombustivel: TFDQuery;
      dsCombustivel: TDataSource;
      cbCombustivel: TDBLookupComboBox;
      qTanqueCODIGO: TIntegerField;
      qTanqueNOME: TStringField;
      qTanqueCODIGO_COMBUSTIVEL: TIntegerField;
      qCombustivelCODIGO: TIntegerField;
      qCombustivelNOME: TStringField;
      qCombustivelPRECO_LITRO: TBCDField;
      procedure btnInserirClick(Sender: TObject);
      procedure btnGravarClick(Sender: TObject);
      procedure edPrecoKeyPress(Sender: TObject; var Key: Char);
   private
      procedure KeyPressNumerico(Sender: TObject; var Key: Char);
    { Private declarations }
   public
    { Public declarations }
      constructor Create(AOwner: TComponent); override;
   end;

var
   frmTanque: TfrmTanque;

implementation

{$R *.dfm}

uses
   uFuncoes;

{ TfrmAbastecimento }

constructor TfrmTanque.Create(AOwner: TComponent);
begin
   { Criando cadastro de combustível }
   inherited Create(AOwner, 'TANQUE');

   DataSource.DataSet := qTanque;

   qTanque.Open;
   qTanque.First;

   qCombustivel.Open;

   edtCodigo.Text := qTanque.FieldByName('CODIGO').AsString;
end;

procedure TfrmTanque.edPrecoKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;

   { Validando entrada numérica/float }
   validaFloat(Sender, Key);
end;

procedure TfrmTanque.btnGravarClick(Sender: TObject);
begin
   { Gravando Tanque de Combustível }
   with qTanque do
   begin
      //Validações
      if FieldByName('NOME').AsString.Trim.IsEmpty then
      begin
         ShowInfo('Informe o Nome do Tanque de Combustível.');
         if edNome.CanFocus then
            edNome.SetFocus;
         Exit;
      end;

      if FieldByName('CODIGO_COMBUSTIVEL').AsInteger <= 0 then
      begin
         ShowInfo('Informe o Combustível!');
         if cbCombustivel.CanFocus then
            cbCombustivel.SetFocus;
         Exit;
      end;

   end;
   //Gravação
   inherited;
end;

procedure TfrmTanque.btnInserirClick(Sender: TObject);
begin
   { Botão Inserir }
   inherited;
   if edNome.CanFocus then
      edNome.SetFocus;
end;

procedure TfrmTanque.KeyPressNumerico(Sender: TObject; var Key: Char);
begin
   Inherited;
end;

end.

