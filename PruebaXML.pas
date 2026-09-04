unit PruebaXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdIntercept, xmlData, StrUtils,  JvJCLUtils,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, jvStrings;

type
  TfrmPruebaXML = class(TForm)
    IdHTTP1: TIdHTTP;
    memo_response: TMemo;
    Label3: TLabel;
    memoAnalisis: TMemo;
    Label1: TLabel;
    EDIT_HOST: TMemo;
    btn01A: TButton;
    Label2: TLabel;
    btn02A: TButton;
    memPrinter: TMemo;
    Label4: TLabel;
    btn02L: TButton;
    btn04A: TButton;
    edtReferencia: TEdit;
    edtNumeroTransaccion: TEdit;
    Label5: TLabel;
    procedure btn01AClick(Sender: TObject);
    procedure btn02AClick(Sender: TObject);
    procedure btn02LClick(Sender: TObject);
    procedure btn04AClick(Sender: TObject);
  private
    procedure ArmaMensaje(tipo:string; mensajeXML: IXMLMensajeType);
    procedure EnviaMensaje(mensajeXML: IXMLMensajeType);
    procedure AnalizaMensaje;
    procedure Procesa(tipo: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPruebaXML: TfrmPruebaXML;

implementation

{$R *.dfm}

procedure TfrmPruebaXML.Procesa(tipo:string);
var
  mensajeXML: IXMLMensajeType;
  respuesta: string;
begin
  memoAnalisis.lines.clear;
  memPrinter.lines.clear;
  MensajeXML := newMensaje;
  try
    ArmaMensaje(tipo,MensajeXML);
    EnviaMensaje(MensajeXML);
    AnalizaMensaje;
  finally
    // MensajeXML.FREE ... NOTA ASAS MGM DEBUG FALTA VER COMO SE IMPLEMENTA EL FREE DE ESTO
  end;
end;

procedure TfrmPruebaXML.AnalizaMensaje;
var
  respuestaXML: IXMLMensajeType;
begin
  respuestaXML := LoadMensaje('XML_answer.xml');
  memoAnalisis.lines.add('CODIGO RESPUESTA = ' + respuestaXML.EncabezadoMensaje.Rta.CodRtaGeneral);
  memoAnalisis.lines.add('referencia       = ' + respuestaXML.EncabezadoMensaje.NroReferencia);
  edtReferencia.text := respuestaXML.EncabezadoMensaje.NroReferencia;
  memoAnalisis.lines.add('====================================================');
  memoAnalisis.lines.add('Tipo transaccion = ' + respuestaXML.EncabezadoMensaje.TipoTransaccion);
  memoAnalisis.lines.add('version          = ' + respuestaXML.EncabezadoMensaje.VersionMsj);
  memoAnalisis.lines.add('CUIT prestador   = ' + respuestaXML.EncabezadoMensaje.Prestador.CuitPrestador);
  memoAnalisis.lines.add('RazSoc Prestador = ' + respuestaXML.EncabezadoMensaje.Prestador.RazonSocial);
  memoAnalisis.lines.add('====================================================');
  memoAnalisis.lines.add('Referencia   = ' +   respuestaXML.EncabezadoMensaje.NroReferencia);
  memoAnalisis.lines.add('Fecha trans  = ' +   respuestaXML.EncabezadoMensaje.InicioTrx.FechaTrx);
  memoAnalisis.lines.add('Hora trans   = ' +   respuestaXML.EncabezadoMensaje.InicioTrx.HoraTrx);
  memoAnalisis.lines.add('Mensaje      = ' +   respuestaXML.EncabezadoMensaje.Rta.MensajeDisplay);
  memoAnalisis.lines.add('Generador    = ' +   respuestaXML.EncabezadoMensaje.GeneradorRespuesta);
  memoAnalisis.lines.add('Benef.TipoDoc= ' +   respuestaXML.EncabezadoAtencion.Beneficiario.TipoDocBeneficiario);
  memoAnalisis.lines.add('Benef.NroDoc = ' +   respuestaXML.EncabezadoAtencion.Beneficiario.NroDocBeneficiario);
  memoAnalisis.lines.add('Benef.Apell  = ' +   respuestaXML.EncabezadoAtencion.Beneficiario.ApellidoBeneficiario);
  memoAnalisis.lines.add('Benef.Nombre = ' +   respuestaXML.EncabezadoAtencion.Beneficiario.NombreBeneficiario);
  memoAnalisis.lines.add('Benef.Sexo   = ' +   respuestaXML.EncabezadoAtencion.Beneficiario.Sexo);
  memoAnalisis.lines.add('Benef.FeNac  = ' +   respuestaXML.EncabezadoAtencion.Beneficiario.FechaNacimiento);
  memoAnalisis.lines.add('Benef.Parent = ' +   respuestaXML.EncabezadoAtencion.Beneficiario.Parentesco);

  memoAnalisis.lines.add('Credencial   = ' +   respuestaXML.EncabezadoAtencion.Credencial.NumeroCredencial);
  memoAnalisis.lines.add('IVA          = ' +   respuestaXML.EncabezadoAtencion.Credencial.CondicionIVA);
  memoAnalisis.lines.add('Plan         = ' +   respuestaXML.EncabezadoAtencion.Credencial.PlanCredencial);

  memPrinter.lines.add('Mensaje      = ' +   respuestaXML.EncabezadoMensaje.Rta.MensajePrinter);
end;

procedure TfrmPruebaXML.ArmaMensaje(tipo:string; mensajeXML: IXMLMensajeType);
begin
  mensajeXML.EncabezadoMensaje.VersionMsj := '1.0';
  mensajeXML.EncabezadoMensaje.TipoTransaccion := tipo;
  mensajeXML.EncabezadoMensaje.IdMsj := edtNumerotransaccion.text;
  edtNumerotransaccion.text := inttostr(strtoint(edtNumerotransaccion.text) + 1);
  mensajeXML.EncabezadoMensaje.InicioTrx.FechaTrx := '20130625';
  mensajeXML.EncabezadoMensaje.InicioTrx.HoraTrx := '160420';
  mensajeXML.EncabezadoMensaje.Terminal.TipoTerminal := 'PC';
  mensajeXML.EncabezadoMensaje.Terminal.NumeroTerminal := '1000';
  mensajeXML.EncabezadoMensaje.Financiador.CodigoFinanciador := '11'; // osde
  mensajeXML.EncabezadoMensaje.Financiador.CuitFinanciador := '30546741253'; // osde
  mensajeXML.EncabezadoMensaje.Prestador.CuitPrestador := '30708402911'; // DEMO ojo cambiar
  mensajeXML.EncabezadoAtencion.Credencial.NumeroCredencial := '60671956201'; // DEMO ojo cambiar
  if (tipo = '04A') then begin
    // anulacion requiere el numero de transaccion a anular y el nro de afiliado para confirmacion
    mensajeXML.EncabezadoMensaje.NroReferenciaCancel:= edtReferencia.text; // debe ser una referencia existente !
  end;
  if (tipo = '02A') or (tipo = '02L')then begin
    mensajeXML.DetalleProcedimientos.NroItem := '1';
    mensajeXML.DetalleProcedimientos.CodPrestacion := '412';
    mensajeXML.DetalleProcedimientos.TipoPrestacion := '1';
    mensajeXML.DetalleProcedimientos.ArancelPrestacion := '0';
    mensajeXML.DetalleProcedimientos.CantidadSolicitada := '1';
    // mensajeXML.DetalleProcedimientos.DescripcionPrestacion := 'GLUCOSA';
    mensajeXML.DetalleProcedimientos.NroItem := '2';
    mensajeXML.DetalleProcedimientos.CodPrestacion := '174';
    mensajeXML.DetalleProcedimientos.TipoPrestacion := '1';
    mensajeXML.DetalleProcedimientos.ArancelPrestacion := '0';
    mensajeXML.DetalleProcedimientos.CantidadSolicitada := '1';
    //mensajeXML.DetalleProcedimientos.DescripcionPrestacion := 'GLUCOSA';
    mensajeXML.DetalleProcedimientos.NroItem := '3';
    mensajeXML.DetalleProcedimientos.CodPrestacion := '1983';
    mensajeXML.DetalleProcedimientos.TipoPrestacion := '1';
    mensajeXML.DetalleProcedimientos.ArancelPrestacion := '0';
    mensajeXML.DetalleProcedimientos.CantidadSolicitada := '1';
  end;
end;

procedure TfrmPruebaXML.EnviaMensaje(mensajeXML: IXMLMensajeType);
var
  inicio: integer;
  Response: TStringStream;
  header, contenido: string;
begin
  header :=  'http://ws.itcsoluciones.com:48080/jSitelServlet/Do?pas=32dbf220f1ab2303592b4a076162c221600ef704&msj=';
  contenido := mensajeXML.ownerdocument.xml.GetText;
  inicio := pos('<Mensaje>',contenido);
  contenido := copy(contenido,inicio,length(contenido)-inicio+1);
  edit_host.text := header + contenido;
  IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded';    // important!
  Response := TStringStream.Create('');
  try
    IdHTTP1.Get(urlEncode(edit_host.text), Response);
    memo_response.Lines.Text := Response.DataString;
    memo_response.Lines.SaveToFile('XML_answer.xml');
  finally
    Response.Free;
  end;
end;

procedure TfrmPruebaXML.btn01AClick(Sender: TObject);
begin
  Procesa('01A');
end;

procedure TfrmPruebaXML.btn02AClick(Sender: TObject);
begin
  Procesa('02A');
end;

procedure TfrmPruebaXML.btn02LClick(Sender: TObject);
begin
  Procesa('02L');
end;

procedure TfrmPruebaXML.btn04AClick(Sender: TObject);
begin
  Procesa('04A');
end;

end.
