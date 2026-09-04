unit uPruebaSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, DB, SqlExpr, StdCtrls, FMTBcd, JvMemoryDataset, Grids,
  DBGrids;

type
  TForm1 = class(TForm)
    SQLConnection1: TSQLConnection;
    Button1: TButton;
    memSQL: TMemo;
    grdSQL: TDBGrid;
    mtblResult: TJvMemoryData;
    dsSQL: TDataSource;
    SQLDataSet: TSQLDataSet;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


//      DriverName := 'DevartMySQLDirect';
//      LibraryName := 'dbexpmda.dll';
//      VendorLib := 'not used';
//      GetDriverFunc := 'getSQLDriverMySQLDirect';


procedure TForm1.Button1Click(Sender: TObject);
begin
  SQLConnection1.Connected := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SQLDataSet.Active := false;
  SQLDataSet.CommandText := memSQL.Lines.Text;
  mtblResult.Active := false;
  try
    SQLDataSet.ExecSQL;
    mtblResult.LoadFromDataSet(SQLDataSet,0,lmCopy);
    mtblResult.Active := true;
    SQLDataSet.Active := false;
  except
    on e: exception do
      Application.HandleException(Sender);
  end;
end;

end.
