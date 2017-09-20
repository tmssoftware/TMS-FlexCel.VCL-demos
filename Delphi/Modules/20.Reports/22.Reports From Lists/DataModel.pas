unit DataModel;

interface
uses Generics.Collections;

type
  //We can use classes or records as data sources
  TElements = class
  private
    FElementId: integer;
    FName: string;
  public
    constructor Create(const aElementId: integer; const aName: string);

    //We will relate this property with the table of colors by adding a relationship.
    property ElementId: integer read FElementId;
    property Name: string read FName;

  end;

  TCategories = class
  private
    FName: string;
    FElements: TObjectList<TElements>;
  public
    constructor Create(const aName: string);
    destructor Destroy; override;

    //In classes we can use public properties, fields and functions without parameters.
    //In records we can't use public properties. In records we can use fields and functions only in XE2 or newer.
    property Name: string read FName;

    //Elements is in master-detail relationship with this element, even when we don't explicitly add a relationship.
    //Relationship is inferred because Elements is a property of this object
    property Elements: TObjectList<TElements> read FElements;
  end;

  //Here we will show a record instead of a class. A record can be used easier in Arrays
  //since it doesn't need free. But due to limitations in Delphi RTTI, we can only access the
  //fields of the method or functions (functions in Delphi XE2 or newer). Not properties.
  TElementName = record
  public
    ElementId: integer;
    Name: string;
    constructor Create(const aElementId: integer; const aName: string);

  end;



implementation

{ TCategories }

constructor TCategories.Create(const aName: string);
begin
  FName := aName;
  FElements := TObjectList<TElements>.Create;
end;

destructor TCategories.Destroy;
begin
  Elements.Free;
  inherited;
end;

{ TElementName }

constructor TElementName.Create(const aElementId: integer; const aName: string);
begin
  ElementId := aElementId;
  Name := aName;
end;

{ TElements }

constructor TElements.Create(const aElementId: integer; const aName: string);
begin
  FElementId := aElementId;
  FName := aName;
end;

end.
