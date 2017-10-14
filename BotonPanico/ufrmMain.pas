unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, System.Sensors,
  System.Sensors.Components;

type
  TForm1 = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    btnViolación: TButton;
    btnRobo: TButton;
    btnAsalto: TButton;
    btnDrogas: TButton;
    LocationSensor: TLocationSensor;
    ToolBar1: TToolBar;
    lblLatitud: TLabel;
    lblLongitud: TLabel;
    Layout1: TLayout;
    procedure btnViolaciónClick(Sender: TObject);
    procedure LocationSensorLocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Localizado: Boolean;
    Latitud: Double;
    Longitud: Double;
    Presionado: String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses udmData;

procedure TForm1.btnViolaciónClick(Sender: TObject);
Procedure EnableDisableButtonsOnControl(C:TFmxObject);
var
  vControl: TFmxObject;
begin
  if Assigned(C.Children) then
    for vControl in C.Children do
    begin
      if vControl is TButton then
        TButton(vControl).Enabled:= False
      else
        EnableDisableButtonsOnControl(vControl);
    end;
end;
begin
  EnableDisableButtonsOnControl(Self);
  if Localizado then
  begin
    dmData.Alerta((Sender as TButton).Text, Latitud, Longitud);
    Close;
  end
  else
    Presionado:= (Sender as TButton).Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Localizado:= False;
  LocationSensor.Active:= True;
end;

procedure TForm1.LocationSensorLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
  Localizado:= True;
  Latitud:= NewLocation.Latitude;
  Longitud:= NewLocation.Longitude;
  lblLatitud.Text:= FormatFloat('#,##0.00', Latitud);
  lblLongitud.Text:= FormatFloat('#,##0.00', Longitud);
  if not (Presionado = EmptyStr) then
  begin
    dmData.Alerta(Presionado, Latitud, Longitud);
    Close;
  end;
end;

end.
