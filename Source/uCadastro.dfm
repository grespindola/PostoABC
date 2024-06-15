object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Padr'#227'o'
  ClientHeight = 496
  ClientWidth = 797
  Color = clWhite
  TransparentColorValue = 3355392
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object pnHeader: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Color = 13083523
    ParentBiDiMode = False
    ParentBackground = False
    TabOrder = 0
    object lblCodigo: TLabel
      Left = 10
      Top = 8
      Width = 49
      Height = 16
      Caption = 'C'#243'digo:'
      Color = clWindowText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object edtCodigo: TEdit
      Tag = 2000
      Left = 63
      Top = 4
      Width = 71
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnCadastro: TPanel
    Left = 0
    Top = 35
    Width = 797
    Height = 369
    Align = alClient
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Color = 15325901
    ParentBiDiMode = False
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 55
    ExplicitHeight = 349
  end
  object pnFooter: TPanel
    Left = 0
    Top = 404
    Width = 797
    Height = 92
    Align = alBottom
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Color = 13083523
    ParentBiDiMode = False
    ParentBackground = False
    TabOrder = 2
    object pnNavegacao: TPanel
      Left = 311
      Top = 7
      Width = 133
      Height = 33
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object btnPrimeiro: TButton
        Left = 0
        Top = 0
        Width = 34
        Height = 34
        Hint = 'Primeiro'
        Caption = '<<'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = False
        OnClick = btnPrimeiroClick
      end
      object btnAnterior: TButton
        Left = 33
        Top = 0
        Width = 34
        Height = 34
        Hint = 'Anterior'
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = btnAnteriorClick
      end
      object btnProximo: TButton
        Left = 66
        Top = 0
        Width = 34
        Height = 34
        Hint = 'Pr'#243'ximo'
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        OnClick = btnProximoClick
      end
      object btnUltimo: TButton
        Left = 99
        Top = 0
        Width = 34
        Height = 34
        Hint = #218'ltimo'
        Caption = '>>'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TabStop = False
        OnClick = btnUltimoClick
      end
    end
    object pnBotoes: TPanel
      Left = 37
      Top = 46
      Width = 724
      Height = 37
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object btnInserir: TButton
        Left = -4
        Top = 0
        Width = 100
        Height = 38
        Hint = 'Inserir'
        Caption = 'Inserir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = False
        OnClick = btnInserirClick
      end
      object btnAlterar: TButton
        Left = 99
        Top = 0
        Width = 100
        Height = 38
        Hint = 'Alterar'
        Caption = 'Alterar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = btnAlterarClick
      end
      object btnGravar: TButton
        Left = 201
        Top = 0
        Width = 100
        Height = 38
        Hint = 'Gravar'
        Caption = 'Gravar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        OnClick = btnGravarClick
      end
      object btnCancelar: TButton
        Left = 304
        Top = 0
        Width = 100
        Height = 38
        Hint = 'Cancelar'
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TabStop = False
        OnClick = btnCancelarClick
      end
      object btnExcluir: TButton
        Left = 407
        Top = 0
        Width = 100
        Height = 38
        Hint = 'Excluir'
        Caption = 'Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        TabStop = False
        OnClick = btnExcluirClick
      end
      object btnPesquisar: TButton
        Left = 509
        Top = 0
        Width = 100
        Height = 38
        Hint = 'Sair'
        Caption = 'Consultar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        TabStop = False
      end
      object btnSair: TButton
        Left = 612
        Top = 0
        Width = 100
        Height = 38
        Hint = '[ F2 ] - Pesquisar'
        Caption = 'Sair'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        TabStop = False
        OnClick = btnSairClick
      end
    end
  end
  object Transacao: TFDTransaction
    Left = 736
    Top = 8
  end
  object DataSource: TDataSource
    Left = 600
    Top = 8
  end
end
