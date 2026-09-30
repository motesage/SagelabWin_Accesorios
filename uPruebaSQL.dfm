object Form1: TForm1
  Left = 554
  Top = 225
  Width = 1305
  Height = 758
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
    Left = 1088
    Top = 8
    Width = 129
    Height = 41
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object memSQL: TMemo
    Left = 0
    Top = 56
    Width = 1289
    Height = 305
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object grdSQL: TDBGrid
    Left = 0
    Top = 368
    Width = 1289
    Height = 369
    DataSource = dsSQL
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 208
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'MySQLSage'
    DriverName = 'DevartMySQLDirect'
    GetDriverFunc = 'getSQLDriverMySQLDirect'
    LibraryName = 'dbexpmda.dll'
    Params.Strings = (
      'Database=sage'
      'HostName=190.xxx.xxx.xxx:xxxx'
      'User_name=xxx'
      'Password=xxx2016##')
    VendorLib = 'not used'
    Left = 440
    Top = 144
  end
  object mtblResult: TJvMemoryData
    Active = True
    FieldDefs = <>
    Left = 288
    Top = 208
  end
  object dsSQL: TDataSource
    DataSet = mtblResult
    Left = 160
    Top = 215
  end
  object SQLDataSet: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 240
    Top = 143
  end
end
