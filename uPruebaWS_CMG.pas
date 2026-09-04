unit uPruebaWS_CMG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  strUtils, IdHTTP, HTTPsend, Dialogs, StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, ExtCtrls;

type
  TfrmPruebaSW = class(TForm)
    memoPedido: TMemo;
    MemoRespuesta: TMemo;
    IdHTTP1: TIdHTTP;
    btnEnvia: TButton;
    edtCredencial: TEdit;
    edtCuit: TEdit;
    edtPractica2: TEdit;
    edtFecha: TEdit;
    edtHora: TEdit;
    btnGenera: TButton;
    memoBase: TMemo;
    edtURL: TEdit;
    Panel2: TPanel;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    memoResultados: TMemo;
    chkCred: TRadioButton;
    chkAutoriza: TRadioButton;
    lblpr1: TLabel;
    edtEntidad: TEdit;
    Label1: TLabel;
    edtPractica1: TEdit;
    memobase2: TMemo;
    Label2: TLabel;
    edtNomenclador: TEdit;

    function EnviaMensaje_Indy(sXML: string): string;
    procedure btnEnviaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGeneraClick(Sender: TObject);

  private
    function Parsea(s: string): string;
    function MuestraRespuestas(s, variable: string): string;
    function MuestraRespuestasPracticas(s: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPruebaSW: TfrmPruebaSW;

implementation

{$R *.dfm}

procedure TfrmPruebaSW.btnEnviaClick(Sender: TObject);
begin
  if trim(memoPedido.Text) <> '' then
  begin
    EnviaMensaje_Indy(memoPedido.text);
  end
  else
  begin
    ShowMessage('Es necesario generar el mensaje de pedido para procesar el envío');
  end;
end;

function TfrmPruebaSW.EnviaMensaje_Indy(sXML: string): string;
var
  inicio: integer;
  Request, Response: TStringStream;
  header: string;
  RespAjustada: string;
begin
  result := '';
  MemoRespuesta.Lines.Clear;
  memoResultados.Lines.Clear;
  // header := 'http://192.168.0.233:8080/AutoRemWebAplication/TransactionServ?wsdl';
  // header := 'http://190.220.14.134:8083/AutoRemWebAplication/TransactionServ?wsdl';
  header := edtURL.Text + '/AutoRemWebAplication/TransactionServ?wsdl';
  IdHTTP1.Request.ContentType := 'text/xml; charset=UTF-8';
  Request := TStringStream.Create(sXML);
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
      if chkAutoriza.Checked then begin
        memoResultados.Lines.add('---------------------------');
        memoResultados.Lines.add('Autorizacion de PRACTICAS');
        memoResultados.Lines.add('-------------------------');

        MuestraRespuestas(RespAjustada, 'CodigoPreautorizacion');
        MuestraRespuestas(RespAjustada, 'AutoRel');

        MuestraRespuestasPracticas(RespAjustada);
      end;
      result := RespAjustada;
    except
      ShowMessage('Error de comunicaciones con el servidor de CMG');
    end;
  finally
    Response.Free;
  end;
end;

function TfrmPruebaSW.MuestraRespuestas(s, variable: string): string;
var
  ini, fin: integer;
begin
  //  <CodRtaGeneral>10   </CodRtaGeneral>
  ini := pos('<' + variable + '>', s) + length('<' + variable + '>');
  fin := pos('</' + variable + '>', s);
  memoResultados.Lines.add(variable + ' => ' + AnsiMidStr(s, ini, fin - ini));
end;

function TfrmPruebaSW.MuestraRespuestasPracticas(s: string): string;
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

function TfrmPruebaSW.Parsea(s: string): string;
var
  itr: integer;
begin
  result := ansiReplacestr(s, '&lt;', '<');
  result := ansiReplacestr(Result, '&gt;', '>');
  result := ansiReplacestr(Result, chr(9), '  ');
end;

procedure TfrmPruebaSW.FormShow(Sender: TObject);
begin
  edtFecha.Text := FormatDateTime('yyyymmdd', date);
  edtHora.Text := FormatDateTime('hhnnss', time);
end;

procedure TfrmPruebaSW.btnGeneraClick(Sender: TObject);
var
  s: string;
begin
  memoPedido.Lines.Clear;
  if chkCred.Checked then
  begin
    s := memoBase.Text;
    s := AnsiReplaceStr(s, '#FECHA', edtFecha.text);
    s := AnsiReplaceStr(s, '#HORA', edtHora.text);
    s := AnsiReplaceStr(s, '#CUITP', edtCuit.text);
    s := AnsiReplaceStr(s, '#CRED', edtCredencial.text);
    s := AnsiReplaceStr(s, '#ENTIDAD', edtEntidad.text);
    memoPedido.Text := s;
    btnEnvia.Enabled := true;
  end;
  if chkAutoriza.Checked then
  begin
    s := memobase2.Text;
    s := AnsiReplaceStr(s, '#FECHA', edtFecha.text);
    s := AnsiReplaceStr(s, '#HORA', edtHora.text);
    s := AnsiReplaceStr(s, '#CUITP', edtCuit.text);
    s := AnsiReplaceStr(s, '#CRED', edtCredencial.text);
    s := AnsiReplaceStr(s, '#ENTIDAD', edtEntidad.text);
    s := AnsiReplaceStr(s, '#PRACTICA1', edtPractica1.text);
    s := AnsiReplaceStr(s, '#PRACTICA2', edtPractica2.text);
    s := AnsiReplaceStr(s, '#NOMENCLADOR', edtNomenclador.text);
    memoPedido.Text := s;
    btnEnvia.Enabled := true;
  end;

end;

end.
