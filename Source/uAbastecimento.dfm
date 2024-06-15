inherited frmAbastecimento: TfrmAbastecimento
  Caption = 'Lan'#231'amento de Abastecimentos'
  ClientHeight = 538
  ClientWidth = 783
  TransparentColorValue = clWhite
  Position = poMainFormCenter
  ExplicitWidth = 789
  ExplicitHeight = 567
  PixelsPerInch = 96
  TextHeight = 17
  object Label6: TLabel [0]
    Left = 153
    Top = 162
    Width = 75
    Height = 17
    Caption = 'Combust'#237'vel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
  end
  inherited pnHeader: TPanel
    Width = 783
    ExplicitWidth = 783
    inherited edtCodigo: TEdit
      Tag = 9999
      TabStop = False
      Color = 15325901
      ReadOnly = True
    end
  end
  inherited pnCadastro: TPanel
    Width = 783
    Height = 411
    ExplicitWidth = 783
    ExplicitHeight = 261
    object Label2: TLabel
      Left = 10
      Top = 58
      Width = 43
      Height = 17
      Caption = 'Bomba'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 10
      Top = 6
      Width = 188
      Height = 17
      Caption = 'Data e Hora do Abastecimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 279
      Top = 58
      Width = 75
      Height = 17
      Caption = 'Combust'#237'vel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 145
      Top = 111
      Width = 85
      Height = 17
      Hint = 
        'Para configurar o pre'#231'o do litro, '#13#10'v'#225' at'#233' o Cadastro de Combust' +
        #237'veis'
      Caption = 'Pre'#231'o do Litro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label5: TLabel
      Left = 10
      Top = 111
      Width = 53
      Height = 17
      Caption = 'Litragem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 279
      Top = 111
      Width = 101
      Height = 17
      Caption = 'Valor Abastecido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 136
      Top = 137
      Width = 6
      Height = 17
      Hint = 
        'Para configurar o pre'#231'o do litro, '#13#10'v'#225' at'#233' o Cadastro de Combust' +
        #237'veis'
      Caption = 'x'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label9: TLabel
      Left = 268
      Top = 137
      Width = 9
      Height = 17
      Hint = 
        'Para configurar o pre'#231'o do litro, '#13#10'v'#225' at'#233' o Cadastro de Combust' +
        #237'veis'
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object Label10: TLabel
      Left = 415
      Top = 111
      Width = 85
      Height = 17
      Caption = 'Valor Imposto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object edData: TDateTimePicker
      Tag = 1000
      Left = 10
      Top = 24
      Width = 189
      Height = 25
      Date = 45457.896724861110000000
      Format = 'dd/MM/yyyy HH:mm:ss'
      Time = 45457.896724861110000000
      TabOrder = 0
      TabStop = False
    end
    object cbBomba: TDBLookupComboBox
      Tag = 1000
      Left = 10
      Top = 76
      Width = 256
      Height = 25
      DataField = 'CODIGO_BOMBA'
      DataSource = DataSource
      KeyField = 'CODIGO'
      ListField = 'NOME'
      ListSource = dsBombas
      TabOrder = 1
    end
    object edCombustivel: TDBEdit
      Tag = 9999
      Left = 279
      Top = 76
      Width = 121
      Height = 25
      TabStop = False
      Color = 15325901
      DataField = 'COMB'
      DataSource = dsBombas
      ReadOnly = True
      TabOrder = 2
    end
    object edPrecoLitro: TDBEdit
      Tag = 9999
      Left = 145
      Top = 129
      Width = 121
      Height = 25
      Hint = 
        'Para configurar o pre'#231'o do litro, '#13#10'v'#225' at'#233' o Cadastro de Combust' +
        #237'veis'
      TabStop = False
      Color = 15325901
      DataField = 'PRECO_LITRO'
      DataSource = dsBombas
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 4
    end
    object edLitragem: TDBEdit
      Tag = 1000
      Left = 10
      Top = 129
      Width = 123
      Height = 25
      AutoSelect = False
      Color = clWhite
      DataField = 'LITROS'
      DataSource = DataSource
      TabOrder = 3
      OnChange = edLitragemChange
      OnKeyPress = edLitragemKeyPress
    end
    object edValorAbastecido: TDBEdit
      Tag = 9999
      Left = 279
      Top = 129
      Width = 121
      Height = 25
      TabStop = False
      Color = 15325901
      DataField = 'VALOR'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 5
    end
    object edValorImposto: TDBEdit
      Tag = 9999
      Left = 415
      Top = 129
      Width = 121
      Height = 25
      TabStop = False
      Color = 15325901
      DataField = 'IMPOSTO'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 6
    end
    object btnPreco: TBitBtn
      Left = 242
      Top = 103
      Width = 25
      Height = 25
      Hint = 'Configurar Pre'#231'o...'
      Glyph.Data = {
        A6080000424DA608000000000000360000002800000028000000120000000100
        18000000000070080000232E0000232E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF1E5E5FCF9F9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFEFDF4F4F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFCCA2A196413FAF6F6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5
        F5BFBCBBAFACAAE6E5E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F3F3B57A7895403E95403E
        A86260FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E8B5B2B0AEABA9AEABA9E0
        DFDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEDDEDEA55C5B95403E95403EB47776F8F3F3FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFD9D8D7AFACAAAEABA9B1AEACE1E0DFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE4CECDC18F8EB37574B57A78CA9F9EEFE2E2FFFFFFFFFFFFDBBD
        BD9A484695403E96413FCA9F9EFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFAFAF9DDDCDBC9C7C6C5C2C1CCCAC9E1E0DFFDFDFCFFFFFFFBFBFBC8C6C5
        AEABA9AEABA9B9B6B4F0EFEFFFFFFFFFFFFFFFFFFFFFFFFFF3E8E8AF6E6C9540
        3E95403E95403E95403E95403E964240C39392C4949395403E95403E9C4C4AE0
        C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E0DFB3B0AFAEABA9
        AEABA9AEABA9AEABA9AEABA9B7B5B3E1DFDFBBB8B7AEABA9AEABA9C5C2C1F9F9
        F9FFFFFFFFFFFFFFFFFFFFFFFFF5ECECA1565495403EA05351CA9F9EDFC5C4DB
        BEBDBE8A8998444295403E95403E95403EA86261F0E4E4FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDDDCDBAEABA9AEABA9C4C2C1E1DFDFE8E7E6DDDC
        DBBDBBB9AEABA9AEABA9AEABA9AFACAAD5D4D2FFFFFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFB4777695403EAE6D6BF9F3F3FFFFFFFFFFFFFFFFFFFFFFFFE9D8D7
        9C4D4B95403EB0706EFBF8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF2F1F1B0ADABAFACAADFDEDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED1D0CEAE
        ABA9AEABA9E2E1E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECDDDD95403E
        9B4A48F6EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDABCBB95403EA55C
        5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCCCAAEABA9CE
        CDCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0BEBCAEABA9DEDCDC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0A9A895403EBE8987FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD9D4F4D95403EF2E7E7FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B5B3AEABA9F1F0F0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E0E0AEABA9C7C5C4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC4959495403ECFA8A7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFAD6B6995403EE7D3D3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFAFACAAAEABA9FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFEEEEEDAEABA9BFBCBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFCA9E9D95403EC79998FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA55C5A95403EECDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFB3B0AEAEABA9F8F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8
        E7E6AEABA9C3C0BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1C9C995403E
        A55D5BFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDDEDD96413F9B4A
        48FDFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C3C2AEABA9DD
        DCDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECCCBAEABA9D3D2D1
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDA3595895403ECA9E9DFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFBF8F8AC6A6895403EC2908FFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E5E4AEABA9B4B1B0F4F3F3FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE9E9E8AFACAAAFACAAF3F2F2FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE3CCCB96424095403EBD8786EFE2E2FFFFFFFD
        FCFCE3CCCBAA656395403EA25755F9F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFC7C5C4AEABA9B5B2B0E1E0DFFCFCFBFFFFFFF8F8
        F8D9D7D6B1AEACAEABA9D6D5D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDABDBC99474595403E95403E9A484698444295403E95403E
        A45A58F0E4E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFCFCFCC6C4C3AEABA9AEABA9AFACAAB2AFAEAEABA9AEABA9AEABA9D1
        D0CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF0E3E3BC86859D4F4D95403E95403EA55D5BCDA5A4FBF8F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE1E0DFC0BEBCB0ADABAEABA9B1AEACC7C5C3EBEAE9FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF9F4F4FBF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFEFAFAF9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      TabStop = False
      OnClick = btnPrecoClick
    end
    object grid: TDBGrid
      Tag = 1000
      Left = 10
      Top = 164
      Width = 761
      Height = 237
      TabStop = False
      DataSource = DataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentColor = True
      ReadOnly = True
      TabOrder = 8
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'Cod.'
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HORA'
          Title.Alignment = taCenter
          Title.Caption = 'Hora'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Bomba'
          Width = 210
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LITROS'
          Title.Caption = 'Litragem'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPOSTO'
          Width = 100
          Visible = True
        end>
    end
  end
  inherited pnFooter: TPanel
    Top = 446
    Width = 783
    ExplicitTop = 296
    ExplicitWidth = 783
  end
  inherited DataSource: TDataSource
    DataSet = qAbastecimento
    Left = 680
  end
  object qBombas: TFDQuery
    Connection = dmPrincipal.FDConexao
    SQL.Strings = (
      'SELECT B.CODIGO, B.NOME, C.NOME AS COMB, C.PRECO_LITRO'
      'FROM BOMBA B'
      'LEFT JOIN TANQUE T ON B.CODIGO_TANQUE = T.CODIGO'
      'LEFT JOIN COMBUSTIVEL C ON T.CODIGO_COMBUSTIVEL = C.CODIGO')
    Left = 608
    Top = 63
    object qBombasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qBombasNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object qBombasCOMB: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMB'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qBombasPRECO_LITRO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_LITRO'
      Origin = 'PRECO_LITRO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
  object dsBombas: TDataSource
    DataSet = qBombas
    Left = 680
    Top = 64
  end
  object qAbastecimento: TFDQuery
    AfterScroll = qAbastecimentoAfterScroll
    Connection = dmPrincipal.FDConexao
    SQL.Strings = (
      'SELECT A.*, B.NOME'
      'FROM ABASTECIMENTO A'
      'LEFT JOIN BOMBA B ON B.CODIGO = A.CODIGO_BOMBA'
      'ORDER BY CODIGO')
    Left = 608
    Top = 8
    object qAbastecimentoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qAbastecimentoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qAbastecimentoHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object qAbastecimentoCODIGO_BOMBA: TIntegerField
      FieldName = 'CODIGO_BOMBA'
      Origin = 'CODIGO_BOMBA'
    end
    object qAbastecimentoLITROS: TBCDField
      FieldName = 'LITROS'
      Origin = 'LITROS'
      DisplayFormat = '0.000'
      EditFormat = '#,###0.000'
      Precision = 18
      Size = 3
    end
    object qAbastecimentoVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = '0.000'
      EditFormat = '#,###0.000'
      Precision = 18
      Size = 3
    end
    object qAbastecimentoIMPOSTO: TBCDField
      FieldName = 'IMPOSTO'
      Origin = 'IMPOSTO'
      DisplayFormat = '0.000'
      EditFormat = '#,###0.000'
      Precision = 18
      Size = 3
    end
    object qAbastecimentoNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
end
