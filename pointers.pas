program pointers;

{
  Демонстрация ссылочных типов и ручного управления памятью в Паскале.

  Ключевые понятия:
    ^T        — типизированный указатель на тип T
    nil       — «нулевой» указатель, никуда не указывает
    new(p)    — выделить память под переменную типа T, p указывает на неё
    dispose(p)— освободить память, на которую указывает p
    p^        — разыменование: доступ к значению по указателю

  На этой базе строятся все динамические структуры:
  списки, стеки, очереди, деревья, графы.
}

type
  { --- Узел односвязного списка --- }
  PNode = ^TNode;
  TNode = record
	Value: integer;
	Next: PNode;
end;

  { --- Список как отдельный тип --- }
  
TList = record
	Head: PNode;
	Count: integer;
end;

{ ============================================================
  Инициализация списка
  ============================================================ }
procedure InitList(var L: TList);
begin
  L.Head  := nil;    { пустой список — Head = nil }
  L.Count := 0;
end;

{ ============================================================
  Добавить элемент в начало списка
  ============================================================ }
procedure Push(var L: TList; x: integer);
var
  p: PNode;
begin
  New(p);            { выделяем память под новый узел }
  p^.Value := x;
  p^.Next  := L.Head;
  L.Head   := p;
  Inc(L.Count);
end;


{ ============================================================
  Печать списка
  ============================================================ }
procedure PrintList(const L: TList);
var
  p: PNode;
begin
  write('Список (', L.Count, ' элем.): ');
  p := L.Head;
  while p <> nil do    { идём, пока не дошли до конца }
  begin
    write(p^.Value);
    if p^.Next <> nil then write(' -> ');
    p := p^.Next;
  end;
  writeln;
end;

{ ============================================================
  Найти элемент по значению
  ============================================================ }
function Find(const L: TList; x: integer): PNode;
var
  p: PNode;
begin
  p := L.Head;
  while p <> nil do
  begin
    if p^.Value = x then
    begin
      Find := p;    { вернули указатель на найденный узел }
      Exit;
    end;
    p := p^.Next;
  end;
  Find := nil;      { не нашли — вернули nil }
end;

{ ============================================================
  Удалить первый элемент списка
  ============================================================ }
procedure Pop(var L: TList);
var
  p: PNode;
begin
  if L.Head = nil then
  begin
    writeln('Список пуст — нечего удалять');
    Exit;
  end;
  p := L.Head;         { запомнили первый узел }
  L.Head := p^.Next;   { переставили Head на следующий }
  Dispose(p);          { освободили память первого узла }
  Dec(L.Count);
end;

{ ============================================================
  Полное освобождение списка
  ============================================================ }
procedure FreeList(var L: TList);
var
  p, q: PNode;
begin
  p := L.Head;
  while p <> nil do
  begin
    q := p^.Next;      { запомнили следующий, пока не потеряли }
    Dispose(p);        { освободили текущий }
    p := q;
  end;
  L.Head  := nil;
  L.Count := 0;
end;

{ ============================================================
  Основная программа
  ============================================================ }
var
  L: TList;
  found: PNode;

begin
  writeln('=== 1. Инициализация и добавление ===');
  InitList(L);
  Push(L, 10);
  Push(L, 20);
  Push(L, 30);
  Push(L, 40);
  PrintList(L);     { 40 -> 30 -> 20 -> 10 }
  writeln;

  writeln('=== 2. Поиск элемента ===');
  found := Find(L, 30);
  if found <> nil then
    writeln('Нашли 30, значение по указателю: ', found^.Value)
  else
    writeln('30 не найдено');

  found := Find(L, 99);
  if found = nil then
    writeln('99 не найдено — Find вернул nil');
  writeln;

  writeln('=== 3. Удаление первого элемента (Pop) ===');
  Pop(L);
  PrintList(L);     { 30 -> 20 -> 10 }
  Pop(L);
  PrintList(L);     { 20 -> 10 }
  writeln;

  writeln('=== 4. Разыменование и изменение по указателю ===');
  found := Find(L, 20);
  if found <> nil then
  begin
    writeln('До изменения: ', found^.Value);
    found^.Value := 999;
    writeln('После изменения: ', found^.Value);
  end;
  PrintList(L);
  writeln;

  writeln('=== 5. Освобождение памяти ===');
  FreeList(L);
  PrintList(L);     { пусто }
  if L.Head = nil then
    writeln('Head = nil, память освобождена');

  writeln;
  writeln('Программа завершилась.');
end.























