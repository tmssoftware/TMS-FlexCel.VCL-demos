unit DataModel;

interface
type
  TFeedData = record
  private
    FName: string;
    FLogo: string;
    FUrl: string;
    FHasPubDate: boolean;
  public
    property Name: string read FName;
    property Url: string read FUrl;
    property Logo: string read FLogo;
    property HasPubDate: boolean read FHasPubDate;

    constructor Create(const aName, aUrl, aLogo: string; const aHasPubDate: boolean);
  end;

  function GetFeeds: TArray<TFeedData>;

type
  TFeedContent = record
  public
    Title: string;
    Description: string;
    Link: string;

    constructor Create(aTitle, aDescription, aLink: string);

  end;

  TFeedContentEx = record
  public
    Title: string;
    Description: string;
    Link: string;
    PubDate: Variant;

    constructor Create(aTitle, aDescription, aLink: string; const aPubDate: Variant);

  end;

implementation

function GetFeeds: TArray<TFeedData>;
begin
  SetLength(Result, 3);
  Result[0] := TFeedData.Create('TMS', 'https://www.tmssoftware.com/rss/tms.xml', 'tms.gif', false);
	Result[1] := TFeedData.Create('MSDN','http://sxpdata.microsoft.com/feeds/3.0/msdntn/MSDNMagazine_enus', 'msdn.jpg', true);
	Result[2] := TFeedData.Create('SLASHDOT' , 'http://rss.slashdot.org/Slashdot/slashdot', 'slashdot.gif', false);
end;

{ TFeedData }

constructor TFeedData.Create(const aName, aUrl, aLogo: string; const aHasPubDate: boolean);
begin
  FName := aName;
  FUrl := aUrl;
  FLogo := aLogo;
  FHasPubDate := aHasPubDate;
end;

{ TFeedContentEx }

constructor TFeedContentEx.Create(aTitle, aDescription, aLink: string;
  const aPubDate: Variant);
begin
  Title := aTitle;
  Description := aDescription;
  Link := aLink;
  PubDate := aPubDate;
end;

{ TFeedContent }

constructor TFeedContent.Create(aTitle, aDescription, aLink: string);
begin
  Title := aTitle;
  Description := aDescription;
  Link := aLink;
end;

end.
