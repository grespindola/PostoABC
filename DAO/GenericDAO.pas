unit GenericDAO;

interface

uses
  SysUtils, vcl.dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Async;

type
  TGenericDAO = Class
    FConexao : TFDConnection;
    FDados : TFDQuery;
    FTransacao : TFDTransaction;
  private

  protected
    FSQL : String;
    constructor Create(pConexao : TFDConnection; pTransacao : TFDTransaction = nil); Overload;
    destructor Destroy; Override;
    function getConexao : TFDConnection;

  public
    function Abrir : Boolean; Overload;
    function Abrir(pSQL:String) : Boolean; Overload;
    function Fechar : Boolean;
    function Inserir : Boolean;
    function Salvar : Boolean;
    function Alterar : Boolean;
    function Excluir : Boolean;
    function Cancelar : Boolean;

    procedure Primeiro;
    procedure Anterior;
    procedure Proximo;
    procedure Ultimo;

    function getID(pTabela: String): Integer;
  published
    property Dados : TFDQuery read FDados;
  end;

implementation

{ TGenericDAO }

uses uFuncoes;

function TGenericDAO.getID(pTabela:String): Integer;
begin
  try
    Result := Consulta('SELECT COALESCE(MAX(CODIGO),0)+1 FROM '+pTabela).Fields[0].asInteger;
  except
    Result := -1;
  end;
end;

constructor TGenericDAO.Create(pConexao : TFDConnection; pTransacao : TFDTransaction = nil);
begin
  inherited Create;
  FConexao := pConexao;

  if Assigned(pTransacao) then
    FTransacao := pTransacao
  else
    FTransacao := TFDTransaction(pConexao.Transaction);

  FDados := TFDQuery.Create(nil);
  FDados.Connection := FConexao;
  FDados.Transaction := FTransacao;
end;

destructor TGenericDAO.Destroy;
begin
  FreeAndNil(FDados);
  inherited;
end;

function TGenericDAO.getConexao: TFDConnection;
begin
  Result := FConexao;
end;

function TGenericDAO.Abrir: Boolean;
begin
  Result := Abrir(FSQL);
end;

function TGenericDAO.Abrir(pSQL: String): Boolean;
begin
  Result := False;
  if not FDados.Active then
  begin
    FDados.Open(pSQL);
    FDados.First;
    Result := FDados.RecordCount > 0;
  end;
end;

function TGenericDAO.Alterar: Boolean;
begin
  Result := False;
  if FDados.Active then
  begin
    if not FTransacao.Active then
      FTransacao.StartTransaction;
    FDados.Edit;
    Result := True;
  end
  else
    ShowInfo('Selecione um registro para alterar!');
end;

function TGenericDAO.Excluir: Boolean;
begin
  Result := False;
  if not (FDados.IsEmpty) then
  begin
    if FDados.Active then
    begin
      if not FTransacao.Active then
        FTransacao.StartTransaction;

      FDados.Delete;

      if FTransacao.Active then
        FTransacao.Commit;

      FDados.Close;
      FDados.Open;

      Result := True;
    end;
  end
  else
    ShowInfo('Selecione um registro para excluir!');
end;

function TGenericDAO.Fechar: Boolean;
begin
  if FDados.Active then
    FDados.Close;
end;

function TGenericDAO.Inserir: Boolean;
begin
  Result := False;
  Abrir;
  if FDados.Active then
  begin
    if not FTransacao.Active then
      FTransacao.StartTransaction;

    FDados.Append;

    Result := True;
  end;
end;

function TGenericDAO.Salvar: Boolean;
begin
  Result := False;
  if FDados.Active then
  begin
    if not FTransacao.Active then
      FTransacao.StartTransaction;
    FDados.Post;
    if FTransacao.Active then
      FTransacao.Commit;
    Result := True;
  end;
end;

function TGenericDAO.Cancelar: Boolean;
begin
  Result := False;
  if FDados.Active then
  begin
    FDados.Cancel;
    if FTransacao.Active then
      FTransacao.Rollback;
  end;
end;

procedure TGenericDAO.Primeiro;
begin
  Abrir;
  if FDados.Active then
    FDados.First;
end;

procedure TGenericDAO.Proximo;
begin
  if FDados.Active then
    FDados.Next
  else
    Abrir;
end;

procedure TGenericDAO.Anterior;
begin
  Abrir;
  if FDados.Active then
    FDados.Prior;
end;

procedure TGenericDAO.Ultimo;
begin
  Abrir;
  if FDados.Active then
    FDados.Last;
end;

end.
