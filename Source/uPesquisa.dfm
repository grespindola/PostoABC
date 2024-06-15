object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '[ F2 ] - Pesquisar'
  ClientHeight = 411
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object gridPesquisa: TcxGrid
    Left = 0
    Top = 0
    Width = 772
    Height = 353
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16449524
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'TheAsphaltWorld'
    object gridPesquisaView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = gridPesquisaViewCellDblClick
      DataController.DataModeController.GridMode = True
      DataController.DataSource = dsPesquisa
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnAddValueItems = False
      Filtering.ColumnMRUItemsList = False
      OptionsBehavior.DragHighlighting = False
      OptionsBehavior.DragOpening = False
      OptionsBehavior.DragScrolling = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = '< N'#227'o h'#225' dados >'
      OptionsView.GridLineColor = 16449524
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.RowSeparatorColor = 16449524
      Styles.Content = cxStyle2
      Styles.Selection = cxStyle1
      OnColumnHeaderClick = gridPesquisaViewColumnHeaderClick
    end
    object gridPesquisaLevel: TcxGridLevel
      GridView = gridPesquisaView
    end
  end
  object pnPesquisa: TPanel
    Left = 0
    Top = 353
    Width = 772
    Height = 58
    Align = alBottom
    Color = 2960640
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      772
      58)
    object lbpesquisa: TLabel
      Left = 6
      Top = 3
      Width = 106
      Height = 17
      Caption = 'Pesquisando por :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16449524
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 438
      Top = 2
      Width = 327
      Height = 17
      Anchors = [akTop, akRight]
      Caption = '[ ENTER ] - Confirmar  [ DELETE ] - Limpar   [ ESC] - Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16449524
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 444
    end
    object edtPesquisa: TEdit
      Left = 6
      Top = 25
      Width = 545
      Height = 25
      ReadOnly = True
      TabOrder = 0
      OnChange = edtPesquisaChange
    end
    object rbComeca: TcxRadioButton
      Left = 566
      Top = 30
      Width = 113
      Height = 17
      Caption = 'Come'#231'a por'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16449524
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
    end
    object rbContem: TcxRadioButton
      Left = 678
      Top = 30
      Width = 68
      Height = 17
      Caption = 'Cont'#233'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16449524
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object qPesquisa: TFDQuery
    Connection = DMPrincipal.Conexao
    Left = 656
    Top = 24
  end
  object dsPesquisa: TDataSource
    DataSet = qPesquisa
    Left = 680
    Top = 24
  end
  object tPesquisa: TTimer
    Enabled = False
    Interval = 750
    OnTimer = tPesquisaTimer
    Left = 724
    Top = 24
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713921
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2960640
      Font.Height = -13
      Font.Name = 'Segoei UI'
      Font.Style = []
      TextColor = 2960640
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
  end
end
