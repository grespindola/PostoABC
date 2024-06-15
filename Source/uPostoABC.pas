
{------------------------------------------------------------------------------}
{ # PostoABC - Menu Principal                                                  }
{   - Programa CRUD para teste da FORTES Tecnologia                            }
{    - CRUD Genérico.: uCadastro.pas                                           }
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
    procedure Combustvel1Click(Sender: TObject);
    procedure Pessoas1Click(Sender: TObject);
    procedure PessoasemLote1Click(Sender: TObject);
    procedure AbastecimentoDirio1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
   uConstants, uGlobais, uFuncoes, ShellAPI, uDmPrincipal, uAbastecimento, uCombustivel, uTanque, uBomba, uRelAbastecimento;

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
   frmAbastecimento := TfrmAbastecimento.Create(Self);
   try
      frmAbastecimento.ShowModal;
   finally
      FreeAndNil(frmAbastecimento);
   end;
end;


procedure TfrmPrincipal.Pessoas1Click(Sender: TObject);
begin
   frmTanque := TfrmTanque.Create(Self);
   try
      frmTanque.ShowModal;
   finally
      FreeAndNil(frmTanque);
   end;
end;

procedure TfrmPrincipal.PessoasemLote1Click(Sender: TObject);
begin
   frmBomba := TfrmBomba.Create(Self);
   try
      frmBomba.ShowModal;
   finally
      FreeAndNil(frmBomba);
   end;
end;

procedure TfrmPrincipal.AbastecimentoDirio1Click(Sender: TObject);
begin
   //Chamando relatório de Abastecimentos Diário
   RelAbastecimentos := TRelAbastecimentos.Create(Self);
   try
      RelAbastecimentos.qRel.Open;
      RelAbastecimentos.Relatorio.Preview;
   finally
      FreeAndNil(RelAbastecimentos);
   end;
end;

procedure TfrmPrincipal.Combustvel1Click(Sender: TObject);
begin
   frmCombustivel := TfrmCombustivel.Create(Self);
   try
      frmCombustivel.ShowModal;
   finally
      FreeAndNil(frmCombustivel);
   end;
end;

end.
