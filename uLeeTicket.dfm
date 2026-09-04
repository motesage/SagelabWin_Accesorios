object frmleeTicket: TfrmleeTicket
  Left = 487
  Top = 150
  Width = 198
  Height = 448
  Caption = 'Control de emisi'#243'n de tickets'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo2: TMemo
    Left = 0
    Top = 46
    Width = 182
    Height = 364
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -32
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 182
    Height = 46
    Align = alTop
    TabOrder = 1
    object edtCommPort: TMemo
      Left = 8
      Top = 4
      Width = 176
      Height = 37
      Hint = 
        'La puerta serie se define en el archivo "Ticket.INI" de la carpe' +
        'ta de trabajo del sistema.'
      Lines.Strings = (
        'Memo1')
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 40
    Top = 216
    Width = 83
    Height = 25
    Caption = 'Prueba Reset'
    TabOrder = 2
    Visible = False
    OnClick = Button1Click
  end
  object SerialPort: TApdComPort
    ComNumber = 3
    Baud = 9600
    AutoOpen = False
    DTR = False
    RTS = False
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    OnTriggerAvail = SerialPortTriggerAvail
    Left = 48
    Top = 32
  end
end
