{------------------------------------------------------------------------------}
{ # PostoABC - CRUD Genérico                                                   }
{   - permite realizar operações de CRUD genéricas                             }
{   - especificar Tabela no Constructor                                        }
{ Gustavo Espíndola - 14/06/2024                                               }
{------------------------------------------------------------------------------}

unit uCadastro;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Comp.Client, Data.DB,
   Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Mask, Vcl.DBCtrls,
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
      procedure btnSairClick(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormKeyPress(Sender: TObject; var Key: Char);
   private
      function getNewID(): Integer;
   protected
      FTabela: string;
      FPodeSair: Boolean;
      FFoco: TWinControl;
      FDados : TFDQuery;
      procedure HabilitaComponentes;
   published

   public
    { Public declarations }
      constructor Create(AOwner: TComponent; pTabela: string); overload; virtual;
      destructor Destroy; override;
      procedure KeyPressNumerico(Sender: TObject; var Key: Char); virtual;
      procedure KeyPressFloat(Sender: TObject; var Key: Char); virtual;
   end;

var
   frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

uses
   uDMPrincipal, uPostoABC;

{ TfrmCadastro }

constructor TfrmCadastro.Create(AOwner: TComponent;  pTabela: string);
begin
   inherited Create(AOwner);
   { Dataset principal do Cadastro/Lançamento }
   { Deve-se vincular ao DataSource }

   FDados := TFDQuery(DataSource.DataSet);

   { Tabela Padrão do Cadastro/Lançamento }
   FTabela := pTabela;

   if not Assigned(FDados.Transaction) then
      FDados.Transaction := dmPrincipal.FDTransacao;
end;

procedure TfrmCadastro.FormCreate(Sender: TObject);
begin
   { Flag de controle para Sair sem Gravar }
   FPodeSair := True;

   { Controle de Enable e Disable de Componentes }
   HabilitaComponentes;
end;

procedure TfrmCadastro.KeyPressNumerico(Sender: TObject; var Key: Char);
begin
   { Evento de validação numérica para DBEdits (Inteiro) }
   validaNumeros(Sender, Key);
end;

procedure TfrmCadastro.KeyPressFloat(Sender: TObject; var Key: Char);
begin
   { Evento de validação numérica para DBEdits (Float) }
   validaFloat(Sender, Key);
end;

procedure TfrmCadastro.btnAlterarClick(Sender: TObject);
begin
   { Procedendo com alteração do Dataset }
   if FDados.Active then
   begin
      if not FDados.Transaction.Active then
         FDados.Transaction.StartTransaction;
      FDados.Edit;
      Tag := 2;
      HabilitaComponentes;
   end
   else
      ShowInfo('Selecione um registro para alterar!');
end;

procedure TfrmCadastro.btnCancelarClick(Sender: TObject);
begin
   { Procedendo com cancelamento das Alterações e Rollback }
   if FDados.Active then
   begin
      FDados.Cancel;
      if FDados.Transaction.Active then
         FDados.Transaction.Rollback;
   end;

   if Datasource.DataSet.Active then
      edtCodigo.Text := Datasource.DataSet.FieldByName('CODIGO').AsString
   else
      edtCodigo.Clear;

   Tag := 0;
   HabilitaComponentes;
end;

procedure TfrmCadastro.btnExcluirClick(Sender: TObject);
begin
   { Procedendo com cancelamento das Alterações e Rollback }

   //Caso vazio
   if FDados.IsEmpty then

      ShowInfo('Selecione um registro para excluir.')

   else if (ShowPergunta('Deseja excluir o registro selecionado?', 'Excluir') = mrYes) then
   begin
      //Se responder SIM
      if FDados.Active then
      begin
         try
            if not FDados.Transaction.Active then
               FDados.Transaction.StartTransaction;

            FDados.Delete;

            if FDados.Transaction.Active then
               FDados.Transaction.Commit;

            FDados.Close;
            FDados.Open;
         except
            on e : exception do
            begin
               if Pos('FOREIGN KEY',AnsiUpperCase(e.Message)) > 0 then
                  ShowErro('Não é possível excluir esse registro, '+#13#10+
                           'pois está vinculado a outro cadastro.')
               else
                  ShowErro('Ocorreu um erro ao excluir o registro:'+#13#10#13#10+
                           e.Message);
            end;
         end;
      end;
      edtCodigo.Text := FDados.FieldByName('CODIGO').AsString;
   end;
end;

function TfrmCadastro.getNewID(): Integer;
begin
   { Procedimento para buscar próximo ID }
   try
      Result := Consulta('SELECT COALESCE(MAX(CODIGO),0)+1 FROM ' + FTabela
                         ).Fields[0].asInteger;
   except
      Result := -1;
   end;
end;

procedure TfrmCadastro.btnGravarClick(Sender: TObject);
var
   I: Integer;
   vValida: string;
begin
   { Procedimento para gravação do Registro no Banco de Dados }

   //Validando campos Not Null não preenchidos

   vValida := EmptyStr;

   if FDados.State in [dsInsert] then
      FDados.FieldByName('CODIGO').Clear;

   for I := 0 to Datasource.DataSet.FieldCount - 1 do
   begin
      if DataSource.DataSet.Fields[I].Required and DataSource.DataSet.Fields[I].IsNull then
      begin
         if not vValida.IsEmpty then
            vValida := vValida + SLineBreak;
         vValida := vValida + DataSource.DataSet.Fields[I].FieldName;
      end;
   end;

   if not vValida.Trim.IsEmpty then
   begin
      ShowInfo('Preencha os campos obrigatórios: ' + SLineBreak + vValida);
      Exit;
   end;

   { Realiza gravação no banco de dados }
   if FDados.Active then
   begin
      try
         if not FDados.Transaction.Active then
            FDados.Transaction.StartTransaction;

         FDados.Post;

         if FDados.Transaction.Active then
            FDados.Transaction.Commit;

         FDados.Refresh;

         edtCodigo.Text := FDados.FieldByName('CODIGO').asString;

         Tag := 0;
         HabilitaComponentes;
      except
         on e : exception do
         begin
             ShowErro('Ocorreu um erro ao gravar o registro:'+#13#10#13#10+
                       e.Message);
         end;
      end;

   end;
end;

procedure TfrmCadastro.btnInserirClick(Sender: TObject);
begin
   { Realiza Append no Dataset para nova inserção de registro }

   if not FDados.Active then
      FDados.Open;

   if FDados.Active then
   begin
      if not FDados.Transaction.Active then
         FDados.Transaction.StartTransaction;

      FDados.Append;

      Tag := 1;
      HabilitaComponentes;

      edtCodigo.Text := '';
   end;
end;

procedure TfrmCadastro.btnPrimeiroClick(Sender: TObject);
begin
   { Volta para o primeiro registro }

   if not FDados.Active then
      FDados.Open;

   FDados.First;

   tag := 3;
   edtCodigo.Text := Datasource.DataSet.FieldByName('CODIGO').AsString;
   tag := 0;
end;

procedure TfrmCadastro.btnAnteriorClick(Sender: TObject);
begin
   { Volta para o registro anterior }

   if not FDados.Active then
      FDados.Open;

   FDados.Prior;

   tag := 3;
   edtCodigo.Text := Datasource.DataSet.FieldByName('CODIGO').AsString;
   tag := 0;
end;

procedure TfrmCadastro.btnUltimoClick(Sender: TObject);
begin
   { Avança para o último registro }

   if not FDados.Active then
      FDados.Open;

   FDados.Last;

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
   { Avança para o próximo registro }

   if not FDados.Active then
      FDados.Open;

   FDados.Next;

   tag := 3;
   edtCodigo.Text := Datasource.DataSet.FieldByName('CODIGO').AsString;
   tag := 0;
end;

procedure TfrmCadastro.btnSairClick(Sender: TObject);
begin
   Close;
end;

destructor TfrmCadastro.Destroy;
begin
   inherited;
end;

procedure TfrmCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //Flag de controle de saída, caso não tenha alteração sai normal
   if FPodeSair then
   begin
      Action := caFree;
   end
   else
   begin
      if tag <> 0 then
      begin
         //Pergunta se deseja cancelar as alterações feitas
         if ShowPergunta('Cancelar as alterações e sair?', 'Sair') = mrYes then
         begin
            Action := caFree;
            btnCancelar.Click;
            FPodeSair := True;
            Self.Close;
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
end;

procedure TfrmCadastro.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F2 then
      btnPesquisar.Click;

   if Key = VK_ESCAPE then
      Close;
end;

procedure TfrmCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Perform(Wm_NextDlgCtl, 0, 0);
      Key := #0;
   end;
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
var
   i, pWidth, pLeftAnt: Integer;
begin
   { Ajustes de posicionamento dinâmico dos componentes }

   Self.Color := cFundoPrincipal;
   pnFooter.Color := cFundoMenu;
   pnHeader.Color := cFundoPrincipal;
   //Ajusta Rodapé
   pnFooter.Height := cCadFooter;
   pWidth := 0;
   pLeftAnt := 0;
   //centraliza botões de cadastro
   for i := 0 to pnBotoes.ControlCount - 1 do
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

   pWidth := 0;
   pLeftAnt := 0;
   for i := 0 to pnNavegacao.ControlCount - 1 do
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
   vModoEdit, vReadOnly: Boolean;
   I: Integer;
   vComponente: TComponent;
   vCor: TColor;
begin
   { Controle de Componentes, Enabled e ReadOnly }
   { Tags definem status do DataSet }
   //Tag 0 = Navegando
   //Tag 1 = Inserindo
   //Tag 2 = Alterando

   vModoEdit := Self.Tag in [1, 2];
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

   formataComponentes(Self, vModoEdit);
end;


end.

