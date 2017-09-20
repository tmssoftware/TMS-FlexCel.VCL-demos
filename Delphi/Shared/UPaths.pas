unit UPaths;

interface

function DataFolder: string;
function ElapsedTime(const et, st: TDateTime): string;

implementation

uses
  SysUtils;

function DataFolder: string;
begin
{$IFDEF MSWINDOWS}
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + '..\..\';
{$ELSE}
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
{$ENDIF}
end;

function ElapsedTime(const et, st: TDateTime): string;
var
  Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(et - st, Hour, Min, Sec, MSec);
  Result :=  Format('%.2d:%.2d:%.2d', [Hour, Min, Sec]);
end;

end.
