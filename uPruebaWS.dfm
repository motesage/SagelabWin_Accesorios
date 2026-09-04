object Form1: TForm1
  Left = 192
  Top = 196
  Width = 1142
  Height = 656
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 792
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 32
    Top = 16
    Width = 297
    Height = 441
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 344
    Top = 16
    Width = 281
    Height = 441
    Lines.Strings = (
      'Memo2')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 792
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Desconectar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object edtId: TEdit
    Left = 680
    Top = 16
    Width = 297
    Height = 21
    TabOrder = 4
    Text = '30597F67-AFD6-4044-B641-5EFD90B85888'
  end
  object Button3: TButton
    Left = 792
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Traer mutuales'
    TabOrder = 5
    OnClick = Button3Click
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    Left = 696
    Top = 136
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    OnDisconnected = IdHTTP1Disconnected
    Host = 'conveniosws.faba.org.ar'
    OnConnected = IdHTTP1Connected
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 744
    Top = 336
  end
end
