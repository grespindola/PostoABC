{------------------------------------------------------------------------------}
{ # PostoABC - Lançamento de Combustívels                                      }
{   - permite lançar registros de Combustívels                                 }
{ Gustavo Espíndola - 15/06/2024                                               }
{------------------------------------------------------------------------------}


unit uCombustivel;

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
   TfrmCombustivel = class(TfrmCadastro)
    edPreco: TDBEdit;
      Label5: TLabel;
      Label6: TLabel;
      qCombustivel: TFDQuery;
      qCombustivelCODIGO: TIntegerField;
      qCombustivelNOME: TStringField;
      qCombustivelPRECO_LITRO: TBCDField;
      edNome: TDBEdit;
      Label1: TLabel;
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
   frmCombustivel: TfrmCombustivel;

implementation

{$R *.dfm}

uses
   uFuncoes;

{ TfrmAbastecimento }

constructor TfrmCombustivel.Create(AOwner: TComponent);
begin
   { Criando cadastro de combustível }
   inherited Create(AOwner, 'COMBUSTIVEL');

   DataSource.DataSet := qCombustivel;

   qCombustivel.Open;
   qCombustivel.First;

   edtCodigo.Text := qCombustivel.FieldByName('CODIGO').AsString;
end;

procedure TfrmCombustivel.edPrecoKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;

   { Validando entrada numérica/float }
   validaFloat(Sender, Key);
end;

procedure TfrmCombustivel.btnGravarClick(Sender: TObject);
begin
   { Gravando Combustível }
   with qCombustivel do
   begin
      //Validações
      if FieldByName('NOME').AsString.Trim.IsEmpty then
      begin
         ShowInfo('Informe o Nome do Combustível.');
         if edNome.CanFocus then
            edNome.SetFocus;
         Exit;
      end;

      if FieldByName('PRECO_LITRO').asFloat <= 0 then
      begin
         ShowInfo('Informe a Preço do Litro do Combustível.');
         if edPreco.CanFocus then
            edPreco.SetFocus;
         Exit;
      end;

   end;

   //Gravação na herança
   inherited;
end;

procedure TfrmCombustivel.btnInserirClick(Sender: TObject);
begin
   { Inserindo combustível }
   inherited;

   //Foco inicial
   if edNome.CanFocus then
      edNome.SetFocus;
end;

procedure TfrmCombustivel.KeyPressNumerico(Sender: TObject; var Key: Char);
begin
   Inherited;
end;

end.

