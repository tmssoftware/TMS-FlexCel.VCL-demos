program EncryptedFiles;



uses
  Forms,
  UEncryptedFiles in 'UEncryptedFiles.pas' {FEncryptedFiles},
  UPaths in '..\..\..\Shared\UPaths.pas',
  UPasswordDlg in 'UPasswordDlg.pas' {PasswordDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFEncryptedFiles, FEncryptedFiles);
  Application.Run;
end.
