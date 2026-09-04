unit uPost_Integrando;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  strUtils, IdHTTP, HTTPsend, Dialogs, StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, ExtCtrls;

type
  TfrmPost_Integrando = class(TForm)
    memoPedido: TMemo;
    MemoRespuesta: TMemo;
    IdHTTP1: TIdHTTP;
    btnEnvia: TButton;
    edtClient: TEdit;
    edtClientSecret: TEdit;
    edtPractica2: TEdit;
    edtPassword: TEdit;
    btnToken: TButton;
    memoPdf: TMemo;
    edtURL: TEdit;
    Panel2: TPanel;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    memoResultados: TMemo;
    lblpr1: TLabel;
    edtUser: TEdit;
    Label1: TLabel;
    edtPractica1: TEdit;
    memoToken: TMemo;
    Label2: TLabel;
    edtNomenclador: TEdit;
    procedure btnEnviaClick(Sender: TObject);
    procedure btnTokenClick(Sender: TObject);

  private
    function Parsea(s: string): string;
    function MuestraRespuestas(s, variable: string): string;
    function MuestraRespuestasPracticas(s: string): string;
    function PideToken: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPost_Integrando: TfrmPost_Integrando;

implementation

{$R *.dfm}

procedure TfrmPost_Integrando.btnEnviaClick(Sender: TObject);
begin
//
end;


function TfrmPost_Integrando.MuestraRespuestas(s, variable: string): string;
var
  ini, fin: integer;
begin
  //  <CodRtaGeneral>10   </CodRtaGeneral>
  ini := pos('<' + variable + '>', s) + length('<' + variable + '>');
  fin := pos('</' + variable + '>', s);
  memoResultados.Lines.add(variable + ' => ' + AnsiMidStr(s, ini, fin - ini));
end;

function TfrmPost_Integrando.MuestraRespuestasPracticas(s: string): string;
var
  ini, fin: integer;
  sResp: string;
begin
  // 'CodPrestacion'
  // 'MensajeRta'
  ini := pos('<CodPrestacion>', s) + 15;
  fin := pos('</CodPrestacion>', s);
  while fin > 0 do begin
    sResp := '<CodPrestacion> ' + AnsiMidStr(s, ini, fin - ini);
    memoResultados.Lines.add(sResp);
    s := AnsiMidStr(s, fin + 16, 5000);
    ini := pos('<CodRta>', s) + 8;
    fin := pos('</CodRta>', s);
    sResp := ' <CodRta> ' + AnsiMidStr(s, ini, fin - ini);
    memoResultados.Lines.add(sResp);
    s := AnsiMidStr(s, fin + 9, 5000);
    ini := pos('<CodAutorizacion>', s) + 17;
    fin := pos('</CodAutorizacion>', s);
    sResp := ' <CodAutorizacion> ' + AnsiMidStr(s, ini, fin - ini);
    memoResultados.Lines.add(sResp);
    s := AnsiMidStr(s, fin + 18, 5000);
    ini := pos('<CodPrestacion>', s) + 15;
    fin := pos('</CodPrestacion>', s);
  end;
end;

function TfrmPost_Integrando.Parsea(s: string): string;
var
  itr: integer;
begin
  result := ansiReplacestr(s, '&lt;', '<');
  result := ansiReplacestr(Result, '&gt;', '>');
  result := ansiReplacestr(Result, chr(9), '  ');
end;


procedure TfrmPost_Integrando.btnTokenClick(Sender: TObject);
var
  inicio: integer;
  Request, Response: TStringStream;
  header: string;
  RespAjustada: string;
  s: string;
begin
  {
  POST 'https://xxxxxxxxxx/is-integrador/public/oauth/token'
  header 'Content-Type: application/json'
  grant_type="password"
  client_id="x"
  client_secret="xx"
  username="xxx"
  password="xxxx"
  scope="*"
  }
  memoPedido.Lines.Clear;
  s := memoToken.Text;
  MemoRespuesta.Lines.Clear;
  memoResultados.Lines.Clear;
  header := edtURL.Text + '/AutoRemWebAplication/TransactionServ?wsdl';
  IdHTTP1.Request.ContentType := 'text/xml; charset=UTF-8';
  Request := TStringStream.Create(s);
  Response := TStringStream.Create('');
  try
    try
      IdHTTP1.Post(header, Request, Response);
      RespAjustada := parsea(Response.DataString);
      MemoRespuesta.Lines.Text := RespAjustada;
      MuestraRespuestas(RespAjustada, 'CodRtaGeneral');
      MuestraRespuestas(RespAjustada, 'DescripcionRtaGeneral');
      MuestraRespuestas(RespAjustada, 'MensajeDisplay');
      MuestraRespuestas(RespAjustada, 'MensajePrinter');
      MuestraRespuestas(RespAjustada, 'NroTransaccion');
      MuestraRespuestas(RespAjustada, 'DenoEntidad');
      MuestraRespuestas(RespAjustada, 'TipoDocBeneficiario');
      MuestraRespuestas(RespAjustada, 'NroDocBeneficiario');
      MuestraRespuestas(RespAjustada, 'ApellidoBeneficiario');
      MuestraRespuestas(RespAjustada, 'NombreBeneficiario');
      MuestraRespuestas(RespAjustada, 'FechaNacimiento');
      MuestraRespuestas(RespAjustada, 'NumeroCredencial');
      MuestraRespuestas(RespAjustada, 'PlanCredencial');
      MuestraRespuestas(RespAjustada, 'CondicionIVA');
    except
      ShowMessage('Error de comunicaciones con el servidor de CMG');
    end;
  finally
    Response.Free;
  end;


end;

function TfrmPost_Integrando.PideToken: string;
begin
 //
end;

end.
