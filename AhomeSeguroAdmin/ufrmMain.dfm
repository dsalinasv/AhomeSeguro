object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Admin Incidencias'
  ClientHeight = 448
  ClientWidth = 968
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 41
    Width = 968
    Height = 388
    Align = alClient
    TabOrder = 0
    ExplicitTop = 0
    ExplicitWidth = 750
    ExplicitHeight = 468
    ControlData = {
      4C0000000C6400001A2800000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 429
    Width = 968
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 968
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 64
      Height = 13
      Caption = 'Tipo de delito'
    end
    object Label2: TLabel
      Left = 272
      Top = 14
      Width = 57
      Height = 13
      Caption = 'Fecha inicial'
    end
    object Label3: TLabel
      Left = 544
      Top = 14
      Width = 52
      Height = 13
      Caption = 'Fecha final'
    end
    object dbcDelitos: TDBLookupComboBox
      Left = 96
      Top = 11
      Width = 145
      Height = 21
      KeyField = 'ID'
      ListField = 'NOMBRE'
      ListSource = dmData.dsDelitos
      TabOrder = 0
    end
    object dtpInicial: TDateTimePicker
      Left = 344
      Top = 11
      Width = 186
      Height = 21
      Date = 43022.067078912030000000
      Time = 43022.067078912030000000
      TabOrder = 1
    end
    object btnConsultar: TButton
      Left = 816
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = btnConsultarClick
    end
  end
  object dtpFinal: TDateTimePicker
    Left = 616
    Top = 11
    Width = 186
    Height = 21
    Date = 43022.067078912030000000
    Time = 43022.067078912030000000
    TabOrder = 3
  end
  object MainMenu: TMainMenu
    Left = 192
    Top = 96
    object Catalogos1: TMenuItem
      Caption = 'Cat'#225'logos'
      object actDelitos1: TMenuItem
        Action = actDelitos
      end
    end
    object Reportes1: TMenuItem
      Caption = 'Reportes'
      object Delitos1: TMenuItem
        Caption = 'Delitos'
        OnClick = Delitos1Click
      end
    end
  end
  object ActionList: TActionList
    Left = 256
    Top = 96
    object actDelitos: TAction
      Category = 'Catalogos'
      Caption = 'Incidencias'
      OnExecute = actExecute
    end
  end
  object GMMap1: TGMMap
    APIKey = 'AIzaSyCgAbfrlyN-dryNOQlkByW_oDTAqmfqH8w'
    RequiredProp.Center.Lat = 25.784000000000000000
    RequiredProp.Center.Lng = -109.000000000000000000
    RequiredProp.MapType = mtHYBRID
    RequiredProp.Zoom = 13
    AfterPageLoaded = GMMap1AfterPageLoaded
    OnMouseMove = GMMap1MouseMove
    WebBrowser = WebBrowser1
    Left = 192
    Top = 32
  end
  object GMHeatmap1: TGMHeatmap
    Map = GMMap1
    Data = <>
    Opacity = 0.600000000000000000
    Left = 256
    Top = 32
  end
  object frxReport1: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43022.110074884260000000
    ReportOptions.LastChange = 43022.110074884260000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 432
    Top = 232
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 14211288
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 15790320
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 15790320
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.787880000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 740.787880000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 740.787880000000000000
        object Memo2: TfrxMemoView
          Width = 740.787401574803200000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 372.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'NOMBRE')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 740.787880000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo4: TfrxMemoView
          Width = 372.000000000000000000
          Height = 18.897650000000000000
          DataField = 'NOMBRE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOMBRE"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 740.787880000000000000
        object Memo5: TfrxMemoView
          Align = baWidth
          Width = 740.787880000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo6: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo7: TfrxMemoView
          Align = baRight
          Left = 665.197280000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = dmData.dsDelitos
    BCDToCurrency = False
    Left = 432
    Top = 184
  end
end
