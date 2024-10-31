unit Providers.Filter.Intf;

interface

uses
  System.JSON;

type
  IFilter = interface
    ['{12BA447D-FADC-4A22-BAAF-BE7327CB31E6}']
    function FilterValue(const AJSONObject: TJSONObject; const AFieldName, AValue: string): TJSONObject;
    function FilterByFieldRange(const AJSONObject: TJSONObject; const AFieldName: string; AMinValue, AMaxValue: Integer): TJSONObject;
    function Sort(AJSONObject: TJSONObject; const AFieldSort: string): TJSONObject;
  end;

implementation

end.

