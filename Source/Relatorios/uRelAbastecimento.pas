unit uRelAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TRelAbastecimentos = class(TForm)
    Relatorio: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    dsRel: TDataSource;
    qRel: TFDQuery;
    qRelDATA: TDateField;
    qRelNOME_TANQUE: TStringField;
    qRelNOME_BOMBA: TStringField;
    qRelVALOR_DIA: TBCDField;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLBand4: TRLBand;
    RLLabel8: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLDBResult1: TRLDBResult;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    filtro: TRLMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Filtrar(sWhere : String; sCaption : String);
  end;

var
  RelAbastecimentos: TRelAbastecimentos;

implementation

uses
   uDmPrincipal;

{$R *.dfm}

{ TRelAbastecimentos }

procedure TRelAbastecimentos.Filtrar(sWhere: String; sCaption : String);
begin
   //Realiza filtro de acordo com argumento passado
   qRel.Close;
   qRel.SQL.Text := qRel.SQL.Text.Replace('/* WHERE */',' '+ sWhere +' ');
   qRel.Open;

   filtro.Lines.Text := sCaption;
end;

procedure TRelAbastecimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
