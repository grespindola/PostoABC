unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, VCL.Forms;

type
  TdmPrincipal = class(TDataModule)
    QueryGeral: TFDQuery;
    FDTransacao: TFDTransaction;
    FDConexao: TFDConnection;
    FBDriver: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

uses
   uGlobais, uFuncoes;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin

   with FDConexao.Params do
   begin
      Database := gDBPath;
      UserName := 'SYSDBA';
      Password := 'masterkey';
      Add('Port='+gDBPort);
      Add('Server='+gDBHost);
      Add('DriverID=Firebird');
   end;

   FBDriver.VendorLib := gExePath + 'fbclient.dll';
   FDConexao.DriverName := 'FB';
   try
      FDConexao.Connected := True;
   except
      on e: exception do
      begin
         ShowAlerta('Erro ao conectar com banco de dados.'#13#10#13#10+
                    'Verifique se a versão instalada do Firebird é a 3.0 '+
                    'e o arquivo de configuração PostoABC.ini está configurado '+
                    'corretamente.'+#13#10#13#10+
                    'Erro: '+ e.Message);
         Application.Terminate;
      end;
   end;

end;

end.
