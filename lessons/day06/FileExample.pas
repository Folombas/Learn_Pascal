program FileExample;

var
	f: Text;
	filename: string;
	line: string;
	i: integer;
	
begin 
	filename := 'test.txt';
	
  // Запись в файл
  Assign(f, filename);
  Rewrite(f);
  Writeln(f, 'Привет, Free Pascal!');
  Writeln(f, 'Это строка 2');
  Writeln(f, 'Это строка 3');
  Close(f);
  
  Writeln('Файл создан и записан.');
  
  // Чтение из файла
  Assign(f, filename);
  Reset(f);
  Writeln('Содержимое файла:');
  Writeln('------------------');
  
  i := 0;
  while not Eof(f) do
  begin
    Readln(f, line);
    i := i + 1;
    Writeln(i, ': ', line);
  end;
  
  Close(f);
  Writeln('------------------');
  Writeln('Всего строк: ', i);
end.
