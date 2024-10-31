unit Types.OrdenacaoCasos;

interface

type
{$SCOPEDENUMS ON}
  TOrdenacaoCasos = (CONFIRMADOS, MORTES, RECUPERADOS);
{$SCOPEDENUMS OFF}

  TOrdenacaoCasosHelper = record helper for TOrdenacaoCasos
    function GetValue: Integer;
    function ToString: string;
    function ToValueJSON: string;
  end;

implementation

function TOrdenacaoCasosHelper.GetValue: Integer;
begin
  Result := Ord(Self);
end;

function TOrdenacaoCasosHelper.ToString: string;
begin
  case Self of
    TOrdenacaoCasos.CONFIRMADOS: Result := 'Casos confirmados';
    TOrdenacaoCasos.MORTES: Result := 'Mortos';
    TOrdenacaoCasos.RECUPERADOS: Result := 'Recuperados';
  end;
end;

function TOrdenacaoCasosHelper.ToValueJSON: string;
begin
  case Self of
    TOrdenacaoCasos.CONFIRMADOS: Result := 'confirmed';
    TOrdenacaoCasos.MORTES: Result := 'deaths';
    TOrdenacaoCasos.RECUPERADOS: Result := 'recovered';
  end;
end;

end.
