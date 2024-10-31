unit Views.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrmMain = class(TForm)
    pnlMain: TPanel;
    pnlMenuBar: TPanel;
    pnlBackground: TPanel;
    imgCovid19: TImage;
    pnlListarCasosPaises: TPanel;
    pnlSpace1: TPanel;
    pnlContent: TPanel;
    procedure pnlListarCasosPaisesClick(Sender: TObject);
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  Views.CasosPaises;

{$R *.dfm}

procedure TFrmMain.pnlListarCasosPaisesClick(Sender: TObject);
var
  LForm: TFrmCasosPaises;
begin
  //Abrindo formulário dentro do Panel "pnlContent"...
  LForm := TFrmCasosPaises.Create(Self);
  LForm.Parent := pnlContent;
  LForm.Align := alClient;
  LForm.Show;
end;

end.
