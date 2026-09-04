unit uLauncher;
{
  Esta unidad debería lanzar el programa TTSQL y actualizarlo en caso de una nueva version
  Para eso

  1) Ver si existe TTSQL.dat en folder central
  2) Ver si existe TimeTechSQL.exe en folder local
  4) Ver si existe sqldir.sni en folder central
  3) Ver si existe sqldir.sni en folder local
  5) Ver si existen las dlls necesarias en local (y en remoto)
  6) Ver si zkemkeeper esta registrada (y registrarla en caso de que no)
  7) Si alguno de los puntos anteriores requiere un cambio, ver si esta corriendo TTSQL o TTSQL auto y detenerlos
  8) Cuando se detengan copiar y/o registrar
  9) Lanzar TTSQL desde local


  Habria que cerrar y reiniciar cuando:
  1) TTSQL.DAT y TimeTechSQL.exe tienen versiones distintas
  2) que sqldir.sni sea distinto en central y en local


  // modificacion del launcher del TTSQL para wl WinLab


 }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JVJCLutils, JCLFileUtils, uLineFiles, RXCtrls, jpeg,
  abcexctl, ExtCtrls, ShellApi, UnitComp_LogToFile, ImagingComponents;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    memMensajes: TMemo;
    abcTiledImage1: TabcTiledImage;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    logTest: TLogToFile;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    function BioKeyOCXRegistrado: boolean;
    procedure Procesar;
    procedure MemoAdd(s: string; OverWrite: boolean = false);
    procedure SendCloseMessage;
    function VerificaFile(fPath, Mensaje: string): boolean;
    function GetSniCheck(sFileName: string): string;
    function FilesParecidos(fName: string): boolean;
    function SonDllsIguales: boolean;
    function OCXRegistrado: boolean;
    function CopiaDlls: boolean;
    function TestWriteLocal: boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses GetVersionInfo, udmCentral, zkemkeeper_TLB, uServerDef, ZKFPEngXControl_TLB;

var
  msgCloseTTech: cardinal;


{$R *.dfm}

procedure TForm1.SendCloseMessage;
var
  BSMRecipients: DWORD;
begin
  BSMRecipients := BSM_APPLICATIONS;
  BroadCastSystemMessage(BSF_POSTMESSAGE, @BSMRecipients, msgCloseTTech, 0, 0);
end;


function TForm1.VerificaFile(fPath: string; Mensaje: string): boolean;
begin
  result := false;
  MemoAdd(Mensaje);
  if FileExists(fPath) then begin
    MemoAdd(Mensaje+': ok',true);
    result := true;
  end;
end;

function TForm1.TestWriteLocal: boolean;
var
  sFileName, sLocal: string;
begin
  result := false;
  sLocal := dmCentral.LocalAppDataFolder;
  sFileName := sLocal+'TestWrite.txt';
  if FileExists(sFileName) then begin
    FileDelete(sFileName);              //borro inicialmente
  end;
  if not FileExists(sFileName) then begin
    logTest.LogFileName := sFileName;
    logTest.WriteToLogFile('12345678901234567890');
    if (FileGetSize(sFileName)>10) then begin   //prueba escribir
      FileDelete(sFileName);                 // y borrar
      if not FileExists(sFileName) then begin
        result := true;
      end;
    end;
  end;
end;


procedure TForm1.Procesar;
var
  sLocalPath: string;
  vRemoto, vLocal: string;
  HayRemoto, HayLocal, HaySniRemoto, HaySniLocal, SniIguales, dllIguales, CHMIguales: boolean;
  sCheckLocal, sCheckRemoto: string;
  sSniLocalName, sSniRemotoName: string;
  ocxRegistered: boolean;
  hMutex, hMutexAuto: THandle;
  sMutex, sMutexAuto: string;
  Handle: HWND;

begin
  sLocalPath := dmCentral.LocalAppDataFolder;
  if not TestWriteLocal then begin
    MessageDlg('No tiene atributos para escribir en el directorio APPATH ('+sLocalPath+'). Consulte a su administrador'
          ,mtWarning,[mbOk],0);
    Application.Terminate;
  end
  else begin
    if FileExists(AppPath+'sagelabwin.lck') then begin  // no dejo ejecutar si esta lockeado
      MessageDlg('Sistema bloqueado por tareas de mantenimiento. Consulte a su administrador'
            ,mtWarning,[mbOk],0);
      Application.Terminate;
    end
    else begin
      if (AppPath = sLocalPath) then begin //no dejo ejecutar directamente desde el path local
        MessageDlg('No se puede ejecutar desde estructura de directorios local. Consulte a su administrador'
              ,mtWarning,[mbOk],0);
        Application.Terminate;
      end
      else begin

        vRemoto := '';
        HayRemoto := VerificaFile(AppPath+'sagelabwin.dat','Verificando ejecutable remoto');
        if HayRemoto then begin
          vRemoto := GetBuildInfoAsString(AppPath+'sagelabwin.dat');

          // verifico los parametros SNI
          sSniLocalName := dmCentral.LocalAppDataFolder+'lab_sqldir.sni';
          sSniRemotoName := AppPath+'lab_sqldir.sni';
          HaySniRemoto := VerificaFile(sSniRemotoName,'Verificando parametros base de datos');
          if not HaySNIRemoto then begin
            if (frmServer.ShowModal <> mrOk) then begin
              MessageDlg('Es necesaria una definicion de base de datos. Consulte a su administrador'
                    ,mtWarning,[mbOk],0);
              Application.Terminate;
            end;
          end;

          HaySniLocal := VerificaFile(sSniLocalName,'Verificando parametros base de datos local');

          if ((FileGetSize(sSniRemotoName) > 4096) or (FileGetSize(sSniLocalName) > 4096)) then begin
            MessageDlg('Error en parametros de base de datos. Consulte a su administrador'
                  ,mtWarning,[mbOk],0);
            Application.Terminate;
          end;

          MemoAdd('Verificando credenciales acceso DB');
          sCheckLocal := GetSniCheck(sSniLocalName);
          sCheckRemoto := GetSniCheck(sSniRemotoName);
          sniIguales := (sCheckLocal = sCheckRemoto);
          if sniIguales then begin
            MemoAdd('Verificando credenciales acceso DB: ok',true);
          end;


          dllIguales := SonDllsIguales;
          ocxRegistered := OCXRegistrado;

          //verifico que haya ejecutable local
          HayLocal := VerificaFile(dmCentral.LocalAppDataFolder+'SageLabWin.exe','Verificando ejecutable local');
          if HayLocal then begin
            vLocal := GetBuildInfoAsString(dmCentral.LocalAppDataFolder+'SageLabWin.exe');
          end;

          CHMIguales := FilesParecidos('SageLabWin.chm');

          if not DirectoryExists(dmCentral.LocalAppDataFolder+'Archivos') then begin
            CreateDir(dmCentral.LocalAppDataFolder+'Archivos');
          end;

          if not DirectoryExists(dmCentral.LocalAppDataFolder+'Logs') then begin
            CreateDir(dmCentral.LocalAppDataFolder+'Logs');
          end;


          // ahora tengo todos los datos necesarios. Procedo
          if (not HayLocal) or (vremoto<>vLocal) or (not sniIguales) or (not dllIguales) or (not ocxRegistered) or (not CHMIguales) then begin
            MemoAdd('Cerrando instancias anteriores');
            SendCloseMessage;   //cierro los timetech que esten corriendo
            Sleep(3000);    //espero 3 segundos para que terminen los procesos activos
            sMutex := 'Global\SageLabWinUnaCopia';
            hMutex := CreateMutex(nil, False, pChar(sMutex));
            if (WaitForSingleObject (hMutex, 0) <> wait_TimeOut) then begin
              sMutexAuto := sMutex+'Auto';
              hMutexAuto := CreateMutex(nil, False, pChar(sMutexAuto));
              if (WaitForSingleObject (hMutexAuto, 0) <> wait_TimeOut) then begin
                // aca ya estamos en condiciones de procesar lo necesario
                MemoAdd('Cerrando instancias anteriores: ok',true);
                if ((not HayLocal) or (vremoto<>vLocal)) then begin
                  MemoAdd('Actualizando ejecutable');
                  FileCopy(AppPath+'sagelabwin.dat',dmCentral.LocalAppDataFolder+'SageLabWin.exe',true)
                end;

                if (not SniIguales) then begin
                  MemoAdd('Actualizando credenciales de acceso a DB');
                  FileCopy(AppPath+'lab_sqldir.sni',dmCentral.LocalAppDataFolder+'lab_sqldir.sni',true)
                end;

                if (not CHMIguales) then begin
                  MemoAdd('Actualizando ayuda contextual');
                  FileCopy(AppPath+'SageLabWin.chm',dmCentral.LocalAppDataFolder+'SageLabWin.chm',true);
                  MemoAdd('Actualizando ayuda contextual: ok',true);
                end;
{
                // verificar aca que dlls son las que hacen falta

                if (not dllIguales) then begin
                  MemoAdd('Actualizando librerias');
                  CopiaDlls;
                  UnRegisterOCX('zkemkeeper.dll');
                  RegisterOCX(dmCentral.LocalAppDataFolder+'zkemkeeper.dll');
                end
                else if (not ocxRegistered) then begin
                  RegisterOCX(dmCentral.LocalAppDataFolder+'zkemkeeper.dll');
                end;

                if not FilesParecidos('Biokey.ocx') then begin
                  if FileCopy(AppPath+'Biokey.ocx', dmCentral.LocalAppDataFolder+'Biokey.ocx', true) then begin
                    UnRegisterOCX('Biokey.ocx');
                    RegisterOCX(dmCentral.LocalAppDataFolder+'Biokey.ocx');
                  end;
                end;
}
                if hMutexAuto <> 0 then begin
                  CloseHandle(hMutexAuto);
                end;
              end
              else begin
                MessageDlg('No se puede detener el procesador de TimeTech. Cierrelo por favor y reintente'
                      ,mtWarning,[mbOk],0);
                Application.Terminate;
              end;
              if hMutex <> 0 then begin
                CloseHandle(hMutex);
              end;
            end
            else begin
              MessageDlg('No se puede detener la otra instancia de TimeTech. Cierrela por favor y reintente'
                    ,mtWarning,[mbOk],0);
              Application.Terminate;

            end;

            // ejecutar tt
            // esto es para ejecutar el tt

          end;
        end
        else begin
          MessageDlg('Instalacion erronea. Consulte a su administrador'
                ,mtWarning,[mbOk],0);
          Application.Terminate;
        end;
      end;
      if (DebugHook=0) then begin
        ShellExecute(Handle, 'open', pChar(dmCentral.LocalAppDataFolder+'TimeTechSQL.exe'), 'TTLauncher_', nil, SW_SHOWNORMAL)
      end;
    end;
  end;
end;

function TForm1.SonDllsIguales: boolean;
var
  lstDlls: tStringList;
  j: Integer;
begin
  result := true;
  lstDlls := tStringList.Create;
  try
    BuildFileList(AppPath+'*.dll',faAnyFile,lstDlls);
    for j := 0 to lstDlls.Count-1 do begin    // Iterate
      if (pos('ASPR',UpperCase(lstDlls.Strings[j]))<=0) then begin
        result := result and FilesParecidos(lstDlls.Strings[j]);
      end;
    end;    // for
  finally
    lstDlls.Free;
  end;
end;

function TForm1.CopiaDlls: boolean;
var
  lstDlls: tStringList;
  j: Integer;
  sName: string;
begin
  result := true;
  lstDlls := tStringList.Create;
  try
    BuildFileList(AppPath+'*.dll',faAnyFile,lstDlls);
    for j := 0 to lstDlls.Count-1 do begin    // Iterate
      sName := lstDlls.Strings[j];
      if (pos('ASPR',UpperCase(sName))<=0) then begin
        result := result and FileCopy(AppPath+sName, dmCentral.LocalAppDataFolder+sName, true);
      end;
    end;    // for
  finally
    lstDlls.Free;
  end;
end;


function TForm1.FilesParecidos(fName: string): boolean;   //compara solo fecha y tamaño
begin
  result := true;
  result := (FileDateTime(AppPath+fName) = FileDateTime(dmCentral.LocalAppDataFolder+fName));
  result := result and (FileGetSize(AppPath+fName) = FileGetSize(dmCentral.LocalAppDataFolder+fName));
end;

function TForm1.GetSniCheck(sFileName: string): string;
var
  LineFile: tLineFile;
begin
  result := '';
  LineFile := tLineFile.Create(sFileName);
  try
    LineFile.OpenForRead;
    result := LineFile.Read;
    LineFile.Close;
  finally
    LineFile.Free;
  end;
end;


procedure TForm1.MemoAdd(s: string; OverWrite: boolean = false);
begin
  if not OverWrite then begin
    memMensajes.Lines.Add(s);
  end
  else begin
    memMensajes.lines.strings[memMensajes.Lines.Count-1] := s;
  end;
  Refresh;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  msgCloseTTech := RegisterWindowMessage('TimeTechSQL_Close');
end;

function TForm1.OCXRegistrado: boolean;
var
  fController: TCZKEM;
begin
  result := false;
	try
	  fController := TCZKEM.Create(nil);
    result := true;
	  fController.Free;
  except
  	on e: exception do begin
		end;
  end;
end;

function TForm1.BioKeyOCXRegistrado: boolean;
var
  fController: TZKFPEngX;
begin
  result := false;
	try
	  fController := TZKFPEngX.Create(nil);
    result := true;
	  fController.Free;
  except
  	on e: exception do begin
		end;
  end;
end;


procedure TForm1.FormActivate(Sender: TObject);
begin
  Procesar;
  Close;
end;

end.
