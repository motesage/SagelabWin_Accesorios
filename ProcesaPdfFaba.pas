unit ProcesaPdfFaba;

interface

uses
  Windows, Messages, JvJCLUtils, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
VAR
s: string;
S1,S2,S3,S4: string;
espacio2,espacio1: integer;
i,j: integer;
begin
  Memo2.Lines.Clear;
  Memo1.Lines.LoadFromFile('INOS1990.TXT');
  for i := 0 to Memo1.Lines.count-1 do begin
    espacio1 := 0;
    espacio2 := 0;
    s := trim(Memo1.Lines[i]);
    for j := length(s) downto 1 do begin
      if copy(s,j,1) = ' ' then begin
        if espacio2 = 0 then begin
          espacio2 := j;
        end
        else begin
          espacio1 := j;
          break;
        end;
      end;
    end;
    //156 17-CETOESTEROIDES FRACCIONADOS(11 OXI-11 7,50 18,50
    //                                        esp1^   2^
    s1 := extractword(1,s,[' ']);
    s2 := copy(s,length(S1)+1,espacio1-length(S1)-1);
    S3 := copy(s,espacio1+1,(espacio2-espacio1)-1);
    S4 := copy(s,espacio2+1,100);
    Memo2.Lines.add(S1+'|'+s2+'|'+ ansireplaceStr(S3,',','.') +'|'+ansireplaceStr(S4,',','.'));
  end;

end;



procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo2.Lines.SaveToFile('INOS1990.CSV');
end;

end.
