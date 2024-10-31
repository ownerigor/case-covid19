unit Services.CasosPaises;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RESTRequest4D,
  System.Generics.Collections;

type
  TServiceCasosPaises = class(TDataModule)
    mtPesquisa: TFDMemTable;
    mtPesquisacountry: TStringField;
    mtPesquisaconfirmed: TIntegerField;
    mtPesquisadeaths: TIntegerField;
    mtPesquisarecovered: TIntegerField;
    mtPesquisacases: TIntegerField;
    mtPesquisaupdated_at: TDateTimeField;
  public
    function SearchCountries(const ARequest: IRequest): IResponse;
  end;

implementation

uses
  DataSet.Serialize, System.JSON, Providers.Consts;

{$R *.dfm}

{ TServiceCasosPaises }

function TServiceCasosPaises.SearchCountries(const ARequest: IRequest): IResponse;
begin
  { Fazendo Requisição para a API... (lembrando que os filtros já estão dentro do
    parâmetro "ARequest") }
  if mtPesquisa.RecordCount > 0 then
    mtPesquisa.EmptyDataSet;
  Result := ARequest.BaseURL(API_URL).Resource('countries').Get;
  //Carregando resultado dentro da MemTable "mtPesquisa"...
  mtPesquisa.LoadFromJSON(TJSONObject(Result.JSONValue).GetValue<TJSONArray>('data').ToJSON);
end;

end.
