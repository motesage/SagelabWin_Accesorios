program LimpiaBloqueos;

uses
  ExceptionLog,
  Forms,
  uLimpiaBloq in 'uLimpiaBloq.pas' {frmLimpiaBloq};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Elimina Bloqueos SQL';
  Application.CreateForm(TfrmLimpiaBloq, frmLimpiaBloq);
  Application.Run;
end.
