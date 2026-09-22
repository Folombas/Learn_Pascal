program files

{
  Демонстрация файловых типов в Паскале.

  В Паскале файл — это встроенный тип:
    text        — текстовый файл (строки, чтение/запись)
    file of T   — типизированный файл: последовательность
                  значений одного типа T (integer, record, ...)

  Файлы стали частью системы типов — это было очень прогрессивно
  для 1970-х: компилятор знает структуру файла и проверяет
  корректность операций с ним.
}

type
  { --- Запись для типизированного файла --- }
  TStudent = record
    Name:  string[20];
    Score: integer;
  end;
  
 { --- Типизированный файл студентов --- }
  TStudentFile = file of TStudent;

var
  { --- Текстовый файл --- }
  txt: text;
  line: string;
  n, i: integer;

  { --- Типизированный файл --- }
  f: TStudentFile;
  s: TStudent;

begin
  { ============================================================
    ЧАСТЬ 1. Текстовый файл (text)
    ============================================================ }

  writeln('=== 1. Запись в текстовый файл ===');

  { AssignFile — связать файловую переменную с именем файла на диске }
  AssignFile(txt, 'demo.txt');

  { Rewrite — открыть файл на запись (создаёт или перезаписывает) }
  Rewrite(txt);

  writeln(txt, 'Первая строка');
  writeln(txt, 'Вторая строка');
  writeln(txt, 'Третья строка');
  writeln(txt, 'Число: ', 42);

  { CloseFile — обязательно закрыть файл, иначе данные могут не сохраниться }
  CloseFile(txt);
  writeln('Файл demo.txt создан.');


  writeln;
  writeln('=== 2. Чтение из текстового файла ===');

  { Reset — открыть существующий файл на чтение }
  AssignFile(txt, 'demo.txt');
  Reset(txt);

  n := 0;
  while not Eof(txt) do       { Eof — «end of file» }
  begin
    ReadLn(txt, line);        { читаем строку целиком }
    Inc(n);
    writeln(n, ': ', line);
  end;
  CloseFile(txt);

  writeln('Прочитано строк: ', n);


  { ============================================================
    ЧАСТЬ 2. Типизированный файл (file of T)
    ============================================================ }

  writeln;
  writeln('=== 3. Запись в типизированный файл ===');

  AssignFile(f, 'students.dat');
  Rewrite(f);

  s.Name := 'Анна';    s.Score := 95;   Write(f, s);
  s.Name := 'Борис';   s.Score := 82;   Write(f, s);
  s.Name := 'Вера';    s.Score := 67;   Write(f, s);
  s.Name := 'Алексей';    s.Score := 45;   Write(f, s);

  CloseFile(f);
  writeln('Файл students.dat создан (4 записи).');


  writeln;
  writeln('=== 4. Чтение из типизированного файла ===');

  AssignFile(f, 'students.dat');
  Reset(f);

  i := 0;
  while not Eof(f) do
  begin
    Read(f, s);              { читаем одну запись целиком }
    Inc(i);
    writeln(i, '. ', s.Name:10, '  балл: ', s.Score);
  end;
  CloseFile(f);


  { ============================================================
    ЧАСТЬ 3. Произвольный доступ (Seek)
    ============================================================ }

  writeln;
  writeln('=== 5. Произвольный доступ через Seek ===');

  AssignFile(f, 'students.dat');
  Reset(f);

  { Перейти к 3-й записи (индексация с нуля) }
  Seek(f, 2);
  Read(f, s);
  writeln('Запись №3: ', s.Name, ', балл ', s.Score);

  { Сколько всего записей? }
  writeln('Всего записей в файле: ', FileSize(f));

  CloseFile(f);

  writeln;
  writeln('Программа завершилась.');
end.
