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
      'HostName=LOCALHOST'
      'port=211')
    Left = 24
    Top = 16
  end
  object cdsDelitos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDelitos'
    RemoteServer = dspConnection
    Left = 24
    Top = 72
    object cdsDelitosID: TWideStringField
      FieldName = 'ID'
      Required = True
      Size = 38
    end
    object cdsDelitosNOMBRE: TWideStringField
      FieldName = 'NOMBRE'
      Size = 50
    end
  end
  object dspConnection: TDSProviderConnection
    ServerClassName = 'TsrvMethods'
    SQLConnection = cntData
    Left = 96
    Top = 16
  end
  object cdsIncidencias: TClientDataSet
    Aggregates = <>
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspIncidencias'
    RemoteServer = dspConnection
    Left = 96
    Top = 72
    object cdsIncidenciasID: TWideStringField
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
    object cdsIncidenciasID_DELITO: TWideStringField
      FieldName = 'ID_DELITO'
      Size = 38
    end
    object cdsIncidenciasFECHAHORA: TSQLTimeStampField
      FieldName = 'FECHAHORA'
    end
    object cdsIncidenciasPERSONA: TSmallintField
      FieldName = 'PERSONA'
    end
    object cdsIncidenciasREPORTE: TSmallintField
      FieldName = 'REPORTE'
    end
  end
end
