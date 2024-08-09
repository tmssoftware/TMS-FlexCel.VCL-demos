program CopyAndPaste;

uses
  Forms,
  UCopyAndPaste in 'UCopyAndPaste.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
