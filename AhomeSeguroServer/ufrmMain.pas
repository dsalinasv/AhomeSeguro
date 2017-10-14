unit ufrmMain;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    memAlertas: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Alerta(Delito: String; Latitud,Longitud: Double);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.Alerta(Delito: String; Latitud, Longitud: Double);
begin
  memAlertas.Lines.Add(Delito + ' Latitud: ' +
    FloatToStr(Latitud) + ' Longitud: ' + FloatToStr(Longitud));
end;

end.

