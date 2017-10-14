inherited frmDelitos: TfrmDelitos
  Caption = 'Delitos'
  ExplicitWidth = 749
  ExplicitHeight = 330
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgData: TDBGrid
    DataSource = dmData.dsDelitos
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Visible = True
      end>
  end
  inherited pnlData: TPanel
    inherited dbnData: TDBNavigator
      DataSource = dmData.dsDelitos
      Hints.Strings = ()
    end
  end
end
