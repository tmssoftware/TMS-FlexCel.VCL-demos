unit UDataReader;

interface
uses FlexCel.Report, Generics.Collections, DataModel;

procedure LoadTables(const Report: TFlexCelReport);

implementation
procedure LoadTables(const Report: TFlexCelReport);
var
  Countries: TObjectList<TCountry>;
  country: TCountry;
begin
  Countries := TObjectList<TCountry>.Create;

  Countries.Add(TCountry.Create('China', TPeople.Create($5288AD5A), TGeography.Create(TArea.Create($420D6, $8E4F4A))));
  country := Countries[Countries.Count - 1];
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Md', 'Mandarin'), TLanguageSpeakers.Create(0, 66.2)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Yue', 'Yue'), TLanguageSpeakers.Create(0, 4.9)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Wu', 'Wu'), TLanguageSpeakers.Create(0, 6.1)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Mb', 'Minbei'), TLanguageSpeakers.Create(0, 6.2)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Mn', 'Minnan'), TLanguageSpeakers.Create(0, 5.2)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Xi', 'Xiang'), TLanguageSpeakers.Create(0, 3)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Gan', 'Gan'), TLanguageSpeakers.Create(0, 4)));

  Countries.Add(TCountry.Create('India', TPeople.Create($4D4C1DFA), TGeography.Create(TArea.Create($4CAD6, $2D5E09))));
  country := Countries[Countries.Count - 1];
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Hi', 'Hindi'), TLanguageSpeakers.Create(0, 43.6)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Bg', 'Bengali'), TLanguageSpeakers.Create(0, 8)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Ma', 'Marath'), TLanguageSpeakers.Create(0, 6.9)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Te', 'Telugu'), TLanguageSpeakers.Create(0, 6.7)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Ta', 'Tamil'), TLanguageSpeakers.Create(0, 5.7)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Gu', 'Gujarati'), TLanguageSpeakers.Create(0, 4.6)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Ur', 'Urdu'), TLanguageSpeakers.Create(0, 4.2)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Ka', 'Kannada'), TLanguageSpeakers.Create(0, 3.6)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Od', 'Odia'), TLanguageSpeakers.Create(0, 3.1)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Ma', 'Malayalam'), TLanguageSpeakers.Create(0, 2.9)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Pu', 'Punjabi'), TLanguageSpeakers.Create(0, 2.7)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('As', 'Assamese'), TLanguageSpeakers.Create(0, 1.3)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Mi', 'Maithili'), TLanguageSpeakers.Create(0, 1.1)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('O', 'Other'), TLanguageSpeakers.Create(0, 5.6)));

  Countries.Add(TCountry.Create('United States', TPeople.Create($13A00E11), TGeography.Create(TArea.Create($A7764, $8B94C9))));
  country := Countries[Countries.Count - 1];
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('En', 'English'), TLanguageSpeakers.Create(0, 78.2)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Sp', 'Spanish'), TLanguageSpeakers.Create(0, 13.4)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('Ch', 'Chinese'), TLanguageSpeakers.Create(0, 1.1)));
  country.People.Language.Add(TLanguage.Create(TLanguageName.Create('O', 'Other'), TLanguageSpeakers.Create(0, 7.3)));
  report.AddTable<TCountry>('country', Countries, TDisposeMode.DisposeAfterRun);


end;

end.
