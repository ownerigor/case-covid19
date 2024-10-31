program case_covid19;

uses
  Vcl.Forms,
  Views.Main in 'src\views\Views.Main.pas' {FrmMain},
  Views.CasosPaises in 'src\views\Views.CasosPaises.pas' {FrmCasosPaises},
  Services.CasosPaises in 'src\services\Services.CasosPaises.pas' {ServiceCasosPaises: TDataModule},
  Providers.Consts in 'src\providers\Providers.Consts.pas',
  Types.OrdenacaoCasos in 'src\providers\types\Types.OrdenacaoCasos.pas',
  Helpers.ComboBox in 'src\providers\helpers\Helpers.ComboBox.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
