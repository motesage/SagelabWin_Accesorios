unit Prueba1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JCLStrings, JvJCLUtils,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function IsOnlyNumeric(const s: string): boolean;
begin
  result := JCLStrings.StrIsSubSet(s,['0','1','2','3','4','5','6','7','8','9']);
end;

procedure TForm1.Button1Click(Sender: TObject);

var
  sResult: string;
  Largo: integer;
  i: integer;
  Car: string;
  Estado: string;
  Cod, Sali:string;
begin
  Largo := 10;
  // si vienen letras, ordeno a izquierda, completo con blancos a la derecha ac____
  // si vbienen numero, ordeno a derecha, completo con ceros  000001
  Cod := trim(Edit1.text);
  Sali := '';
  Estado := ''; // inicial
  Sresult := '';
  if length(Cod) > 0   then begin
    for i:= 1 to length(Cod)  do begin
      // 1.2
      Car := copy(Cod,i,1);
      if isOnlyNumeric(Car) then begin
        if (Estado = '') or (Estado = 'N') then begin
          Sali := Sali + Car;
        end
        else begin
          // viene de estado LETRA, guardo las letras
          Sresult := Sresult + Sali + stringOfChar(' ',(Largo - length(Sali)));
          Sali := Car;
        end;
        Estado := 'N';
      end
      else begin
        if (Estado = '') or (Estado = 'A') then begin
          Sali := Sali + Car;
        end
        else begin
          // Viene de estado NUMERO, guardo los numeros
          Sresult := Sresult + stringOfChar('0',(Largo - length(Sali))) + Sali;
          Sali := Car;
        end;
        Estado := 'A';
      end;
    end;
    // ajuste final
    if (Estado = 'N') then begin
      Sresult := Sresult + stringOfChar('0',(Largo - length(Sali))) + Sali;
    end
    else begin
      Sresult := Sresult + Sali + stringOfChar(' ',(Largo - length(Sali)));
    end;
  end;

  Memo1.Lines.ADD(sResult);

end;


end.
