unit UImagesImpl;

interface
uses FlexCel.Core, FlexCel.Report;

type
  TImagesImpl = class(TFlexCelUserFunction)
  private
    DataPath: string;
  public
    constructor Create(const aDataPath: string);
    function Evaluate(const parameters: TFormulaValueArray): TReportValue; override;
  end;

implementation
uses SysUtils, IOUtils, Classes;

{ TImagesImpl }

constructor TImagesImpl.Create(const aDataPath: string);
begin
  DataPath := aDataPath;
end;

function TImagesImpl.Evaluate(
  const parameters: TFormulaValueArray): TReportValue;
var
  ImageFileName: string;
  fs: TFileStream;
  Bytes: TBytes;
begin
  if Length(parameters) <> 1 then raise Exception.Create('Bad parameter count in call to Images() user-defined function');

  ImageFilename := TPath.Combine(TPath.Combine(DataPath, 'images'), 'Features' + parameters[0].ToStringInvariant + '.png');
  if (TFile.Exists(ImageFilename)) then
  begin
    fs := TFileStream.Create(ImageFilename, fmOpenRead);
    try
      SetLength(Bytes, fs.Size);
      fs.Read(Bytes[0], Length(Bytes));
      exit(Bytes);
    finally
      fs.Free;
    end;
  end;

  Result := TReportValue.Empty;
end;

end.
