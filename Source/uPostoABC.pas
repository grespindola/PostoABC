
{------------------------------------------------------------------------------}
{ # PostoABC - Menu Principal                                                  }
{   - Programa CRUD para teste da FORTES Tecnologia                            }
{    - CRUD Gen�rico.: uCadastro.pas                                           }
{ Gustavo Esp�ndola - 14/06/2024                                               }
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
    procedure Combustvel1Click(Sender: TObject);
    procedure Pessoas1Click(Sender: TObject);
    procedure PessoasemLote1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
   uConstants, uGlobais, uFuncoes, ShellAPI, uDmPrincipal, uAbastecimento, uCombustivel, uTanque, uBomba;

{$R *.dfm}


procedure TfrmPrincipal.Combustvel1Click(Sender: TObject);
begin
   frmCombustivel := TfrmCombustivel.Create(Self);
   frmCombustivel.ShowModal;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   gExePath := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

   //Carrega configura��es
   try
      leConfigs;
   except
      on e: exception do
      begin
         ShowAlerta('Erro ao carregar configura��es: ' +
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
   frmAbastecimento := TfrmAbastecimento.Create(Self);
   frmAbastecimento.ShowModal;
end;


procedure TfrmPrincipal.Pessoas1Click(Sender: TObject);
begin
   frmTanque := TfrmTanque.Create(Self);
   frmTanque.ShowModal;
end;

procedure TfrmPrincipal.PessoasemLote1Click(Sender: TObject);
begin
   frmBomba := TfrmBomba.Create(Self);
   frmBomba.ShowModal;
end;

end.