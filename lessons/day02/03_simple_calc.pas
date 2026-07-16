program SimpleCalculator;

var
  a, b: Real;
  operation: Integer;
  result: Real;

begin
  writeln('=== Простой калькулятор ===');
  writeln;
  writeln('Выберите операцию:');
  writeln('  1 - Сложение');
  writeln('  2 - Вычитание');
  writeln('  3 - Умножение');
  writeln('  4 - Деление');
  writeln;

  write('Введите номер операции (1-4): ');
  ReadLn(operation);

  if (operation < 1) or (operation > 4) then
  begin
    writeln;
    writeln('Ошибка: неверный номер операции!');
  end
  else
  begin
    write('Введите первое число: ');
    ReadLn(a);

    write('Введите второе число: ');
    ReadLn(b);

    case operation of
      1: result := a + b;
      2: result := a - b;
      3: result := a * b;
      4:
      begin
        if b = 0 then
        begin
          writeln;
          writeln('Ошибка: деление на ноль!');
          result := 0;
        end
        else
          result := a / b;
      end;
    end;

    if (operation <> 4) or (b <> 0) then
    begin
      writeln;
      case operation of
        1: writeln(a:0:2, ' + ', b:0:2, ' = ', result:0:2);
        2: writeln(a:0:2, ' - ', b:0:2, ' = ', result:0:2);
        3: writeln(a:0:2, ' * ', b:0:2, ' = ', result:0:2);
        4: writeln(a:0:2, ' / ', b:0:2, ' = ', result:0:2);
      end;
    end;
  end;
end.
