unit uLeeTicket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JvJCLUtils, JCLStrings, usqlServer, udmTickets, Dialogs, StdCtrls, OoMisc, AdPort, ExtCtrls;

type
  TfrmleeTicket = class(TForm)
    SerialPort: TApdComPort;
    Memo2: TMemo;
    Panel1: TPanel;
    edtCommPort: TMemo;
    Button1: TButton;
    procedure SerialPortTriggerAvail(CP: TObject; Count: Word);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCommPortChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    function AppPath(EnServer: boolean): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmleeTicket: TfrmleeTicket;

implementation

var
  buffer: string;
  BaseConn: tDatosBaseSQL;
  ticketActual: tTickets;

{$R *.dfm}

procedure TfrmleeTicket.SerialPortTriggerAvail(CP: TObject; Count: Word);
var
	i: integer;
  posData: integer;
  s: char;
  sNumero, tipoTicket: string;
begin
	for i := 1 to Count do begin
    s := SerialPort.GetChar;
    if s in [#32..#126] then begin
   		buffer := buffer + s;
    end;
  end;

  if pos('ROCA', buffer) > 0 then begin
    posData := pos('w',buffer);
    if posData > 0 then begin
      tipoTicket := copy(buffer,posData+1,1);
      if tipoTicket[1] in ['A', 'R', 'P', 'O']  then begin
        sNumero := copy(buffer,posData+3,3);
      end;
    end;
    Memo2.lines.add(tipoTicket + ' ' + sNumero);
    ticketActual.Tipo := tipoTicket;
    ticketActual.Ultimo := StrToIntDef(sNumero,0);
    ticketActual.GrabaUltimo;
//    if abs(ticketActual.Ultimo - ticketActual.Numero) > 20 then begin
//      if MessageDlg(' Hay mas de 20 tickets pendientes... reseteo la cuenta ?' ,mtWarning,[mbYes,mbNo],0) = mrYes then begin
//        ticketActual.GrabaUltimo;
//        ticketActual.Reset;  // pone  numero=ultimo PARA TODAS LAS VERSIONES DE TICKET
//      end;
//    end
//    else begin
//      ticketActual.GrabaUltimo;
//    end;
    buffer := '';
  end;

{
busco la 'w' (119)
el siguiente es el tipo 'A', 'R', 'P', 'O'
el siguiente, un espacio (32)
los 3 siguientes son el numero emitido 005 015 008 009 ...

!RETIRO DE ANALISISTURNO:d!wR 005!dLABORATORIO ROCA
dV!PAMITURNO:d!wP 015!dLABORATORIO ROCA
dV!PARTICULARESTURNO:d!wA 008!dLABORATORIO ROCA
dV!O/SOCIALESTURNO:d!wO 009!dLABORATORIO ROCA
}


end;

procedure TfrmleeTicket.FormShow(Sender: TObject);
var
  ComNum: integer;
begin
  if FileExists('ticket.ini')then begin
    edtCommPort.Lines.loadfromfile('ticket.ini');
    ComNum := StrToIntDef(extractword(2,edtCommPort.Lines[0],[':']),1);
  end
  else begin
    edtCommPort.Lines.Clear;
    edtCommPort.Lines.add('Puerta Serie Nro:1');
    edtCommPort.Lines.add('(ver Ticket.ini)');
    edtCommPort.Lines.SaveToFile('ticket.ini');
    ComNum := 1;
  end;
  ticketActual := tTickets.Create(self);
  SerialPort.ComNumber := ComNum;
  SerialPort.Open := true;
  Memo2.Lines.clear;
  buffer := '';
end;

procedure TfrmleeTicket.FormCreate(Sender: TObject);
var
  reintenta: Boolean;
begin
  reintenta := false;
  repeat
    try
      if Assigned(BaseConn) then begin
        freeandnil(baseconn);
      end;
      BaseConn := TdatosBaseSql.Create(self,'','','','',AppPath(true)  + 'SQLDir.ini');
      baseConn.Active := true;
    except
      if MessageDlg(' Error al crear conexión... Verifique conexion de red ' + #13#10 +
                    ' y que los parámetros de conexión sean los correctos...' + #13#10 +
                    ' ¿Quiere intentar nuevamente? ' ,mtWarning,[mbYes,mbNo],0) = mrYes then
      begin
        reintenta := true;
      end
      else begin
        Application.Terminate;
      end;
    end;

  until not reintenta;

  if not BaseConn.ExisteBase then begin
     MessageDlg('No se pudo conectar con la Base de Datos...' + #13#10 +
                '  Server = ' + BaseConn.Server +  #13#10 +
                '  Base = ' + Baseconn.BaseDatos +  #13#10 +
                '  User = ' + Baseconn.Usuario +  #13#10 +
                '  Passw = ********* ' + #13#10 +  //+ Baseconn.Pwd
                'El sistema cerrará la conexión...',mtWarning,[mbYes],0);
     Application.Terminate;
  end;

end;


function TfrmleeTicket.AppPath(EnServer: boolean): string;
var
  j: Integer;
  s: string;
begin
  if EnServer then begin
    result := ExtractFilePath(ParamStr(0));
    for j := 1 to ParamCount do begin    // Iterate
      s := UpperCase(ParamStr(j));
      if pos('PATH=',s)>0 then begin
        Result := extractword(2,s,['=']);
      end;
    end;    // for
  end
  else begin
  	Result := ExtractFilePath(ParamStr(0));
  end;
end;

procedure TfrmleeTicket.edtCommPortChange(Sender: TObject);
var
  comNum: integer;
begin
  SerialPort.Open := false;
  ComNum := StrToIntDef(edtCommPort.Lines[0],1);
  SerialPort.ComNumber := comNum;
  SerialPort.Open := true;
end;

procedure TfrmleeTicket.Button1Click(Sender: TObject);
begin
    ticketActual.Tipo := 'A';
    ticketActual.Ultimo := 1200;
    if abs(ticketActual.Ultimo - ticketActual.Numero) > 10 then begin
      if MessageDlg(' Hay mas de 10 tickets pendientes... reseteo la cuenta ?' ,mtWarning,[mbYes,mbNo],0) = mrYes then begin
        ticketActual.Reset;  // pone  numero=ultimo PARA TODAS LAS VERSIONES DE TICKET
      end;
    end
    else begin
      ticketActual.GrabaUltimo;
    end;

end;

end.
