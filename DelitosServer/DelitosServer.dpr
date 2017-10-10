program DelitosServer;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  usrvMethods in 'usrvMethods.pas' {srvMethods: TDSServerModule},
  usrvContainer in 'usrvContainer.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

