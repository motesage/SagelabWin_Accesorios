object frmPruebaSW: TfrmPruebaSW
  Left = 428
  Top = 188
  Width = 904
  Height = 556
  Caption = 'Prueba WS Clinica Monte Grande 2024'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 888
    Height = 86
    Align = alTop
    TabOrder = 12
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
      Width = 75
      Height = 13
      Caption = 'Nro Documento'
    end
    object Label8: TLabel
      Left = 16
      Top = 60
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label9: TLabel
      Left = 201
      Top = 33
      Width = 66
      Height = 13
      Caption = 'Cuit Prestador'
    end
    object Label10: TLabel
      Left = 201
      Top = 59
      Width = 64
      Height = 13
      Caption = 'Fecha / Hora'
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
    object chkCred: TRadioButton
      Left = 521
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Valida Afiliado'
      TabOrder = 0
      OnClick = btnGeneraClick
    end
    object chkAutoriza: TRadioButton
      Left = 521
      Top = 37
      Width = 113
      Height = 17
      Caption = 'Autoriza pr'#225'cticas'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = btnGeneraClick
    end
    object edtEntidad: TEdit
      Left = 79
      Top = 55
      Width = 100
      Height = 21
      TabOrder = 2
      Text = '1'
    end
    object edtPractica1: TEdit
      Left = 734
      Top = 6
      Width = 62
      Height = 21
      TabOrder = 3
      Text = '550865'
    end
    object edtNomenclador: TEdit
      Left = 734
      Top = 54
      Width = 62
      Height = 21
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 568
    Top = 86
    Width = 320
    Height = 431
    Align = alClient
    TabOrder = 11
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
    Caption = 'Enviar'
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
  object edtCredencial: TEdit
    Left = 96
    Top = 29
    Width = 95
    Height = 21
    TabOrder = 3
    Text = '54270709'
  end
  object edtCuit: TEdit
    Left = 277
    Top = 29
    Width = 108
    Height = 21
    TabOrder = 4
    Text = '30546068656'
  end
  object edtPractica2: TEdit
    Left = 734
    Top = 30
    Width = 62
    Height = 21
    TabOrder = 5
    Text = '047500'
  end
  object edtFecha: TEdit
    Left = 277
    Top = 55
    Width = 55
    Height = 21
    TabOrder = 6
    Text = '20240416'
  end
  object edtHora: TEdit
    Left = 335
    Top = 55
    Width = 50
    Height = 21
    TabOrder = 7
    Text = '1321453'
  end
  object btnGenera: TButton
    Left = 402
    Top = 7
    Width = 94
    Height = 32
    Caption = 'Genera XML'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnGeneraClick
  end
  object memoBase: TMemo
    Left = 18
    Top = 96
    Width = 407
    Height = 393
    Lines.Strings = (
      
        '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap' +
        '/envelope/" xmlns:ser="http://service.autorem.com/">'
      '<soapenv:Header/>'
      '<soapenv:Body>'
      '<ser:EjecutarTransaccion>'
      '<mensajeXml>'
      '<![CDATA['
      ' <?xml version="1.0" encoding="UTF-8" standalone="no"?>'
      '  <Mensaje>'
      '    <EncabezadoMensaje>'
      '      <TipoTransaccion>01A</TipoTransaccion>'
      '      <InicioTrx>'
      '        <FechaTrx>#FECHA</FechaTrx>'
      '        <HoraTrx>#HORA</HoraTrx>'
      '      </InicioTrx>'
      '     <Prestador>'
      '        <CuitPrestador>#CUITP</CuitPrestador>'
      '        <lugarAtencion>'
      '          <codigo>1</codigo>'
      '        </lugarAtencion>'
      '      </Prestador>'
      '    </EncabezadoMensaje>'
      '    <EncabezadoAtencion>'
      '      <Credencial>'
      '        <NumeroCredencial>#CRED</NumeroCredencial>'
      '      </Credencial>'#9
      '      <Beneficiario>'
      '        <Entidad>#ENTIDAD</Entidad>'
      '        <Contra></Contra>'
      '        <Inte></Inte>'
      '      </Beneficiario>'
      '    </EncabezadoAtencion>'
      '  </Mensaje>'
      ']]>'
      '</mensajeXml>'
      '</ser:EjecutarTransaccion>'
      '</soapenv:Body>'
      '</soapenv:Envelope>')
    ReadOnly = True
    TabOrder = 9
    Visible = False
    WordWrap = False
  end
  object edtURL: TEdit
    Left = 78
    Top = 3
    Width = 307
    Height = 21
    TabOrder = 10
    Text = 'http://190.220.14.134:8083'
  end
  object memobase2: TMemo
    Left = 448
    Top = 96
    Width = 393
    Height = 385
    Lines.Strings = (
      
        '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap' +
        '/envelope/" xmlns:ser="http://service.autorem.com/">'
      '<soapenv:Header/>'
      '<soapenv:Body>'
      '<ser:EjecutarTransaccion>'
      '<mensajeXml>'
      '<![CDATA['
      '<?xml version="1.0" encoding="UTF-8" standalone="no" ?> '
      '<Mensaje>'
      ' <EncabezadoMensaje>'
      '  <VersionMsj>1.0</VersionMsj> '
      '  <NroReferencia>036747</NroReferencia> '
      '  <TipoMsj>OL</TipoMsj> '
      '  <TipoTransaccion>02C</TipoTransaccion> '
      '  <IdMsj>036747</IdMsj> '
      '  <InicioTrx>'
      #9'<FechaTrx>#FECHA</FechaTrx>'
      #9'<HoraTrx>#HORA</HoraTrx>'
      '  </InicioTrx>'
      '  <Terminal>'
      ' '#9'<TipoTerminal>PC</TipoTerminal> '
      ' '#9'<NumeroTerminal>98026301</NumeroTerminal> '
      '  </Terminal>'
      '  <Prestador>'
      '    <CuitPrestador>#CUITP</CuitPrestador>'
      '    <lugarAtencion>'
      '    <codigo>1</codigo>'
      '    </lugarAtencion>'
      '  </Prestador>'
      '  <Financiador>'
      ' '#9'<CodigoFinanciador>#ENTIDAD</CodigoFinanciador> '
      ' '#9'<CuitFinanciador>#CUITP</CuitFinanciador> '
      '  </Financiador>'
      ' </EncabezadoMensaje>'
      ' <EncabezadoAtencion>'
      #9'<Prescriptor>'
      ' '#9'<ProvinciaPrescriptor>M</ProvinciaPrescriptor> '
      ' '#9'<TipoPrescriptor>M</TipoPrescriptor> '
      ' '#9'<NroMatriculaPrescriptor>050213</NroMatriculaPrescriptor> '
      '  </Prescriptor>'
      '  <Credencial>'
      '   <NumeroCredencial>#CRED</NumeroCredencial>'
      '   <ModoIngreso>M</ModoIngreso> '
      '  </Credencial>'
      '  <Atencion>'
      #9'<FechaAtencion>#FECHA</FechaAtencion> '
      '  </Atencion>'
      '  <Diagnostico>'
      '   <CodDiagnostico>I15</CodDiagnostico>'
      '  </Diagnostico>'
      ' </EncabezadoAtencion>'
      ' <DetalleProcedimientos>'
      '  '#9'<NroItem>1</NroItem> '
      '  '#9'<CodPrestacion>#PRACTICA1</CodPrestacion> '
      #9'<Nomenclador>#NOMENCLADOR</Nomenclador>'
      '  '#9'<TipoPrestacion>1</TipoPrestacion> '
      '  '#9'<ArancelPrestacion>0</ArancelPrestacion> '
      '  '#9'<CantidadSolicitada>01</CantidadSolicitada> '
      ' </DetalleProcedimientos>'
      ' <DetalleProcedimientos>'
      ' '#9'<NroItem>2</NroItem> '
      '  '#9'<CodPrestacion>#PRACTICA2</CodPrestacion> '
      #9'<Nomenclador>#NOMENCLADOR</Nomenclador>'#9
      '  '#9'<TipoPrestacion>1</TipoPrestacion> '
      '  '#9'<ArancelPrestacion>0</ArancelPrestacion> '
      '  '#9'<CantidadSolicitada>01</CantidadSolicitada> '
      ' </DetalleProcedimientos>'
      '</Mensaje>'
      ']]>'
      '</mensajeXml>'
      '</ser:EjecutarTransaccion>'
      '</soapenv:Body>'
      '</soapenv:Envelope>')
    ReadOnly = True
    TabOrder = 13
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
    Left = 416
    Top = 144
  end
end
