
{------------------------------------------------------------------------------}
{ - PostoABC - Menu Principal                                                  }
{   - Programa CRUD para teste da FORTES Tecnologia                            }
{    - Persistência.: diretório DAO                                            }
{    - Controle.....: diretório Source                                         }
{    - View.........: diretório Source                                         }
{ Gustavo Espíndola - 14/06/2024                                               }
{------------------------------------------------------------------------------}


unit uPostoABC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TfrmPrincipal = class(TForm)
    Menu: TMainMenu;
    Cadastros1: TMenuItem;
    Pessoas1: TMenuItem;
    PessoasemLote1: TMenuItem;
    Label1: TLabel;
    Abastecimento1: TMenuItem;
    Combustvel1: TMenuItem;
    Lanamento1: TMenuItem;
    Relatrios1: TMenuItem;
    AbastecimentoDirio1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Lanamento1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
   uConstants, uGlobais, uFuncoes, ShellAPI, uDmPrincipal, uAbastecimento;

{$R *.dfm}


procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   gExePath := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

   //Carrega configurações
   try
      leConfigs;
   except
      on e: exception do
      begin
         ShowAlerta('Erro ao carregar configurações: ' +
                   sLineBreak + sLineBreak +
                   e.message);
         if gDBPath.Trim.IsEmpty then
            ShellExecute(Application.Handle, 'open', PWideChar(gExePath + cIniFile), '', '', SW_SHOW);
         Application.Terminate;
      end;
   end;

   //Cria DM
   try
      DMPrincipal := TDMPrincipal.Create(Self);
   except
      on e: exception do
      begin
         ShowAlerta('Erro ao conectar com banco de dados, verifique : ' +
                     sLineBreak + sLineBreak +
                     e.Message);
         Application.Terminate;
      end;
   end;

   Self.Color := cFundoCadastro;
end;


procedure TfrmPrincipal.Lanamento1Click(Sender: TObject);
begin
   if not Assigned(frmAbastecimento) then
      frmAbastecimento := TfrmAbastecimento.Create(Self);
   frmAbastecimento.Show;
end;

end.
