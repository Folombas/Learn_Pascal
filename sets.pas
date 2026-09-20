program sets;

{
  Демонстрация множеств (set of) в Паскале.

  Множество — это встроенный тип, хранящий набор значений
  порядкового типа без повторений. С ним работают операторы:
    in  — проверка принадлежности
    +   — объединение
    *   — пересечение
    -   — разность
    =   <>  <=  >=  — сравнение множеств

  Множества в Паскале обычно строятся на базе типов
  с небольшим диапазоном: char, byte, перечисления,
  поддиапазоны 0..255 и т.п.
}

type
  TDigit  = set of '0'..'9';
  TLetter = set of 'A'..'Z';
  TVowel  = set of 'A'..'Z';

var
  digits: TDigit;
  letters: TLetter;
  vowels: TVowel;
  consonants: TLetter;
  ch: char;
  c: char;
  i: integer;

begin
  { --- 1. Построение множества --- }
  digits := ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  letters := ['A'..'Z'];
  vowels := ['A', 'E', 'I', 'O', 'U'];

  writeln('Множества построены.');
  writeln;

  { --- 2. Оператор in: проверка принадлежности --- }
  writeln('Проверка символов:');
  for i := 1 to 5 do
  begin
    case i of
      1: ch := '7';
      2: ch := 'Q';
      3: ch := 'a';   { строчная — не входит в TLetter }
      4: ch := '!';
      5: ch := 'E';
    end;

    write('  ', ch, ' -> ');
    if ch in digits then
      writeln('цифра')
    else if ch in vowels then
      writeln('гласная буква')
    else if ch in letters then
      writeln('согласная буква')
    else
      writeln('другой символ');
  end;
  writeln;

  { --- 3. Объединение (+) --- }
  { все символы, которые являются цифрой ИЛИ заглавной буквой }
  writeln('Цифры + заглавные буквы:');
  for c := '0' to '9' do
    if c in digits then write(c, ' ');
  for c := 'A' to 'E' do
    if c in letters then write(c, ' ');
  writeln('...');
  writeln;

  { --- 4. Пересечение (*) --- }
  { согласные = все буквы минус гласные }
  consonants := letters - vowels;

  writeln('Согласные (letters - vowels):');
  for c := 'A' to 'Z' do
    if c in consonants then
      write(c, ' ');
  writeln;
  writeln;

  { --- 5. Разность (-) --- }
  { убираем из гласных букву 'A' }
  vowels := vowels - ['A'];
  writeln('Гласные после удаления A:');
  for c := 'A' to 'Z' do
    if c in vowels then write(c, ' ');
  writeln;
  writeln;

  { --- 6. Проверка на пустоту и сравнение --- }
  if [] = (letters * digits) then
    writeln('Пересечение букв и цифр пусто (ожидаемо)');

  if vowels <= letters then
    writeln('Все гласные входят в множество букв');
  writeln;

  { --- 7. Практический пример: фильтр ввода --- }
  write('Введите строку (программа посчитает гласные и цифры): ');
  { для демонстрации без ввода закомментируем readln и покажем
    статический пример: }

  writeln;
  writeln('Пример: "Hello 2025" -> ',
          'гласных (E, O) = 2, цифр (2, 0, 2, 5) = 4');

  { Если хотите проверить вживую — раскомментируйте:
    vowels := ['A','E','I','O','U'];
    readln(s);
    ...
  }

  writeln;
  writeln('Программа завершилась.');
end.
