object frmListado: TfrmListado
  Left = 0
  Top = 0
  Caption = 'Listado'
  ClientHeight = 291
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dbgData: TDBGrid
    Left = 0
    Top = 35
    Width = 733
    Height = 237
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object sbData: TStatusBar
    Left = 0
    Top = 272
    Width = 733
    Height = 19
    Panels = <>
  end
  object pnlData: TPanel
    Left = 0
    Top = 0
    Width = 733
    Height = 35
    Align = alTop
    TabOrder = 2
    object dbnData: TDBNavigator
      Left = 10
      Top = 4
      Width = 230
      Height = 25
      TabOrder = 0
    end
  end
end
