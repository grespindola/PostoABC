
{------------------------------------------------------------------------------}
{ # PostoABC - Projeto                                                         }
{   - Programa CRUD para teste da FORTES Tecnologia                            }
{    - CRUD Genérico.: uCadastro.pas                                           }
{    - Controle......: diretório Source                                        }
{    - View..........: diretório Source                                        }
{ Gustavo Espíndola - 14/06/2024                                               }
{------------------------------------------------------------------------------}


program PostoABC;

uses
  Vcl.Forms,
  uPostoABC in 'source\uPostoABC.pas' {frmPrincipal},
  uDmPrincipal in 'Source\uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uMensagem in 'source\utils\uMensagem.pas' {frmMensagem},
  uCadastro in 'Source\uCadastro.pas' {frmCadastro},
  uAbastecimento in 'Source\uAbastecimento.pas' {frmAbastecimento},
  uFuncoes in 'Source\utils\uFuncoes.pas',
  uConstants in 'Source\utils\uConstants.pas',
  uGlobais in 'Source\utils\uGlobais.pas',
  uPergunta in 'Source\utils\uPergunta.pas' {frmPergunta},
  uCombustivel in 'Source\uCombustivel.pas' {frmCombustivel},
  uTanque in 'Source\uTanque.pas' {frmTanque},
  uBomba in 'Source\uBomba.pas' {frmBomba},
  uRelAbastecimento in 'Source\Relatorios\uRelAbastecimento.pas' {RelAbastecimentos},
  uFiltro in 'Source\Relatorios\uFiltro.pas' {frmFiltro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
