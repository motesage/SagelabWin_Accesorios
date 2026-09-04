object frmLimpiaBloq: TfrmLimpiaBloq
  Left = 501
  Top = 286
  Width = 498
  Height = 348
  Caption = 'Analiza y elimina bloqueos SQL del sistema SageLab'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object memQuery: TMemo
    Left = 8
    Top = 15
    Width = 465
    Height = 161
    Lines.Strings = (
      'SELECT'
      
        '  blocking_session_id AS BlockingSessionID, session_id AS Victim' +
        'SessionID,'
      
        '  (SELECT [text] FROM sys.sysprocesses  CROSS APPLY sys.dm_exec_' +
        'sql_text([sql_handle])'
      '  WHERE spid = blocking_session_id) AS BlockingQuery,'
      '     [text] AS VictimQuery,'
      '     wait_time/1000 AS WaitDurationSecond,'
      '     wait_type AS WaitType,'
      '     percent_complete AS BlockingQueryCompletePercent'
      'FROM sys.dm_exec_requests'
      'CROSS APPLY sys.dm_exec_sql_text([sql_handle])'
      'WHERE blocking_session_id > 0')
    ReadOnly = True
    TabOrder = 1
    Visible = False
    WordWrap = False
  end
  object Button1: TButton
    Left = 7
    Top = 16
    Width = 82
    Height = 30
    Caption = 'Procesa'
    TabOrder = 0
    OnClick = Button1Click
  end
  object grdBloqueos: TDBGrid
    Left = 7
    Top = 49
    Width = 465
    Height = 142
    DataSource = dsQry
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object memProceso: TMemo
    Left = 7
    Top = 205
    Width = 465
    Height = 89
    TabOrder = 3
  end
  object mtblQuery: TJvMemoryData
    FieldDefs = <>
    Left = 112
    Top = 128
  end
  object dsQry: TDataSource
    DataSet = mtblQuery
    Left = 200
    Top = 120
  end
end
