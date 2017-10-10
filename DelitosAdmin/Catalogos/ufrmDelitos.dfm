inherited frmDelitos: TfrmDelitos
  Caption = 'Delitos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgData: TDBGrid
    DataSource = dmData.dsDelitos
  end
  inherited pnlData: TPanel
    inherited dbnData: TDBNavigator
      DataSource = dmData.dsDelitos
      Hints.Strings = ()
    end
  end
end
