unit udmData;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.DSConnect;

type
  TdmData = class(TDataModule)
    cntData: TSQLConnection;
    ssmAlerta: TSqlServerMethod;
    dspConnection: TDSProviderConnection;
  private
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

{ TdmData }

procedure TdmData.Alerta(Delito: String; Latitud, Longitud: Double);
begin
  ssmAlerta.ParamByName('Delito').Value:= Delito;
  ssmAlerta.ParamByName('Latitud').Value:= Latitud;
  ssmAlerta.ParamByName('Longitud').Value:= Longitud;
  dmData.ssmAlerta.ExecuteMethod;
end;

end.
