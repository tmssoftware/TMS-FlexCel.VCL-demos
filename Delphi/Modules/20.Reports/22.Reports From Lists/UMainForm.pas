unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellApi, Generics.Collections, DataModel,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    btnCancel: TButton;
    btnGo: TButton;
    SaveDialog: TSaveDialog;
    Label1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
  private
    procedure RunReport;
    function GetDataPath: string;
    procedure LoadCategories(const Categories: TObjectList<TCategories>);
    function GetElementNames: TArray<TElementName>;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses IOUtils;

{$R *.dfm}

procedure TMainForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnGoClick(Sender: TObject);
begin
  RunReport;

end;

function TMainForm.GetDataPath: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..');
end;


procedure TMainForm.RunReport;
var
  Report: TFlexCelReport;
  Categories: TObjectList<TCategories>;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    Categories := TObjectList<TCategories>.Create;
    try
      LoadCategories(Categories);
      Report.AddTable<TCategories>('Categories', Categories, TDisposeMode.DoNotDispose);
      //We don't need to call AddTable for elements since it is already added when we add Categories.

      Report.AddTable<TElementName>('ElementName', GetElementNames);
      //ElementName doesn't have an intrinsic relationship with categories, so we will have to manually add a relationship.
      //Non intrinsic relationships should be rare, but we do it here to show how it can be done.
      Report.AddRelationship('Elements', 'ElementName', 'ElementID', 'ElementID');

      Report.Run(
        TPath.Combine(GetDataPath, 'Reports From Lists.template.xls'),
        SaveDialog.FileName);
    finally
      Categories.Free;
    end;
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

procedure TMainForm.LoadCategories(const Categories: TObjectList<TCategories>);
begin
  Categories.Add(TCategories.Create('Animals'));
  Categories[Categories.Count - 1].Elements.Add(TElements.Create(1, 'Penguin'));
  Categories[Categories.Count - 1].Elements.Add(TElements.Create(2, 'Cat'));
  Categories[Categories.Count - 1].Elements.Add(TElements.Create(3, 'Unicorn'));

  Categories.Add(TCategories.Create('Flowers'));
  Categories[Categories.Count - 1].Elements.Add(TElements.Create(4, 'Daisy'));
  Categories[Categories.Count - 1].Elements.Add(TElements.Create(5, 'Rose'));
  Categories[Categories.Count - 1].Elements.Add(TElements.Create(6, 'Orchid'));
end;

function TMainForm.GetElementNames: TArray<TElementName>;
begin
  SetLength(Result, 7);
  Result[0] := TElementName.Create(1, 'Linus');
  Result[1] := TElementName.Create(1, 'Gerard');
  Result[2] := TElementName.Create(2, 'Rover');
  Result[3] := TElementName.Create(3, 'Mike');
  Result[4] := TElementName.Create(5, 'Rosalyn');
  Result[5] := TElementName.Create(5, 'Monica');
  Result[6] := TElementName.Create(6, 'Lisa');
end;


end.
