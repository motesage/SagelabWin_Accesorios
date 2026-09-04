unit uPruebaTokenIntegrando;

interface

uses
  forms, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IdSSLOpenSSL, IdMultipartFormData, StdCtrls;

type
  TForm1 = class(TForm)
    IdHTTP1: TIdHTTP;
    Memo1: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FSSL: TIdSSLIOHandlerSocketOpenSSL;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FSSL := TIdSSLIOHandlerSocketOpenSSL.Create(Self);

  // FORZAR TLS 1.2
  FSSL.SSLOptions.Method := sslvTLSv1_2;
  FSSL.SSLOptions.SSLVersions := [sslvTLSv1_2];

  IdHTTP1.IOHandler := FSSL;

  IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded';
  IdHTTP1.Request.Accept := 'application/json';

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Params: TStringList;
  Response: string;
begin
  Params := TStringList.Create;
  try
    Params.Add('grant_type=password');
    Params.Add('client_id=x');
    Params.Add('client_secret=xx');
    Params.Add('username=xxx');
    Params.Add('password=xxxx');
    Params.Add('scope=*');

    // https://integrandosalud.com/is-integrador/public/api/v1/paciente

    try
      Response := IdHTTP1.Post(
        'https://integrandosalud.com/is-integrador/public/oauth/token',
        Params
      );

      Memo1.Lines.Text := Response;

    except
      on E: Exception do
        Memo1.Lines.Text := 'Error: ' + E.Message;
    end;

  finally
    Params.Free;
  end;
end;

end.
