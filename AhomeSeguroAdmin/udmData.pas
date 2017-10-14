unit udmData;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.DSConnect;

type
  TdmData = class(TDataModule)
    cntData: TSQLConnection;
    dspConnection: TDSProviderConnection;
    cdsDelitos: TClientDataSet;
    dsDelitos: TDataSource;
    cdsIncidencias: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsAfterPost(DataSet: TDataSet);
    procedure cdsNewRecord(DataSet: TDataSet);
  private
    procedure AsignarEventos;
    function GetId: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmData: TdmData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmData.GetId: String;
var
  Guid : TGuid;
begin
  CreateGuid(Guid);
  Exit(GuidToString(Guid))
end;

procedure TdmData.cdsAfterPost(DataSet: TDataSet);
begin
  with (DataSet as TClientDataSet) do
    if not Assigned(DataSetField) then
      ApplyUpdates(0);
end;

procedure TdmData.cdsNewRecord(DataSet: TDataSet);
begin
  with (DataSet as TClientDataSet) do
    if Tag > 0 then
      FieldByName('ID' + IntToStr(Tag)).AsString := GetId
    else
      FieldByName('ID').AsString := GetId;
end;

procedure TdmData.AsignarEventos;
var
  i: integer;
begin
  for i:= 0 to Pred(ComponentCount) do
    if Components[i] is TClientDataset then
      with (Components[i] as TClientDataSet) do
      begin
        AfterDelete:= cdsAfterPost;
        AfterPost:= cdsAfterPost;
        OnNewRecord:= cdsNewRecord;
      end;
end;

procedure TdmData.DataModuleCreate(Sender: TObject);
begin
  AsignarEventos;
  cdsDelitos.Open;
end;

end.
