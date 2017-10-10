unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.OleCtrls, SHDocVw, GMMap, GMHeatmap, GMClasses, GMMapVCL, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    Catalogos1: TMenuItem;
    ActionList: TActionList;
    actDelitos: TAction;
    actDelitos1: TMenuItem;
    GMMap1: TGMMap;
    GMHeatmap1: TGMHeatmap;
    WebBrowser1: TWebBrowser;
    sbStatus: TStatusBar;
    Heatmap1: TMenuItem;
    procedure actExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
    procedure GMMap1MouseMove(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure Heatmap1Click(Sender: TObject);
  private
    procedure ControlIEVersion;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  Registry;

procedure TfrmMain.actExecute(Sender: TObject);
var
  sForma: String;
  FormClass: TFormClass;
begin
  sForma:= StringReplace(TAction(Sender).Name, 'act', 'frm', []);
  FormClass:= TFormClass(GetClass('T' + sForma));
  if Assigned(FormClass) then
    with FormClass.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.ControlIEVersion;
var
  Tmp: string;
  L: TStringList;
  Ver: Integer;
  Reg: TRegistry;
begin
  Tmp := GMMap1.GetIEVersion;

  L := TStringList.Create;
  try
    L.Delimiter := '.';
    L.DelimitedText := Tmp;
    Ver := StrToInt(L[0]);
  finally
    FreeAndNil(L);
  end;

  if Ver < 7 then Ver := 7;
  if Ver > 10 then Ver := 10;

  Ver := Ver * 1000;

  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION', False) then
    try
      Reg.WriteInteger(ExtractFileName(ParamStr(0)), Ver);
    finally
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GMMap1.Active:= True;
  ControlIEVersion;
end;

procedure TfrmMain.GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
begin
  if First then
  begin
    GMMap1.DoMap;
  end;
end;

procedure TfrmMain.GMMap1MouseMove(Sender: TObject; LatLng: TLatLng; X,
  Y: Double);
begin
  sbStatus.Panels[0].Text := 'Lat: ' + LatLng.LatToStr(GMMap1.Precision);
  sbStatus.Panels[1].Text := 'Lng: ' + LatLng.LngToStr(GMMap1.Precision);;
end;

procedure TfrmMain.Heatmap1Click(Sender: TObject);
var
  Point: TLinePoint;
  I: Integer;
begin
  for I := 0 to 300 do
  begin
    Point := GMHeatmap1.data.Add;
    Point.Lat := 25.735 + Random(10000000)/100000000;
    Point.Lng := -109.04 + Random(800000)/10000000;
  end;
  GMMap1.SetCenter(25.784, -109);
  GMMap1.RequiredProp.Zoom := 13;
  GMHeatmap1.Show:= True;
end;

end.
