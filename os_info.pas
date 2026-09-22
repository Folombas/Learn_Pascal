program os_info;

uses
  SysUtils;

begin
  writeln('FPC version:  ', {$I %FPCVERSION%});
  writeln('Target CPU:   ', {$I %FPCTARGETCPU%});
  writeln('Target OS:    ', {$I %FPCTARGETOS%});
  writeln('User:         ', GetEnvironmentVariable('USER'));
  writeln('Home:         ', GetEnvironmentVariable('HOME'));
  writeln('PWD:          ', GetCurrentDir);
  writeln;
  {$IFDEF LINUX}
    writeln('Это Linux — привет из Linux Mint!');
  {$ENDIF}
  {$IFDEF UNIX}
    writeln('Unix-семейство подтверждено.');
  {$ENDIF}
end.
