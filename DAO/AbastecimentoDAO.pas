unit AbastecimentoDAO;

interface

uses
  GenericDAO, SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Async;

type
  TAbastecimentoDAO = Class(TGenericDAO)
  private

  protected

  public
    constructor Create(pConexao : TFDConnection; pTransacao : TFDTransaction = nil); Overload;

    function getNumero() : Integer;
  end;

implementation

{ TClienteDAO }

uses uFuncoes;

constructor TAbastecimentoDAO.Create(pConexao: TFDConnection;
  pTransacao: TFDTransaction);
begin
  inherited Create(pConexao, pTransacao);
  FSQL := 'SELECT * FROM ABASTECIMENTO';
end;

function TAbastecimentoDAO.getNumero: Integer;
begin
  Result := Consulta('SELECT COALESCE(MAX(NUMERO),0) + 1 FROM ABASTECIMENTO').Fields[0].asInteger;
end;

end.
