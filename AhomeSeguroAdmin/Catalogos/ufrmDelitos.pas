unit ufrmDelitos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmListado, Data.DB, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmDelitos = class(TfrmListado)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDelitos: TfrmDelitos;

implementation

{$R *.dfm}

uses udmData;

initialization
  RegisterClass(TfrmDelitos);

end.
