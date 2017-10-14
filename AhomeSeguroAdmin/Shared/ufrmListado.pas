unit ufrmListado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmListado = class(TForm)
    dbgData: TDBGrid;
    sbData: TStatusBar;
    pnlData: TPanel;
    dbnData: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListado: TfrmListado;

implementation

{$R *.dfm}

end.
