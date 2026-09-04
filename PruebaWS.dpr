program PruebaWS;

uses
  Forms,
  uPruebaWS in 'uPruebaWS.pas' {Form1},
  faba_ws in 'faba_ws.pas',
  conveniosws in 'conveniosws.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
