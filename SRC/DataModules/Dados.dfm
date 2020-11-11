object DM: TDM
  OldCreateOrder = False
  Height = 98
  Width = 361
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 128
    Top = 8
  end
  object Database1: TFDConnection
    ConnectionName = 'X'
    Params.Strings = (
      'Database=SMCPLUS'
      'User_Name=sa'
      'Password=Senha123@'
      'Server=HPW'
      'DriverID=MSSQL')
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
      'select * from cliente')
    Left = 208
    Top = 16
  end
  object qUSUARIO: TFDQuery
    Connection = Database1
    SQL.Strings = (
      'select * from cliente')
    Left = 304
    Top = 16
  end
  object Query2: TFDQuery
    Connection = Database1
    SQL.Strings = (
      'select * from cliente')
    Left = 256
    Top = 16
  end
  object qCONFIG: TFDQuery
    Connection = Database1
    SQL.Strings = (
      'select * from cliente')
    Left = 216
    Top = 48
  end
end
