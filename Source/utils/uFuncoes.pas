
{------------------------------------------------------------------------------}
{ # PostoABC - Biblioteca de Funcões Úteis                                     }
{ Gustavo Espíndola - 14/06/2024                                               }
{------------------------------------------------------------------------------}

unit uFuncoes;

interface

uses
  VCL.Forms, Vcl.Printers, VCL.stdCtrls,
  VCL.ComCtrls, SysUtils, IniFiles,
  ShellAPI, Winapi.Windows, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Winapi.Messages, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Mask, Vcl.DBCtrls;

  function leConfigs():Boolean;
  function Consulta(pSQL:String):TFDQuery;
  function getGenerator(pGenName:String; pQueima : Boolean = True): Integer;
  procedure validaNumeros(Sender: TObject; var Key: Char);
  procedure validaFloat(Sender: TObject; var Key: Char);

  procedure ShowInfo(pMensagem : String);
  procedure ShowAlerta(pMensagem : String; pMaisInfo : String = '');
  procedure ShowErro(pMensagem : String);
  function ShowPergunta(pMensagem, pTitulo : String; pTimer: Integer = 0): TModalResult;

  procedure formataComponentes(pForm : TForm; pModoEdit : Boolean);
  function Trunca(vValor : Double; vDecimais : Single) : Double;
  function checaEdit(pComponente:TWinControl):Boolean;
  function GetDefaultPrinterName: string;

  function salvaConfig(pSecao, pChave, pValor : String):Boolean;
  function leConfig(pSecao, pChave, pDefault : String): String;

  function EncryptStr(const S :WideString; Key: Word): String;
  function DecryptStr(const S: String; Key: Word): String;

  function IIF(p: Variant; pT, pF: Variant): Variant;

implementation

uses uGlobais, uConstants, uDMPrincipal, uMensagem, uPergunta;


function GetDefaultPrinterName: string;
begin
  Result := '';

  if (Printer.PrinterIndex >= 0) then
    Result := Printer.Printers[Printer.PrinterIndex];

end;

function salvaConfig(pSecao, pChave, pValor : String):Boolean;
var
  vIni : TIniFile;
begin
  vIni := TIniFile.Create(gExePath+cIniFile);
  try
    vIni.WriteString(pSecao,pChave,pValor);
  finally
    FreeAndNil(vIni);
  end;
end;

function leConfig(pSecao, pChave, pDefault : String):String;
var
  vIni : TIniFile;
begin
  vIni := TIniFile.Create(gExePath+cIniFile);
  try
    Result := vIni.ReadString(pSecao,pChave,pDefault);
  finally
    FreeAndNil(vIni);
  end;
end;


function leConfigs():Boolean;
var
  vIni : TIniFile;
  sCaminhoBD : String;
begin
  vIni := TIniFile.Create(gExePath+cIniFile);
  try
    gDBPath := vIni.ReadString('Conexao','CaminhoBanco','');
    gDBPort := vIni.ReadString('Conexao','Porta','');
    gDBHost := vIni.ReadString('Conexao','Servidor','');

    if gDBPath.Trim.isEmpty then
    begin
      vIni.WriteString('Conexao','CaminhoBanco','');
      raise Exception.Create('Caminho do Banco de dados não configurado!'+#13#10+
                             'Configure no arquivo que abrirá a seguir.');
    end
    else
    if not FileExists(gDBPath) then
    begin
      sCaminhoBD := StringReplace(AnsiUpperCase(gExePath),'BIN', 'DADOS', []);
      sCaminhoBD := IncludeTrailingPathDelimiter(sCaminhoBD) + 'POSTOABC_FB3.0.FDB';

      if FileExists(sCaminhoBD) then
      begin
         vIni.WriteString('Conexao','CaminhoBanco', sCaminhoBD);
         gDBPath := sCaminhoBD;
      end
      else
         raise Exception.Create('Banco de dados não encontrado no caminho configurado, verifique!'
                                +sLineBreak+sLineBreak+
                                'Caminho configurado: '+ gDBPath);

    end;
  finally
    FreeAndNil(vIni);
  end;
end;

function Consulta(pSQL:String):TFDQuery;
begin
  Result := TFDQuery.Create(Application);
  with Result do
  begin
    Connection := DMPrincipal.FDConexao;
    SQL.Text := pSQL;
    Open;
  end;
end;


function getGenerator(pGenName:String; pQueima : Boolean = True): Integer;
var
  vQueima : String;
begin
  if pQueima then
    vQueima := '1'
  else
    vQueima := '0';

  try
    Result := Consulta('SELECT GEN_ID('+pGenName+','+vQueima+') FROM RDB$DATABASE').Fields[0].asInteger;
  except
    Result := -1;
  end;

end;

procedure validaNumeros(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, #13, #27, '0'..'9']) then
    Key := #0;
end;

procedure validaFloat(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, #13, #27, '0'..'9', ',']) then
    Key := #0
  else
  if (Key = ',') and
     (Pos(Key, TEdit(Sender).Text) > 0) then
    Key := #0;
end;

function checaEdit(pComponente:TWinControl):Boolean;
begin
  Result :=  (pComponente is TEdit) or
             (pComponente is TMemo) or
             (pComponente is TDBEdit) or
             (pComponente is TDBMemo);
end;

procedure formataComponentes(pForm : TForm; pModoEdit : Boolean);
var
  vReadOnly : Boolean;
  I: Integer;
  vComponente : TComponent;
  vCor : TColor;
begin
  //Tag 0 - Ignora
  //Tag 1000 - Componente de Cadastro
  //Tag 2000 - Invertido
  //Tag 9999 - Sempre desativado

  for I := 0 to pForm.ComponentCount - 1 do
  begin
    vComponente := pForm.Components[i];

    case vComponente.Tag of
      0: Continue;
      1000: vReadOnly := not pModoEdit;
      2000: vReadOnly := pModoEdit;
      9999: vReadOnly := True;
    end;

    if vReadOnly then
      vCor := cCorReadOnly
    else
      vCor := cCorAtivo;

    if (vComponente is TDateTimePicker) then
    begin
      TDateTimePicker(vComponente).Enabled := not vReadOnly;
      TDateTimePicker(vComponente).Color := vCor;
    end else
    if (vComponente is TEdit) then
    begin
      TEdit(vComponente).ReadOnly := vReadOnly;
      TEdit(vComponente).Color := vCor;
    end else
    if (vComponente is TDBEdit) then
    begin
      TDBEdit(vComponente).ReadOnly := vReadOnly;
      TDBEdit(vComponente).Color := vCor;
    end else
    if (vComponente is TMemo) then
    begin
      TMemo(vComponente).ReadOnly := vReadOnly;
      TMemo(vComponente).Color := vCor;
    end else
    if (vComponente is TDBMemo) then
    begin
      TDBMemo(vComponente).ReadOnly := vReadOnly;
      TDBMemo(vComponente).Color := vCor;
    end else
    if (vComponente is TDBComboBox) then
    begin
      TDBComboBox(vComponente).Enabled := not vReadOnly;
      TDBComboBox(vComponente).Color := vCor;
    end else
    if (vComponente is TComboBox) then
    begin
      TComboBox(vComponente).Enabled := not vReadOnly;
      TComboBox(vComponente).Color := vCor;
    end else
    if (vComponente is TCheckBox) then
    begin
      TCheckBox(vComponente).Enabled := not vReadOnly;
      TCheckBox(vComponente).Color := vCor;
    end else
    if (vComponente is TDBCheckBox) then
    begin
      TDBCheckBox(vComponente).Enabled := not vReadOnly;
      TDBCheckBox(vComponente).Color := vCor;
    end else
    if (vComponente is TDBLookupComboBox) then
    begin
      TDBLookupComboBox(vComponente).Enabled := not vReadOnly;
      TDBLookupComboBox(vComponente).Color := vCor;
    end else
    if (vComponente is TGroupBox) then
    begin
      TGroupBox(vComponente).Enabled := vReadOnly;
    end;
  end;
  Application.ProcessMessages;
end;

function Trunca(vValor : Double; vDecimais : Single): Double;
var
  vMult : Single;
begin
  vMult := Power(10 ,vDecimais);
  Result := Trunc((vValor * vMult)) / vMult;
end;


function ShowPergunta(pMensagem, pTitulo : String; pTimer: Integer = 0):TModalResult;
begin
  try
    Application.CreateForm(TfrmPergunta, frmPergunta);
    frmPergunta.btsim.Visible := True;
    frmPergunta.btnao.Visible := True;
    frmPergunta.Caption := pTitulo;
    frmPergunta.lbMsg.Caption := pMensagem;
    frmPergunta.TimerSeconds := pTimer;
    Result := frmPergunta.ShowModal;
  finally
    FreeAndNil(frmPergunta);
  end;
end;

procedure ShowAlerta(pMensagem : String; pMaisInfo : String = '');
begin
  try
    frmMensagem := TfrmMensagem.Create(Application, mtWarning, pMaisInfo);
    frmMensagem.lbMsg.Caption := pMensagem;
    frmMensagem.ShowModal;
  finally
    FreeAndNil(frmMensagem);
  end;
end;

procedure ShowErro(pMensagem : String);
begin
  try
    frmMensagem := TfrmMensagem.Create(Application, mtError);
    frmMensagem.lbMsg.Caption := pMensagem;
    frmMensagem.ShowModal;
  finally
    FreeAndNil(frmMensagem);
  end;
end;

procedure ShowInfo(pMensagem : String);
begin
  try
    frmMensagem := TfrmMensagem.Create(Application, mtInformation);
    frmMensagem.lbMsg.Caption := pMensagem;
    frmMensagem.Caption := 'Informação!';
    frmMensagem.ShowModal;
  finally
    FreeAndNil(frmMensagem);
  end;
end;


function EncryptStr(const S :WideString; Key: Word): String;
var   i          :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
begin
  Result:= '';
  RStr:= UTF8Encode(S);
  for i := 0 to Length(RStr)-1 do begin
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (RStrB[i] + Key) * CK1 + CK2;
  end;
  for i := 0 to Length(RStr)-1 do begin
    Result:= Result + IntToHex(RStrB[i], 2);
  end;
end;

function DecryptStr(const S: String; Key: Word): String;
var   i, tmpKey  :Integer;
      RStr       :RawByteString;
      RStrB      :TBytes Absolute RStr;
      tmpStr     :string;
begin
  tmpStr:= UpperCase(S);
  SetLength(RStr, Length(tmpStr) div 2);
  i:= 1;
  try
    while (i < Length(tmpStr)) do begin
      RStrB[i div 2]:= StrToInt('$' + tmpStr[i] + tmpStr[i+1]);
      Inc(i, 2);
    end;
  except
    Result:= '';
    Exit;
  end;
  for i := 0 to Length(RStr)-1 do begin
    tmpKey:= RStrB[i];
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (tmpKey + Key) * CK1 + CK2;
  end;
  Result:= UTF8Decode(RStr);
end;

function IIF(p: Variant; pT, pF: Variant): Variant;
begin
  if p then
    Result := pT
  else
    Result := pF;
end;



end.

