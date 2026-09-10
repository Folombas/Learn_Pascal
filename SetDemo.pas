program SetDemo;
{$mode objfpc}{$H+}
{ Демонстрация встроенного типа "множество" в Free Pascal.
  Показывает все операции, которые поддерживает язык на уровне синтаксиса. }

uses crt;

type
  { Множество может быть только из порядкового типа — обычно 0..255 }
  TDigit = 0..9;
  TDigitSet = set of TDigit;

  TLetter = 'a'..'z';
  TLetterSet = set of TLetter;

  TColor = (Red, Green, Blue, Yellow, Black, White);
  TColorSet = set of TColor;

var
  s1, s2, s3: TDigitSet;
  vowels, consonants: TLetterSet;
  warm, cool, dark: TColorSet;
  d: TDigit;
  ch: TLetter;
  col: TColor;

{ --- 1. Печать множества --- }
procedure PrintDigitSet(const name: string; s: TDigitSet);
var
  x: TDigit;
  first: boolean;
begin
  write(name, ' = {');
  first := true;
  for x := 0 to 9 do
    if x in s then
    begin
      if not first then write(', ');
      write(x);
      first := false
    end;
  writeln('}')
end;

{ --- 2. Печать множества букв --- }
procedure PrintLetterSet(const name: string; s: TLetterSet);
var
  c: TLetter;
  first: boolean;
begin
  write(name, ' = {');
  first := true;
  for c := 'a' to 'z' do
    if c in s then
    begin
      if not first then write(', ');
      write(c);
      first := false
    end;
  writeln('}')
end;

{ --- 3. Печать множества цветов --- }
procedure PrintColorSet(const name: string; s: TColorSet);
var
  c: TColor;
  first: boolean;
begin
  write(name, ' = {');
  first := true;
  for c := Red to White do
    if c in s then
    begin
      if not first then write(', ');
      write(c);
      first := false
    end;
  writeln('}')
end;

begin
  clrscr;
  writeln('=== ТИП "МНОЖЕСТВО" В FREE PASCAL ===');
  writeln('(аналогов в C, Java, Python, Go на уровне синтаксиса нет)');
  writeln;

  { --- 1. Инициализация через [] --- }
  writeln('1. Создание множества через []:');
  s1 := [1, 3, 5, 7, 9];
  s2 := [2, 3, 5, 7];
  s3 := [0..4];          { диапазон внутри множества }
  PrintDigitSet('  s1     ', s1);
  PrintDigitSet('  s2     ', s2);
  PrintDigitSet('  s3=0..4', s3);
  writeln;

  { --- 2. Операция in --- }
  writeln('2. Проверка принадлежности (in):');
  writeln('  7 in s1 = ', 7 in s1);
  writeln('  4 in s1 = ', 4 in s1);
  writeln('  2 in s2 = ', 2 in s2);
  writeln;

  { --- 3. Объединение (+) --- }
  writeln('3. Объединение (s1 + s2):');
  PrintDigitSet('  s1 + s2', s1 + s2);
  writeln;

  { --- 4. Пересечение (*) --- }
  writeln('4. Пересечение (s1 * s2):');
  PrintDigitSet('  s1 * s2', s1 * s2);
  writeln;

  { --- 5. Разность (-) --- }
  writeln('5. Разность (s1 - s2):');
  PrintDigitSet('  s1 - s2', s1 - s2);
  PrintDigitSet('  s2 - s1', s2 - s1);
  writeln;

  { --- 6. Симметрическая разность (> <) --- }
  writeln('6. Симметрическая разность (s1 >< s2):');
  PrintDigitSet('  s1 >< s2', s1 >< s2);
  writeln;

  { --- 7. Сравнение на равенство и вложенность --- }
  writeln('7. Сравнение множеств:');
  writeln('  s1 = s2       : ', s1 = s2);
  writeln('  [3,5] <= s1   : ', [3, 5] <= s1);
  writeln('  s1 <= s1      : ', s1 <= s1);
  writeln('  [0..9] >= s1  : ', [0..9] >= s1);
  writeln;

  { --- 8. Проверка на пустоту --- }
  writeln('8. Проверка на пустоту:');
  writeln('  [] = []       : ', [] = []);
  writeln('  [] <= s1      : ', [] <= s1);
  writeln;

  { --- 9. Include и Exclude — добавление и удаление --- }
  writeln('9. Include / Exclude (изменение множества):');
  s3 := [1, 2, 3];
  PrintDigitSet('  до Include ', s3);
  Include(s3, 9);
  PrintDigitSet('  после +9   ', s3);
  Exclude(s3, 1);
  PrintDigitSet('  после -1   ', s3);
  writeln;

  { --- 10. Множества букв --- }
  writeln('10. Множество букв (set of ''a''..''z''):');
  vowels := ['a', 'e', 'i', 'o', 'u'];
  consonants := ['a'..'z'] - vowels;
  PrintLetterSet('  гласные    ', vowels);
  PrintLetterSet('  согласные  ', consonants);
  writeln;

  { --- 11. Подсчёт гласных в строке --- }
  writeln('11. Подсчёт гласных в строке через множество:');
  writeln('  Строка: "hello, free pascal!"');
  writeln('  Гласных: ', 
    ord('h' in vowels) + ord('e' in vowels) + ord('l' in vowels) + 
    ord('l' in vowels) + ord('o' in vowels) + ord('f' in vowels) + 
    ord('r' in vowels) + ord('e' in vowels) + ord('e' in vowels) + 
    ord('p' in vowels) + ord('a' in vowels) + ord('s' in vowels) + 
    ord('c' in vowels) + ord('a' in vowels) + ord('l' in vowels));
  writeln;

  { --- 12. Множество перечислений --- }
  writeln('12. Множество перечислений (set of TColor):');
  warm := [Red, Yellow, White];
  cool := [Green, Blue];
  dark := [Black];
  PrintColorSet('  тёплые ', warm);
  PrintColorSet('  холодные', cool);
  PrintColorSet('  тёмные ', dark);
  PrintColorSet('  тёплые + холодные', warm + cool);
  writeln;

  { --- 13. Размер множества --- }
  writeln('13. Размер множества в байтах:');
  writeln('  sizeof(TDigitSet)  = ', sizeof(TDigitSet), 
          ' байт (10 бит упакованы)');
  writeln('  sizeof(TLetterSet) = ', sizeof(TLetterSet), 
          ' байт (26 бит упакованы)');
  writeln('  sizeof(TColorSet)  = ', sizeof(TColorSet), 
          ' байт (6 бит упакованы)');
  writeln;

  writeln('=== Почему это уникально ===');
  writeln('- В C: только ручные битовые маски (1 << n), нет операций');
  writeln('- В Java: java.util.BitSet — тяжёлый объект, не синтаксис');
  writeln('- В Python: set() — хеш-таблица, тяжелее в разы');
  writeln('- В Go: только map[byte]bool — нет операций +,*,<=,in');
  writeln;
  writeln('=== Нажмите Enter ===');
  readln
end.
