program LabLauncher;

uses
  Forms,
  uLauncher in 'uLauncher.pas' {Form1},
  udmCentral in 'udmCentral.pas' {dmCentral: TDataModule},
  GetVersionInfo in 'GetVersionInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmCentral, dmCentral);
  Application.Run;
end.
