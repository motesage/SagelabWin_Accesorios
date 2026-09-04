program prPruebaCurl;

uses
  ExceptionLog,
  Forms,
  uPruebaCurl in 'uPruebaCurl.pas' {frmCurl};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCurl, frmCurl);
  Application.Run;
end.
