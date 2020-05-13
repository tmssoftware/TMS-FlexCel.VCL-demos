# Signing PDFs

In this example we will show how to add a visible or invisible signature
to a generated PDF file.

## Concepts

- In order to sign a PDF file you will need a certificate issued by a
  valid Certificate Authority, or one issued by yourself. In this
  example we will use a self signed certificate. **This certificate
  will not validate by default when you open it in Acrobat, you need
  to add it to your trusted list.**


- As SHA-1 is deprecated, FlexCel will default to using SHA512 
  for the signature. You could use a different algorithm by 
  providing an OID in the EncryptionFactory.GetSigner call.

- In order to sign a file, FlexCel **will write a requirement for
  Acrobat 8 or newer in the generated files. This is because only
  Acrobat 8 or newer support SHA512.** Older versions of acrobat
  will still display the pages but will not validate the signature.


- FlexCel currently only has support for signing in Windows, 
  using CryptoAPI. You can still create your own signature 
  engine for other platforms by using a third party cryptography
  library or by calling the native crypto functions in that platform, 
  the same way we call CryptoAPI. This is explained in the section
  [Signing PDF Files](https://download.tmssoftware.com/flexcel/doc/vcl/guides/pdf-exporting-guide.html#signing-pdf-files) in the 
  PDF exporting guide.
