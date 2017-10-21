unit udmData;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Datasnap.DBClient, Datasnap.DSConnect, Data.DB, Data.SqlExpr,
  Data.FMTBcd;

type
  TdmData = class(TDataModule)
    cntData: TSQLConnection;
    dspConnection: TDSProviderConnection;
    cdsDelitos: TClientDataSet;
    cdsDelitosID: TStringField;
    cdsDelitosNOMBRE: TStringField;
    cdsIncidencias: TClientDataSet;
    cdsIncidenciasID: TStringField;
    cdsIncidenciasLATITUD: TFloatField;
    cdsIncidenciasLONGITUD: TFloatField;
    cdsIncidenciasFOTO: TBlobField;
    cdsIncidenciasID_DELITO: TStringField;
    cdsIncidenciasFECHAHORA: TSQLTimeStampField;
    cdsIncidenciasPERSONA: TSmallintField;
    ssmAlerta: TSqlServerMethod;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsAfterPost(DataSet: TDataSet);
    procedure cdsNewRecord(DataSet: TDataSet);
  private
    function GetId: String;
    procedure AsignarEventos;
    { Private declarations }
  public
    { Public declarations }
    procedure Alerta(Delito: String; Latitud, Longitud: Double);
  end;

var
  dmData: TdmData;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

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
  cdsIncidencias.Open;
end;

procedure TdmData.Alerta(Delito: String; Latitud, Longitud: Double);
begin
  ssmAlerta.ParamByName('Delito').Value:= Delito;
  ssmAlerta.ParamByName('Latitud').Value:= Latitud;
  ssmAlerta.ParamByName('Longitud').Value:= Longitud;
  dmData.ssmAlerta.ExecuteMethod;
end;

end.
