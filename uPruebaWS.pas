unit uPruebaWS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, conveniosws,ScktComp, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ClientSocket1: TClientSocket;
    IdHTTP1: TIdHTTP;
    Memo1: TMemo;
    Memo2: TMemo;
    Button2: TButton;
    edtId: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure IdHTTP1Connected(Sender: TObject);
    procedure IdHTTP1Disconnected(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  aService: ConveniosWSSoap;
  Usuario: integer;
  psw: WideString;
  s: string;
begin
  IdHTTP1.Connect;
  s := IdHTTP1.Get('/conveniosws/conveniosws.asmx/iniciarSession?usuario=1157&string&pwd=5025 HTTP/1.1');

//  s := IdHTTP1.Get('http://conveniosws.faba.org.ar/conveniosws/conveniosws.asmx?WSDL');

  Memo1.Lines.add(s);
  IdHTTP1.Disconnect;
//  aService := conveniosws.GetConveniosWsSoap(true,'http://conveniosws.faba.org.ar/conveniosws/conveniosws.asmx');
//  Usuario := 1157;
//  psw := '5025';
//  s := aService.iniciarSession(Usuario,psw);
//  TopMsg(s);
//  s := aService.finalizarSession(s);

end;

procedure TForm1.IdHTTP1Connected(Sender: TObject);
begin
  Memo1.Lines.Add('conectado');
end;

procedure TForm1.IdHTTP1Disconnected(Sender: TObject);
begin
  Memo1.Lines.Add('desconectado');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  s: string;
begin
  IdHTTP1.Connect;
  s := IdHTTP1.Get('/conveniosws/conveniosws.asmx/finalizarSession?session='+edtID.Text+' HTTP/1.1');

//  s := IdHTTP1.Get('http://conveniosws.faba.org.ar/conveniosws/conveniosws.asmx?WSDL');

  Memo1.Lines.add(s);
  IdHTTP1.Disconnect;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  s: string;
begin
  IdHTTP1.Connect;
  s := IdHTTP1.Get('/conveniosws/conveniosws.asmx/traerMutuales?session='+edtID.Text+' HTTP/1.1');

//  s := IdHTTP1.Get('http://conveniosws.faba.org.ar/conveniosws/conveniosws.asmx?WSDL');

  Memo1.Lines.add(s);
  IdHTTP1.Disconnect;
end;

end.
