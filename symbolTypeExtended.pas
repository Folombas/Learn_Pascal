program SymbolTypeExtended;
var
    s: string;
    i: integer;
begin
    writeln('Введите строку для анализа:');
    readln(s);
    for i := 1 to length(s) do
    begin
        c := s[i];
        code := ord(c);
        write('Символ ''', c, ''' (код ', code, ') - ');
        case c of
            'A'..'Z': writeln('заглавная латинская буква');
            'a'..'z': writeln('строчная латинская буква');
            '0'..'9': writeln('цифра');
        else
            writeln('неопознанный символ');
        end;
    end;
    writeln('Программа завершена.');
end.
