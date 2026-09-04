object Form1: TForm1
  Left = -2
  Top = 103
  Width = 1305
  Height = 675
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
  object Memo1: TMemo
    Left = 32
    Top = 16
    Width = 481
    Height = 617
    Lines.Strings = (
      'Lee el archivo INOS1990.TXT con la pinta'
      ''
      'Lo separa en 4 columnas separadas por PIPES'
      'Busca los 4 campos basado en lois espacios'
      '(midiendo desde el fondo....)'
      ''
      'Y lo graba como INOS1990.CSV')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 528
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Lee'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 528
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Graba'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo2: TMemo
    Left = 616
    Top = 16
    Width = 481
    Height = 617
    TabOrder = 3
  end
end
