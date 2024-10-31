unit Helpers.ComboBox;

interface

uses
  Vcl.StdCtrls, System.Rtti, System.TypInfo, Types.OrdenacaoCasos, System.SysUtils;
type
  TComboBoxHelper = class helper for TComboBox
    procedure LoadFromEnum(AEnum: PTypeInfo);
  end;
implementation

procedure TComboBoxHelper.LoadFromEnum(AEnum: PTypeInfo);
var
  LContext: TRttiContext;
  LTypeEnum: TRttiEnumerationType;
  I: Integer;
  LEnumValue: TValue;
begin
  Self.Items.Clear;
  LContext := TRttiContext.Create;
  try
    LTypeEnum := LContext.GetType(AEnum).AsOrdinal as TRttiEnumerationType;
    for I := LTypeEnum.MinValue to LTypeEnum.MaxValue do
    begin
      LEnumValue := TValue.FromOrdinal(AEnum, I);
      if LEnumValue.IsOrdinal then
        Self.Items.Add(TOrdenacaoCasos(LEnumValue.AsOrdinal).ToString);
    end;
  finally
    LContext.Free;
  end;
end;

end.

