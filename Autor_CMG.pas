
{***************************************************************************************}
{                                                                                       }
{                                   XML Data Binding                                    }
{                                                                                       }
{         Generated on: 05/03/2024 11:52:30                                             }
{       Generated from: C:\Delphiwork\UDP_FTP_WebServices\XML_ClinicaMG\Autor_CMG.xml   }
{   Settings stored in: C:\Delphiwork\UDP_FTP_WebServices\XML_ClinicaMG\Autor_CMG.xdb   }
{                                                                                       }
{***************************************************************************************}

unit Autor_CMG;

interface

uses xmldom, XMLDoc, XMLIntf;

type

  { Forward Decls }

  IXMLMensajeType_CMG = interface;
  IXMLEncabezadoMensajeType_CMG = interface;
  IXMLRtaType_CMG = interface;
  IXMLRtaAdicionalType_CMG = interface;
  IXMLInicioTrxType_CMG = interface;
  IXMLTerminalType_CMG = interface;
  IXMLSoftwareType_CMG = interface;
  IXMLValidadorType_CMG = interface;
  IXMLFinanciadorType_CMG = interface;
  IXMLPrestadorType_CMG = interface;
  IXMLLugarAtencionType_CMG = interface;
  IXMLEncabezadoAtencionType_CMG = interface;
  IXMLCredencialType_CMG = interface;
  IXMLPreautorizacionType_CMG = interface;
  IXMLBeneficiarioType_CMG = interface;
  IXMLPrescriptorType_CMG = interface;
  IXMLDocumentacionType_CMG = interface;
  IXMLAtencionType_CMG = interface;
  IXMLDiagnosticoType_CMG = interface;
  IXMLDetalleProcedimientosType_CMG = interface;
  IXMLString_List = interface;

  { IXMLMensajeType_CMG}

  IXMLMensajeType_CMG = interface(IXMLNode)
    ['{1A1D473F-4FB8-4740-86B8-52018240A46E}']
    { Property Accessors }
    function Get_EncabezadoMensaje: IXMLEncabezadoMensajeType_CMG;
    function Get_GeneradorRespuesta: WideString;
    function Get_NroReferencia: WideString;
    function Get_EncabezadoAtencion: IXMLEncabezadoAtencionType_CMG;
    function Get_DetalleProcedimientos: IXMLDetalleProcedimientosType_CMG;
    procedure Set_GeneradorRespuesta(Value: WideString);
    procedure Set_NroReferencia(Value: WideString);
    { Methods & Properties }
    property EncabezadoMensaje: IXMLEncabezadoMensajeType_CMG read
      Get_EncabezadoMensaje;
    property GeneradorRespuesta: WideString read Get_GeneradorRespuesta write
      Set_GeneradorRespuesta;
    property NroReferencia: WideString read Get_NroReferencia write
      Set_NroReferencia;
    property EncabezadoAtencion: IXMLEncabezadoAtencionType_CMG read
      Get_EncabezadoAtencion;
    property DetalleProcedimientos: IXMLDetalleProcedimientosType_CMG read
      Get_DetalleProcedimientos;
  end;

  { IXMLEncabezadoMensajeType_CMG }

  IXMLEncabezadoMensajeType_CMG = interface(IXMLNode)
    ['{22D4C1B6-68A8-40F5-A793-91139B21D508}']
    { Property Accessors }
    function Get_VersionMsj: WideString;
    function Get_Rta: IXMLRtaType_CMG;
    function Get_RtaAdicional: IXMLRtaAdicionalType_CMG;
    function Get_NroReferencia: WideString;
    function Get_TipoMsj: WideString;
    function Get_TipoTransaccion: WideString;
    function Get_IdMsj: WideString;
    function Get_InicioTrx: IXMLInicioTrxType_CMG;
    function Get_Terminal: IXMLTerminalType_CMG;
    function Get_Software: IXMLSoftwareType_CMG;
    function Get_SetCaracteres: WideString;
    function Get_Validador: IXMLValidadorType_CMG;
    function Get_Financiador: IXMLFinanciadorType_CMG;
    function Get_Prestador: IXMLPrestadorType_CMG;
    procedure Set_VersionMsj(Value: WideString);
    procedure Set_NroReferencia(Value: WideString);
    procedure Set_TipoMsj(Value: WideString);
    procedure Set_TipoTransaccion(Value: WideString);
    procedure Set_IdMsj(Value: WideString);
    procedure Set_SetCaracteres(Value: WideString);
    { Methods & Properties }
    property VersionMsj: WideString read Get_VersionMsj write Set_VersionMsj;
    property Rta: IXMLRtaType_CMG read Get_Rta;
    property RtaAdicional: IXMLRtaAdicionalType_CMG read Get_RtaAdicional;
    property NroReferencia: WideString read Get_NroReferencia write
      Set_NroReferencia;
    property TipoMsj: WideString read Get_TipoMsj write Set_TipoMsj;
    property TipoTransaccion: WideString read Get_TipoTransaccion write
      Set_TipoTransaccion;
    property IdMsj: WideString read Get_IdMsj write Set_IdMsj;
    property InicioTrx: IXMLInicioTrxType_CMG read Get_InicioTrx;
    property Terminal: IXMLTerminalType_CMG read Get_Terminal;
    property Software: IXMLSoftwareType_CMG read Get_Software;
    property SetCaracteres: WideString read Get_SetCaracteres write
      Set_SetCaracteres;
    property Validador: IXMLValidadorType_CMG read Get_Validador;
    property Financiador: IXMLFinanciadorType_CMG read Get_Financiador;
    property Prestador: IXMLPrestadorType_CMG read Get_Prestador;
  end;

  { IXMLRtaType_CMG }

  IXMLRtaType_CMG = interface(IXMLNode)
    ['{AA4DCCA7-8A9A-4D13-BBCF-648F84BADB25}']
    { Property Accessors }
    function Get_CodRtaGeneral: WideString;
    function Get_DescripcionRtaGeneral: WideString;
    function Get_MensajeDisplay: WideString;
    function Get_MensajePrinter: WideString;
    function Get_NroTransaccion: WideString;
    procedure Set_CodRtaGeneral(Value: WideString);
    procedure Set_DescripcionRtaGeneral(Value: WideString);
    procedure Set_MensajeDisplay(Value: WideString);
    procedure Set_MensajePrinter(Value: WideString);
    procedure Set_NroTransaccion(Value: WideString);
    { Methods & Properties }
    property CodRtaGeneral: WideString read Get_CodRtaGeneral write
      Set_CodRtaGeneral;
    property DescripcionRtaGeneral: WideString read Get_DescripcionRtaGeneral
      write Set_DescripcionRtaGeneral;
    property MensajeDisplay: WideString read Get_MensajeDisplay write
      Set_MensajeDisplay;
    property MensajePrinter: WideString read Get_MensajePrinter write
      Set_MensajePrinter;
    property NroTransaccion: WideString read Get_NroTransaccion write
      Set_NroTransaccion;
  end;

  { IXMLRtaAdicionalType_CMG }

  IXMLRtaAdicionalType_CMG = interface(IXMLNode)
    ['{1C5BEA45-349C-476A-B692-47B241418925}']
    { Property Accessors }
    function Get_CodigoRtaAdicional: WideString;
    function Get_Mensaje: WideString;
    function Get_Coseguro: WideString;
    function Get_MontoFinanciador: WideString;
    procedure Set_CodigoRtaAdicional(Value: WideString);
    procedure Set_Mensaje(Value: WideString);
    procedure Set_Coseguro(Value: WideString);
    procedure Set_MontoFinanciador(Value: WideString);
    { Methods & Properties }
    property CodigoRtaAdicional: WideString read Get_CodigoRtaAdicional write
      Set_CodigoRtaAdicional;
    property Mensaje: WideString read Get_Mensaje write Set_Mensaje;
    property Coseguro: WideString read Get_Coseguro write Set_Coseguro;
    property MontoFinanciador: WideString read Get_MontoFinanciador write
      Set_MontoFinanciador;
  end;

  { IXMLInicioTrxType_CMG }

  IXMLInicioTrxType_CMG = interface(IXMLNode)
    ['{D4BA37BD-B67A-42A3-A8B2-2DB02052D7B2}']
    { Property Accessors }
    function Get_FechaTrx: WideString;
    function Get_HoraTrx: WideString;
    procedure Set_FechaTrx(Value: WideString);
    procedure Set_HoraTrx(Value: WideString);
    { Methods & Properties }
    property FechaTrx: WideString read Get_FechaTrx write Set_FechaTrx;
    property HoraTrx: WideString read Get_HoraTrx write Set_HoraTrx;
  end;

  { IXMLTerminalType_CMG }

  IXMLTerminalType_CMG = interface(IXMLNode)
    ['{0556E8CF-ED0E-4928-8C21-9AD94608763D}']
    { Property Accessors }
    function Get_TipoTerminal: WideString;
    function Get_NumeroTerminal: WideString;
    procedure Set_TipoTerminal(Value: WideString);
    procedure Set_NumeroTerminal(Value: WideString);
    { Methods & Properties }
    property TipoTerminal: WideString read Get_TipoTerminal write
      Set_TipoTerminal;
    property NumeroTerminal: WideString read Get_NumeroTerminal write
      Set_NumeroTerminal;
  end;

  { IXMLSoftwareType_CMG }

  IXMLSoftwareType_CMG = interface(IXMLNode)
    ['{6C730403-F460-4AAE-9AB6-F03F2D2BBC31}']
    { Property Accessors }
    function Get_NombreSoftware: WideString;
    procedure Set_NombreSoftware(Value: WideString);
    { Methods & Properties }
    property NombreSoftware: WideString read Get_NombreSoftware write
      Set_NombreSoftware;
  end;

  { IXMLValidadorType_CMG }

  IXMLValidadorType_CMG = interface(IXMLNode)
    ['{92A3BF91-CD7A-45F6-8BD6-DF8E76A3188A}']
    { Property Accessors }
    function Get_NombreConcentrador: WideString;
    function Get_NombreValidador: WideString;
    procedure Set_NombreConcentrador(Value: WideString);
    procedure Set_NombreValidador(Value: WideString);
    { Methods & Properties }
    property NombreConcentrador: WideString read Get_NombreConcentrador write
      Set_NombreConcentrador;
    property NombreValidador: WideString read Get_NombreValidador write
      Set_NombreValidador;
  end;

  { IXMLFinanciadorType_CMG }

  IXMLFinanciadorType_CMG = interface(IXMLNode)
    ['{7D8D3FAF-F8EA-4D34-A54E-EE44C9F9ED72}']
    { Property Accessors }
    function Get_CodigoFinanciador: WideString;
    procedure Set_CodigoFinanciador(Value: WideString);
    { Methods & Properties }
    property CodigoFinanciador: WideString read Get_CodigoFinanciador write
      Set_CodigoFinanciador;
  end;

  { IXMLPrestadorType_CMG }

  IXMLPrestadorType_CMG = interface(IXMLNode)
    ['{C6913A60-AD8B-46BF-B1E8-3D0810CB8A0A}']
    { Property Accessors }
    function Get_CuitPrestador: WideString;
    function Get_RazonSocial: WideString;
    function Get_LugarAtencion: IXMLLugarAtencionType_CMG;
    procedure Set_CuitPrestador(Value: WideString);
    procedure Set_RazonSocial(Value: WideString);
    { Methods & Properties }
    property CuitPrestador: WideString read Get_CuitPrestador write
      Set_CuitPrestador;
    property RazonSocial: WideString read Get_RazonSocial write Set_RazonSocial;
    property LugarAtencion: IXMLLugarAtencionType_CMG read Get_LugarAtencion;
  end;

  { IXMLLugarAtencionType_CMG }

  IXMLLugarAtencionType_CMG = interface(IXMLNode)
    ['{CC51F849-8140-4DF2-B0FA-15AB2F520AB5}']
    { Property Accessors }
    function Get_Codigo: WideString;
    procedure Set_Codigo(Value: WideString);
    { Methods & Properties }
    property Codigo: WideString read Get_Codigo write Set_Codigo;
  end;

  { IXMLEncabezadoAtencionType_CMG }

  IXMLEncabezadoAtencionType_CMG = interface(IXMLNode)
    ['{07F34592-64C8-42B8-99C3-5150EA266E08}']
    { Property Accessors }
    function Get_Efector: WideString;
    function Get_Credencial: IXMLCredencialType_CMG;
    function Get_Preautorizacion: IXMLPreautorizacionType_CMG;
    function Get_Beneficiario: IXMLBeneficiarioType_CMG;
    function Get_Prescriptor: IXMLPrescriptorType_CMG;
    function Get_Acompannante: WideString;
    function Get_Documentacion: IXMLDocumentacionType_CMG;
    function Get_Atencion: IXMLAtencionType_CMG;
    function Get_Diagnostico: IXMLDiagnosticoType_CMG;
    function Get_Rta: IXMLRtaType_CMG;
    function Get_RtaAdicional: IXMLRtaAdicionalType_CMG;
    procedure Set_Efector(Value: WideString);
    procedure Set_Acompannante(Value: WideString);
    { Methods & Properties }
    property Efector: WideString read Get_Efector write Set_Efector;
    property Credencial: IXMLCredencialType_CMG read Get_Credencial;
    property Preautorizacion: IXMLPreautorizacionType_CMG read
      Get_Preautorizacion;
    property Beneficiario: IXMLBeneficiarioType_CMG read Get_Beneficiario;
    property Prescriptor: IXMLPrescriptorType_CMG read Get_Prescriptor;
    property Acompannante: WideString read Get_Acompannante write
      Set_Acompannante;
    property Documentacion: IXMLDocumentacionType_CMG read Get_Documentacion;
    property Atencion: IXMLAtencionType_CMG read Get_Atencion;
    property Diagnostico: IXMLDiagnosticoType_CMG read Get_Diagnostico;
    property Rta: IXMLRtaType_CMG read Get_Rta;
    property RtaAdicional: IXMLRtaAdicionalType_CMG read Get_RtaAdicional;
  end;

  { IXMLCredencialType_CMG }

  IXMLCredencialType_CMG = interface(IXMLNode)
    ['{12DFD2B4-CDED-4AEB-8670-C3A5A4911A17}']
    { Property Accessors }
    function Get_NumeroCredencial: WideString;
    function Get_VersionCredencial: WideString;
    function Get_ModoIngreso: WideString;
    function Get_CodigoSeguridad: WideString;
    function Get_PlanCredencial: WideString;
    function Get_CondicionIVA: WideString;
    procedure Set_NumeroCredencial(Value: WideString);
    procedure Set_VersionCredencial(Value: WideString);
    procedure Set_ModoIngreso(Value: WideString);
    procedure Set_CodigoSeguridad(Value: WideString);
    procedure Set_PlanCredencial(Value: WideString);
    procedure Set_CondicionIVA(Value: WideString);
    { Methods & Properties }
    property NumeroCredencial: WideString read Get_NumeroCredencial write
      Set_NumeroCredencial;
    property VersionCredencial: WideString read Get_VersionCredencial write
      Set_VersionCredencial;
    property ModoIngreso: WideString read Get_ModoIngreso write Set_ModoIngreso;
    property CodigoSeguridad: WideString read Get_CodigoSeguridad write
      Set_CodigoSeguridad;
    property PlanCredencial: WideString read Get_PlanCredencial write
      Set_PlanCredencial;
    property CondicionIVA: WideString read Get_CondicionIVA write
      Set_CondicionIVA;
  end;

  { IXMLPreautorizacionType_CMG }

  IXMLPreautorizacionType_CMG = interface(IXMLNode)
    ['{9E1A9451-046C-43BC-B47A-25E7FAE50996}']
    { Property Accessors }
    function Get_CodigoPreautorizacion: WideString;
    function Get_Sucursal: WideString;
    procedure Set_CodigoPreautorizacion(Value: WideString);
    procedure Set_Sucursal(Value: WideString);
    { Methods & Properties }
    property CodigoPreautorizacion: WideString read Get_CodigoPreautorizacion
      write Set_CodigoPreautorizacion;
    property Sucursal: WideString read Get_Sucursal write Set_Sucursal;
  end;

  { IXMLBeneficiarioType_CMG }

  IXMLBeneficiarioType_CMG = interface(IXMLNode)
    ['{020212B4-1465-4EBD-BD89-35FCDDDF21D7}']
    { Property Accessors }
    function Get_NombreBeneficiario: IXMLString_List;
    function Get_Entidad: WideString;
    function Get_DenoEntidad: WideString;
    function Get_Contra: WideString;
    function Get_Inte: WideString;
    function Get_Sexo: WideString;
    function Get_FechaNacimiento: IXMLString_List;
    function Get_TipoDocBeneficiario: WideString;
    function Get_NroDocBeneficiario: WideString;
    function Get_ApellidoBeneficiario: WideString;
    function Get_ActivoCondicional: WideString;
    function Get_AutoInterVigen: WideString;
    procedure Set_Entidad(Value: WideString);
    procedure Set_DenoEntidad(Value: WideString);
    procedure Set_Contra(Value: WideString);
    procedure Set_Inte(Value: WideString);
    procedure Set_Sexo(Value: WideString);
    procedure Set_TipoDocBeneficiario(Value: WideString);
    procedure Set_NroDocBeneficiario(Value: WideString);
    procedure Set_ApellidoBeneficiario(Value: WideString);
    procedure Set_ActivoCondicional(Value: WideString);
    procedure Set_AutoInterVigen(Value: WideString);
    { Methods & Properties }
    property NombreBeneficiario: IXMLString_List read Get_NombreBeneficiario;
    property Entidad: WideString read Get_Entidad write Set_Entidad;
    property DenoEntidad: WideString read Get_DenoEntidad write Set_DenoEntidad;
    property Contra: WideString read Get_Contra write Set_Contra;
    property Inte: WideString read Get_Inte write Set_Inte;
    property Sexo: WideString read Get_Sexo write Set_Sexo;
    property FechaNacimiento: IXMLString_List read Get_FechaNacimiento;
    property TipoDocBeneficiario: WideString read Get_TipoDocBeneficiario write
      Set_TipoDocBeneficiario;
    property NroDocBeneficiario: WideString read Get_NroDocBeneficiario write
      Set_NroDocBeneficiario;
    property ApellidoBeneficiario: WideString read Get_ApellidoBeneficiario write
      Set_ApellidoBeneficiario;
    property ActivoCondicional: WideString read Get_ActivoCondicional write
      Set_ActivoCondicional;
    property AutoInterVigen: WideString read Get_AutoInterVigen write
      Set_AutoInterVigen;
  end;

  { IXMLPrescriptorType_CMG }

  IXMLPrescriptorType_CMG = interface(IXMLNode)
    ['{A07CC9E5-9573-4374-91DF-D027749B430B}']
    { Property Accessors }
    function Get_ProvinciaPrescriptor: WideString;
    function Get_TipoPrescriptor: WideString;
    function Get_NroMatriculaPrescriptor: WideString;
    procedure Set_ProvinciaPrescriptor(Value: WideString);
    procedure Set_TipoPrescriptor(Value: WideString);
    procedure Set_NroMatriculaPrescriptor(Value: WideString);
    { Methods & Properties }
    property ProvinciaPrescriptor: WideString read Get_ProvinciaPrescriptor write
      Set_ProvinciaPrescriptor;
    property TipoPrescriptor: WideString read Get_TipoPrescriptor write
      Set_TipoPrescriptor;
    property NroMatriculaPrescriptor: WideString read Get_NroMatriculaPrescriptor
      write Set_NroMatriculaPrescriptor;
  end;

  { IXMLDocumentacionType_CMG }

  IXMLDocumentacionType_CMG = interface(IXMLNode)
    ['{38AE49AC-1577-46BA-9DB3-FA28716F7E3B}']
    { Property Accessors }
    function Get_NombreArchivo: WideString;
    procedure Set_NombreArchivo(Value: WideString);
    { Methods & Properties }
    property NombreArchivo: WideString read Get_NombreArchivo write
      Set_NombreArchivo;
  end;

  { IXMLAtencionType_CMG }

  IXMLAtencionType_CMG = interface(IXMLNode)
    ['{E7323E4B-71D5-4661-9004-B2654B7E808C}']
    { Property Accessors }
    function Get_FechaAtencion: Integer;
    procedure Set_FechaAtencion(Value: Integer);
    { Methods & Properties }
    property FechaAtencion: Integer read Get_FechaAtencion write
      Set_FechaAtencion;
  end;

  { IXMLDiagnosticoType_CMG }

  IXMLDiagnosticoType_CMG = interface(IXMLNode)
    ['{9E6E2572-5C4F-4A16-9E5F-101C12264700}']
    { Property Accessors }
    function Get_CodDiagnostico: WideString;
    function Get_DescripcionDiagnostico: WideString;
    procedure Set_CodDiagnostico(Value: WideString);
    procedure Set_DescripcionDiagnostico(Value: WideString);
    { Methods & Properties }
    property CodDiagnostico: WideString read Get_CodDiagnostico write
      Set_CodDiagnostico;
    property DescripcionDiagnostico: WideString read Get_DescripcionDiagnostico
      write Set_DescripcionDiagnostico;
  end;

  { IXMLDetalleProcedimientosType_CMG }

  IXMLDetalleProcedimientosType_CMG = interface(IXMLNode)
    ['{7A4C2FAA-236F-41E2-A54D-1C1FC70B0EAC}']
    { Property Accessors }
    function Get_NroItem: WideString;
    function Get_CodPrestacion: WideString;
    function Get_TipoPrestacion: WideString;
    function Get_Nomenclador: WideString;
    function Get_Copago: WideString;
    function Get_ArancelPrestacion: WideString;
    function Get_CantidadSolicitada: WideString;
    function Get_CantidadAprobada: WideString;
    function Get_DescripcionPrestacion: WideString;
    function Get_CodRta: WideString;
    function Get_MensajeRta: WideString;
    function Get_CodAutorizacion: WideString;
    function Get_IVA: WideString;
    procedure Set_NroItem(Value: WideString);
    procedure Set_CodPrestacion(Value: WideString);
    procedure Set_TipoPrestacion(Value: WideString);
    procedure Set_Nomenclador(Value: WideString);
    procedure Set_Copago(Value: WideString);
    procedure Set_ArancelPrestacion(Value: WideString);
    procedure Set_CantidadSolicitada(Value: WideString);
    procedure Set_CantidadAprobada(Value: WideString);
    procedure Set_DescripcionPrestacion(Value: WideString);
    procedure Set_CodRta(Value: WideString);
    procedure Set_MensajeRta(Value: WideString);
    procedure Set_CodAutorizacion(Value: WideString);
    procedure Set_IVA(Value: WideString);
    { Methods & Properties }
    property NroItem: WideString read Get_NroItem write Set_NroItem;
    property CodPrestacion: WideString read Get_CodPrestacion write
      Set_CodPrestacion;
    property TipoPrestacion: WideString read Get_TipoPrestacion write
      Set_TipoPrestacion;
    property Nomenclador: WideString read Get_Nomenclador write Set_Nomenclador;
    property Copago: WideString read Get_Copago write Set_Copago;
    property ArancelPrestacion: WideString read Get_ArancelPrestacion write
      Set_ArancelPrestacion;
    property CantidadSolicitada: WideString read Get_CantidadSolicitada write
      Set_CantidadSolicitada;
    property CantidadAprobada: WideString read Get_CantidadAprobada write
      Set_CantidadAprobada;
    property DescripcionPrestacion: WideString read Get_DescripcionPrestacion
      write Set_DescripcionPrestacion;
    property CodRta: WideString read Get_CodRta write Set_CodRta;
    property MensajeRta: WideString read Get_MensajeRta write Set_MensajeRta;
    property CodAutorizacion: WideString read Get_CodAutorizacion write
      Set_CodAutorizacion;
    property IVA: WideString read Get_IVA write Set_IVA;
  end;

  { IXMLString_List }

  IXMLString_List = interface(IXMLNodeCollection)
    ['{052FCE3E-97E9-4B7A-A2AC-431F68B93FEA}']
    { Methods & Properties }
    function Add(const Value: WideString): IXMLNode;
    function Insert(const Index: Integer; const Value: WideString): IXMLNode;
    function Get_Item(Index: Integer): WideString;
    property Items[Index: Integer]: WideString read Get_Item; default;
  end;

  { Forward Decls }

  TXMLMensajeType_CMG = class;
  TXMLEncabezadoMensajeType_CMG = class;
  TXMLRtaType_CMG = class;
  TXMLRtaAdicionalType_CMG = class;
  TXMLInicioTrxType_CMG = class;
  TXMLTerminalType_CMG = class;
  TXMLSoftwareType_CMG = class;
  TXMLValidadorType_CMG = class;
  TXMLFinanciadorType_CMG = class;
  TXMLPrestadorType_CMG = class;
  TXMLLugarAtencionType_CMG = class;
  TXMLEncabezadoAtencionType_CMG = class;
  TXMLCredencialType_CMG = class;
  TXMLPreautorizacionType_CMG = class;
  TXMLBeneficiarioType_CMG = class;
  TXMLPrescriptorType_CMG = class;
  TXMLDocumentacionType_CMG = class;
  TXMLAtencionType_CMG = class;
  TXMLDiagnosticoType_CMG = class;
  TXMLDetalleProcedimientosType_CMG = class;
  TXMLString_List = class;

  { TXMLMensajeType_CMG }

  TXMLMensajeType_CMG = class(TXMLNode, IXMLMensajeType_CMG)
  protected
    { IXMLMensajeType_CMG}
    function Get_EncabezadoMensaje: IXMLEncabezadoMensajeType_CMG;
    function Get_GeneradorRespuesta: WideString;
    function Get_NroReferencia: WideString;
    function Get_EncabezadoAtencion: IXMLEncabezadoAtencionType_CMG;
    function Get_DetalleProcedimientos: IXMLDetalleProcedimientosType_CMG;
    procedure Set_GeneradorRespuesta(Value: WideString);
    procedure Set_NroReferencia(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

  { TXMLEncabezadoMensajeType_CMG}

  TXMLEncabezadoMensajeType_CMG = class(TXMLNode, IXMLEncabezadoMensajeType_CMG)
  protected
    { IXMLEncabezadoMensajeType_CMG }
    function Get_VersionMsj: WideString;
    function Get_Rta: IXMLRtaType_CMG;
    function Get_RtaAdicional: IXMLRtaAdicionalType_CMG;
    function Get_NroReferencia: WideString;
    function Get_TipoMsj: WideString;
    function Get_TipoTransaccion: WideString;
    function Get_IdMsj: WideString;
    function Get_InicioTrx: IXMLInicioTrxType_CMG;
    function Get_Terminal: IXMLTerminalType_CMG;
    function Get_Software: IXMLSoftwareType_CMG;
    function Get_SetCaracteres: WideString;
    function Get_Validador: IXMLValidadorType_CMG;
    function Get_Financiador: IXMLFinanciadorType_CMG;
    function Get_Prestador: IXMLPrestadorType_CMG;
    procedure Set_VersionMsj(Value: WideString);
    procedure Set_NroReferencia(Value: WideString);
    procedure Set_TipoMsj(Value: WideString);
    procedure Set_TipoTransaccion(Value: WideString);
    procedure Set_IdMsj(Value: WideString);
    procedure Set_SetCaracteres(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

  { TXMLRtaType_CMG}

  TXMLRtaType_CMG = class(TXMLNode, IXMLRtaType_CMG)
  protected
    { IXMLRtaType_CMG }
    function Get_CodRtaGeneral: WideString;
    function Get_DescripcionRtaGeneral: WideString;
    function Get_MensajeDisplay: WideString;
    function Get_MensajePrinter: WideString;
    function Get_NroTransaccion: WideString;
    procedure Set_CodRtaGeneral(Value: WideString);
    procedure Set_DescripcionRtaGeneral(Value: WideString);
    procedure Set_MensajeDisplay(Value: WideString);
    procedure Set_MensajePrinter(Value: WideString);
    procedure Set_NroTransaccion(Value: WideString);
  end;

  { TXMLRtaAdicionalType_CMG }

  TXMLRtaAdicionalType_CMG = class(TXMLNode, IXMLRtaAdicionalType_CMG)
  protected
    { IXMLRtaAdicionalType_CMG }
    function Get_CodigoRtaAdicional: WideString;
    function Get_Mensaje: WideString;
    function Get_Coseguro: WideString;
    function Get_MontoFinanciador: WideString;
    procedure Set_CodigoRtaAdicional(Value: WideString);
    procedure Set_Mensaje(Value: WideString);
    procedure Set_Coseguro(Value: WideString);
    procedure Set_MontoFinanciador(Value: WideString);
  end;

  { TXMLInicioTrxType_CMG }

  TXMLInicioTrxType_CMG = class(TXMLNode, IXMLInicioTrxType_CMG)
  protected
    { IXMLInicioTrxType }
    function Get_FechaTrx: WideString;
    function Get_HoraTrx: WideString;
    procedure Set_FechaTrx(Value: WideString);
    procedure Set_HoraTrx(Value: WideString);
  end;

  { TXMLTerminalType_CMG }

  TXMLTerminalType_CMG = class(TXMLNode, IXMLTerminalType_CMG)
  protected
    { IXMLTerminalType_CMG }
    function Get_TipoTerminal: WideString;
    function Get_NumeroTerminal: WideString;
    procedure Set_TipoTerminal(Value: WideString);
    procedure Set_NumeroTerminal(Value: WideString);
  end;

  { TXMLSoftwareType_CMG }

  TXMLSoftwareType_CMG = class(TXMLNode, IXMLSoftwareType_CMG)
  protected
    { IXMLSoftwareType_CMG }
    function Get_NombreSoftware: WideString;
    procedure Set_NombreSoftware(Value: WideString);
  end;

  { TXMLValidadorType_CMG }

  TXMLValidadorType_CMG = class(TXMLNode, IXMLValidadorType_CMG)
  protected
    { IXMLValidadorType_CMG }
    function Get_NombreConcentrador: WideString;
    function Get_NombreValidador: WideString;
    procedure Set_NombreConcentrador(Value: WideString);
    procedure Set_NombreValidador(Value: WideString);
  end;

  { TXMLFinanciadorType_CMG }

  TXMLFinanciadorType_CMG = class(TXMLNode, IXMLFinanciadorType_CMG)
  protected
    { IXMLFinanciadorType_CMG }
    function Get_CodigoFinanciador: WideString;
    procedure Set_CodigoFinanciador(Value: WideString);
  end;

  { TXMLPrestadorType_CMG }

  TXMLPrestadorType_CMG = class(TXMLNode, IXMLPrestadorType_CMG)
  protected
    { IXMLPrestadorType_CMG }
    function Get_CuitPrestador: WideString;
    function Get_RazonSocial: WideString;
    function Get_LugarAtencion: IXMLLugarAtencionType_CMG;
    procedure Set_CuitPrestador(Value: WideString);
    procedure Set_RazonSocial(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

  { TXMLLugarAtencionType_CMG }

  TXMLLugarAtencionType_CMG = class(TXMLNode, IXMLLugarAtencionType_CMG)
  protected
    { IXMLLugarAtencionType_CMG }
    function Get_Codigo: WideString;
    procedure Set_Codigo(Value: WideString);
  end;

  { TXMLEncabezadoAtencionType_CMG }

  TXMLEncabezadoAtencionType_CMG = class(TXMLNode,
    IXMLEncabezadoAtencionType_CMG)
  protected
    { IXMLEncabezadoAtencionType_CMG }
    function Get_Efector: WideString;
    function Get_Credencial: IXMLCredencialType_CMG;
    function Get_Preautorizacion: IXMLPreautorizacionType_CMG;
    function Get_Beneficiario: IXMLBeneficiarioType_CMG;
    function Get_Prescriptor: IXMLPrescriptorType_CMG;
    function Get_Acompannante: WideString;
    function Get_Documentacion: IXMLDocumentacionType_CMG;
    function Get_Atencion: IXMLAtencionType_CMG;
    function Get_Diagnostico: IXMLDiagnosticoType_CMG;
    function Get_Rta: IXMLRtaType_CMG;
    function Get_RtaAdicional: IXMLRtaAdicionalType_CMG;
    procedure Set_Efector(Value: WideString);
    procedure Set_Acompannante(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

  { TXMLCredencialType_CMG }

  TXMLCredencialType_CMG = class(TXMLNode, IXMLCredencialType_CMG)
  protected
    { IXMLCredencialType_CMG }
    function Get_NumeroCredencial: WideString;
    function Get_VersionCredencial: WideString;
    function Get_ModoIngreso: WideString;
    function Get_CodigoSeguridad: WideString;
    function Get_PlanCredencial: WideString;
    function Get_CondicionIVA: WideString;
    procedure Set_NumeroCredencial(Value: WideString);
    procedure Set_VersionCredencial(Value: WideString);
    procedure Set_ModoIngreso(Value: WideString);
    procedure Set_CodigoSeguridad(Value: WideString);
    procedure Set_PlanCredencial(Value: WideString);
    procedure Set_CondicionIVA(Value: WideString);
  end;

  { TXMLPreautorizacionType_CMG }

  TXMLPreautorizacionType_CMG = class(TXMLNode, IXMLPreautorizacionType_CMG)
  protected
    { IXMLPreautorizacionType_CMG }
    function Get_CodigoPreautorizacion: WideString;
    function Get_Sucursal: WideString;
    procedure Set_CodigoPreautorizacion(Value: WideString);
    procedure Set_Sucursal(Value: WideString);
  end;

  { TXMLBeneficiarioType_CMG }

  TXMLBeneficiarioType_CMG = class(TXMLNode, IXMLBeneficiarioType_CMG)
  private
    FNombreBeneficiario: IXMLString_List;
    FFechaNacimiento: IXMLString_List;
  protected
    { IXMLBeneficiarioType_CMG }
    function Get_NombreBeneficiario: IXMLString_List;
    function Get_Entidad: WideString;
    function Get_DenoEntidad: WideString;
    function Get_Contra: WideString;
    function Get_Inte: WideString;
    function Get_Sexo: WideString;
    function Get_FechaNacimiento: IXMLString_List;
    function Get_TipoDocBeneficiario: WideString;
    function Get_NroDocBeneficiario: WideString;
    function Get_ApellidoBeneficiario: WideString;
    function Get_ActivoCondicional: WideString;
    function Get_AutoInterVigen: WideString;
    procedure Set_Entidad(Value: WideString);
    procedure Set_DenoEntidad(Value: WideString);
    procedure Set_Contra(Value: WideString);
    procedure Set_Inte(Value: WideString);
    procedure Set_Sexo(Value: WideString);
    procedure Set_TipoDocBeneficiario(Value: WideString);
    procedure Set_NroDocBeneficiario(Value: WideString);
    procedure Set_ApellidoBeneficiario(Value: WideString);
    procedure Set_ActivoCondicional(Value: WideString);
    procedure Set_AutoInterVigen(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

  { TXMLPrescriptorType_CMG }

  TXMLPrescriptorType_CMG = class(TXMLNode, IXMLPrescriptorType_CMG)
  protected
    { IXMLPrescriptorType_CMG }
    function Get_ProvinciaPrescriptor: WideString;
    function Get_TipoPrescriptor: WideString;
    function Get_NroMatriculaPrescriptor: WideString;
    procedure Set_ProvinciaPrescriptor(Value: WideString);
    procedure Set_TipoPrescriptor(Value: WideString);
    procedure Set_NroMatriculaPrescriptor(Value: WideString);
  end;

  { TXMLDocumentacionType_CMG }

  TXMLDocumentacionType_CMG = class(TXMLNode, IXMLDocumentacionType_CMG)
  protected
    { IXMLDocumentacionType_CMG }
    function Get_NombreArchivo: WideString;
    procedure Set_NombreArchivo(Value: WideString);
  end;

  { TXMLAtencionType_CMG }

  TXMLAtencionType_CMG = class(TXMLNode, IXMLAtencionType_CMG)
  protected
    { IXMLAtencionType_CMG }
    function Get_FechaAtencion: Integer;
    procedure Set_FechaAtencion(Value: Integer);
  end;

  { TXMLDiagnosticoType_CMG }

  TXMLDiagnosticoType_CMG = class(TXMLNode, IXMLDiagnosticoType_CMG)
  protected
    { IXMLDiagnosticoType_CMG }
    function Get_CodDiagnostico: WideString;
    function Get_DescripcionDiagnostico: WideString;
    procedure Set_CodDiagnostico(Value: WideString);
    procedure Set_DescripcionDiagnostico(Value: WideString);
  end;

  { TXMLDetalleProcedimientosType_CMG }

  TXMLDetalleProcedimientosType_CMG = class(TXMLNode,
    IXMLDetalleProcedimientosType_CMG)
  protected
    { IXMLDetalleProcedimientosType_CMG }
    function Get_NroItem: WideString;
    function Get_CodPrestacion: WideString;
    function Get_TipoPrestacion: WideString;
    function Get_Nomenclador: WideString;
    function Get_Copago: WideString;
    function Get_ArancelPrestacion: WideString;
    function Get_CantidadSolicitada: WideString;
    function Get_CantidadAprobada: WideString;
    function Get_DescripcionPrestacion: WideString;
    function Get_CodRta: WideString;
    function Get_MensajeRta: WideString;
    function Get_CodAutorizacion: WideString;
    function Get_IVA: WideString;
    procedure Set_NroItem(Value: WideString);
    procedure Set_CodPrestacion(Value: WideString);
    procedure Set_TipoPrestacion(Value: WideString);
    procedure Set_Nomenclador(Value: WideString);
    procedure Set_Copago(Value: WideString);
    procedure Set_ArancelPrestacion(Value: WideString);
    procedure Set_CantidadSolicitada(Value: WideString);
    procedure Set_CantidadAprobada(Value: WideString);
    procedure Set_DescripcionPrestacion(Value: WideString);
    procedure Set_CodRta(Value: WideString);
    procedure Set_MensajeRta(Value: WideString);
    procedure Set_CodAutorizacion(Value: WideString);
    procedure Set_IVA(Value: WideString);
  end;

  { TXMLString_List }

  TXMLString_List = class(TXMLNodeCollection, IXMLString_List)
  protected
    { IXMLString_List }
    function Add(const Value: WideString): IXMLNode;
    function Insert(const Index: Integer; const Value: WideString): IXMLNode;
    function Get_Item(Index: Integer): WideString;
  end;

  { Global Functions }

function GetMensaje_CMG(Doc: IXMLDocument): IXMLMensajeType_CMG;
function LoadMensaje_CMG(const FileName: WideString): IXMLMensajeType_CMG;
function NewMensaje_CMG: IXMLMensajeType_CMG;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetMensaje_CMG(Doc: IXMLDocument): IXMLMensajeType_CMG;
begin
  Result := Doc.GetDocBinding('Mensaje', TXMLMensajeType_CMG, TargetNamespace) as
    IXMLMensajeType_CMG;
end;

function LoadMensaje_CMG(const FileName: WideString): IXMLMensajeType_CMG;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Mensaje',
    TXMLMensajeType_CMG, TargetNamespace) as IXMLMensajeType_CMG;
end;

function NewMensaje_CMG: IXMLMensajeType_CMG;
begin
  Result := NewXMLDocument.GetDocBinding('Mensaje', TXMLMensajeType_CMG,
    TargetNamespace) as IXMLMensajeType_CMG;
end;

{ TXMLMensajeType_CMG }

procedure TXMLMensajeType_CMG.AfterConstruction;
begin
  RegisterChildNode('EncabezadoMensaje', TXMLEncabezadoMensajeType_CMG);
  RegisterChildNode('EncabezadoAtencion', TXMLEncabezadoAtencionType_CMG);
  RegisterChildNode('DetalleProcedimientos', TXMLDetalleProcedimientosType_CMG);
  inherited;
end;

function TXMLMensajeType_CMG.Get_EncabezadoMensaje:
  IXMLEncabezadoMensajeType_CMG;
begin
  Result := ChildNodes['EncabezadoMensaje'] as IXMLEncabezadoMensajeType_CMG;
end;

function TXMLMensajeType_CMG.Get_GeneradorRespuesta: WideString;
begin
  Result := ChildNodes['GeneradorRespuesta'].Text;
end;

procedure TXMLMensajeType_CMG.Set_GeneradorRespuesta(Value: WideString);
begin
  ChildNodes['GeneradorRespuesta'].NodeValue := Value;
end;

function TXMLMensajeType_CMG.Get_NroReferencia: WideString;
begin
  Result := ChildNodes['NroReferencia'].Text;
end;

procedure TXMLMensajeType_CMG.Set_NroReferencia(Value: WideString);
begin
  ChildNodes['NroReferencia'].NodeValue := Value;
end;

function TXMLMensajeType_CMG.Get_EncabezadoAtencion:
  IXMLEncabezadoAtencionType_CMG;
begin
  Result := ChildNodes['EncabezadoAtencion'] as IXMLEncabezadoAtencionType_CMG;
end;

function TXMLMensajeType_CMG.Get_DetalleProcedimientos:
  IXMLDetalleProcedimientosType_CMG;
begin
  Result := ChildNodes['DetalleProcedimientos'] as
    IXMLDetalleProcedimientosType_CMG;
end;

{ TXMLEncabezadoMensajeType_CMG }

procedure TXMLEncabezadoMensajeType_CMG.AfterConstruction;
begin
  RegisterChildNode('Rta', TXMLRtaType_CMG);
  RegisterChildNode('RtaAdicional', TXMLRtaAdicionalType_CMG);
  RegisterChildNode('InicioTrx', TXMLInicioTrxType_CMG);
  RegisterChildNode('Terminal', TXMLTerminalType_CMG);
  RegisterChildNode('Software', TXMLSoftwareType_CMG);
  RegisterChildNode('Validador', TXMLValidadorType_CMG);
  RegisterChildNode('Financiador', TXMLFinanciadorType_CMG);
  RegisterChildNode('Prestador', TXMLPrestadorType_CMG);
  inherited;
end;

function TXMLEncabezadoMensajeType_CMG.Get_VersionMsj: WideString;
begin
  Result := ChildNodes['VersionMsj'].Text;
end;

procedure TXMLEncabezadoMensajeType_CMG.Set_VersionMsj(Value: WideString);
begin
  ChildNodes['VersionMsj'].NodeValue := Value;
end;

function TXMLEncabezadoMensajeType_CMG.Get_Rta: IXMLRtaType_CMG;
begin
  Result := ChildNodes['Rta'] as IXMLRtaType_CMG;
end;

function TXMLEncabezadoMensajeType_CMG.Get_RtaAdicional:
  IXMLRtaAdicionalType_CMG;
begin
  Result := ChildNodes['RtaAdicional'] as IXMLRtaAdicionalType_CMG;
end;

function TXMLEncabezadoMensajeType_CMG.Get_NroReferencia: WideString;
begin
  Result := ChildNodes['NroReferencia'].Text;
end;

procedure TXMLEncabezadoMensajeType_CMG.Set_NroReferencia(Value: WideString);
begin
  ChildNodes['NroReferencia'].NodeValue := Value;
end;

function TXMLEncabezadoMensajeType_CMG.Get_TipoMsj: WideString;
begin
  Result := ChildNodes['TipoMsj'].Text;
end;

procedure TXMLEncabezadoMensajeType_CMG.Set_TipoMsj(Value: WideString);
begin
  ChildNodes['TipoMsj'].NodeValue := Value;
end;

function TXMLEncabezadoMensajeType_CMG.Get_TipoTransaccion: WideString;
begin
  Result := ChildNodes['TipoTransaccion'].Text;
end;

procedure TXMLEncabezadoMensajeType_CMG.Set_TipoTransaccion(Value: WideString);
begin
  ChildNodes['TipoTransaccion'].NodeValue := Value;
end;

function TXMLEncabezadoMensajeType_CMG.Get_IdMsj: WideString;
begin
  Result := ChildNodes['IdMsj'].Text;
end;

procedure TXMLEncabezadoMensajeType_CMG.Set_IdMsj(Value: WideString);
begin
  ChildNodes['IdMsj'].NodeValue := Value;
end;

function TXMLEncabezadoMensajeType_CMG.Get_InicioTrx: IXMLInicioTrxType_CMG;
begin
  Result := ChildNodes['InicioTrx'] as IXMLInicioTrxType_CMG;
end;

function TXMLEncabezadoMensajeType_CMG.Get_Terminal: IXMLTerminalType_CMG;
begin
  Result := ChildNodes['Terminal'] as IXMLTerminalType_CMG;
end;

function TXMLEncabezadoMensajeType_CMG.Get_Software: IXMLSoftwareType_CMG;
begin
  Result := ChildNodes['Software'] as IXMLSoftwareType_CMG;
end;

function TXMLEncabezadoMensajeType_CMG.Get_SetCaracteres: WideString;
begin
  Result := ChildNodes['SetCaracteres'].Text;
end;

procedure TXMLEncabezadoMensajeType_CMG.Set_SetCaracteres(Value: WideString);
begin
  ChildNodes['SetCaracteres'].NodeValue := Value;
end;

function TXMLEncabezadoMensajeType_CMG.Get_Validador: IXMLValidadorType_CMG;
begin
  Result := ChildNodes['Validador'] as IXMLValidadorType_CMG;
end;

function TXMLEncabezadoMensajeType_CMG.Get_Financiador: IXMLFinanciadorType_CMG;
begin
  Result := ChildNodes['Financiador'] as IXMLFinanciadorType_CMG;
end;

function TXMLEncabezadoMensajeType_CMG.Get_Prestador: IXMLPrestadorType_CMG;
begin
  Result := ChildNodes['Prestador'] as IXMLPrestadorType_CMG;
end;

{ TXMLRtaType_CMG }

function TXMLRtaType_CMG.Get_CodRtaGeneral: WideString;
begin
  Result := ChildNodes['CodRtaGeneral'].Text;
end;

procedure TXMLRtaType_CMG.Set_CodRtaGeneral(Value: WideString);
begin
  ChildNodes['CodRtaGeneral'].NodeValue := Value;
end;

function TXMLRtaType_CMG.Get_DescripcionRtaGeneral: WideString;
begin
  Result := ChildNodes['DescripcionRtaGeneral'].Text;
end;

procedure TXMLRtaType_CMG.Set_DescripcionRtaGeneral(Value: WideString);
begin
  ChildNodes['DescripcionRtaGeneral'].NodeValue := Value;
end;

function TXMLRtaType_CMG.Get_MensajeDisplay: WideString;
begin
  Result := ChildNodes['MensajeDisplay'].Text;
end;

procedure TXMLRtaType_CMG.Set_MensajeDisplay(Value: WideString);
begin
  ChildNodes['MensajeDisplay'].NodeValue := Value;
end;

function TXMLRtaType_CMG.Get_MensajePrinter: WideString;
begin
  Result := ChildNodes['MensajePrinter'].Text;
end;

procedure TXMLRtaType_CMG.Set_MensajePrinter(Value: WideString);
begin
  ChildNodes['MensajePrinter'].NodeValue := Value;
end;

function TXMLRtaType_CMG.Get_NroTransaccion: WideString;
begin
  Result := ChildNodes['NroTransaccion'].Text;
end;

procedure TXMLRtaType_CMG.Set_NroTransaccion(Value: WideString);
begin
  ChildNodes['NroTransaccion'].NodeValue := Value;
end;

{ TXMLRtaAdicionalType_CMG }

function TXMLRtaAdicionalType_CMG.Get_CodigoRtaAdicional: WideString;
begin
  Result := ChildNodes['CodigoRtaAdicional'].Text;
end;

procedure TXMLRtaAdicionalType_CMG.Set_CodigoRtaAdicional(Value: WideString);
begin
  ChildNodes['CodigoRtaAdicional'].NodeValue := Value;
end;

function TXMLRtaAdicionalType_CMG.Get_Mensaje: WideString;
begin
  Result := ChildNodes['Mensaje'].Text;
end;

procedure TXMLRtaAdicionalType_CMG.Set_Mensaje(Value: WideString);
begin
  ChildNodes['Mensaje'].NodeValue := Value;
end;

function TXMLRtaAdicionalType_CMG.Get_Coseguro: WideString;
begin
  Result := ChildNodes['Coseguro'].Text;
end;

procedure TXMLRtaAdicionalType_CMG.Set_Coseguro(Value: WideString);
begin
  ChildNodes['Coseguro'].NodeValue := Value;
end;

function TXMLRtaAdicionalType_CMG.Get_MontoFinanciador: WideString;
begin
  Result := ChildNodes['MontoFinanciador'].Text;
end;

procedure TXMLRtaAdicionalType_CMG.Set_MontoFinanciador(Value: WideString);
begin
  ChildNodes['MontoFinanciador'].NodeValue := Value;
end;

{ TXMLInicioTrxType_CMG }

function TXMLInicioTrxType_CMG.Get_FechaTrx: WideString;
begin
  Result := ChildNodes['FechaTrx'].Text;
end;

procedure TXMLInicioTrxType_CMG.Set_FechaTrx(Value: WideString);
begin
  ChildNodes['FechaTrx'].NodeValue := Value;
end;

function TXMLInicioTrxType_CMG.Get_HoraTrx: WideString;
begin
  Result := ChildNodes['HoraTrx'].Text;
end;

procedure TXMLInicioTrxType_CMG.Set_HoraTrx(Value: WideString);
begin
  ChildNodes['HoraTrx'].NodeValue := Value;
end;

{ TXMLTerminalType_CMG }

function TXMLTerminalType_CMG.Get_TipoTerminal: WideString;
begin
  Result := ChildNodes['TipoTerminal'].Text;
end;

procedure TXMLTerminalType_CMG.Set_TipoTerminal(Value: WideString);
begin
  ChildNodes['TipoTerminal'].NodeValue := Value;
end;

function TXMLTerminalType_CMG.Get_NumeroTerminal: WideString;
begin
  Result := ChildNodes['NumeroTerminal'].Text;
end;

procedure TXMLTerminalType_CMG.Set_NumeroTerminal(Value: WideString);
begin
  ChildNodes['NumeroTerminal'].NodeValue := Value;
end;

{ TXMLSoftwareType_CMG }

function TXMLSoftwareType_CMG.Get_NombreSoftware: WideString;
begin
  Result := ChildNodes['NombreSoftware'].Text;
end;

procedure TXMLSoftwareType_CMG.Set_NombreSoftware(Value: WideString);
begin
  ChildNodes['NombreSoftware'].NodeValue := Value;
end;

{ TXMLValidadorType_CMG }

function TXMLValidadorType_CMG.Get_NombreConcentrador: WideString;
begin
  Result := ChildNodes['NombreConcentrador'].Text;
end;

procedure TXMLValidadorType_CMG.Set_NombreConcentrador(Value: WideString);
begin
  ChildNodes['NombreConcentrador'].NodeValue := Value;
end;

function TXMLValidadorType_CMG.Get_NombreValidador: WideString;
begin
  Result := ChildNodes['NombreValidador'].Text;
end;

procedure TXMLValidadorType_CMG.Set_NombreValidador(Value: WideString);
begin
  ChildNodes['NombreValidador'].NodeValue := Value;
end;

{ TXMLFinanciadorType_CMG }

function TXMLFinanciadorType_CMG.Get_CodigoFinanciador: WideString;
begin
  Result := ChildNodes['CodigoFinanciador'].Text;
end;

procedure TXMLFinanciadorType_CMG.Set_CodigoFinanciador(Value: WideString);
begin
  ChildNodes['CodigoFinanciador'].NodeValue := Value;
end;

{ TXMLPrestadorType_CMG }

procedure TXMLPrestadorType_CMG.AfterConstruction;
begin
  RegisterChildNode('lugarAtencion', TXMLLugarAtencionType_CMG);
  inherited;
end;

function TXMLPrestadorType_CMG.Get_CuitPrestador: WideString;
begin
  Result := ChildNodes['CuitPrestador'].Text;
end;

procedure TXMLPrestadorType_CMG.Set_CuitPrestador(Value: WideString);
begin
  ChildNodes['CuitPrestador'].NodeValue := Value;
end;

function TXMLPrestadorType_CMG.Get_RazonSocial: WideString;
begin
  Result := ChildNodes['RazonSocial'].Text;
end;

procedure TXMLPrestadorType_CMG.Set_RazonSocial(Value: WideString);
begin
  ChildNodes['RazonSocial'].NodeValue := Value;
end;

function TXMLPrestadorType_CMG.Get_LugarAtencion: IXMLLugarAtencionType_CMG;
begin
  Result := ChildNodes['lugarAtencion'] as IXMLLugarAtencionType_CMG;
end;

{ TXMLLugarAtencionType_CMG }

function TXMLLugarAtencionType_CMG.Get_Codigo: WideString;
begin
  Result := ChildNodes['codigo'].Text;
end;

procedure TXMLLugarAtencionType_CMG.Set_Codigo(Value: WideString);
begin
  ChildNodes['codigo'].NodeValue := Value;
end;

{ TXMLEncabezadoAtencionType_CMG }

procedure TXMLEncabezadoAtencionType_CMG.AfterConstruction;
begin
  RegisterChildNode('Credencial', TXMLCredencialType_CMG);
  RegisterChildNode('Preautorizacion', TXMLPreautorizacionType_CMG);
  RegisterChildNode('Beneficiario', TXMLBeneficiarioType_CMG);
  RegisterChildNode('Prescriptor', TXMLPrescriptorType_CMG);
  RegisterChildNode('Documentacion', TXMLDocumentacionType_CMG);
  RegisterChildNode('Atencion', TXMLAtencionType_CMG);
  RegisterChildNode('Diagnostico', TXMLDiagnosticoType_CMG);
  RegisterChildNode('Rta', TXMLRtaType_CMG);
  RegisterChildNode('RtaAdicional', TXMLRtaAdicionalType_CMG);
  inherited;
end;

function TXMLEncabezadoAtencionType_CMG.Get_Efector: WideString;
begin
  Result := ChildNodes['Efector'].Text;
end;

procedure TXMLEncabezadoAtencionType_CMG.Set_Efector(Value: WideString);
begin
  ChildNodes['Efector'].NodeValue := Value;
end;

function TXMLEncabezadoAtencionType_CMG.Get_Credencial: IXMLCredencialType_CMG;
begin
  Result := ChildNodes['Credencial'] as IXMLCredencialType_CMG;
end;

function TXMLEncabezadoAtencionType_CMG.Get_Preautorizacion:
  IXMLPreautorizacionType_CMG;
begin
  Result := ChildNodes['Preautorizacion'] as IXMLPreautorizacionType_CMG;
end;

function TXMLEncabezadoAtencionType_CMG.Get_Beneficiario:
  IXMLBeneficiarioType_CMG;
begin
  Result := ChildNodes['Beneficiario'] as IXMLBeneficiarioType_CMG;
end;

function TXMLEncabezadoAtencionType_CMG.Get_Prescriptor:
  IXMLPrescriptorType_CMG;
begin
  Result := ChildNodes['Prescriptor'] as IXMLPrescriptorType_CMG;
end;

function TXMLEncabezadoAtencionType_CMG.Get_Acompannante: WideString;
begin
  Result := ChildNodes['Acompannante'].Text;
end;

procedure TXMLEncabezadoAtencionType_CMG.Set_Acompannante(Value: WideString);
begin
  ChildNodes['Acompannante'].NodeValue := Value;
end;

function TXMLEncabezadoAtencionType_CMG.Get_Documentacion:
  IXMLDocumentacionType_CMG;
begin
  Result := ChildNodes['Documentacion'] as IXMLDocumentacionType_CMG;
end;

function TXMLEncabezadoAtencionType_CMG.Get_Atencion: IXMLAtencionType_CMG;
begin
  Result := ChildNodes['Atencion'] as IXMLAtencionType_CMG;
end;

function TXMLEncabezadoAtencionType_CMG.Get_Diagnostico:
  IXMLDiagnosticoType_CMG;
begin
  Result := ChildNodes['Diagnostico'] as IXMLDiagnosticoType_CMG;
end;

function TXMLEncabezadoAtencionType_CMG.Get_Rta: IXMLRtaType_CMG;
begin
  Result := ChildNodes['Rta'] as IXMLRtaType_CMG;
end;

function TXMLEncabezadoAtencionType_CMG.Get_RtaAdicional:
  IXMLRtaAdicionalType_CMG;
begin
  Result := ChildNodes['RtaAdicional'] as IXMLRtaAdicionalType_CMG;
end;

{ TXMLCredencialType_CMG }

function TXMLCredencialType_CMG.Get_NumeroCredencial: WideString;
begin
  Result := ChildNodes['NumeroCredencial'].Text;
end;

procedure TXMLCredencialType_CMG.Set_NumeroCredencial(Value: WideString);
begin
  ChildNodes['NumeroCredencial'].NodeValue := Value;
end;

function TXMLCredencialType_CMG.Get_VersionCredencial: WideString;
begin
  Result := ChildNodes['VersionCredencial'].Text;
end;

procedure TXMLCredencialType_CMG.Set_VersionCredencial(Value: WideString);
begin
  ChildNodes['VersionCredencial'].NodeValue := Value;
end;

function TXMLCredencialType_CMG.Get_ModoIngreso: WideString;
begin
  Result := ChildNodes['ModoIngreso'].Text;
end;

procedure TXMLCredencialType_CMG.Set_ModoIngreso(Value: WideString);
begin
  ChildNodes['ModoIngreso'].NodeValue := Value;
end;

function TXMLCredencialType_CMG.Get_CodigoSeguridad: WideString;
begin
  Result := ChildNodes['CodigoSeguridad'].Text;
end;

procedure TXMLCredencialType_CMG.Set_CodigoSeguridad(Value: WideString);
begin
  ChildNodes['CodigoSeguridad'].NodeValue := Value;
end;

function TXMLCredencialType_CMG.Get_PlanCredencial: WideString;
begin
  Result := ChildNodes['PlanCredencial'].Text;
end;

procedure TXMLCredencialType_CMG.Set_PlanCredencial(Value: WideString);
begin
  ChildNodes['PlanCredencial'].NodeValue := Value;
end;

function TXMLCredencialType_CMG.Get_CondicionIVA: WideString;
begin
  Result := ChildNodes['CondicionIVA'].Text;
end;

procedure TXMLCredencialType_CMG.Set_CondicionIVA(Value: WideString);
begin
  ChildNodes['CondicionIVA'].NodeValue := Value;
end;

{ TXMLPreautorizacionType_CMG }

function TXMLPreautorizacionType_CMG.Get_CodigoPreautorizacion: WideString;
begin
  Result := ChildNodes['CodigoPreautorizacion'].Text;
end;

procedure TXMLPreautorizacionType_CMG.Set_CodigoPreautorizacion(Value:
  WideString);
begin
  ChildNodes['CodigoPreautorizacion'].NodeValue := Value;
end;

function TXMLPreautorizacionType_CMG.Get_Sucursal: WideString;
begin
  Result := ChildNodes['Sucursal'].Text;
end;

procedure TXMLPreautorizacionType_CMG.Set_Sucursal(Value: WideString);
begin
  ChildNodes['Sucursal'].NodeValue := Value;
end;

{ TXMLBeneficiarioType_CMG }

procedure TXMLBeneficiarioType_CMG.AfterConstruction;
begin
  FNombreBeneficiario := CreateCollection(TXMLString_List, IXMLNode,
    'NombreBeneficiario') as IXMLString_List;
  FFechaNacimiento := CreateCollection(TXMLString_List, IXMLNode,
    'FechaNacimiento') as IXMLString_List;
  inherited;
end;

function TXMLBeneficiarioType_CMG.Get_NombreBeneficiario: IXMLString_List;
begin
  Result := FNombreBeneficiario;
end;

function TXMLBeneficiarioType_CMG.Get_Entidad: WideString;
begin
  Result := ChildNodes['Entidad'].Text;
end;

procedure TXMLBeneficiarioType_CMG.Set_Entidad(Value: WideString);
begin
  ChildNodes['Entidad'].NodeValue := Value;
end;

function TXMLBeneficiarioType_CMG.Get_DenoEntidad: WideString;
begin
  Result := ChildNodes['DenoEntidad'].Text;
end;

procedure TXMLBeneficiarioType_CMG.Set_DenoEntidad(Value: WideString);
begin
  ChildNodes['DenoEntidad'].NodeValue := Value;
end;

function TXMLBeneficiarioType_CMG.Get_Contra: WideString;
begin
  Result := ChildNodes['Contra'].Text;
end;

procedure TXMLBeneficiarioType_CMG.Set_Contra(Value: WideString);
begin
  ChildNodes['Contra'].NodeValue := Value;
end;

function TXMLBeneficiarioType_CMG.Get_Inte: WideString;
begin
  Result := ChildNodes['Inte'].Text;
end;

procedure TXMLBeneficiarioType_CMG.Set_Inte(Value: WideString);
begin
  ChildNodes['Inte'].NodeValue := Value;
end;

function TXMLBeneficiarioType_CMG.Get_Sexo: WideString;
begin
  Result := ChildNodes['Sexo'].Text;
end;

procedure TXMLBeneficiarioType_CMG.Set_Sexo(Value: WideString);
begin
  ChildNodes['Sexo'].NodeValue := Value;
end;

function TXMLBeneficiarioType_CMG.Get_FechaNacimiento: IXMLString_List;
begin
  Result := FFechaNacimiento;
end;

function TXMLBeneficiarioType_CMG.Get_TipoDocBeneficiario: WideString;
begin
  Result := ChildNodes['TipoDocBeneficiario'].Text;
end;

procedure TXMLBeneficiarioType_CMG.Set_TipoDocBeneficiario(Value: WideString);
begin
  ChildNodes['TipoDocBeneficiario'].NodeValue := Value;
end;

function TXMLBeneficiarioType_CMG.Get_NroDocBeneficiario: WideString;
begin
  Result := ChildNodes['NroDocBeneficiario'].Text;
end;

procedure TXMLBeneficiarioType_CMG.Set_NroDocBeneficiario(Value: WideString);
begin
  ChildNodes['NroDocBeneficiario'].NodeValue := Value;
end;

function TXMLBeneficiarioType_CMG.Get_ApellidoBeneficiario: WideString;
begin
  Result := ChildNodes['ApellidoBeneficiario'].Text;
end;

procedure TXMLBeneficiarioType_CMG.Set_ApellidoBeneficiario(Value: WideString);
begin
  ChildNodes['ApellidoBeneficiario'].NodeValue := Value;
end;

function TXMLBeneficiarioType_CMG.Get_ActivoCondicional: WideString;
begin
  Result := ChildNodes['ActivoCondicional'].Text;
end;

procedure TXMLBeneficiarioType_CMG.Set_ActivoCondicional(Value: WideString);
begin
  ChildNodes['ActivoCondicional'].NodeValue := Value;
end;

function TXMLBeneficiarioType_CMG.Get_AutoInterVigen: WideString;
begin
  Result := ChildNodes['AutoInterVigen'].Text;
end;

procedure TXMLBeneficiarioType_CMG.Set_AutoInterVigen(Value: WideString);
begin
  ChildNodes['AutoInterVigen'].NodeValue := Value;
end;

{ TXMLPrescriptorType_CMG }

function TXMLPrescriptorType_CMG.Get_ProvinciaPrescriptor: WideString;
begin
  Result := ChildNodes['ProvinciaPrescriptor'].Text;
end;

procedure TXMLPrescriptorType_CMG.Set_ProvinciaPrescriptor(Value: WideString);
begin
  ChildNodes['ProvinciaPrescriptor'].NodeValue := Value;
end;

function TXMLPrescriptorType_CMG.Get_TipoPrescriptor: WideString;
begin
  Result := ChildNodes['TipoPrescriptor'].Text;
end;

procedure TXMLPrescriptorType_CMG.Set_TipoPrescriptor(Value: WideString);
begin
  ChildNodes['TipoPrescriptor'].NodeValue := Value;
end;

function TXMLPrescriptorType_CMG.Get_NroMatriculaPrescriptor: WideString;
begin
  Result := ChildNodes['NroMatriculaPrescriptor'].Text;
end;

procedure TXMLPrescriptorType_CMG.Set_NroMatriculaPrescriptor(Value:
  WideString);
begin
  ChildNodes['NroMatriculaPrescriptor'].NodeValue := Value;
end;

{ TXMLDocumentacionType_CMG }

function TXMLDocumentacionType_CMG.Get_NombreArchivo: WideString;
begin
  Result := ChildNodes['NombreArchivo'].Text;
end;

procedure TXMLDocumentacionType_CMG.Set_NombreArchivo(Value: WideString);
begin
  ChildNodes['NombreArchivo'].NodeValue := Value;
end;

{ TXMLAtencionType_CMG }

function TXMLAtencionType_CMG.Get_FechaAtencion: Integer;
begin
  Result := ChildNodes['FechaAtencion'].NodeValue;
end;

procedure TXMLAtencionType_CMG.Set_FechaAtencion(Value: Integer);
begin
  ChildNodes['FechaAtencion'].NodeValue := Value;
end;

{ TXMLDiagnosticoType_CMG }

function TXMLDiagnosticoType_CMG.Get_CodDiagnostico: WideString;
begin
  Result := ChildNodes['CodDiagnostico'].Text;
end;

procedure TXMLDiagnosticoType_CMG.Set_CodDiagnostico(Value: WideString);
begin
  ChildNodes['CodDiagnostico'].NodeValue := Value;
end;

function TXMLDiagnosticoType_CMG.Get_DescripcionDiagnostico: WideString;
begin
  Result := ChildNodes['DescripcionDiagnostico'].Text;
end;

procedure TXMLDiagnosticoType_CMG.Set_DescripcionDiagnostico(Value: WideString);
begin
  ChildNodes['DescripcionDiagnostico'].NodeValue := Value;
end;

{ TXMLDetalleProcedimientosType_CMG }

function TXMLDetalleProcedimientosType_CMG.Get_NroItem: WideString;
begin
  Result := ChildNodes['NroItem'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_NroItem(Value: WideString);
begin
  ChildNodes['NroItem'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_CodPrestacion: WideString;
begin
  Result := ChildNodes['CodPrestacion'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_CodPrestacion(Value:
  WideString);
begin
  ChildNodes['CodPrestacion'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_TipoPrestacion: WideString;
begin
  Result := ChildNodes['TipoPrestacion'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_TipoPrestacion(Value:
  WideString);
begin
  ChildNodes['TipoPrestacion'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_Nomenclador: WideString;
begin
  Result := ChildNodes['Nomenclador'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_Nomenclador(Value: WideString);
begin
  ChildNodes['Nomenclador'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_Copago: WideString;
begin
  Result := ChildNodes['Copago'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_Copago(Value: WideString);
begin
  ChildNodes['Copago'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_ArancelPrestacion: WideString;
begin
  Result := ChildNodes['ArancelPrestacion'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_ArancelPrestacion(Value:
  WideString);
begin
  ChildNodes['ArancelPrestacion'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_CantidadSolicitada: WideString;
begin
  Result := ChildNodes['CantidadSolicitada'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_CantidadSolicitada(Value:
  WideString);
begin
  ChildNodes['CantidadSolicitada'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_CantidadAprobada: WideString;
begin
  Result := ChildNodes['CantidadAprobada'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_CantidadAprobada(Value:
  WideString);
begin
  ChildNodes['CantidadAprobada'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_DescripcionPrestacion:
  WideString;
begin
  Result := ChildNodes['DescripcionPrestacion'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_DescripcionPrestacion(Value:
  WideString);
begin
  ChildNodes['DescripcionPrestacion'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_CodRta: WideString;
begin
  Result := ChildNodes['CodRta'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_CodRta(Value: WideString);
begin
  ChildNodes['CodRta'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_MensajeRta: WideString;
begin
  Result := ChildNodes['MensajeRta'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_MensajeRta(Value: WideString);
begin
  ChildNodes['MensajeRta'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_CodAutorizacion: WideString;
begin
  Result := ChildNodes['CodAutorizacion'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_CodAutorizacion(Value:
  WideString);
begin
  ChildNodes['CodAutorizacion'].NodeValue := Value;
end;

function TXMLDetalleProcedimientosType_CMG.Get_IVA: WideString;
begin
  Result := ChildNodes['IVA'].Text;
end;

procedure TXMLDetalleProcedimientosType_CMG.Set_IVA(Value: WideString);
begin
  ChildNodes['IVA'].NodeValue := Value;
end;

{ TXMLString_List }

function TXMLString_List.Add(const Value: WideString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLString_List.Insert(const Index: Integer; const Value: WideString):
  IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLString_List.Get_Item(Index: Integer): WideString;
begin
  Result := List[Index].NodeValue;
end;

end.
