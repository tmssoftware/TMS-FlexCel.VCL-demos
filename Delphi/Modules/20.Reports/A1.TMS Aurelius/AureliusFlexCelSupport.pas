unit AureliusFlexCelSupport;
interface
{$IF CompilerVersion < 23.0}
//Aurelius doesn't support XE
implementation
{$ELSE}
uses RTTI, FlexCel.Report, Aurelius.Types.Blob, Aurelius.Mapping.RttiUtils;

procedure SetupAurelius(const Report: TFlexCelReport);

implementation
uses TypInfo, StrUtils;

function ConvertAureliusTypes(const v: TFlexCelDataConversionArgs; out r: TReportValue): boolean;
var
  Blob: TBlob;
  TName: string;
  v0: TValue;
  RttiType: TRttiType;
  FieldHasValue, FieldValue: TRttiField;
  HasValue: boolean;

begin
  v0 := v.v;
  Result := false;

  if v0.IsEmpty then
  begin
    r := TReportValue.Empty;
    exit(true);
  end;

  if (v0.Kind <> tkRecord) then exit(false);

  if v0.TryAsType<TBlob>(Blob) then
  begin
    r := Blob.AsBytes;
    exit(true);
  end;


  if (v0.TypeInfo = nil) then exit(false);

  TName := GetTypeName(v0.TypeInfo);
  if StartsStr('Nullable<', TName) then
  begin
    RttiType := v.Rtti.GetType(v0.TypeInfo);
    FieldHasValue := RttiType.GetField('FHasValue');
    if FieldHasValue = nil then exit(false);
    FieldValue := RttiType.GetField('FValue');
    if FieldValue = nil then exit(false);

    HasValue := FieldHasValue.GetValue(v0.GetReferenceToRawData).AsBoolean;
    if not HasValue then
    begin
      r := TReportValue.Empty;
      exit(true);
    end;

    r := TReportValue.Create(FieldValue.GetValue(v0.GetReferenceToRawData).AsVariant);
    exit(true);

  end;
end;

procedure SetupAurelius(const Report: TFlexCelReport);
begin
  Report.DataConversionEvent :=
      function (const v: TFlexCelDataConversionArgs; out r: TReportValue): boolean
      begin
        Result := ConvertAureliusTypes(v, r);
      end;
end;

{$IFEND}
end.
