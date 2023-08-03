unit UAdvancedAPI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, UPaths,
  Dialogs, StdCtrls, FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellAPI;

type
  TFAdvancedAPI = class(TForm)
    Memo1: TMemo;
    btnCreateFile: TButton;
    SaveDialog: TSaveDialog;
    btnUseXlsx: TCheckBox;
    procedure btnCreateFileClick(Sender: TObject);
  private
    procedure CreateFile;
    procedure AddData(const Xls: TExcelFile);
    procedure OpenFile(const Xls: TExcelFile);
    procedure AddChart(const DataCell: TXlsNamedRange; const Xls: TExcelFile);
    function GetCountryList: String;
  end;

var
  FAdvancedAPI: TFAdvancedAPI;

implementation

{$IFNDEF FPC}
{$R *.dfm}
{$ENDIF}

const
  //some silly data to fill in the cells. A real app would read this from somewhere else.
	Country: array [0..7] of string = ('USA', 'Canada', 'Spain', 'France', 'United Kingdom', 'Australia', 'Brazil', 'Unknown');
	DataRows = 100;

/// <summary>
/// Will return a list of countries separated by Character(0) so it can be used as input for a built in list.
/// </summary>
function TFAdvancedAPI.GetCountryList: String;
var
  sep: String;
  c: String;
  fIndex: Integer;
begin
  sep := '';
  Result := '';
  begin
    for fIndex := 0 to Length(Country) - 1 do
    begin
      c := Country[fIndex];
      Result := Result + sep + c;
      sep := #0;  //not very efficient method to concat, but good enough for this demo.
    end;
  end;
end;

procedure TFAdvancedAPI.AddChart(const DataCell: TXlsNamedRange; const Xls: TExcelFile);
var
  ChartRange: TXlsNamedRange;
  FirstCell: TCellAddress;
  SecondCell: TCellAddress;
  FirstSumCell: TCellAddress;
  r: Int32;
begin
   //Find the cell where the cart will go.
  ChartRange := Xls.GetNamedRange('ChartData', -1);

   //Insert cells to expand the range for the chart. It already has 2 rows, so we need to insert Country.Length - 2
   //Note also that we insert after ChartRange.Top, so the chart is updates with the new range.
  Xls.InsertAndCopyRange(TXlsCellRange.Create(ChartRange.Top, ChartRange.Left, ChartRange.Top, ChartRange.Left + 1), ChartRange.Top + 1, ChartRange.Left, Length(Country) - 2, TFlxInsertMode.ShiftRangeDown);
   //we use shiftrangedown so not all the row goes down and the chart stays in place.

   //Get the cell addresses of the data range.
  FirstCell := TCellAddress.Create(DataCell.Top, DataCell.Left);
  SecondCell := TCellAddress.Create(DataCell.Top + DataRows, DataCell.Left + 1);
  FirstSumCell := TCellAddress.Create(DataCell.Top, DataCell.Left + 1);

   //Fill a table with the data to be used in the chart.
  for r := ChartRange.Top to ChartRange.Top + Length(Country) - 1 do
  begin
    Xls.SetCellValue(r, ChartRange.Left, Country[r - ChartRange.Top]);
    Xls.SetCellValue(r, ChartRange.Left + 1,
      TFormula.Create('=SUMIF(' + FirstCell.CellRef + ':' + SecondCell.CellRef
      + ',"' + Country[r - ChartRange.Top] + '", ' + FirstSumCell.CellRef
      + ':' + SecondCell.CellRef + ')'));
  end;

end;

procedure TFAdvancedAPI.AddData(const Xls: TExcelFile);
var
  DataCell: TXlsNamedRange;
  ApplyFormat: TFlxApplyFormat;
  fmt: TFlxFormat;
  z: Int32;
  OutlineLevel: Int32;
  r: Int32;
  dv: TDataValidationInfo;
  ChartRange: TXlsNamedRange;
  Sp: TSheetProtectionOptions;
  Template: string;
  Keys: Int32Array;
  SortOrder: TArray<TSortOrder>;
begin
  if btnUseXlsx.Checked then Template := 'AdvancedAPI.template.xlsm' else Template := 'AdvancedAPI.template.xls';


  // Open an existing file to be used as template. In this example this file has
  // little data, in a real situation it should have as much as possible. (Or even better, be a report)
  Xls.Open(DataFolder + Template);

  //Find the cell where we want to fill the data. In this case, we have created a named range "data" so the address
  //is not hardcoded here.
  DataCell := Xls.GetNamedRange('Data', -1);

  //Add a chart with totals
  AddChart(DataCell, Xls);
  //Note that "DataCell" will change because we inserted rows above it when creating the chart. But we will keep using the old one.

  //Add the captions. This should probably go into the template, but in a dynamic environment it might go here.
  Xls.SetCellValue(DataCell.Top - 1, DataCell.Left, 'Country');
  Xls.SetCellValue(DataCell.Top - 1, DataCell.Left + 1, 'Quantity');

   //Add a rectangle around the cells
  ApplyFormat := TFlxApplyFormat.Create;
  ApplyFormat.SetAllMembers(false);
  ApplyFormat.Borders.SetAllMembers(true);  //We will only apply the borders to the existing cell formats

  fmt := Xls.GetDefaultFormat;
  fmt.Borders.Left.Style := TFlxBorderStyle.Double;
  fmt.Borders.Right.Style := TFlxBorderStyle.Double;
  fmt.Borders.Top.Style := TFlxBorderStyle.Double;
  fmt.Borders.Bottom.Style := TFlxBorderStyle.Double;
  Xls.SetCellFormat(DataCell.Top - 1, DataCell.Left, DataCell.Top, DataCell.Left + 1, fmt, ApplyFormat, true);  //Set last parameter to true so it draws a box.

   //Freeze panes
  Xls.FreezePanes(TCellAddress.Create(DataCell.Top, 1));
  Randomize;
  z := 0;  //Fill the data

  OutlineLevel := 0;
  for r := 0 to DataRows do
  begin

     //Fill the values.
    Xls.SetCellValue(DataCell.Top + r, DataCell.Left, Country[z mod Length(Country)]);  //For non C# users, "%" means "mod" or modulus in other languages. It is the rest of the integer division.

    Xls.SetCellValue(DataCell.Top + r, DataCell.Left + 1, Random(1000));

     //Add the country to the outline
    Xls.SetRowOutlineLevel(DataCell.Top + r, OutlineLevel);
     //increment the country randomly
    if Random(3) = 0 then
    begin
      Inc(z);
      OutlineLevel := 0;  //Break the group and create a new one.

    end
    else
    begin
      OutlineLevel := 1;
    end;

  end;


   //Make the "+" signs of the outline appear at the top.
  Xls.OutlineSummaryRowsBelowDetail := false;

   //Collapse the outline to the first level.
  Xls.CollapseOutlineRows(1, TCollapseChildrenMode.Collapsed);

   //Add Data Validation for the first column, it must be a country.
  dv := TDataValidationInfo.Create(TDataValidationDataType.List,  //We will use a built in list.
           TDataValidationConditionType.Between, //This parameter does not matter since it is a list. It will not be used.
           '="' + GetCountryList + '"',  //We could have used a range of cells here with the values (like "=C1..C4") Instead, we directly entered the list in the formula.
           '',  //no need for a second formula, not used in List
           false,
           true,
           true, //Note that as we entered the data directly in FirstFormula, we need to set this to true
           true,
           'Unknown country',
           'Please make sure that the country is in the list',
           false, //We will not use an input box, so this is false and the 2 next entries are nil
           '',
           '',
           TDataValidationIcon.Stop); //We will use the stop icon so no invalid input is permitted.

  Xls.AddDataValidation(TXlsCellRange.Create(DataCell.Top, DataCell.Left, DataCell.Top + DataRows, DataCell.Left), dv);

   //Add Data Validation for the second column, it must be an integer between 0 and 1000.
  dv := TDataValidationInfo.Create(
            TDataValidationDataType.WholeNumber, //We will request a number.
            TDataValidationConditionType.Between,
            '=0', //First formula marks the first part of the "between" condition.
            '=1000', //Second formula is the second part.
            false,
            false,
            false,
            true,
            'Invalid Quantity',
            '', //We will leave the default error message.
            true,
            'Quantity:',
            'Please enter a quantity between 0 and 1000',
            TDataValidationIcon.Stop); //We will use the stop icon so no invalid input is permitted.

  Xls.AddDataValidation(TXlsCellRange.Create(DataCell.Top, DataCell.Left + 1, DataCell.Top + DataRows, DataCell.Left + 1), dv);


   //Search country "Unknown" and replace it by "no".
   //This does not make any sense here (we could just have entered "no" to begin)
   //but it shows how to do it when modifying an existing file
   Xls.Replace('Unknown', 'no', TXlsCellRange.FullRange, true, false, true);

   //Autofit the rows. As we keep the row height automatic this will not show when opening in Excel, but will work when directly printing from FlexCel.
   Xls.AutofitRowsOnWorkbook(false, true, 1);

  Xls.Recalc;  //Calculate the SUMIF formulas so we can sort by them. Note that FlexCel automatically recalculates before saving,
               //but in this case we haven't saved yet, so the sheet is not recalculated. You do not normally need to call Recalc directly.

  //Sort the data. As in the case with replace, this does not make much sense. We could have entered the data sorted to begin
  //But it shows how you can use the feature.

  //Find the cell where the chart goes.
  ChartRange := Xls.GetNamedRange('ChartData', -1);
  Keys := Int32Array.Create(2);
  SortOrder := TArray<TSortOrder>.Create(TSortOrder.Descending);
  Xls.Sort(TXlsCellRange.Create(ChartRange.Top, ChartRange.Left, ChartRange.Top + Length(Country),
   ChartRange.Left + 1), true, Keys, SortOrder, nil);

  //Protect the Sheet
  Sp := TSheetProtectionOptions.Create(false);  //Create default protection options that allows everything.
  Sp.InsertColumns := false;  //Restrict inserting columns.
  Xls.Protection.SetSheetProtection('flexcel', Sp);
   //Set a modify password. Note that this does *not* encrypt the file.
  Xls.Protection.SetModifyPassword('flexcel', true, 'flexcel');
  Xls.Protection.OpenPassword := 'flexcel';  //OpenPasword is the only password that will actually encrypt the file, so you will not be able to open it with flexcel if you do not know the password.

  //Select cell A1
  Xls.SelectCell(1, 1, true);
end;

procedure TFAdvancedAPI.btnCreateFileClick(Sender: TObject);
begin
   CreateFile;
end;


procedure TFAdvancedAPI.CreateFile;
var
  Xls: TExcelFile;
begin
  Xls := TXlsFile.Create(true);

  try
    AddData(Xls);
    OpenFile(Xls);
  finally
    FreeAndNil(Xls);
  end;
end;

procedure TFAdvancedAPI.OpenFile(const Xls: TExcelFile);
begin
  if not SaveDialog.Execute then exit;
  Xls.Save(SaveDialog.FileName); //No need to delete the file first, since AllowOverWriteFiles is true in XlsAdapter.

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;
end;

end.
