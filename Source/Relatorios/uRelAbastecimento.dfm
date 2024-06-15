object RelAbastecimentos: TRelAbastecimentos
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 624
  ClientWidth = 866
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object Relatorio: TRLReport
    Left = 40
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dsRel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 71
      BandType = btTitle
      object RLLabel10: TRLLabel
        Left = 0
        Top = 34
        Width = 718
        Height = 37
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = False
        Caption = ' '
        Color = clSilver
        ParentColor = False
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 200
        Top = 42
        Width = 325
        Height = 22
        Caption = 'Relat'#243'rios de Abastecimentos - Di'#225'rio'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 12
        Width = 39
        Height = 16
        Alignment = taJustify
        Color = clWhite
        ParentColor = False
        Text = ''
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 637
        Top = 12
        Width = 48
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Info = itPageNumber
        ParentColor = False
        Text = 'Pag.: '
        Transparent = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 686
        Top = 12
        Width = 29
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Info = itLastPageNumber
        ParentColor = False
        Text = 'de '
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 109
      Width = 718
      Height = 24
      BandType = btColumnHeader
      GroupIndex = 1
      object RLLabel6: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 24
        Align = faClient
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = ' '
        Color = 15000804
        ParentColor = False
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 0
        Top = 0
        Width = 80
        Height = 24
        Align = faHeight
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Caption = 'Data'
        Color = 15000804
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 79
        Top = 0
        Width = 227
        Height = 24
        Align = faHeight
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Caption = 'Tanque'
        Color = 15000804
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 305
        Top = 0
        Width = 304
        Height = 24
        Align = faHeight
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Caption = 'Bomba'
        Color = 15000804
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 608
        Top = 0
        Width = 110
        Height = 24
        Align = faHeight
        Alignment = taCenter
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Caption = 'Valor'
        Color = 15000804
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 133
      Width = 718
      Height = 27
      GroupIndex = 1
      object RLLabel7: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 27
        Align = faClient
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Caption = ' '
      end
      object RLDBText1: TRLDBText
        Left = 0
        Top = 0
        Width = 80
        Height = 27
        Align = faHeight
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        DataField = 'DATA'
        DataSource = dsRel
        Layout = tlCenter
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 79
        Top = 0
        Width = 227
        Height = 27
        Align = faHeight
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        DataField = 'NOME_TANQUE'
        DataSource = dsRel
        Layout = tlCenter
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 305
        Top = 0
        Width = 304
        Height = 27
        Align = faHeight
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        DataField = 'NOME_BOMBA'
        DataSource = dsRel
        Layout = tlCenter
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 608
        Top = 0
        Width = 110
        Height = 27
        Align = faHeight
        Alignment = taRightJustify
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        DataField = 'VALOR_DIA'
        DataSource = dsRel
        DisplayMask = '#,###0.000'
        Layout = tlCenter
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 160
      Width = 718
      Height = 28
      BandType = btColumnFooter
      GroupIndex = 1
      object RLLabel9: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 28
        Align = faClient
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Caption = ' '
        Color = 15000804
        ParentColor = False
        Transparent = False
      end
      object RLLabel8: TRLLabel
        Left = 500
        Top = 6
        Width = 107
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor Total:'
        Color = 15000804
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object RLDBResult1: TRLDBResult
        Left = 608
        Top = 6
        Width = 110
        Height = 16
        Alignment = taRightJustify
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        Color = 15000804
        DataField = 'VALOR_DIA'
        DataSource = dsRel
        DisplayMask = '#,###0.000'
        Info = riSum
        ParentColor = False
        Text = ''
        Transparent = False
      end
    end
  end
  object dsRel: TDataSource
    DataSet = qRel
    Left = 824
    Top = 16
  end
  object qRel: TFDQuery
    Connection = dmPrincipal.FDConexao
    SQL.Strings = (
      'SELECT A.DATA,'
      '       T.NOME AS NOME_TANQUE,'
      '       B.NOME AS NOME_BOMBA,'
      '       SUM(A.VALOR) AS VALOR_DIA'
      'FROM ABASTECIMENTO A'
      'LEFT JOIN BOMBA B ON A.CODIGO_BOMBA = B.CODIGO'
      'LEFT JOIN TANQUE T ON B.CODIGO_TANQUE = T.CODIGO'
      'LEFT JOIN COMBUSTIVEL C ON T.CODIGO_COMBUSTIVEL = C.CODIGO'
      'GROUP BY 1, 2, 3'
      'ORDER BY 1, 2, 3')
    Left = 824
    Top = 64
    object qRelDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object qRelNOME_TANQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_TANQUE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qRelNOME_BOMBA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_BOMBA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qRelVALOR_DIA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_DIA'
      Origin = 'VALOR_DIA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
end
