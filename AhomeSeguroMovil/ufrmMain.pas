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
  FMX.Layouts, FMX.DateTimeCtrls, FGX.ProgressDialog, System.ImageList,
  FMX.ImgList, FMX.Gestures;

type
  TfrmMain = class(TForm)
    LocationSensor: TLocationSensor;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    fgActivityDialog: TfgActivityDialog;
    TabControl1: TTabControl;
    Captura: TTabItem;
    TabItem2: TTabItem;
    TabItem1: TTabItem;
    Layout1: TLayout;
    Layout10: TLayout;
    Label2: TLabel;
    btnTakePhoto: TButton;
    imgCameraView: TImage;
    Layout9: TLayout;
    Label1: TLabel;
    MapView1: TMapView;
    NextTabAction1: TNextTabAction;
    ToolBar1: TToolBar;
    Label5: TLabel;
    Rectangle1: TRectangle;
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
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    Rectangle2: TRectangle;
    GridLayout1: TGridLayout;
    imgCaptura: TImage;
    Image4: TImage;
    imgMapa: TImage;
    Image5: TImage;
    imgCamara: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Circle1: TCircle;
    Button3: TButton;
    GestureManager1: TGestureManager;
    Button1: TButton;
    actAlerta: TAction;
    procedure LocationSensorLocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure MapView1MapClick(const Position: TMapCoordinate);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCapturaClick(Sender: TObject);
    procedure btnMapaClick(Sender: TObject);
    procedure btnCamaraClick(Sender: TObject);
    procedure actAlertaExecute(Sender: TObject);
  private
    { Private declarations }
    Latitude: Double;
    Longitude: Double;
    FActivityDialogThread: TThread;
    procedure ClearMarkers;
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

procedure TfrmMain.actAlertaExecute(Sender: TObject);
begin
  dmData.Alerta('Emergencia', Latitude, Longitude);
  Close;
end;

procedure TfrmMain.btnCamaraClick(Sender: TObject);
begin
  TabControl1.TabIndex:= 2;
end;

procedure TfrmMain.ClearMarkers;
var
  i:integer;
begin
  for i:=0 to high(Markers) do
  begin
    Markers[i].Remove;
  end;
  SetLength(Markers,0);
end;

procedure TfrmMain.btnEnviarClick(Sender: TObject);
var
  memStream: TMemoryStream;
begin
  case TabControl1.TabIndex of
    0: begin
      NextTabAction1.Execute;
    end;
    1: begin
      NextTabAction1.Execute;
    end;
    2: begin
      if length(Markers) = 0 then
      begin
        ShowMessage('Elige la ubicación en el mapa');
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
                MessageDlg('Enviada, deseas enviar otra?',
                  System.UITypes.TMsgDlgType.mtInformation,
                  [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
                    procedure(const AResult: TModalResult)
                    begin
                      case AResult of
                        mrYes:
                        begin
                          ClearMarkers;
                          imgCameraView.Bitmap.Clear(0);
                          TabControl1.TabIndex:= 0;
                        end;
                        mrNo:
                        begin
                          Close;
                        end;
                    end;
                  end);
                fgActivityDialog.Hide;
              end);
          end;
        end);
        FActivityDialogThread.FreeOnTerminate := False;
        FActivityDialogThread.Start;
      end;
    end;
  end;
end;

procedure TfrmMain.btnMapaClick(Sender: TObject);
begin
  TabControl1.TabIndex:= 1;
end;

procedure TfrmMain.btnCapturaClick(Sender: TObject);
begin
  TabControl1.TabIndex:= 0;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TabControl1.TabIndex:= 0;
  DateEdit1.Date:= Date;
  TimeEdit1.Time:= Time;
  LocationSensor.Active:= True;
end;

procedure TfrmMain.LocationSensorLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
var
  mapCenter: TMapCoordinate;
begin
  actAlerta.Visible:= True;
  Latitude:= NewLocation.Latitude;
  Longitude:= NewLocation.Longitude;
  mapCenter := TMapCoordinate.Create(Latitude, Longitude);
  MapView1.Location := mapCenter;
end;

procedure TfrmMain.MapView1MapClick(const Position: TMapCoordinate);
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
