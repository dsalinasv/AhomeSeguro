unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Maps,
  System.Sensors, System.Sensors.Components, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Media, FMX.Objects, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, FMX.ListBox,
  FMX.Layouts, FMX.DateTimeCtrls, FGX.ProgressDialog;

type
  TfrmMain = class(TForm)
    LocationSensor: TLocationSensor;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    fgActivityDialog: TfgActivityDialog;
    BindSourceDB2: TBindSourceDB;
    TabControl1: TTabControl;
    Captura: TTabItem;
    ScrollBox1: TScrollBox;
    Layout2: TLayout;
    DateEdit1: TDateEdit;
    Label8: TLabel;
    Layout3: TLayout;
    TimeEdit1: TTimeEdit;
    Label7: TLabel;
    Layout4: TLayout;
    Label4: TLabel;
    Layout5: TLayout;
    rbAfectado: TRadioButton;
    rbTestigo: TRadioButton;
    Layout8: TLayout;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Layout11: TLayout;
    btnEnviar: TButton;
    TabItem2: TTabItem;
    TabItem1: TTabItem;
    Layout1: TLayout;
    Layout10: TLayout;
    Label2: TLabel;
    btnTakePhoto: TButton;
    imgCameraView: TImage;
    Layout6: TLayout;
    Button1: TButton;
    Layout9: TLayout;
    Label1: TLabel;
    MapView1: TMapView;
    Layout7: TLayout;
    Button2: TButton;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    NextTabAction1: TNextTabAction;
    procedure LocationSensorLocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure MapView1MapClick(const Position: TMapCoordinate);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FActivityDialogThread: TThread;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  udmData, Math;

var
  Markers : array of  TMapMarker;

procedure TfrmMain.btnEnviarClick(Sender: TObject);
var
  memStream: TMemoryStream;
begin
  if length(Markers) = 0 then
  begin
    ShowMessage('Elige la ubicación en el mapa');
  end
  else if imgCameraView.Bitmap.IsEmpty then
  begin
    ShowMessage('Toma la foto de evidencia');
  end
  else
  begin
    FActivityDialogThread := TThread.CreateAnonymousThread(procedure
    begin
      try
        TThread.Synchronize(nil, procedure
        begin
          fgActivityDialog.Show;
        end);
        with dmData do
        begin
          cdsIncidencias.Insert;
          cdsIncidenciasFECHAHORA.AsDateTime:= DateEdit1.Date + TimeEdit1.Time;
          cdsIncidenciasPERSONA.Value:= IfThen(rbAfectado.IsChecked, 1, 0);
          cdsIncidenciasID_DELITO.Value:= cdsDelitosID.Value;
          cdsIncidenciasLATITUD.Value:= Markers[0].Descriptor.Position.Latitude;
          cdsIncidenciasLONGITUD.Value:= Markers[0].Descriptor.Position.Longitude;
          memStream:= TMemoryStream.Create;
          imgCameraView.Bitmap.SaveToStream(memStream);
          cdsIncidenciasFOTO.LoadFromStream(memStream);
          cdsIncidencias.Post;
        end;
        if TThread.CheckTerminated then
          Exit;
      finally
        if not TThread.CheckTerminated then
          TThread.Synchronize(nil, procedure
          begin
            fgActivityDialog.Hide;
            Close;
          end);
      end;
    end);
    FActivityDialogThread.FreeOnTerminate := False;
    FActivityDialogThread.Start;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TabControl1.TabIndex:= 0;
  DateEdit1.Date:= Date;
  TimeEdit1.Time:= Time;
end;

procedure TfrmMain.LocationSensorLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
var
  mapCenter: TMapCoordinate;
begin
  mapCenter := TMapCoordinate.Create(NewLocation.Latitude, NewLocation.Longitude);
  MapView1.Location := mapCenter;
end;

procedure TfrmMain.MapView1MapClick(const Position: TMapCoordinate);
procedure ClearMarkers;
var
  i:integer;
begin
  for i:=0 to high(Markers) do
  begin
    Markers[i].Remove;
  end;
  SetLength(Markers,0);
end;
var
  MyMarker: TMapMarkerDescriptor;
begin
  MyMarker := TMapMarkerDescriptor.Create(Position, dmData.cdsDelitosNOMBRE.Value);
  MyMarker.Draggable := True;
  MyMarker.Visible :=True;
  ClearMarkers;
  setlength(Markers,length(Markers)+1);
  Markers[high(Markers)]:= MapView1.AddMarker(MyMarker);
end;

procedure TfrmMain.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  imgCameraView.Bitmap:= Image;
end;

end.
