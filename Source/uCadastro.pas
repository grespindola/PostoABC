unit uCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Comp.Client, Data.DB, GenericDAO, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, cxImageList, cxGraphics, Vcl.Mask, Vcl.DBCtrls,
  uConstants, Vcl.Menus, uFuncoes;

type
  TfrmCadastro = class(TForm)
    Transacao: TFDTransaction;
    DataSource: TDataSource;
    pnHeader: TPanel;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    pnCadastro: TPanel;
    pnFooter: TPanel;
    pnNavegacao: TPanel;
    btnPrimeiro: TButton;
    btnAnterior: TButton;
    btnProximo: TButton;
    btnUltimo: TButton;
    pnBotoes: TPanel;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    btnPesquisar: TButton;
    btnSair: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    procedure FocoAlterado(Sender: TObject);

  protected
    FDAO : TGenericDAO;
    FTabela : String;
    FPodeSair : Boolean;
    FFoco : TWinControl;

    procedure HabilitaComponentes;
  published
    property DAO : TGenericDAO read FDAO;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent; pDAO: TGenericDAO; pTabela : String); Overload; Virtual;
    Destructor Destroy; Override;
    procedure KeyPressNumerico(Sender: TObject; var Key: Char); Virtual;
    procedure KeyPressFloat(Sender: TObject; var Key: Char); Virtual;

  end;

var
  frmCadastro: TfrmCadastro;


implementation

{$R *.dfm}

uses uDMPrincipal, uPostoABC;

{ TfrmCadastro }

procedure TfrmCadastro.KeyPressNumerico(Sender: TObject; var Key: Char);
begin
  validaNumeros(sender, key);
end;

procedure TfrmCadastro.KeyPressFloat(Sender: TObject; var Key: Char);
begin
  validaFloat(sender, key);
end;

procedure TfrmCadastro.btnAlterarClick(Sender: TObject);
begin
  if FDAO.Alterar then
  begin
    Tag := 2;
    HabilitaComponentes;
  end;
end;


procedure TfrmCadastro.btnCancelarClick(Sender: TObject);
begin
  FDAO.Cancelar;
  if Datasource.DataSet.Active then
    edtCodigo.Text := Datasource.DataSet.FieldByName('CODIGO').AsString
  else
    edtCodigo.Clear;

  Tag := 0;
  HabilitaComponentes;
end;

procedure TfrmCadastro.btnExcluirClick(Sender: TObject);
begin
  if FDAO.FDados.IsEmpty then
    ShowInfo('Selecione um registro para excluir.')
  else
  if (ShowPergunta('Deseja excluir o registro selecionado?', 'Excluir') = mrYes) then
  begin
    FDAO.Excluir;
    edtCodigo.Text := FDAO.FDados.FieldByName('CODIGO').AsString;
  end;
end;

procedure TfrmCadastro.btnGravarClick(Sender: TObject);
var
  I: Integer;
  vValida : String;
begin

  vValida := EmptyStr;
  for I := 0 to Datasource.DataSet.FieldCount - 1 do
  begin
    if DataSource.DataSet.Fields[I].Required and
       DataSource.DataSet.Fields[I].IsNull
    then
    begin
      if not vValida.IsEmpty then
        vValida := vValida + SLineBreak;
      vValida := vValida + DataSource.DataSet.Fields[I].FieldName;
    end;
  end;

  if not vValida.Trim.IsEmpty then
  begin
    ShowInfo('Preencha os campos obrigatórios: '+SLineBreak+vValida);
    Exit;
  end;

  if Tag = 1 then
    Datasource.DataSet.FieldByName('CODIGO').AsInteger := FDAO.getID(FTabela);

  if FDAO.Salvar then
  begin
    Tag := 0;
    HabilitaComponentes;
  end;
end;

procedure TfrmCadastro.btnInserirClick(Sender: TObject);
begin
  if FDAO.Inserir then
  begin
    Tag := 1;
    Datasource.DataSet.FieldByName('CODIGO').AsInteger := FDAO.getID(FTabela);
    if Assigned(DataSource.DataSet.FindField('ATIVO')) then
      DataSource.DataSet.FindField('ATIVO').AsInteger := 1;
    edtCodigo.Text := Datasource.DataSet.FieldByName('CODIGO').AsString;
    HabilitaComponentes;
  end;
end;

procedure TfrmCadastro.btnPrimeiroClick(Sender: TObject);
begin
  FDAO.Primeiro;
  tag := 3;
  edtCodigo.Text := Datasource.DataSet.FieldByName('CODIGO').AsString;
  tag := 0;
end;

procedure TfrmCadastro.btnAnteriorClick(Sender: TObject);
begin
  FDAO.Anterior;
  tag := 3;
  edtCodigo.Text := Datasource.DataSet.FieldByName('CODIGO').AsString;
  tag := 0;
end;

procedure TfrmCadastro.btnUltimoClick(Sender: TObject);
begin
  FDAO.Ultimo;
  tag := 3;
  edtCodigo.Text := Datasource.DataSet.FieldByName('CODIGO').AsString;
  tag := 0;
end;

procedure TfrmCadastro.Button1Click(Sender: TObject);
begin
  btnPesquisar.Click;
end;

procedure TfrmCadastro.btnProximoClick(Sender: TObject);
begin
  FDAO.Proximo;
  tag := 3;
  edtCodigo.Text := Datasource.DataSet.FieldByName('CODIGO').AsString;
  tag := 0;
end;

procedure TfrmCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;

constructor TfrmCadastro.Create(AOwner : TComponent; pDAO: TGenericDAO; pTabela : String);
begin
  inherited Create(AOwner);
  FDAO := pDAO;
  FTabela := pTabela;
  DataSource.DataSet := pDAO.Dados;
end;

destructor TfrmCadastro.Destroy;
begin
  FreeAndNil(FDAO);
  inherited;
end;

procedure TfrmCadastro.edtCodigoChange(Sender: TObject);
begin
  if Tag <> 0 then
    Exit;
  if edtCodigo.Text <> EmptyStr then
  begin
    FDAO.Abrir;
    if not FDAO.FDados.Locate('CODIGO',StrToIntDef(edtCodigo.Text, -1),[]) then
      FDAO.Fechar;
  end;
end;

procedure TfrmCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FPodeSair then
  begin
    Action := caFree;
    Self := nil;
  end
  else
  begin
    if tag <> 0 then
    begin
      if ShowPergunta('Cancelar as alterações e sair?','Sair') = mrYes then
      begin
        btnCancelar.Click;
        Action := caFree;
        Self := nil;
      end
      else
      begin
        Action := caNone;
        Abort;
      end;
    end
    else
    begin
      Action := caNone;
      Abort;
    end;
  end;
  if Action = caFree then
  begin
    Screen.OnActiveControlChange := nil;
  end;
end;

procedure TfrmCadastro.FormCreate(Sender: TObject);
begin
  FPodeSair := True;
  HabilitaComponentes;
  Screen.OnActiveControlChange := FocoAlterado;
end;

procedure TfrmCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if KEY = VK_F2 then
    btnPesquisar.Click;

  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Perform(Wm_NextDlgCtl,0,0);
    Key := #0;
  end;
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
var
  i, pWidth, pLeftAnt: Integer;
begin
  Self.Color := cFundoPrincipal;
  pnFooter.Color := cFundoMenu;
  pnHeader.Color := cFundoPrincipal;
  //Ajusta Rodapé
  pnFooter.Height := cCadFooter;
  pWidth := 0;
  pLeftAnt := 0;
  //centraliza botões de cadastro
  for I := 0 to pnBotoes.ControlCount - 1 do
  begin
    if (PnBotoes.Controls[i] is TButton) then
    begin
      if TButton(PnBotoes.Controls[i]).Visible then
      begin
        pWidth := pWidth + TButton(PnBotoes.Controls[i]).Width + 2;
        TButton(PnBotoes.Controls[i]).Top := 0;
        TButton(PnBotoes.Controls[i]).Left := pLeftAnt;
        pLeftAnt := pLeftAnt + TButton(PnBotoes.Controls[i]).Width + 2;
      end;
    end;
  end;
  pnBotoes.Width := pWidth;
  pnBotoes.Left := Trunc((pnFooter.Width - pWidth) / 2);

 { if Self.Width < (pnBotoes.Width + 40) then
    Self.Width := pnBotoes.Width + 40;    }

  pWidth := 0;
  pLeftAnt := 0;
  for I := 0 to pnNavegacao.ControlCount - 1 do
  begin
    if (pnNavegacao.Controls[i] is TButton) then
    begin
      pWidth := pWidth + TButton(pnNavegacao.Controls[i]).Width;
      TButton(pnNavegacao.Controls[i]).Top := 0;
      TButton(pnNavegacao.Controls[i]).Left := pLeftAnt;
      pLeftAnt := pLeftAnt + TButton(pnNavegacao.Controls[i]).Width;
    end;
  end;
  pnNavegacao.Width := pWidth;
  pnNavegacao.Left := Trunc((pnFooter.Width - pWidth) / 2);


  pnNavegacao.Left := Trunc((pnFooter.Width - pnNavegacao.Width) / 2);

  Self.Top := 0;
  Self.Left := 0;

  if edtCodigo.CanFocus then
    edtCodigo.SetFocus;
end;

procedure TfrmCadastro.HabilitaComponentes;
var
  vModoEdit, vReadOnly : Boolean;
  I: Integer;
  vComponente : TComponent;
  vCor : TColor;
begin
  //Tag 0 = Navegando
  //Tag 1 = Inserindo
  //Tag 2 = Alterando

  vModoEdit := Self.Tag in [1,2];
  btnAlterar.Enabled := not vModoEdit;
  btnInserir.Enabled := not vModoEdit;
  btnExcluir.Enabled := not vModoEdit;
  btnSair.Enabled := not vModoEdit;

  FPodeSair := not vModoEdit;

  btnGravar.Enabled := vModoEdit;
  btnCancelar.Enabled := vModoEdit;

  btnPrimeiro.Enabled := not vModoEdit;
  btnUltimo.Enabled := not vModoEdit;
  btnProximo.Enabled := not vModoEdit;
  btnAnterior.Enabled := not vModoEdit;

  formataComponentes(Self,vModoEdit);
end;

procedure TfrmCadastro.FocoAlterado(Sender: TObject);
begin
 { if Assigned(FFoco) then
    if checaEdit(FFoco) then
      TEdit(FFoco).Color := clWhite;

  if (checaEdit(ActiveControl)) then
    try
      TEdit(ActiveControl).Color := $00DFCAB7;
      FFoco := ActiveControl;
    except
    end;    }
end;

end.
