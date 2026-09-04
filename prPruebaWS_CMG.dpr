program prPruebaWS_CMG;

uses
  ExceptionLog,
  Forms,
  uPruebaWS_CMG in 'uPruebaWS_CMG.pas' {frmPruebaSW},
  Autor_CMG in 'Autor_CMG.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPruebaSW, frmPruebaSW);
  Application.Run;
end.
