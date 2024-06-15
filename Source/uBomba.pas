{------------------------------------------------------------------------------}
{ # PostoABC - Lan�amento de Bombas                                            }
{   - permite lan�ar registros de Bombas                                       }
{ Gustavo Esp�ndola - 15/06/2024                                               }
{------------------------------------------------------------------------------}


unit uBomba;

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
   TfrmBomba = class(TfrmCadastro)
      Label5: TLabel;
      Label6: TLabel;
      qBomba: TFDQuery;
      edNome: TDBEdit;
      Label1: TLabel;
      qTanque: TFDQuery;
      dsTanque: TDataSource;
      cbTanque: TDBLookupComboBox;
      qBombaCODIGO: TIntegerField;
      qBombaNOME: TStringField;
      qBombaCODIGO_TANQUE: TIntegerField;
      qTanqueCODIGO: TIntegerField;
      qTanqueNOME: TStringField;
      qTanqueCODIGO_COMBUSTIVEL: TIntegerField;
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
   frmBomba: TfrmBomba;

implementation

{$R *.dfm}

uses
   uFuncoes;

{ TfrmAbastecimento }

constructor TfrmBomba.Create(AOwner: TComponent);
begin
   { Criando cadastro de Bombas }
   inherited Create(AOwner, 'BOMBA');

   DataSource.DataSet := qBomba;

   qBomba.Open;
   qTanque.Open;

   qBomba.First;

   edtCodigo.Text := qTanque.FieldByName('CODIGO').AsString;
end;

procedure TfrmBomba.edPrecoKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;

   { Validando entrada num�rica/float }
   validaFloat(Sender, Key);
end;

procedure TfrmBomba.btnGravarClick(Sender: TObject);
begin
   { Gravando Bomba }
   with qBomba do
   begin
      //Valida��es
      if FieldByName('NOME').AsString.Trim.IsEmpty then
      begin
         ShowInfo('Informe o Nome da Bomba de Combust�vel.');
         if edNome.CanFocus then
            edNome.SetFocus;
         Exit;
      end;

      if FieldByName('CODIGO_TANQUE').AsInteger <= 0 then
      begin
         ShowInfo('Informe o Tanque de Combust�vel.');
         if cbTanque.CanFocus then
            cbTanque.SetFocus;
         Exit;
      end;

   end;
   //Grava��o na heran�a
   inherited;
end;

procedure TfrmBomba.btnInserirClick(Sender: TObject);
begin
   { Bot�o Inserir }
   inherited;
   if edNome.CanFocus then
      edNome.SetFocus;
end;

procedure TfrmBomba.KeyPressNumerico(Sender: TObject; var Key: Char);
begin
   Inherited;
end;

end.

