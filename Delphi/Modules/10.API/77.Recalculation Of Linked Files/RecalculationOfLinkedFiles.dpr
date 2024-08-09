program RecalculationOfLinkedFiles;

uses
  Forms,
  URecalculationOfLinkedFiles in 'URecalculationOfLinkedFiles.pas' {FRecalculationOfLinkedFiles};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFRecalculationOfLinkedFiles, FRecalculationOfLinkedFiles);
  Application.Run;
end.
