unit Controllers.COVID;

interface

uses
  Horse,
  RESTRequest4D;

procedure Registry;

implementation

uses
  System.JSON, System.SysUtils, System.StrUtils, Providers.Filter.Intf, Providers.Filter.Impl;

procedure DoGetCasesByCountry(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LResponse: IResponse;
  LCountry, LDeathsMin, LDeathsMax, LConfirmedsMin, LConfirmedsMax, LSort: string;
  LJSONFiltered: TJSONObject;
  LFilter: TFilter;
begin
  //Puxando par�metros que vieram do client...
  LCountry := Req.Query['country'];
  LDeathsMin := Req.Query['deaths_min'];
  LDeathsMax := Req.Query['deaths_max'];
  LConfirmedsMin := Req.Query['confirmed_min'];
  LConfirmedsMax := Req.Query['confirmed_max'];
  LSort := Req.Query['sort'];

  { Setando que a resposta deste endpoint � um json com formata��o de caracteres
    "utf-8" }

  Res.ContentType('application/json; charset=utf-8');

  //Fazendo requisi��o externa...
  LResponse := TRequest.New
    .BaseURL('https://covid19-brazil-api.now.sh/api/')
    .Resource('report/v1/')
    .ResourceSuffix('countries')
    .Get;

  { Fazendo verifica��o se a requisi��o deu certo, caso n�o, retornar o mesmo
    StatusCode e resposta da requisi��o externa... }
  if LResponse.StatusCode <> 200 then
    Res.Send(LResponse.JSONValue).Status(LResponse.StatusCode);
  //Verificando se a resposta da requisi��o � um JSONObject v�lido...
  if not (LResponse.JSONValue is TJSONObject) then
    raise Exception.Create('Resposta inv�lida do servi�o externo');

  //Pegando JSON da resposta da requisi��o externa...
  LJSONFiltered := TJSONObject(LResponse.JSONValue);

  //Criando interface "TFilter", que � onde eu filtro o JSON...
  LFilter := TFilter.Create;

  //Filtrando de acordo com cada filtro fornecido...
  if not LCountry.IsEmpty then
    LJSONFiltered := LFilter.FilterValue(TJSONObject(LResponse.JSONValue), 'country', LCountry);
  if not (LDeathsMin.IsEmpty) and not (LDeathsMax.IsEmpty) then
    LJSONFiltered := LFilter.FilterByFieldRange(LJSONFiltered, 'deaths', LDeathsMin.ToInteger, LDeathsMax.ToInteger);
  if not (LConfirmedsMin.IsEmpty) and not (LConfirmedsMax.IsEmpty) then
    LJSONFiltered := LFilter.FilterByFieldRange(LJSONFiltered, 'confirmed', LConfirmedsMin.ToInteger, LConfirmedsMax.ToInteger);

  //Fazendo ordena��o...
  if not LSort.IsEmpty then
    LJSONFiltered := LFilter.Sort(LJSONFiltered, LSort);
  Res.Send(LJSONFiltered.ToJSON);
end;


procedure Registry;
begin
  //Setando endpoint "countries"...
  THorse.Get('/countries', DoGetCasesByCountry)
end;

end.
