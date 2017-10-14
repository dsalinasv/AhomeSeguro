object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Admin Delitos'
  ClientHeight = 448
  ClientWidth = 750
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
    Top = 0
    Width = 750
    Height = 429
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 468
    ControlData = {
      4C000000844D0000572C00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 429
    Width = 750
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end>
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
    object Heatmap1: TMenuItem
      Caption = 'Heatmap'
      OnClick = Heatmap1Click
    end
  end
  object ActionList: TActionList
    Left = 256
    Top = 96
    object actDelitos: TAction
      Category = 'Catalogos'
      Caption = 'Delitos'
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
end
