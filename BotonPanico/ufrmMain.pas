unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, System.Sensors,
  System.Sensors.Components;

type
  TForm1 = class(TForm)
    LocationSensor: TLocationSensor;
    procedure LocationSensorLocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses udmData;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LocationSensor.Active:= True;
end;

procedure TForm1.LocationSensorLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
  dmData.Alerta('Emergencia', NewLocation.Latitude, NewLocation.Longitude);
  Close;
end;

end.
