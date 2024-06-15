inherited frmTanque: TfrmTanque
  Caption = 'Tanques de Combust'#237'vel'
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
    ExplicitTop = 35
    ExplicitWidth = 783
    ExplicitHeight = 260
    object Label5: TLabel
      Left = 10
      Top = 65
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
    object Label1: TLabel
      Left = 10
      Top = 11
      Width = 203
      Height = 20
      Caption = 'Nome do Tanque de Combust'#237'vel'#13#10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object edNome: TDBEdit
      Left = 10
      Top = 29
      Width = 392
      Height = 25
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = DataSource
      TabOrder = 0
    end
    object cbCombustivel: TDBLookupComboBox
      Tag = 1000
      Left = 10
      Top = 83
      Width = 392
      Height = 25
      DataField = 'CODIGO_COMBUSTIVEL'
      DataSource = DataSource
      KeyField = 'CODIGO'
      ListField = 'NOME'
      ListSource = dsCombustivel
      TabOrder = 1
    end
  end
  inherited pnFooter: TPanel
    Top = 296
    Width = 783
    ExplicitTop = 296
    ExplicitWidth = 783
  end
  inherited DataSource: TDataSource
    DataSet = qTanque
    Left = 680
  end
  object qTanque: TFDQuery
    Connection = dmPrincipal.FDConexao
    SQL.Strings = (
      'SELECT * FROM TANQUE'
      '')
    Left = 608
    Top = 8
    object qTanqueCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qTanqueNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qTanqueCODIGO_COMBUSTIVEL: TIntegerField
      FieldName = 'CODIGO_COMBUSTIVEL'
      Origin = 'CODIGO_COMBUSTIVEL'
      Required = True
    end
  end
  object qCombustivel: TFDQuery
    Connection = dmPrincipal.FDConexao
    SQL.Strings = (
      'SELECT * FROM COMBUSTIVEL')
    Left = 608
    Top = 63
    object qCombustivelCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
      Precision = 18
      Size = 3
    end
  end
  object dsCombustivel: TDataSource
    DataSet = qCombustivel
    Left = 680
    Top = 64
  end
end
