unit DataModel;

interface
uses Generics.Collections;

type

  TArea = class
  strict private
    FWater: Int32;
    FLand: Int32;
    function Get_Total: Int32;

  public
    constructor Create(const aWater: Int32; const aLand: Int32);
    property Total: Int32 read Get_Total;
    property Water: Int32 read FWater;
    property Land: Int32 read FLand;
  end;


  TGeography = class
  strict private
    FArea: TArea;
  public
    constructor Create(const aArea: TArea);
    destructor Destroy; override;
    property Area: TArea read FArea;
  end;

  TLanguageSpeakers = class
  strict private
    FAbsoluteNumber: Int32;
    FPercent: double;

  public
    constructor Create(const aAbsoluteNumber: Int32; const aPercent: double);
    property AbsoluteNumber: Int32 read FAbsoluteNumber;
    property Percent: double read FPercent;
  end;



  TLanguageName = class
  strict private
    FShortName: string;
    FLongName: string;
  public
    constructor Create(const aShortName: string; const aLongName: string);
    property ShortName: string read FShortName;
    property LongName: string read FLongName;
  end;

  TLanguage = class
  strict private
    FName: TLanguageName;
    FSpeakers: TLanguageSpeakers;

  public
    constructor Create(const aName: TLanguageName; const aSpeakers: TLanguageSpeakers);
    destructor Destroy; override;
    property Name: TLanguageName read FName;
    property Speakers: TLanguageSpeakers read FSpeakers;
  end;

  TPeople = class
  strict private
    FPopulation: Int32;
    FLanguage: TObjectList<TLanguage>;

  public
    constructor Create(const aPopulation: Int32);
    destructor Destroy; override;
    property Population: Int32 read FPopulation;
    property Language: TObjectList<TLanguage> read FLanguage;
  end;

  TCountry = class
  strict private
    FName: string;
    FPeople: TPeople;
    FGeography: TGeography;

  public
    constructor Create(const aName: string; const aPeople: TPeople; const aGeography: TGeography);
    destructor Destroy; override;
    property Name: string read FName;
    property People: TPeople read FPeople;
    property Geography: TGeography read FGeography;
  end;



implementation

{ TArea }

constructor TArea.Create(const aWater, aLand: Int32);
begin
  inherited Create;
  FWater := aWater;
  FLand := aLand;

end;

function TArea.Get_Total: Int32;
begin
  Result := Water + Land;
end;

{ TGeography }

constructor TGeography.Create(const aArea: TArea);
begin
  inherited Create;
  FArea := aArea;
end;

destructor TGeography.Destroy;
begin
  FArea.Free;
  inherited;
end;

{ TLanguageSpeakers }

constructor TLanguageSpeakers.Create(const aAbsoluteNumber: Int32;
  const aPercent: double);
begin
  inherited Create;
  FAbsoluteNumber := aabsoluteNumber;
  FPercent := aPercent / 100.0;
end;

{ TLanguageName }

constructor TLanguageName.Create(const aShortName, aLongName: string);
begin
  inherited Create;
  FShortName := aShortName;
  FLongName := aLongName;
end;

{ TLanguage }

constructor TLanguage.Create(const aName: TLanguageName;
  const aSpeakers: TLanguageSpeakers);
begin
  inherited Create;
  FName := aName;
  FSpeakers := aSpeakers;
end;

destructor TLanguage.Destroy;
begin
  FName.Free;
  FSpeakers.Free;

  inherited;
end;

{ TPeople }

constructor TPeople.Create(const aPopulation: Int32);
begin
  inherited Create;
  FPopulation := aPopulation;
  FLanguage := TObjectList<TLanguage>.Create;

end;

destructor TPeople.Destroy;
begin
  FLanguage.Free;
  inherited;
end;

{ TCountry }

constructor TCountry.Create(const aName: string; const aPeople: TPeople;
  const aGeography: TGeography);
begin
  FName := aName;
  FPeople := aPeople;
  FGeography := aGeography;
end;

destructor TCountry.Destroy;
begin
  FPeople.Free;
  FGeography.Free;

  inherited;
end;

end.


