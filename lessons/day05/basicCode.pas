program basicCode;

var
	c: char;
	n: integer;
	s: string;

begin
	// Символ -> код
	Write('Введите символ: ');
	Readln(s);
	if s = '' then
	begin
		Writeln('Символ не введён.');
		Halt;
	end;

	c := s[1];
	n := Ord(c);
	Writeln('Код символа ', c, ' = ', n);
	
	Writeln;
	
	// Код -> символ
	Write('Введите код символа: ');
	Readln(c);
	
	// chr работает для диапазона символов; для обычного ASII обычно достаточно 0...255
	c := Chr(n);
	Writeln('Символ с кодом ', n, ' = ', c);
end.
