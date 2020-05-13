# Using FlexCel with TMS Aurelius

You can run a report in data from [TMS Aurelius](https://www.tmssoftware.com/site/aurelius.asp) the same way you would
run a report from a TList\<T\>.

## Concepts

- There is no need to use TAureliusDataSet. FlexCel can bind directly
  to the TList\<T\> managed by Aurelius.

- Aurelius has 2 specific types that must be handled differently:
  Nullable\<T\> and TBlob. In the unit AureliusFlexCelSupport, we
  add support for those types in FlexCel. To run your own reports
  with Aurelius, copy the unit \"AureliusFlexCelSupport.pas\" in
  your own app, and call SetupAurelius(Report) after creating the
  [TFlexCelReport](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.Report/TFlexCelReport/index.html) instance.
