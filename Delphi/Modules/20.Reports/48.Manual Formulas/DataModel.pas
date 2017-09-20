unit DataModel;

interface
type
  //Delphi doesn't provide RTTI in record properties:
  //http://qc.embarcadero.com/wc/qcmain.aspx?d=78110
  //
  //As we want to use records instead of classes for simplicity,
  //we can't use properties. We'll use public fields instead.

  TMine = record
  public
    Value: integer;
  end;

  TColOfMines = record
  public
    datacol: TArray<TMine>;

    procedure CreateCol(const count: integer);
  end;

  TMines = TArray<TColOfMines>;


implementation

{ TColOfMines }

procedure TColOfMines.CreateCol(const count: integer);
begin
  SetLength(DataCol, count);
end;

end.
