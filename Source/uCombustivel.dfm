inherited frmCombustivel: TfrmCombustivel
  Caption = 'Combust'#237'veis'
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
    Height = 261
    ExplicitWidth = 783
    ExplicitHeight = 260
    object Label5: TLabel
      Left = 10
      Top = 63
      Width = 90
      Height = 17
      Caption = 'Pre'#231'o por Litro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 10
      Top = 11
      Width = 136
      Height = 17
      Caption = 'Nome do Combust'#237'vel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object edPreco: TDBEdit
      Tag = 1000
      Left = 10
      Top = 81
      Width = 123
      Height = 25
      AutoSelect = False
      Color = clWhite
      DataField = 'PRECO_LITRO'
      DataSource = DataSource
      TabOrder = 1
      OnKeyPress = edPrecoKeyPress
    end
    object edNome: TDBEdit
      Left = 10
      Top = 29
      Width = 392
      Height = 25
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = DataSource
      MaxLength = 100
      TabOrder = 0
    end
  end
  inherited pnFooter: TPanel
    Top = 296
    Width = 783
    ExplicitTop = 296
    ExplicitWidth = 783
  end
  inherited DataSource: TDataSource
    DataSet = qCombustivel
    Left = 680
  end
  object qCombustivel: TFDQuery
    Connection = dmPrincipal.FDConexao
    SQL.Strings = (
      'SELECT * FROM COMBUSTIVEL'
      '')
    Left = 608
    Top = 8
    object qCombustivelCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qCombustivelNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qCombustivelPRECO_LITRO: TBCDField
      FieldName = 'PRECO_LITRO'
      Origin = 'PRECO_LITRO'
      Required = True
      DisplayFormat = '0.000'
      EditFormat = '0.000'
      Precision = 18
      Size = 3
    end
  end
end
