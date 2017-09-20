unit DataModel;

interface
uses SysUtils, Generics. Collections;
type
  TTravelItem = class
    private
    FTitle: string;
    FSummary: string;
    FUrl: string;
    FImageData: TBytes;
    public
      constructor Create(const aTitle: string; const aSummary: string; const aUrl: string; const aImageData: TBytes);
      property Title: string read FTitle;
      property Summary: string read FSummary;
      property Url: string read FUrl;
      property ImageData: TBytes read FImageData;
  end;

  TTravelItemList = class (TObjectList<TTravelItem>)
  end;

implementation

{ TTravelItem }

constructor TTravelItem.Create(const aTitle, aSummary, aUrl: string; const aImageData: TBytes);
begin
  FTitle := aTitle;
  FSummary := aSummary;
  FUrl := aUrl;
  FImageData := aImageData;
end;

end.
