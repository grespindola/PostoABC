
{------------------------------------------------------------------------------}
{ # PostoABC - Diálogo de Perguntas                                            }
{ Gustavo Espíndola - 14/06/2024                                               }
{------------------------------------------------------------------------------}

unit uPergunta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage, Vcl.Menus;

type
  TfrmPergunta = class(TForm)
    pnBotoes: TPanel;
    Panel5: TPanel;
    lblUsuario: TLabel;
    pnl_left: TPanel;
    imgInfo: TImage;
    lbMsg: TLabel;
    Panel1: TPanel;
    btSim: TButton;
    btNao: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btNaoClick(Sender: TObject);
    procedure btSimClick(Sender: TObject);
  private
    { Private declarations }
    Timer : TTimer;
    procedure TimerOnTimer(Sender: TObject);
  public
    { Public declarations }
    TimerSeconds : Integer;
  end;

var
  frmPergunta: TfrmPergunta;

implementation

uses
  uGlobais;

{$R *.dfm}

procedure TfrmPergunta.TimerOnTimer(Sender: TObject);
begin
  if timerSeconds = 0 then
  begin
    btsim.Enabled := True;
    btnao.Enabled := True;
    btsim.Caption := '&Sim';
    timer.Enabled := False;
  end
  else
  begin
    btsim.Enabled := False;
    btnao.Enabled := False;
    btsim.Caption := Format('&Sim' + '  (%ds)', [timerSeconds * -1]);
  end;
  Dec(timerSeconds);
end;

procedure TfrmPergunta.btNaoClick(Sender: TObject);
begin
  ModalResult := mrNo;
end;

procedure TfrmPergunta.btSimClick(Sender: TObject);
begin
  ModalResult := mrYes;
end;

procedure TfrmPergunta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if timerSeconds > 0 then
  begin
    Action := caNone;
    Exit;
  end
  else
  begin
    if Assigned(Timer) then
    begin
      Timer.Enabled := False;
      FreeAndNil(Timer);
    end;
    Action := caFree;
  end;
end;

procedure TfrmPergunta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    btNao.Click;
end;

procedure TfrmPergunta.FormShow(Sender: TObject);
var
  tamanho: Integer;
begin
  tamanho := Width;
  lbMsg.AutoSize := True;

  if (lbMsg.Width + lbMsg.Left) > tamanho then
    Width := (lbMsg.Width + lbMsg.Left) + 60;

  if lbMsg.Top + lbMsg.Height + 10 > pnBotoes.Top then
    Height := Height + (lbMsg.Top + lbMsg.Height - pnBotoes.Top + 25);

  if timerSeconds > 0 then
  begin
    btsim.Enabled := False;
    btnao.Enabled := False;
    timer := TTimer.Create(self);
    timer.Enabled := False;
    Timer.OnTimer := TimerOnTimer;
    timer.Interval := 1000;
    timer.Enabled := True;
  end;

  Application.ProcessMessages;
end;

end.
