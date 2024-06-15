program PostoABC;

uses
  Vcl.Forms,
  uPostoABC in 'source\uPostoABC.pas' {frmPrincipal},
  uDmPrincipal in 'Source\uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uMensagem in 'source\utils\uMensagem.pas' {frmMensagem},
  uPergunta in 'source\utils\uPergunta.pas' {frmPergunta},
  GenericDAO in 'DAO\GenericDAO.pas',
  AbastecimentoDAO in 'DAO\AbastecimentoDAO.pas',
  uCadastro in 'Source\uCadastro.pas' {frmCadastro},
  uAbastecimento in 'Source\uAbastecimento.pas' {frmAbastecimento},
  uFuncoes in 'Source\utils\uFuncoes.pas',
  uPesquisa in 'Source\uPesquisa.pas' {frmPesquisa},
  uConstants in 'Source\utils\uConstants.pas',
  uGlobais in 'Source\utils\uGlobais.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
