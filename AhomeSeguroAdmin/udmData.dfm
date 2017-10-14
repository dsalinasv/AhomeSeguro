object dmData: TdmData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object cntData: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'HostName=cevaf.redirectme.net'
      'port=211')
    Connected = True
    Left = 24
    Top = 16
  end
  object dspConnection: TDSProviderConnection
    ServerClassName = 'TsrvMethods'
    Connected = True
    SQLConnection = cntData
    Left = 88
    Top = 16
  end
  object cdsDelitos: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDelitos'
    RemoteServer = dspConnection
    Left = 24
    Top = 64
  end
  object dsDelitos: TDataSource
    DataSet = cdsDelitos
    Left = 88
    Top = 64
  end
  object cdsIncidencias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIncidencias'
    RemoteServer = dspConnection
    Left = 152
    Top = 64
  end
end
