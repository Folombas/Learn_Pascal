program BlocksDemo;

var
	a, b: integer;
	
begin
	writeln('=== Демонстрация блоков begin...end и точки с запятой ===');
	writeln;
	
	a := 10;
	b := 20;
	
	writeln('a = ', a);
	writeln('b = ', b);
	
	// Блок begin...end внутри if
	if a<b then
		begin
			writeln('a меньше b');
			writeln('Этот текст внутри блока begin...end');
			writeln('Обратите внимание: ; перед end не нужна');
		end
	else
		begin
			writeln('а не меньше b');
			writeln('Здесь тоже блок begin...end');
		end;
		
	writel;
	writeln('=== Одна строка с несколькими операторами ===');
	a := 100; b := 200; writeln('a = ', a); writeln('b = ', b);

	writeln;
	writeln('=== Последний оператор перед end без ; ===');
	writeln('Эта строка — последняя в блоке, ; перед end не нужна')
end.
