unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Menus;

type
  TForm1 = class(TForm)
    DrawGrid1: TDrawGrid;
    Image1: TImage;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    Image2: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DrawGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N21Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

const
  left = 37;  a = 65;
  right = 39;  d = 68;
  up = 38;    w = 87;
  down = 40;   s = 83;
  h = 50;

var
  Form1: TForm1;
  map: array [0..11, 0..11] of integer;
  mapBox: array[0..11, 0..11] of integer;
  mapPlace: array[0..11, 0..11] of integer;
  kol, x, y, level: integer;

implementation

{$R *.dfm}

procedure drawWall (x, y, width, height, image: integer);
var i, j: integer;
begin
  for j := y to y + height - 1 do begin
    for i := x to x + width - 1 do begin
      map[i, j] := image;
    end;
  end;

end;

procedure TForm1.DrawGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: Integer;
  j: Integer;
  n: integer;
begin
//Движение героя вправо
  if (Key=right) or (Key=d) then begin
    if (map[x+1, y]=0) then begin
      if (mapBox[x+1, y]=3) then begin
        if (map[x+2, y]<>1)and(mapBox[x+2, y]<>3) then begin
          map[x, y]:=0;
          mapBox[x+1, y]:=0;
          mapBox[x+2, y]:=3;
          x:=x+1;
        end;
      end
      else begin
        map[x,y]:=0;
        x:=x+1;
      end;
    end;
  end;
  //Движение героя влево
  if (Key=left) or (Key=a) then begin
    if (map[x-1, y]=0) then begin
      if (mapBox[x-1, y]=3) then begin
        if (map[x-2, y]<>1)and(mapBox[x-2, y]<>3) then begin
          map[x, y]:=0;
          mapBox[x-1, y]:=0;
          mapBox[x-2, y]:=3;
          x:=x-1;
        end;
      end
      else begin
        map[x,y]:=0;
        x:=x-1;
      end;
    end;
  end;
  //Движение героя вверх
  if (Key=up) or (Key=w) then begin
    if (map[x, y-1]=0) then begin
      if (mapBox[x, y-1]=3) then begin
        if (map[x, y-2]<>1)and(mapBox[x, y-2]<>3) then begin
          map[x, y]:=0;
          mapBox[x, y-1]:=0;
          mapBox[x, y-2]:=3;
          y:=y-1;
        end;
      end
      else begin
        map[x,y]:=0;
        y:=y-1;
      end;
    end;
  end;
 //Движение героя вниз
  if (Key=down) or (Key=s) then begin
    if (map[x, y+1]=0) then begin
      if (mapBox[x, y+1]=3) then begin
        if (map[x, y+2]<>1)and(mapBox[x, y+2]<>3) then begin
          map[x, y]:=0;
          mapBox[x, y+1]:=0;
          mapBox[x, y+2]:=3;
          y:=y+1;
        end;
      end
      else begin
        map[x,y]:=0;
        y:=y+1;
      end;
    end;
  end;
  //Проверка победы
  n:=0;
  for i := 0 to 11 do
    for j := 0 to 11 do begin
      if (mapPlace[i,j]=4)and(mapBox[i,j]=3) then n:=n+1;
      if n=kol then begin
        n:=0;
        showmessage('Вы выиграли!');
        case level of
          1: N21Click(Sender);
          2: N31Click(Sender);
          3: N41Click(Sender);
          4: N51Click(Sender);
          5: N61Click(Sender);
          //6:
        end;
      end;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i, j: integer;
begin
  drawGrid1.Visible:=False;
  for i := 0 to 11 do
    for j := 0 to 11 do begin
      map[i, j]:=0;
      mapBox[i, j]:=0;
    end;
  Form1.ClientHeight:=400;
  Form1.ClientWidth:=400;
  Image1.Visible:=false;
  Image2.Visible:=True;
  Image2.Top:=0;
  Image2.Left:=0;
  Image2.Picture.LoadFromFile('Заставка.bmp');
  Image2.Width:= 400;
  Image2.Height:= 400;
end;

//Level 1
procedure TForm1.N11Click(Sender: TObject);
var i, j: integer;
begin
  level:=1;
  Image2.Visible:=False;
  DrawGrid1.Visible:=true;
  DrawGrid1.SetFocus;
  Form1.ClientHeight:= 410;
  Form1.ClientWidth:= 360;
  DrawGrid1.Height:=520;
  DrawGrid1.Width:=520;
  DrawGrid1.RowCount:=8;
  DrawGrid1.ColCount:=7;
  DrawGrid1.DefaultColWidth:=h;
  DrawGrid1.DefaultRowHeight:=h;
  for i := 0 to 11 do
    for j := 0 to 11 do begin
      map[i, j]:=0;
      mapBox[i, j]:=0;
      mapPlace[i, j]:=0;
    end;
  //Отрисовка стен
  drawWall(0, 0, 6, 1, 1);
  drawWall(0, 0, 1, 6, 1);
  drawWall(5, 0, 1, 5, 1);
  drawWall(6, 4, 1, 4, 1);
  drawWall(0, 6, 3, 1, 1);
  drawWall(2, 7, 4, 1, 1);
  drawWall(3, 2, 1, 1, 1);
  drawWall(2, 4, 1, 1, 1);
  //Инициализация ящиков
  kol:=4;
  mapBox[4, 2]:=3;
  mapBox[2, 2]:=3;
  mapBox[2, 3]:=3;
  mapBox[2, 5]:=3;
  //Инициализация мест
  mapPlace[3, 6]:=4;
  mapPlace[4, 6]:=4;
  mapPlace[3, 5]:=4;
  mapPlace[4, 5]:=4;
  //Hero
  x:= 1;
  y:= 2;
end;

//Level 2
procedure TForm1.N21Click(Sender: TObject);
var i, j: integer;
begin
  level:=2;
  Image2.Visible:=False;
  DrawGrid1.Visible:=true;
  DrawGrid1.SetFocus;
  Form1.ClientHeight:= 360;//420;
  Form1.ClientWidth:= 510;//370;
  DrawGrid1.Height:=520;
  DrawGrid1.Width:=520;
  DrawGrid1.RowCount:=7;
  DrawGrid1.ColCount:=10;
  DrawGrid1.DefaultColWidth:=h;
  DrawGrid1.DefaultRowHeight:=h;
  for i := 0 to 11 do
    for j := 0 to 11 do begin
      map[i, j]:=0;
      mapBox[i,j]:=0;
      mapPlace[i, j]:=0;
    end;
  //Отрисовка стен
  drawWall(1, 1, 8, 5, 0);
  drawWall(1, 0, 7, 1, 1);
  drawWall(0, 1, 1, 6, 1);
  drawWall(1, 1, 1, 2, 1);
  drawWall(7, 1, 3, 1, 1);
  drawWall(9, 2, 1, 4, 1);
  drawWall(0, 6, 9, 1, 1);
  drawWall(3, 2, 3, 1, 1);
  drawWall(4, 4, 1, 2, 1);
  drawWall(8, 4, 1, 2, 1);
  drawWall(1, 5, 1, 1, 1);
  //Инициализация ящиков
  kol:=4;
  mapBox[2, 2]:=3;
  mapBox[5, 3]:=3;
  mapBox[6, 4]:=3;
  mapBox[7, 3]:=3;
  //Инициализация мест
  mapPlace[3, 5]:=4;
  mapPlace[2, 5]:=4;
  mapPlace[3, 4]:=4;
  mapPlace[2, 4]:=4;
  //Hero
  x:=1;
  y:=3;
end;

//Level 3
procedure TForm1.N31Click(Sender: TObject);
var i, j: integer;
begin
  level:=3;
  Image2.Visible:=False;
  DrawGrid1.Visible:=true;
  DrawGrid1.SetFocus;
  Form1.ClientHeight:= 410;
  Form1.ClientWidth:= 510;
  DrawGrid1.Height:=420;
  DrawGrid1.Width:=520;
  DrawGrid1.RowCount:=8;//5;
  DrawGrid1.ColCount:=10;//7;
  DrawGrid1.DefaultColWidth:=h;
  DrawGrid1.DefaultRowHeight:=h;
  for i := 0 to 11 do
    for j := 0 to 11 do begin
      map[i, j]:=0;
      mapBox[i, j]:=0;
      mapPlace[i, j]:=0;
    end;
  //Отрисовка стен
  drawWall(1, 5, 8, 2, 0);
  drawWall(7, 1, 2, 6, 0);
  drawWall(6, 0, 4, 1, 1);
  drawWall(4, 1, 3, 1, 1);
  drawWall(4, 1, 1, 4, 1);
  drawWall(0, 4, 1, 4, 1);
  drawWall(0, 7, 10, 1, 1);
  drawWall(0, 4, 4, 1, 1);
  drawWall(6, 2, 1, 3, 1);
  drawWall(9, 1, 1, 7, 1);
  //Инициализация ящиков
  kol:=5;
  mapBox[7, 3]:=3;
  mapBox[2, 5]:=3;
  mapBox[4, 5]:=3;
  mapBox[7, 5]:=3;
  mapBox[4, 6]:=3;
  //Инициализация мест
  mapPlace[5, 2]:=4;
  mapPlace[5, 3]:=4;
  mapPlace[5, 4]:=4;
  mapPlace[5, 5]:=4;
  mapPlace[5, 6]:=4;
  //Hero
  x:=1;
  y:=6;
end;

//Level 4
procedure TForm1.N41Click(Sender: TObject);
var i, j: integer;
begin
  level:=4;
  Image2.Visible:=False;
  DrawGrid1.Visible:=true;
  DrawGrid1.SetFocus;
  Form1.ClientHeight:= 410;
  Form1.ClientWidth:= 410;
  DrawGrid1.Height:=420;
  DrawGrid1.Width:=420;
  DrawGrid1.RowCount:=8;
  DrawGrid1.ColCount:=8;
  DrawGrid1.DefaultColWidth:=h;
  DrawGrid1.DefaultRowHeight:=h;
  for i := 0 to 11 do
    for j := 0 to 11 do begin
      map[i, j]:=0;
      mapBox[i, j]:=0;
      mapPlace[i, j]:=0;
    end;
  //Отрисовка стен
  drawWall(0, 0, 1, 8, 1);
  drawWall(0, 0, 4, 1, 1);
  drawWall(3, 0, 1, 3, 1);
  drawWall(3, 1, 5, 1, 1);
  drawWall(7, 1, 1, 4, 1);
  drawWall(5, 4, 3, 1, 1);
  drawWall(5, 4, 1, 4, 1);
  drawWall(0, 7, 6, 1, 1);
  map[3, 4]:=1;
  map[3, 6]:=1;
  //Инициализация ящиков
  kol:=4;
  mapBox[2, 2]:=3;
  mapBox[2, 5]:=3;
  mapBox[3, 3]:=3;
  mapBox[5, 3]:=3;
  //Инициализация мест
  for i := 3 to 6 do mapPlace[4, i]:=4;
  //Hero
  x:=1;
  y:=1;
end;

//Level 5
procedure TForm1.N51Click(Sender: TObject);
var i, j: integer;
begin
  level:=5;
  Image2.Visible:=False;
  DrawGrid1.Visible:=true;
  DrawGrid1.SetFocus;
  Form1.ClientHeight:= 410;
  Form1.ClientWidth:= 460;
  DrawGrid1.Height:=420;
  DrawGrid1.Width:=470;
  DrawGrid1.RowCount:=8;
  DrawGrid1.ColCount:=9;
  DrawGrid1.DefaultColWidth:=h;
  DrawGrid1.DefaultRowHeight:=h;
  for i := 0 to 11 do
    for j := 0 to 11 do begin
      map[i, j]:=0;
      mapBox[i, j]:=0;
      mapPlace[i, j]:=0;
    end;
  //Отрисовка стен
  drawWall(0, 0, 1, 7, 1);
  drawWall(0, 0, 9, 1, 1);
  drawWall(4, 1, 2, 1, 1);
  drawWall(4, 4, 2, 1, 1);
  drawWall(0, 6, 6, 1, 1);
  drawWall(8, 0, 1, 8, 1);
  drawWall(5, 7, 4, 1, 1);
  //Инициализация ящиков
  kol:=6;
  mapBox[3, 2]:=3;
  mapBox[3, 4]:=3;
  mapBox[3, 5]:=3;
  mapBox[6, 2]:=3;
  mapBox[6, 3]:=3;
  mapBox[4, 3]:=3;
  //Инициализация мест
  for i := 4 to 6 do
    for j := 6 to 7 do mapPlace[j, i]:=4;
  //Hero
  x:=1;
  y:=1;
end;

//Level 6
procedure TForm1.N61Click(Sender: TObject);
var i, j: integer;
begin
  level:=6;
  Image2.Visible:=False;
  DrawGrid1.Visible:=true;
  DrawGrid1.SetFocus;
  Form1.ClientHeight:= 410;
  Form1.ClientWidth:= 510;
  DrawGrid1.Height:=420;
  DrawGrid1.Width:=520;
  DrawGrid1.RowCount:=8;
  DrawGrid1.ColCount:=10;
  DrawGrid1.DefaultColWidth:=h;
  DrawGrid1.DefaultRowHeight:=h;
  for i := 0 to 11 do
    for j := 0 to 11 do begin
      map[i, j]:=0;
      mapBox[i, j]:=0;
      mapPlace[i, j]:=0;
    end;
  //Отрисовка стен
  drawWall(0, 0, 1, 8, 1);
  drawWall(0, 0, 10, 1, 1);
  drawWall(9, 0, 1, 8, 1);
  drawWall(0, 7, 10, 1, 1);
  drawWall(1, 4, 3, 1, 1);
  drawWall(4, 1, 2, 2, 1);
  map[8, 4]:=1;
  //Инициализация ящиков
  kol:=8;
  mapBox[2, 2]:=3;
  mapBox[2, 3]:=3;
  mapBox[4, 3]:=3;
  mapBox[5, 5]:=3;
  mapBox[5, 6]:=3;
  mapBox[6, 2]:=3;
  mapBox[6, 4]:=3;
  mapBox[6, 5]:=3;
  //Инициализация мест
  for i := 1 to 4 do
    for j := 5 to 6 do mapPlace[i, j]:=4;
  //Hero
  x:= 2;
  y:= 1;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Area: TRect;
  i, j: integer;
begin
  map[x, y]:=2;
  for i:=0 to 11 do   //Прорисовка
    for j:=0 to 11 do begin
      if Map[i,j]=0 then begin
        Area := Form1.DrawGrid1.CellRect(i, j);
        Form1.Image1.Picture.LoadFromFile('Fon.bmp');
        Form1.DrawGrid1.Canvas.StretchDraw(Area, Form1.Image1.Picture.Bitmap);
      end;
      if mapPlace[i,j]=4 then begin
        Area := Form1.DrawGrid1.CellRect(i, j);
        Form1.Image1.Picture.LoadFromFile('Place.bmp');
        Form1.DrawGrid1.Canvas.StretchDraw(Area, Form1.Image1.Picture.Bitmap);
      end;
      if Map[i,j]=1 then begin
        Area := Form1.DrawGrid1.CellRect(i, j);
        Form1.Image1.Picture.LoadFromFile('Wall.bmp');
        Form1.DrawGrid1.Canvas.StretchDraw(Area, Form1.Image1.Picture.Bitmap);
      end;
      if Map[i,j]=2 then begin
        Area := Form1.DrawGrid1.CellRect(i, j);
        Form1.Image1.Picture.LoadFromFile('Hero.bmp');
        Form1.DrawGrid1.Canvas.StretchDraw(Area, Form1.Image1.Picture.Bitmap);
      end;
      if MapBox[i,j]=3 then begin
        Area := Form1.DrawGrid1.CellRect(i, j);
        Form1.Image1.Picture.LoadFromFile('Box.bmp');
        Form1.DrawGrid1.Canvas.StretchDraw(Area, Form1.Image1.Picture.Bitmap);
      end;
    end;
end;

end.
