program AhomeSeguroAdmin;

uses
  Vcl.Forms, MidasLib,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  udmData in 'udmData.pas' {dmData: TDataModule},
  ufrmListado in 'Shared\ufrmListado.pas' {frmListado},
  ufrmDelitos in 'Catalogos\ufrmDelitos.pas' {frmDelitos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmData, dmData);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmListado, frmListado);
  Application.CreateForm(TfrmDelitos, frmDelitos);
  Application.Run;
end.
