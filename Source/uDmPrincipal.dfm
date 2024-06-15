object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 247
  Width = 351
  object QueryGeral: TFDQuery
    Connection = FDConexao
    Transaction = FDTransacao
    Left = 264
    Top = 72
  end
  object FDTransacao: TFDTransaction
    Connection = FDConexao
    Left = 160
    Top = 72
  end
  object FDConexao: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\_GIT\Delphi\Fortes\PostoABC\Dados\POSTOABC_FB3.0.FDB'
      'DriverID=Firebird'
      'Port=3050'
      'Server=localhost')
    LoginPrompt = False
    Transaction = FDTransacao
    Left = 52
    Top = 80
  end
  object FBDriver: TFDPhysFBDriverLink
    DriverID = 'Firebird'
    VendorLib = 'C:\_GIT\Delphi\Fortes\PostoABC\Bin\fbclient.dll'
    Left = 48
    Top = 136
  end
end
