object dmData: TdmData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 197
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
  object dspConnection: TDSProviderConnection
    ServerClassName = 'TsrvMethods'
    SQLConnection = cntData
    Left = 96
    Top = 16
  end
  object cdsDelitos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDelitos'
    RemoteServer = dspConnection
    Left = 24
    Top = 72
    object cdsDelitosID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 38
    end
    object cdsDelitosNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Origin = 'NOMBRE'
      Size = 50
    end
  end
  object cdsIncidencias: TClientDataSet
    Aggregates = <>
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspIncidencias'
    RemoteServer = dspConnection
    Left = 96
    Top = 72
    object cdsIncidenciasID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 38
    end
    object cdsIncidenciasLATITUD: TFloatField
      FieldName = 'LATITUD'
    end
    object cdsIncidenciasLONGITUD: TFloatField
      FieldName = 'LONGITUD'
    end
    object cdsIncidenciasFOTO: TBlobField
      FieldName = 'FOTO'
    end
    object cdsIncidenciasID_DELITO: TStringField
      FieldName = 'ID_DELITO'
      Size = 38
    end
    object cdsIncidenciasFECHAHORA: TSQLTimeStampField
      FieldName = 'FECHAHORA'
    end
    object cdsIncidenciasPERSONA: TSmallintField
      FieldName = 'PERSONA'
    end
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
    Top = 128
  end
end
