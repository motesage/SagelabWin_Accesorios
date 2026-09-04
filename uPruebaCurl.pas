unit uPruebaCurl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JCLStrings, JvJCLUtils, Dialogs, StdCtrls, wwdbdatetimepicker;

type
  TfrmCurl = class(TForm)
    BotonConsultar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtTipoDoc: TEdit;
    Label3: TLabel;
    EdtNroDoc: TEdit;
    Memo1: TMemo;
    edtFechaNac: TwwDBDateTimePicker;
    procedure BotonConsultarClick(Sender: TObject);
  private
    function Parsea(s: string): string;
    function ProcesaJson(var sJson: string; sTag: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCurl: TfrmCurl;

implementation

{$R *.dfm}
uses
  IdHTTP, IdSSLOpenSSL, IdBaseComponent, IdAssignedNumbers, StrUtils;

const
  crlf = #13#10;
  
procedure TfrmCurl.BotonConsultarClick(Sender: TObject);
const
  BASE_URL = 'https://integrandosalud.com/is-integrador/public/api/v1/paciente';
  TOKEN = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjVmZGY4ZjNkNWJkNDQ3YjlhNDM2YTI2ODRlNmE4OWIxYzk0MWRhYzB'+
          'jMTFkMGNhY2Q0ZjFhNTlmYTEyNzU4NmI5YTQ1NmRiZGYyNzE3ODMyIn0.eyJhdWQiOiIxIiwianRpIjoiNWZkZjhmM2Q1YmQ0ND'+
          'diOWE0MzZhMjY4NGU2YTg5YjFjOTQxZGFjMGMxMWQwY2FjZDRmMWE1OWZhMTI3NTg2YjlhNDU2ZGJkZjI3MTc4MzIiLCJpYXQiO'+
          'jE3NjA5NjQ1NjYsIm5iZiI6MTc2MDk2NDU2NiwiZXhwIjoxNzkyNTAwNTY2LCJzdWIiOiIxMiIsInNjb3BlcyI6WyIqIl19.PK6'+
          '9yGNq2IbLPddcmS6yNsRRnB_t_hmo28a6okxvCcNT0Awtfy7VNDr_S5cAR3ehPBDM6SyjoSqXRp-UCypnbl2iQ578P1zz83c3qm'+
          'o-M0QidC_HkOc_tPFeMiCDBCMJfHs3bpBYyu2d_cIgdwntshcwq_xFWLHurb4ScrqoQCx3f5le373lLNDl4UY6Bs8dZ3yePghDG'+
          'SMjWBFJSTrrfsMUcTbToPemA20ADRNbrOGSijkjN3VNRPHm2a-ey8HKJ-tDn9Aa7B4LHByooMbalyxmQWVTtx_dkhllTo1oromD'+
          '5g9rw9J7kYylR0C5t5brp4PY7xcSkx9pn8cFvdlkdWLg8-108O_zU1RWVmBAukzxcPkNMBpvTmc1nYP0lQ9Gtn-ce9OzaIBybld'+
          'TZ2p5wjBbBc1wjMvViyPZthJa2fzlCE5LAnEb4uZKo6TojUqdzfH5VvSO_QIX-HnKJi32p4egnRFKhIOWjr-qh6rWb_aB5rni8j'+
          'YJAsImnU7pcaCdpNon3N1OsAHi1N_Py2Dq9eONR9CYcYte5fBP38aOLUXiiDB-3DokIjnW3m9fVuuOsfSXLlDzT1L_tLKlnGkGH'+
          'KPtjX436RJiChW5iJ2EsmbS7SpzsqdwafxltJG7fcBXMk4fk-5ajJxlr7AJuCFINn-LN05ZWWZGFW2Velfe6j8';

var
  IdHTTP: TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  URLCompleta: string;
  RespuestaJSON: string;
  sFecha: string;
begin
  Memo1.Lines.Clear;
  // Construir la URL con los parámetros de la query
  sFecha := FormatDateTime('yyyy-mm-dd',edtFechaNac.Date);
  URLCompleta := BASE_URL + '?fecha_nacimiento=' + sFecha +   '&tipo_documento=' + edtTipoDoc.text + '&numero_documento=' + EdtNroDoc.text;
  // 1. Crear los componentes
  IdHTTP := TIdHTTP.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  try
    // -----------------------------------------------------------------
    //  Forzar el uso de TLSv1.2 (o incluir también TLSv1.1) ??
    // -----------------------------------------------------------------
    SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1_2];
    // 2. Configurar el manejo de SSL/TLS (HTTPS)
    // Asegúrate de que las DLLs de OpenSSL estén accesibles por la aplicación
    IdHTTP.IOHandler := SSLHandler;
    // 3. Configurar los encabezados (Headers)
    // Encabezado Authorization: Bearer TOKEN
    IdHTTP.Request.CustomHeaders.AddValue('Authorization', 'Bearer ' + TOKEN);
    // Encabezado Accept: application/json
    IdHTTP.Request.Accept := 'application/json';
    // 4. Realizar la solicitud GET
    try
      RespuestaJSON := IdHTTP.Get(URLCompleta);
      // Mostrar la respuesta (por ejemplo, en un Memo)
      Memo1.Lines.Add(parsea(RespuestaJSON));
    except
      on E: Exception do
      begin
        Memo1.Lines.Add(E.Message);
      end;
    end;
  finally
    // Liberar los recursos
    IdHTTP.Free;
    SSLHandler.Free;
  end;
end;

function TfrmCurl.Parsea(s: string) : string;
var
  sp: string;
  posicion: integer;
begin

  if pos('{"success":true',s) > 0 then begin
    // Si no existe el documento y fecha solicitados
    // '{"success":true,"data":[],"message":"No se encontr\u00f3 el paciente"}'
    if pos('No se encontr',s) > 0 then begin
      result := 'Sin datos para ' + edtTipoDoc.text + ' numero ' + EdtNroDoc.Text + ' Fecha de nacimiento ' + edtFechaNac.Text;
      exit;
    end
    else begin
      posicion := pos('"nombre"',s);
      sp := AnsiMidStr(s,posicion,1000);
    end;
  end;
  sp := trim(AnsiReplaceStr(sp, '}]}', ''));
  result :=                'Nombre       ' + ProcesaJson(sp,'nombre');
  result := result + crlf +'Nombre 2     '+ ProcesaJson(sp,'otro_nombre');
  result := result + crlf +'Apellido     '+ ProcesaJson(sp,'apellido');
  result := result + crlf +'Apellido 2   ' + ProcesaJson(sp,'otro_apellido');
  result := result + crlf +'Sexo         '+ ProcesaJson(sp,'sexo');
  result := result + crlf +'Email        '+ ProcesaJson(sp,'email');
  result := result + crlf +'Celular      '+ ProcesaJson(sp,'telefono_celular');
  result := result + crlf +'TE           '+ ProcesaJson(sp,'telefono_particular');
  result := result + crlf +'Direccion    '+ ProcesaJson(sp,'direccion');
  result := result + crlf +'Puerta       '+ ProcesaJson(sp,'puerta');
  result := result + crlf +'Piso         '+ ProcesaJson(sp,'piso');
  result := result + crlf +'Depto        '+ ProcesaJson(sp,'departamento');
  result := result + crlf +'Codpost      '+ ProcesaJson(sp,'codigo_postal');
  result := result + crlf +'Localid      '+ ProcesaJson(sp,'localidad');
  result := result + crlf +'Provincia    '+ ProcesaJson(sp,'provincia');
  result := result + crlf +'id_prog_med  '+ ProcesaJson(sp,'id_programa_medico');
  result := result + crlf +'prog_medico  '+ ProcesaJson(sp,'programa_medico');
  result := result + crlf +'id_plan_med  '+ ProcesaJson(sp,'id_plan_medico');
  result := result + crlf +'plan_medico  '+ ProcesaJson(sp,'plan_medico');
  result := result + crlf +'numero_benef '+ ProcesaJson(sp,'numero_beneficiario');
end;

function TfrmCurl.ProcesaJson(var sJson: string; sTag: string): string;
var
  inicio: integer;
begin
  // busca el tag en el string y devuelve el contenido
	// "apellido":"GARCIA",
  result := '';
  inicio := pos('"' + sTag + '":' , sJson) + length(sTag) + 3;
  sJson := copy(sJson,inicio,1000);
	// "GARCIA",.......
  result := trim(AnsiReplaceStr(ExtractWord(1,sJson,[',']),'"',''));
end;

end.



