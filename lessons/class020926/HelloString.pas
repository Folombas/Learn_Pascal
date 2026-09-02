program HelloString;
var
	hello: array [1..33] of char;
	i: integer;
begin
	hello := 'Hello, world of Free Pascal!';
	for i := 1 to 33 do
	begin
		if hello[i] = #0 then
			break;
		write(hello[i])
	end;
	writeln
end.
			
