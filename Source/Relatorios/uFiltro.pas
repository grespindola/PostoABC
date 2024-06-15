
{------------------------------------------------------------------------------}
{ # PostoABC - Formulário de Filtro para Relatórios                            }
{ Gustavo Espíndola - 15/06/2024                                               }
{------------------------------------------------------------------------------}

unit uFiltro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, DateUtils;

type
  TfrmFiltro = class(TForm)
    pnFooter: TPanel;
    pnCadastro: TPanel;
    Label1: TLabel;
    pnHeader: TPanel;
    lblCodigo: TLabel;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnSair: TButton;
    edInicio: TDateTimePicker;
    edFinal: TDateTimePicker;
    Label2: TLabel;
    Label5: TLabel;
    qCombustivel: TFDQuery;
    qCombustivelCODIGO: TIntegerField;
    qCombustivelNOME: TStringField;
    qCombustivelPRECO_LITRO: TBCDField;
    dsCombustivel: TDataSource;
    Label3: TLabel;
    qTanque: TFDQuery;
    qTanqueCODIGO: TIntegerField;
    qTanqueNOME: TStringField;
    qTanqueCODIGO_COMBUSTIVEL: TIntegerField;
    dsTanque: TDataSource;
    Label4: TLabel;
    Label6: TLabel;
    qBombas: TFDQuery;
    dsBombas: TDataSource;
    btnLimpaComb: TBitBtn;
    btnLimpaTanque: TBitBtn;
    btnLimpaBomba: TBitBtn;
    qBombasCODIGO: TIntegerField;
    qBombasNOME: TStringField;
    qBombasCODIGO_TANQUE: TIntegerField;
    cbCombustivel: TComboBox;
    cbTanque: TComboBox;
    cbBomba: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLimpaCombClick(Sender: TObject);
    procedure btnLimpaTanqueClick(Sender: TObject);
    procedure btnLimpaBombaClick(Sender: TObject);
  private
    function criaFiltro: String;
    function criaCaptionFiltro: String;
    procedure alimentaCombos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltro: TfrmFiltro;

implementation

uses
   uConstants, uGlobais, uRelAbastecimento, uFuncoes;

{$R *.dfm}

procedure TfrmFiltro.btnLimpaBombaClick(Sender: TObject);
begin
   cbBomba.ItemIndex := -1;
end;

procedure TfrmFiltro.btnLimpaCombClick(Sender: TObject);
begin
   cbCombustivel.ItemIndex := -1;
end;

procedure TfrmFiltro.btnLimpaTanqueClick(Sender: TObject);
begin
   cbTanque.ItemIndex := -1;
end;

procedure TfrmFiltro.btnSairClick(Sender: TObject);
begin
   Close;
end;

function TfrmFiltro.criaCaptionFiltro : String;
var
   sCaption : String;
begin
   { Cria Caption de Filtros de acordo com filtros informados }

   //TIPO DE COMBUSTÍVEL
   if cbCombustivel.ItemIndex >= 0 then
   begin
      sCaption := sCaption + 'Comb.: '+cbCombustivel.Text + '; ';
   end;

   //TANQUE DE COMBUSTÍVEL
   if cbTanque.ItemIndex >= 0 then
      sCaption := sCaption + 'Tanque: '+cbTanque.Text + '; ';

   //BOMBA DE COMBUSTÍVEL
   if cbBomba.ItemIndex >= 0 then
      sCaption := sCaption + 'Bomba: '+cbBomba.Text;

   if not sCaption.Trim.IsEmpty then
      sCaption := #13#10+sCaption;

   sCaption := 'Período: '+
               FormatDateTime('dd/MM/yyyy', edInicio.Date) +
               ' a ' +
               FormatDateTime('dd/MM/yyyy', edFinal.Date)+
               sCaption;

   Result := sCaption;
end;

function TfrmFiltro.criaFiltro : String;
var
   sFiltro : String;
begin
   { Cria cláusula Where de acordo com filtros informados }

   if edInicio.Date > edFinal.Date then
   begin
      ShowInfo('Data inicial não pode ser maior que a Data Final.');
      if edInicio.CanFocus then
         edInicio.SetFocus;
      Abort;
   end;

   //PERÍODO DE DATA
   sFiltro := 'WHERE A.DATA BETWEEN '+
              FormatDateTime('dd.MM.yyyy', edInicio.Date).QuotedString +
              ' AND ' +
              FormatDateTime('dd.MM.yyyy', edFinal.Date).QuotedString + ' ';

   //TIPO DE COMBUSTÍVEL
   if cbCombustivel.ItemIndex >= 0 then
      sFiltro := sFiltro + ' AND C.CODIGO = ' +
                 Trim(Copy(cbCombustivel.Text, 1, Pos('-',cbCombustivel.Text) - 1));

   //TANQUE DE COMBUSTÍVEL
   if cbTanque.ItemIndex >= 0 then
      sFiltro := sFiltro + ' AND T.CODIGO = ' +
                 Trim(Copy(cbTanque.Text, 1, Pos('-',cbTanque.Text) - 1));

   //BOMBA DE COMBUSTÍVEL
   if cbBomba.ItemIndex >= 0 then
      sFiltro := sFiltro + ' AND B.CODIGO = ' +
                Trim(Copy(cbBomba.Text, 1, Pos('-',cbBomba.Text) - 1));

   result := sFiltro;
end;

procedure TfrmFiltro.btnInserirClick(Sender: TObject);
begin
   //Chamando relatório de Abastecimentos Diário
   RelAbastecimentos := TRelAbastecimentos.Create(Self);
   try
      RelAbastecimentos.Filtrar(criaFiltro(),
                                criaCaptionFiltro());
      RelAbastecimentos.qRel.Open;
      RelAbastecimentos.Relatorio.Preview;
   finally
      FreeAndNil(RelAbastecimentos);
   end;
end;

procedure TfrmFiltro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmFiltro.alimentaCombos;
begin
   { Cria cláusula Where de acordo com filtros informados }

   qCombustivel.Open;
   qCombustivel.First;
   cbCombustivel.Items.Clear;
   while not qCombustivel.Eof do
   begin
      cbCombustivel.Items.Add(qCombustivelCODIGO.AsString + ' - ' +
                              qCombustivelNOME.asString);
      qCombustivel.Next;
   end;

   qTanque.Open;
   qTanque.First;
   cbTanque.Items.Clear;
   while not qTanque.Eof do
   begin
      cbTanque.Items.Add(qTanqueCODIGO.AsString + ' - ' +
                         qTanqueNOME.asString);
      qTanque.Next;
   end;

   qBombas.Open;
   qBombas.First;
   cbBomba.Items.Clear;
   while not qBombas.Eof do
   begin
      cbBomba.Items.Add(qBombasCODIGO.AsString + ' - ' +
                         qBombasNOME.asString);
      qBombas.Next;
   end;

end;

procedure TfrmFiltro.FormCreate(Sender: TObject);
begin
   //Cor Padrão
   Self.Color := cFundoCadastro;
   edInicio.Date := IncDay(Date, -30);
   edFinal.Date  := Date;

   alimentaCombos;
end;

end.
