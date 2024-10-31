unit Views.CasosPaises;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Services.CasosPaises, RESTRequest4D, Vcl.DBCtrls;

type
  TFrmCasosPaises = class(TForm)
    pnlContent: TPanel;
    grdResultado: TDBGrid;
    pnlFiltros: TPanel;
    btnFiltrar: TButton;
    dsPesquisa: TDataSource;
    edtPaisFiltro: TEdit;
    Label1: TLabel;
    cbxOrdenacaoFiltro: TComboBox;
    Label2: TLabel;
    edtMortosMin: TEdit;
    Label3: TLabel;
    edtMortosMax: TEdit;
    edtConfirmadosMax: TEdit;
    edtConfirmadosMin: TEdit;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FService: TServiceCasosPaises;
    function GetFilters: IRequest;
  end;

implementation

uses
  Helpers.ComboBox, Types.OrdenacaoCasos;

{$R *.dfm}

procedure TFrmCasosPaises.btnFiltrarClick(Sender: TObject);
begin
  //Pesquisando países passando os filtros para a requisição...
  FService.SearchCountries(GetFilters);
end;

procedure TFrmCasosPaises.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Liberando formulário da memória ao fechá-lo...
  Action := caFree;
end;

procedure TFrmCasosPaises.FormCreate(Sender: TObject);
begin
  { Criando service, setando o MemTable da Service no DataSet e
    carregando os Enums criados no ComboBox }
  FService := TServiceCasosPaises.Create(Self);
  dsPesquisa.DataSet := FService.mtPesquisa;
  cbxOrdenacaoFiltro.LoadFromEnum(TypeInfo(TOrdenacaoCasos));
end;

function TFrmCasosPaises.GetFilters: IRequest;
begin
  //Passando os filtros par ao Result "IRequest"...
  Result := TRequest.New
    .AddParam('country', edtPaisFiltro.Text)
    .AddParam('deaths_min', edtMortosMin.Text)
    .AddParam('deaths_max', edtMortosMax.Text)
    .AddParam('confirmed_min', edtConfirmadosMin.Text)
    .AddParam('confirmed_max', edtConfirmadosMax.Text);
  if cbxOrdenacaoFiltro.ItemIndex <> -1 then
    Result.AddParam('sort', TOrdenacaoCasos(cbxOrdenacaoFiltro.ItemIndex).ToValueJSON);
end;

end.
