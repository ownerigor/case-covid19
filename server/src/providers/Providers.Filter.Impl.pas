unit Providers.Filter.Impl;

interface

uses
  Providers.Filter.Intf, System.JSON, System.SysUtils, System.StrUtils, System.Generics.Collections, System.Generics.Defaults;

type
  TFilter = class(TInterfacedObject, IFilter)
  public
    function FilterValue(const AJSONObject: TJSONObject; const AFieldName, AValue: string): TJSONObject;
    function FilterByFieldRange(const AJSONObject: TJSONObject; const AFieldName: string; AMinValue, AMaxValue: Integer): TJSONObject;
    function Sort(AJSONObject: TJSONObject; const AFieldSort: string): TJSONObject;
  end;

implementation

function TFilter.FilterValue(const AJSONObject: TJSONObject; const AFieldName, AValue: string): TJSONObject;
var
  LDataArray: TJSONArray;
  LFilteredArray: TJSONArray;
  LItem: TJSONObject;
  LFieldValue: string;
begin
  { Basicamente, pego o AJSONObject, crio um TJSONArray com o "data" e faço um laço nesse Array
    onde o "AnsiContainsStr" vai ser responsável por verificar se os campos do JSON contém
    a palavra que está no "AValue", se contém, adiciona ao Array e me retorna o JSON novamente. }
  Result := TJSONObject.Create;
  LFilteredArray := TJSONArray.Create;
  LDataArray := AJSONObject.GetValue<TJSONArray>('data');
  for var I := 0 to Pred(LDataArray.Count) do
  begin
    LItem := LDataArray.Items[I] as TJSONObject;
    if LItem.TryGetValue<string>(AFieldName, LFieldValue) and AnsiContainsStr(LFieldValue.ToLower, AValue.ToLower) then
    LFilteredArray.AddElement(LItem.Clone as TJSONObject);
  end;
  Result.AddPair('data', LFilteredArray);
end;

function TFilter.Sort(AJSONObject: TJSONObject; const AFieldSort: string): TJSONObject;
var
  LDataArray: TJSONArray;
  LSortedArray: TJSONArray;
  LItemList: TList<TJSONObject>;
begin
  Result := TJSONObject.Create;
  LSortedArray := TJSONArray.Create;
  LItemList := TList<TJSONObject>.Create;
  try
    { Basicamente, eu pego o JSON, crio um Array para percorrer os JSON's
      e adiciono eles a uma TList e utilizo a .Sort da TList para ordená-los e retorno
      o JSON já ordenado de acordo com o campo que foi passado no "AFieldSort"... }
    LDataArray := AJSONObject.GetValue<TJSONArray>('data');
    for var I := 0 to LDataArray.Count - 1 do
      LItemList.Add(LDataArray.Items[I] as TJSONObject);

    LItemList.Sort(
      TComparer<TJSONObject>.Construct(
        function(const a, b: TJSONObject): Integer
        var
          ValueA, ValueB: Integer;
        begin
          if a.TryGetValue<Integer>(AFieldSort, ValueA) and
             b.TryGetValue<Integer>(AFieldSort, ValueB) then
            Result := ValueA - ValueB
          else
            Result := 0;
        end));

    for var Item in LItemList do
      LSortedArray.AddElement(Item.Clone as TJSONObject);

    Result.AddPair('data', LSortedArray);
  finally
    LItemList.Free;
  end;
end;

function TFilter.FilterByFieldRange(const AJSONObject: TJSONObject; const AFieldName: string; AMinValue, AMaxValue: Integer): TJSONObject;
var
  LDataArray: TJSONArray;
  LFilteredArray: TJSONArray;
  LItem: TJSONObject;
  LFieldValue: Integer;
begin
  { Basicamente, pego o AJSONObject, crio um TJSONArray com o "data" e faço um laço nesse Array
    onde nesse laço, vou verificar se os valores AMinValue e AMaxValue são < > de acordo
    com os parâmetros passados para essa função, se for, adiciono ao Array e retorno como
    TJSONObject...}
  Result := TJSONObject.Create;
  LFilteredArray := TJSONArray.Create;

  LDataArray := AJSONObject.GetValue<TJSONArray>('data');
  for var I := 0 to Pred(LDataArray.Count) do
  begin
    LItem := LDataArray.Items[I] as TJSONObject;
    if LItem.TryGetValue<Integer>(AFieldName, LFieldValue) then
    begin
      if (LFieldValue >= AMinValue) and (LFieldValue <= AMaxValue) then
        LFilteredArray.AddElement(LItem.Clone as TJSONObject);
    end;
  end;
  Result.AddPair('data', LFilteredArray);
end;

end.

