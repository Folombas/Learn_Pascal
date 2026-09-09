program GtKey;
uses crt;

procedure GetKey(var code: integer);
var
  c: char;
begin
  c := ReadKey;
  if c = #0 then
  begin
    c := ReadKey;
    code := -ord(c)
  end
  else
    code := ord(c)
end;

function GetKeyName(code: integer): string;
begin
  case code of
    -59:  GetKeyName := 'F1';
    -60:  GetKeyName := 'F2';
    -61:  GetKeyName := 'F3';
    -62:  GetKeyName := 'F4';
    -63:  GetKeyName := 'F5';
    -64:  GetKeyName := 'F6';
    -65:  GetKeyName := 'F7';
    -66:  GetKeyName := 'F8';
    -67:  GetKeyName := 'F9';
    -68:  GetKeyName := 'F10';
    -87:  GetKeyName := 'F11';
    -88:  GetKeyName := 'F12';
    -71:  GetKeyName := 'Home';
    -72:  GetKeyName := 'Up';
    -73:  GetKeyName := 'PageUp';
    -75:  GetKeyName := 'Left';
    -77:  GetKeyName := 'Right';
    -79:  GetKeyName := 'End';
    -80:  GetKeyName := 'Down';
    -81:  GetKeyName := 'PageDown';
    -82:  GetKeyName := 'Insert';
    -83:  GetKeyName := 'Delete';
    else
      GetKeyName := '';
  end
end;

var
  i: integer;
begin
  repeat
    GetKey(i);
    if i < 0 then
      writeln(i:4, ' ', GetKeyName(i))
    else
      writeln(i:4, ' (', chr(i), ')')
  until i = ord(' ')
end.
