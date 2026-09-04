object frmPruebaXML: TfrmPruebaXML
  Left = 399
  Top = 451
  Width = 1291
  Height = 599
  Caption = 'Prueba XML SageLabWin'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 6
    Top = 203
    Width = 76
    Height = 16
    Caption = 'Respuesta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 6
    Top = 3
    Width = 51
    Height = 16
    Caption = 'Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 654
    Top = 19
    Width = 148
    Height = 16
    Caption = 'Respuesta analizada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 992
    Top = 19
    Width = 50
    Height = 16
    Caption = 'Printer:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 789
    Top = 539
    Width = 116
    Height = 16
    Caption = 'Nro Transacci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object memo_response: TMemo
    Left = 5
    Top = 222
    Width = 640
    Height = 299
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object memoAnalisis: TMemo
    Left = 654
    Top = 42
    Width = 329
    Height = 479
    TabOrder = 1
  end
  object EDIT_HOST: TMemo
    Left = 5
    Top = 21
    Width = 643
    Height = 179
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object btn01A: TButton
    Left = 3
    Top = 536
    Width = 154
    Height = 25
    Caption = '01A Verificar Afiliado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btn01AClick
  end
  object btn02A: TButton
    Left = 159
    Top = 536
    Width = 154
    Height = 25
    Caption = '02A Facturar practicas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btn02AClick
  end
  object memPrinter: TMemo
    Left = 992
    Top = 41
    Width = 274
    Height = 522
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object btn02L: TButton
    Left = 314
    Top = 536
    Width = 154
    Height = 25
    Caption = '02L Autorizar practicas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btn02LClick
  end
  object btn04A: TButton
    Left = 472
    Top = 536
    Width = 210
    Height = 25
    Caption = '04A Anular practicas de referencia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btn04AClick
  end
  object edtReferencia: TEdit
    Left = 685
    Top = 538
    Width = 94
    Height = 21
    TabOrder = 8
  end
  object edtNumeroTransaccion: TEdit
    Left = 910
    Top = 536
    Width = 73
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    Text = '2355'
  end
  object IdHTTP1: TIdHTTP
    MaxLineLength = 65535
    MaxLineAction = maException
    Port = 48080
    AuthRetries = 20
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = 0
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoInProcessAuth, hoKeepOrigProtocol, hoForceEncodeParams]
    Left = 800
    Top = 112
  end
end
