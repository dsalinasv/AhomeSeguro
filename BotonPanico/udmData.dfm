object dmData: TdmData
  OldCreateOrder = False
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
    Left = 24
    Top = 16
  end
  object ssmAlerta: TSqlServerMethod
    Params = <
      item
        DataType = ftWideString
        Precision = 2000
        Name = 'Delito'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Precision = 8
        Name = 'Latitud'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Precision = 8
        Name = 'Longitud'
        ParamType = ptInput
      end>
    SQLConnection = cntData
    ServerMethodName = 'TsrvMethods.Alerta'
    Left = 24
    Top = 64
  end
  object dspConnection: TDSProviderConnection
    ServerClassName = 'TsrvMethods'
    SQLConnection = cntData
    Left = 104
    Top = 16
  end
end
