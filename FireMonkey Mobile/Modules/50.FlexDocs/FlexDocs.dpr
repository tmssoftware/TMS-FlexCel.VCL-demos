program FlexDocs;



{$R 'FlexDocsResource.res' 'FlexDocsResource.rc'}

uses
  System.StartUpCopy,
  FMX.Forms,
  UFlexDocs in 'UFlexDocs.pas' {FFlexDocs};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFFlexDocs, FFlexDocs);
  Application.Run;
end.
