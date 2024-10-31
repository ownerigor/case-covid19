program server_case_covid19;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Controllers.COVID in 'src\controllers\Controllers.COVID.pas',
  Providers.Filter.Intf in 'src\providers\Providers.Filter.Intf.pas',
  Providers.Filter.Impl in 'src\providers\Providers.Filter.Impl.pas';

begin
  Controllers.COVID.Registry;

  THorse.Listen(9000,
    procedure
    begin
      Writeln('Server is runing on port 9000...');
      Readln;
    end);

end.
