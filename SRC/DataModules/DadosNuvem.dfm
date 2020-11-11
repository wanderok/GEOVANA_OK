object DMNuvem: TDMNuvem
  OldCreateOrder = False
  Height = 150
  Width = 419
  object Database1: TFDConnection
    ConnectionName = 'X'
    Params.Strings = (
      'Database=wander'
      'User_Name=sa'
      'Server=45.34.12.247'
      'Password=93VYetFayUu_?gC*'
      'DriverID=MySQL')
    FetchOptions.AssignedValues = [evMode, evAutoFetchAll]
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object Query1: TFDQuery
    Connection = Database1
    SQL.Strings = (
      'select * from CLIENTE_CLI')
    Left = 208
    Top = 16
  end
  object Query2: TFDQuery
    Connection = Database1
    SQL.Strings = (
      'select * from cliente')
    Left = 256
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\SMCPLUS\libmysql.dll'
    Left = 144
    Top = 64
  end
  object qCONFIG_NUVEM: TFDQuery
    Connection = Database1
    SQL.Strings = (
      'select * from CLIENTE_CLI')
    Left = 264
    Top = 72
  end
end
