program CharStats;

{$mode delphi}

{ Подсчёт символов в строке: гласные, согласные, цифры, пробелы, остальные.
  Каждая проверка основана на ord — сравниваем код символа
  с кодами границ диапазонов.
  Не используем "or" — в Free Pascal по умолчанию это побитовая операция. }

var
  text: String;
  i: Integer;
  c: Char;
  code: Integer;
  vowels, consonants, digits, spaces, other: Integer;
  isVowel: Boolean;

begin
  writeln('=== Анализ символов в строке ===');
  writeln;

  text := 'Free Pascal 2026: learn to code!';
  writeln('Строка: "', text, '"');
  writeln;

  vowels := 0;
  consonants := 0;
  digits := 0;
  spaces := 0;
  other := 0;

  for i := 1 to Length(text) do
  begin
    c := text[i];
    code := ord(c);

    isVowel := False;

    { Проверяем: это буква? }
    if (code >= ord('A')) and (code <= ord('Z')) then
    begin
      { Заглавная буква — проверяем гласная ли }
      if c = 'A' then isVowel := True;
      if c = 'E' then isVowel := True;
      if c = 'I' then isVowel := True;
      if c = 'O' then isVowel := True;
      if c = 'U' then isVowel := True;

      if isVowel then
        vowels := vowels + 1
      else
        consonants := consonants + 1;
    end
    else if (code >= ord('a')) and (code <= ord('z')) then
    begin
      { Строчная буква — проверяем гласная ли }
      if c = 'a' then isVowel := True;
      if c = 'e' then isVowel := True;
      if c = 'i' then isVowel := True;
      if c = 'o' then isVowel := True;
      if c = 'u' then isVowel := True;

      if isVowel then
        vowels := vowels + 1
      else
        consonants := consonants + 1;
    end
    else if (code >= ord('0')) and (code <= ord('9')) then
      digits := digits + 1
    else if code = ord(' ') then
      spaces := spaces + 1
    else
      other := other + 1;
  end;

  writeln('--- Результаты ---');
  writeln('Гласные:      ', vowels);
  writeln('Согласные:    ', consonants);
  writeln('Цифры:        ', digits);
  writeln('Пробелы:      ', spaces);
  writeln('Остальные:    ', other);
  writeln('Всего:        ', vowels + consonants + digits + spaces + other);
  writeln;

  { Бонус: покажем коды всех символов строки }
  writeln('--- Коды символов ---');
  for i := 1 to Length(text) do
  begin
    c := text[i];
    write(ord(c), ' ');
  end;
  writeln;
end.
