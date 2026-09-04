unit uLimpiaBloq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Inifiles, Dialogs, DBXpress, SqlExpr, StdCtrls, DB, JvMemoryDataset,
  Grids, DBGrids;

type
  TfrmLimpiaBloq = class(TForm)
    Button1: TButton;
    memQuery: TMemo;
    mtblQuery: TJvMemoryData;
    dsQry: TDataSource;
    grdBloqueos: TDBGrid;
    memProceso: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure EliminaBloque(id: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLimpiaBloq: TfrmLimpiaBloq;

implementation

var
  Connection: TSQLConnection;
  cServer, cUsuario, cPwd, cBaseDatos: string;

{$R *.dfm}

procedure TfrmLimpiaBloq.Button1Click(Sender: TObject);
var
  Query: TSQLQuery;
begin

  // Crea una instancia de la conexión a la base de datos MSSQL
  memProceso.Lines.Clear;
  Connection := TSQLConnection.Create(nil);
  Connection.DriverName := 'SQLServer';
  Connection.GetDriverFunc := 'getSQLDriverSQLServer';
  Connection.LibraryName := 'dbexpsda.dll';
    // Ruta al archivo dbxmss.dll si es necesario
  Connection.VendorLib := 'sqloledb.dll';
    // Ruta al archivo sqlncli11.dll si es necesario
  Connection.Params.Values['HostName'] := cServer;
  Connection.Params.Values['Database'] := cBaseDatos;
  Connection.Params.Values['User_Name'] := cUsuario;
  Connection.Params.Values['Password'] := cPwd;
  Connection.LoginPrompt := False;
  try
    Connection.Open;
    // Crea un objeto de consulta SQL
    Query := TSQLQuery.Create(nil);
    Query.SQLConnection := Connection;
    // Consulta los bloqueos actuales en la base de datos
    Query.SQL.Text := memQuery.Text;

{
SELECT
  blocking_session_id AS BlockingSessionID, session_id AS VictimSessionID,
  (SELECT [text] FROM sys.sysprocesses  CROSS APPLY sys.dm_exec_sql_text([sql_handle])
  WHERE spid = blocking_session_id) AS BlockingQuery,
     [text] AS VictimQuery,
     wait_time/1000 AS WaitDurationSecond,
     wait_type AS WaitType,
     percent_complete AS BlockingQueryCompletePercent
FROM sys.dm_exec_requests
CROSS APPLY sys.dm_exec_sql_text([sql_handle])
WHERE blocking_session_id > 0
}


    Query.Open;
    if not(Query.Eof) then begin
      mtblQuery.LoadFromDataSet(Query, 0, lmCopy);
      mtblQuery.Active := true;
      mtblQuery.First;
      while not mtblQuery.Eof do begin
        if mtblQuery.FieldByName('BlockingSessionId').AsInteger > 0 then begin
          EliminaBloque(mtblQuery.FieldByName('BlockingSessionId').AsInteger);
        end;
        mtblQuery.Next;
      end;
    end
    else begin
      memProceso.lines.add('No hay bloqueos pendientes.');
    end;
    Query.Close;
  finally
    Connection.Close;
    Connection.Free;
    Query.Free;
  end;
end;

procedure TfrmLimpiaBloq.EliminaBloque(id: integer);
var
  Query2: TSQLQuery;
begin
  Query2 := TSQLQuery.Create(nil);
  Query2.SQLConnection := Connection;
  memProceso.lines.add('eliminando proceso ' + IntToStr(id));
  Query2.SQL.Text := 'Kill ' + IntToStr(id);
  try
    Query2.ExecSQL;
  finally
    Query2.Close;
    Query2.Free;
  end;
end;

procedure TfrmLimpiaBloq.FormCreate(Sender: TObject);
var
  sExePath: string;
  IniFilename: string;
  IniFile: tIniFile;
begin
  sExePath := ExtractFilePath(Application.ExeName);
  IniFileName := sExePath + 'sqldir.Ini';
  IniFile := TIniFile.Create(IniFileName);
  try
    cServer := IniFile.ReadString('SQLSERVER', 'server', 'MarceloWin10');
    cUsuario := IniFile.ReadString('SQLSERVER', 'user', 'sa');
    cPwd := IniFile.ReadString('SQLSERVER', 'password', 'SApassword//');
    cBaseDatos := IniFile.ReadString('SQLSERVER', 'database', 'SageLab');
  finally
    IniFile.Free;
  end;
end;

end.
