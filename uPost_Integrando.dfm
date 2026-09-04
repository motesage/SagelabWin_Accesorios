object frmPost_Integrando: TfrmPost_Integrando
  Left = 428
  Top = 188
  Width = 904
  Height = 556
  Caption = 'Prueba Subida pdf a Integrando Salud Clinica Monte Grande 2024'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 888
    Height = 86
    Align = alTop
    TabOrder = 11
    object Label6: TLabel
      Left = 16
      Top = 7
      Width = 22
      Height = 13
      Caption = 'URL'
    end
    object Label7: TLabel
      Left = 15
      Top = 33
      Width = 38
      Height = 13
      Caption = 'Client Id'
    end
    object Label8: TLabel
      Left = 16
      Top = 60
      Width = 46
      Height = 13
      Caption = 'username'
    end
    object Label9: TLabel
      Left = 201
      Top = 33
      Width = 63
      Height = 13
      Caption = 'client_secret:'
    end
    object Label10: TLabel
      Left = 201
      Top = 59
      Width = 45
      Height = 13
      Caption = 'password'
    end
    object lblpr1: TLabel
      Left = 664
      Top = 9
      Width = 48
      Height = 13
      Caption = 'Practica 1'
    end
    object Label1: TLabel
      Left = 664
      Top = 33
      Width = 48
      Height = 13
      Caption = 'Practica 2'
    end
    object Label2: TLabel
      Left = 664
      Top = 57
      Width = 63
      Height = 13
      Caption = 'Nomenclador'
    end
    object edtUser: TEdit
      Left = 79
      Top = 55
      Width = 100
      Height = 21
      TabOrder = 0
    end
    object edtPractica1: TEdit
      Left = 734
      Top = 6
      Width = 62
      Height = 21
      TabOrder = 1
      Text = '550865'
    end
    object edtNomenclador: TEdit
      Left = 734
      Top = 54
      Width = 62
      Height = 21
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 568
    Top = 86
    Width = 320
    Height = 431
    Align = alClient
    TabOrder = 10
    object memoResultados: TMemo
      Left = 1
      Top = 1
      Width = 318
      Height = 429
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object memoPedido: TMemo
    Left = 0
    Top = 86
    Width = 268
    Height = 431
    Align = alLeft
    Color = clMoneyGreen
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object MemoRespuesta: TMemo
    Left = 268
    Top = 86
    Width = 300
    Height = 431
    Align = alLeft
    Color = 16776176
    Lines.Strings = (
      'Esperando respuesta ....')
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object btnEnvia: TButton
    Left = 402
    Top = 42
    Width = 94
    Height = 32
    Caption = 'Enviar pdf'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnEnviaClick
  end
  object edtClient: TEdit
    Left = 78
    Top = 29
    Width = 102
    Height = 21
    TabOrder = 3
  end
  object edtClientSecret: TEdit
    Left = 277
    Top = 29
    Width = 108
    Height = 21
    TabOrder = 4
  end
  object edtPractica2: TEdit
    Left = 734
    Top = 30
    Width = 62
    Height = 21
    TabOrder = 5
    Text = '047500'
  end
  object edtPassword: TEdit
    Left = 277
    Top = 55
    Width = 108
    Height = 21
    TabOrder = 6
  end
  object btnToken: TButton
    Left = 402
    Top = 7
    Width = 94
    Height = 32
    Caption = 'Pide token'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnTokenClick
  end
  object memoPdf: TMemo
    Left = 18
    Top = 320
    Width = 511
    Height = 165
    Lines.Strings = (
      
        'curl --location --request POST '#39'https://xxxxxxxxxx/is-integrador' +
        '/public/api/v1/resultado/adjuntar-resultado'#39' \'
      '--header '#39'Content-Type: application/json'#39' \'
      '--header '#39'Authorization: Bearer {access_token}'#39'\'
      '--data '#39'{'
      '"id_persona": identificador de la persona,'
      '"archivos": ['
      '{'
      '"fecha": "aaaa-mm-dd",'
      '"agrupador": 1-7,'
      '"titulo": "titulo de la imagen",'
      
        '"descripcion": "una breve descripcion de la imagen, es opcionea"' +
        ','
      '"link": '#8220'Se ingresa un link, cuando el valor de agrupador: 6",'
      '"archivo_base64": "el archivo adjunto en base64"'
      '}'
      ']'
      '}'#39
      'Response:'
      
        '{"statusCode":200,"message":"success","data":{"insertados_con_ex' +
        'ito":1,"no_insertados":[]}}')
    ReadOnly = True
    TabOrder = 8
    Visible = False
    WordWrap = False
  end
  object edtURL: TEdit
    Left = 78
    Top = 3
    Width = 307
    Height = 21
    TabOrder = 9
    Text = 'http://190.220.14.134:8083'
  end
  object memoToken: TMemo
    Left = 18
    Top = 148
    Width = 511
    Height = 157
    Lines.Strings = (
      
        'curl --location --request POST '#39'https://xxxxxxxxxx/is-integrador' +
        '/public/oauth/token'#39' \'
      '--header '#39'Content-Type: application/json'#39' \'
      '--form '#39'grant_type="password"'#39' \'
      '--form '#39'client_id="x"'#39' \'
      '--form '#39'client_secret="xx"'#39' \'
      '--form '#39'username="xxx"'#39' \'
      '--form '#39'password="xxxx"'#39' \'
      '--form '#39'scope="*"'#39
      ''
      'Response:'
      
        '{"token_type":"Bearer","expires_in":31536000,"access_token":"eyJ' +
        '0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0a'
      
        'SI6IjQzYzA1MGVlZTJlNWYxOTk4NmNkNThiOGRmZmU5ZjYyODRjMTVlMzc1OTgxZ' +
        'TEwYzFiZTBlNzhmZmFm'
      
        'NDJhMDJkYzNjMTA2ODRlZmQ1MWJiIn0.eyJhdWQiOiIxIiwianRpIjoiNDNjMDUw' +
        'ZWVlMmU1ZjE5OTg2Y2Q1OG'
      
        'I4ZGZmZTlmNjI4NGMxNWUzNzU5ODFlMTBjMWJlMGU3OGZmYWY0MmEwMmRjM2MxMD' +
        'Y4NGVmZDUxYm'
      
        'IiLCJpYXQiOjE2NjMxNjQ4NzgsIm5iZiI6MTY2MzE2NDg3OCwiZXhwIjoxNjk0Nz' +
        'AwODc4LCJzdWIiOiI2Iiwic2Nvc'
      
        'GVzIjpbIioiXX0.jWmMeIOu18uKQxzGRaOPbDo1gVsHw9S0d0Ifq_CCvseXHo83b' +
        'DsZMKHpwEQxQDSc7jAKU-p'
      
        '4POjHczYxOOxB2jYyefKtIEcKZjFmbDQyTyFhXFTEpRVLzND414Dyy_euI0tEEON' +
        '2AaZfllxuyrQzXaHzWVWRQl'
      'Z"}')
    ReadOnly = True
    TabOrder = 12
    Visible = False
    WordWrap = False
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 432
    Top = 104
  end
end
