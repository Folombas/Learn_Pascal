program OrdChrInput;

var
	c: char;
	n: integer;
	
begin
	Writeln('Введи символ (например A):');
	ReadLn(c);
	
	n := ord(c);
	Writeln('ord(c) = ', n);
	
	Writeln('Введи число (код символа), чтобы получить chr(n):');
	ReadLn(n);
	
	c := chr(n);
	Writeln('chr(n) = ', c);
end.
	
