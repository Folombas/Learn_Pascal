program FileLengthDemo;
uses crt;

const
  FileName = 'demo_str.dat';
  TestString = 'Hello, Free Pascal!';   { длина = 18 }

var
  fb: file of byte;
  fs: file of string;
  s: string;
  b: byte;
  i, fileSizeBytes, lenViaOrd, lenViaFileSize: integer;

begin
  clrscr;

  { 1. Записываем строку в типизированный файл }
  Assign(fs, FileName);
  Rewrite(fs);
  write(fs, TestString);
  Close(fs);

  writeln('Записали строку: "', TestString, '"');
  writeln('Длина по length(): ', length(TestString));
  writeln;

  { 2. Открываем тот же файл как поток байт }
  Assign(fb, FileName);
  Reset(fb);
  fileSizeBytes := FileSize(fb);

  writeln('--- Содержимое файла побайтово ---');
  for i := 0 to fileSizeBytes - 1 do
  begin
    BlockRead(fb, b, 1);
    if i = 0 then
      writeln('Байт [0] (счётчик длины): ', b, '  (ord = ', ord(b), ')')
    else
      write(chr(b));
  end;
  writeln;
  writeln;

  { 3. Способ 1: длина через ord() }
  Reset(fb);
  BlockRead(fb, b, 1);
  lenViaOrd := ord(b);
  writeln('Способ 1. Длина через ord(): ', lenViaOrd);

  { 4. Способ 2: длина через размер файла минус 1 }
  lenViaFileSize := fileSizeBytes - 1;
  writeln('Способ 2. Размер файла в байтах: ', fileSizeBytes);
  writeln('           Минус 1 байт счётчика = ', lenViaFileSize);

  Close(fb);

  writeln;
  if (lenViaOrd = length(TestString)) and (lenViaFileSize = length(TestString)) then
    writeln('OK! Оба способа дали правильную длину строки.')
  else
    writeln('Что-то не так...');

  { Удаляем демо-файл }
  Erase(fb);
end.
