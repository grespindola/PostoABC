object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Posto ABC'
  ClientHeight = 622
  ClientWidth = 986
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = Menu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 0
    Top = 600
    Width = 986
    Height = 22
    Align = alBottom
    Alignment = taCenter
    Caption = 'Teste Fortes Tecnologia - Gustavo Resende Esp'#237'ndola'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    StyleElements = [seFont, seClient]
    ExplicitWidth = 464
  end
  object Menu: TMainMenu
    Left = 16
    Top = 8
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object Combustvel1: TMenuItem
        Caption = '&Combust'#237'vel'
        OnClick = Combustvel1Click
      end
      object Pessoas1: TMenuItem
        Caption = '&Tanques'
        OnClick = Pessoas1Click
      end
      object PessoasemLote1: TMenuItem
        Caption = '&Bombas'
        OnClick = PessoasemLote1Click
      end
    end
    object Abastecimento1: TMenuItem
      Caption = 'Abastecimento'
      object Lanamento1: TMenuItem
        Caption = '&Lan'#231'amentos...'
        OnClick = Lanamento1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object AbastecimentoDirio1: TMenuItem
        Caption = 'Abastecimento Di'#225'rio'
        OnClick = AbastecimentoDirio1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
