program EncryptedFiles;



uses
  Forms,
  UEncryptedFiles in 'UEncryptedFiles.pas' {FEncryptedFiles},
  UPaths in '..\..\..\Shared\UPaths.pas',
  UPasswordDlg in 'UPasswordDlg.pas' {PasswordDlg};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFEncryptedFiles, FEncryptedFiles);
  Application.Run;
end.
