inherited frmAbastecimento: TfrmAbastecimento
  Caption = 'Abastecimento'
  ClientHeight = 388
  ClientWidth = 783
  TransparentColorValue = clWhite
  Position = poMainFormCenter
  ExplicitWidth = 789
  ExplicitHeight = 417
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
    Height = 241
    ExplicitLeft = 8
    ExplicitTop = 49
    ExplicitWidth = 783
    ExplicitHeight = 241
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
      Top = 5
      Width = 73
      Height = 17
      Caption = 'Data e Hora'
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
      Width = 65
      Height = 17
      Hint = 
        'Para configurar o pre'#231'o do litro, '#13#10'v'#225' at'#233' o Cadastro de Combust' +
        #237'veis'
      Caption = 'Pre'#231'o Litro'
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
      Left = 10
      Top = 161
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
      Top = 23
      Width = 186
      Height = 25
      Date = 45457.896724861110000000
      Format = 'dd/mm/yyyy HH:mm:ss'
      Time = 45457.896724861110000000
      TabOrder = 2
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
      TabOrder = 0
    end
    object edCombustivel: TDBEdit
      Tag = 9999
      Left = 279
      Top = 76
      Width = 121
      Height = 25
      Color = 15325901
      DataField = 'COMB'
      DataSource = dsBombas
      ReadOnly = True
      TabOrder = 3
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
      Color = clWhite
      DataField = 'LITROS'
      DataSource = DataSource
      TabOrder = 1
      OnChange = edLitragemChange
      OnKeyPress = edLitragemKeyPress
    end
    object edValorAbastecido: TDBEdit
      Tag = 9999
      Left = 279
      Top = 129
      Width = 121
      Height = 25
      Color = 15325901
      DataField = 'VALOR'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 5
    end
    object edValorImposto: TDBEdit
      Tag = 9999
      Left = 10
      Top = 179
      Width = 121
      Height = 25
      Color = 15325901
      DataField = 'IMPOSTO'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 6
    end
  end
  inherited pnFooter: TPanel
    Top = 296
    Width = 783
    ExplicitTop = 244
    ExplicitWidth = 783
    inherited pnBotoes: TPanel
      inherited btnPesquisar: TButton
        OnClick = btnPesquisarClick
      end
    end
  end
  inherited DataSource: TDataSource
    Left = 680
  end
  object qBombas: TFDQuery
    Connection = dmPrincipal.FDConexao
    SQL.Strings = (
      'SELECT B.CODIGO, B.NOME, C.NOME AS COMB, C.PRECO_LITRO'
      'FROM BOMBA B'
      'LEFT JOIN TANQUE T ON B.CODIGO_TANQUE = T.CODIGO'
      'LEFT JOIN COMBUSTIVEL C ON T.CODIGO_COMBUSTIVEL = C.CODIGO')
    Left = 672
    Top = 95
  end
  object dsBombas: TDataSource
    DataSet = qBombas
    Left = 632
    Top = 95
  end
end
