unit usrvMethods;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider;

type
  TsrvMethods = class(TDSServerModule)
    cntData: TFDConnection;
    qryDelitos: TFDQuery;
    dspDelitos: TDataSetProvider;
    dspIncidencias: TDataSetProvider;
    qryIncidencias: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Alerta(Delito: String; Latitud,Longitud: Double);
  end;

implementation


{$R *.dfm}

uses ufrmMain;

{ TsrvMethods }

procedure TsrvMethods.Alerta(Delito: String; Latitud,Longitud: Double);
begin
  frmMain.Alerta(Delito, Latitud, Longitud);
end;

end.

