program prPostIntegrando;

uses
  ExceptionLog,
  Forms,
  uPost_Integrando in 'uPost_Integrando.pas' {frmPost_Integrando};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPost_Integrando, frmPost_Integrando);
  Application.Run;
end.
