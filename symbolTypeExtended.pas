program SymbolTypeExtended;
var
	c: char;
	code: integer;
begin
	writeln('Вводите символы (для завершения введите точку):');
	repeat
		read(c);
		code := ord(c);
		write('Символ ''', c, ''' (код ', code, ') - ');
		case c of
			'A'..'Z': writeln('заглавная латинская буква');
			'a'..'z': writeln('строчная латинская буква');
			'А'..'Я': writeln('заглавная русская буква');
			'a'..'я': writeln('строчная русская буква');
			'0'..'9': writeln('цифра');
		else
			writeln('неопознанный символ');
		end;
	until c = '.';
	writeln('Программа завершена.');
end.
