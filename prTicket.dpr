program prTicket;

uses
  Forms,
  uLeeTicket in 'uLeeTicket.pas' {frmLeeTicket},
  uSqlServer in 'uSqlServer.pas',
  uDmTickets in 'udmTickets.pas' {dmTickets: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Monitor de tickeadora';
  Application.CreateForm(TfrmLeeTicket, frmLeeTicket);
  Application.CreateForm(TdmTickets, dmTickets);
  Application.Run;
end.
