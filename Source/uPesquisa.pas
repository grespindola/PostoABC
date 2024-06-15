unit uPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, cxRadioGroup,
  Vcl.ExtCtrls, cxTimeEdit, cxCurrencyEdit;

type
  TfrmPesquisa = class(TForm)
    gridPesquisaView: TcxGridDBTableView;
    gridPesquisaLevel: TcxGridLevel;
    gridPesquisa: TcxGrid;
    qPesquisa: TFDQuery;
    dsPesquisa: TDataSource;
    pnPesquisa: TPanel;
    edtPesquisa: TEdit;
    lbpesquisa: TLabel;
    rbComeca: TcxRadioButton;
    rbContem: TcxRadioButton;
    Label1: TLabel;
    tPesquisa: TTimer;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridPesquisaViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure gridPesquisaViewColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaChange(Sender: TObject);
    procedure tPesquisaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FResult : ^Variant;
    FCampos : String;
    FCampoResult : String;
    FTamanhos : String;
    FNomes : String;
    sTamanhos, sNomes, sCampos : TStringList;
    procedure criaColunas;
    function getWidth(var pColumn : TcxGridDBColumn; pTamanho : String): Integer;
    procedure Pesquisa;
    procedure Ordena;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; pTabela: String; pNomes:String; pCampos : String; pTamanhos: String; pTitulo: string; var pValorResult : Variant);
  end;

var
  frmPesquisa: TfrmPesquisa;

  FColuna, FCampoResult, FSQL, FOrder : String;

implementation

{$R *.dfm}

uses uDMPrincipal, uFuncoes;

function TfrmPesquisa.getWidth(var pColumn : TcxGridDBColumn; pTamanho : String): Integer;
begin
{I = 000000000 ou (width do titulo + 10)
C = (width do titulo + 10)
SS = SSSSSSSSSSSSSSSSSSSS ou (width do titulo + 10)
S = SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
MS = SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
LS = SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
F = 000000000,00}
  Result := 150;

  if pTamanho = 'I' then
    Result := 75
  else
  if pTamanho = 'C' then
    Result := pColumn.Width + 10
  else
  if pTamanho = 'SS' then
    Result := 100
  else
  if pTamanho = 'S' then
    Result := 400
  else
  if pTamanho = 'MS' then
    Result := 600
  else
  if pTamanho = 'LS' then
    Result := 1000
  else
  if pTamanho = 'F' then
    Result := 120;

  if Result < (pColumn.Width + 10) then
    Result := pColumn.Width + 10;

  pColumn.Width := Result;

end;

procedure TfrmPesquisa.criaColunas;
var
  i : Integer;
  AColumn : TcxGridDBColumn;
begin
  try
    FColuna := EmptyStr;

    for i := 0 to qPesquisa.FieldCount -1 do
    begin
      if Pos('&', sNomes[i]) > 0 then
      begin
        FColuna := sCampos[i];
        sNomes[i] := sNomes[i].Replace('&','',[rfReplaceAll]);
        lbPesquisa.Caption := 'Pesquisando por ' + sNomes[i];
      end;
      AColumn := gridPesquisaView.CreateColumn;
      with AColumn do
      begin
        DataBinding.FieldName := qPesquisa.Fields[i].FieldName;
        Options.Sorting := True;
        Caption := sNomes[i];
        if sTamanhos[i] = 'F' then
        begin
          PropertiesClass := TcxCurrencyEditProperties;
          TcxCurrencyEditProperties(AColumn.Properties).DisplayFormat := 'R$ ,0.00;';
        end;

        ApplyBestFit;
        getWidth(AColumn, sTamanhos[i]);
      end;
    end;

    if FColuna.IsEmpty then
    begin
      FColuna := sCampos[0];
      lbPesquisa.Caption := 'Pesquisando por ' + sNomes[1];
    end;

  finally

  end;
end;

procedure TfrmPesquisa.edtPesquisaChange(Sender: TObject);
begin
  tPesquisa.Enabled := True;
end;

constructor TfrmPesquisa.Create(AOwner: TComponent; pTabela: String; pNomes:String; pCampos : String; pTamanhos: String; pTitulo: string; var pValorResult : Variant);
var
  i : Integer;
begin
  inherited Create(AOwner);
  FResult := @pValorResult;
  FOrder := ' ASC ';
  FCampoResult := 'CODIGO';
  FTamanhos := pTamanhos;
  FNomes := pNomes;
  FCampos := pCampos;

  if not pTitulo.Trim.IsEmpty then
    Self.Caption := '[ F2 ] - Pesquisar '+pTitulo;

  sTamanhos := TStringList.Create;
  sNomes := TStringList.Create;
  sCampos := TStringList.Create;

  sTamanhos.StrictDelimiter := True;
  sNomes.StrictDelimiter := True;
  sCampos.StrictDelimiter := True;

  sTamanhos.Delimiter := '|';
  sNomes.Delimiter := '|';
  sCampos.Delimiter := '|';

  sTamanhos.DelimitedText := FTamanhos;
  sNomes.DelimitedText := FNomes;
  sCampos.DelimitedText := FCampos;

  for i := 0 to sCampos.Count -1 do
  begin
    if Pos('#', sCampos[i]) > 0 then
    begin
      FCampoResult := sCampos[i].Replace('#','',[rfReplaceAll]);
      sCampos[i] := FCampoResult;
    end;
  end;

  if FCampoResult.isEmpty then
    FCampoResult := 'CODIGO';


  try
    FSQl := ' SELECT '+
            FCampos.Replace('|',',',[rfReplaceAll]).Replace('#','',[rfReplaceAll])+
            ' FROM '+pTabela+
            ' /*WHERE*/ '+
            ' /*ORDER*/ ';
    qPesquisa.Close;

    qPesquisa.Open(FSQL);

    criaColunas;
  except
    on e : exception do
      ShowInfo('Pesquisa não configurada corretamente.' + sLineBreak + e.message);
  end;
//  gridPesquisaView.DataController.CreateAllItems(True);
end;

procedure TfrmPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sTamanhos.Free;
  sNomes.Free;
  sCampos.Free;
  Action := caFree;
end;

procedure TfrmPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    FResult^ := 0;
    Close;
  end
  else
  if Key = VK_Return then
  begin
    if not qPesquisa.isEmpty then
      FResult^ := qPesquisa.FieldByName(FCampoResult).Value
    else
      FResult^ := 0;

    Close;
  end
  else
  begin

    if (Key = VK_BACK) then //backspace
    begin
      edtPesquisa.Text := Copy(edtPesquisa.Text,1,Length(edtPesquisa.Text)-1);
      edtPesquisa.SelStart := Length(edtPesquisa.Text);
    end
    else if Key = VK_DELETE then   //DEL
      edtPesquisa.Clear;
  end;
end;

procedure TfrmPesquisa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Ord(Key) in [8,13,27,127]) then
  begin
    if Ord(Key) in [32..126, 128..167] then
    begin
      edtPesquisa.Text := edtPesquisa.Text + Key;
      edtPesquisa.SelStart := Length(edtPesquisa.Text);
    end;
  end;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
  Top := 0;
  Left := 0;
end;

procedure TfrmPesquisa.gridPesquisaViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if not qPesquisa.isEmpty then
  begin
    FResult^ := qPesquisa.FieldByName(FCampoResult).Value;
    Close;
  end;
end;

procedure TfrmPesquisa.Ordena();
begin
  qPesquisa.Close;
  qPesquisa.SQL.Text := FSQL.Replace('/*ORDER*/',' ORDER BY '+FColuna+FOrder);
  qPesquisa.Open;

  if FOrder = ' ASC ' then
    FOrder := ' DESC '
  else
    FOrder := ' ASC ';
end;

procedure TfrmPesquisa.Pesquisa();
var
  vFiltro : String;
begin
  if rbContem.Checked then
    vFiltro := ' WHERE UPPER('+FColuna+') LIKE ''%'+AnsiUpperCase(edtPesquisa.Text)+'%'' '
  else
    vFiltro := ' WHERE UPPER('+FColuna+') LIKE '''+AnsiUpperCase(edtPesquisa.Text)+'%'' ';

  qPesquisa.Close;
  qPesquisa.SQL.Text := FSQL.Replace('/*WHERE*/',vFiltro);
  qPesquisa.Open;

  qPesquisa.First;
end;
procedure TfrmPesquisa.gridPesquisaViewColumnHeaderClick(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  FColuna := sCampos[AColumn.Index];
  lbPesquisa.Caption := 'Pesquisando por ' + sNomes[AColumn.Index];
  Ordena();
end;

procedure TfrmPesquisa.tPesquisaTimer(Sender: TObject);
begin
  if edtPesquisa.Text <> EmptySTr then
    Pesquisa()
  else
  begin
    qPesquisa.Close;
    qPesquisa.SQL.Text := FSQL;
    qPesquisa.Open;
  end;
  tPesquisa.Enabled := False;
end;

end.
