object srvMethods: TsrvMethods
  OldCreateOrder = False
  Height = 160
  Width = 215
  object cntData: TFDConnection
    Params.Strings = (
      'Database=C:\AppData\AHOME_SEGURO.FDB'
      'Password=masterkey'
      'User_Name=sysdba'
      'DriverID=FB')
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object qryDelitos: TFDQuery
    Connection = cntData
    SQL.Strings = (
      'select * from delitos')
    Left = 24
    Top = 56
  end
  object dspDelitos: TDataSetProvider
    DataSet = qryDelitos
    Left = 24
    Top = 104
  end
  object dspIncidencias: TDataSetProvider
    DataSet = qryIncidencias
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 104
  end
  object qryIncidencias: TFDQuery
    Connection = cntData
    SQL.Strings = (
      'select * from incidencias where id = '#39#39)
    Left = 96
    Top = 56
  end
end
