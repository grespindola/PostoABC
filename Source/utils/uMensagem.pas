unit uMensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.Imaging.pngimage, ShellApi, IniFiles,
  Vcl.Menus;

type
  TfrmMensagem = class(TForm)
    pnBotoes: TPanel;
    Panel5: TPanel;
    lblUsuario: TLabel;
    lbMsg: TLabel;
    pnl_left: TPanel;
    imgInfo: TImage;
    imgErro: TImage;
    imgWarning: TImage;
    Panel1: TPanel;
    btOk: TButton;
    procedure FormShow(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FTipo: TMsgDlgType;
    FInfo: string;
    FAlturaOriginal: Integer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; pTipo: TMsgDlgType; pMaisInfo: string = '');
  end;

var
  frmMensagem: TfrmMensagem;

implementation

uses
  uGlobais, uConstants;

{$R *.dfm}

procedure TfrmMensagem.btOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

constructor TfrmMensagem.Create(AOwner: TComponent; pTipo: TMsgDlgType; pMaisInfo: string = '');
begin
  inherited Create(AOwner);
  FTipo := pTipo;
  FInfo := pMaisInfo;
end;

procedure TfrmMensagem.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmMensagem.FormShow(Sender: TObject);
var
  tamanho: Integer;
begin
  self.Height := 224;
  tamanho := Width;
  lbMsg.AutoSize := True;

  Application.ProcessMessages;

  if (lbMsg.Width + lbMsg.Left) > tamanho then
    Width := (lbMsg.Width + lbMsg.Left) + 60;

  if lbMsg.Top + lbMsg.Height + 10 > pnBotoes.Top then
    Height := Height + (lbMsg.Top + lbMsg.Height - pnBotoes.Top + 25);

  imgWarning.Visible := False;
  imgErro.Visible := False;
  imgInfo.Visible := False;

  case FTipo of
    TMsgDlgType.mtWarning:
      begin
        imgWarning.Visible := True;
        self.Caption := 'Alerta!';
      end;
    TMsgDlgType.mtError:
      begin
        imgErro.Visible := True;
        self.Caption := 'Erro!';
      end;
    TMsgDlgType.mtInformation:
      begin
        imgInfo.Visible := True;
        Self.Caption := 'Informação!';
      end;
  end;

  FAlturaOriginal := Self.Height;

  Application.ProcessMessages;
end;

end.

