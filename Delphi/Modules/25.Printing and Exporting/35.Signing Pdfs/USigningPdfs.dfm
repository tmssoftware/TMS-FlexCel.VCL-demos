object FSigningPdfs: TFSigningPdfs
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Signing PDFs'
  ClientHeight = 95
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    298
    95)
  PixelsPerInch = 96
  TextHeight = 13
  object SignaturePicture: TImage
    Left = 8
    Top = 102
    Width = 282
    Height = 107
    Center = True
    Proportional = True
    Stretch = True
    OnClick = SignaturePictureClick
  end
  object btnCreateAndSignPdf: TButton
    Left = 8
    Top = 8
    Width = 282
    Height = 57
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Create and sign PDF'
    TabOrder = 0
    OnClick = btnCreateAndSignPdfClick
    ExplicitWidth = 272
  end
  object cbVisibleSignature: TCheckBox
    Left = 8
    Top = 71
    Width = 272
    Height = 17
    Caption = 'Visible Signature (In last page)'
    TabOrder = 1
    OnClick = cbVisibleSignatureClick
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 72
    Top = 16
  end
  object OpenExcelDialog: TOpenDialog
    Filter = 'Excel files|*.xls;*.xlsx;*.xlsm|All files|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select file to read...'
    Left = 14
  end
  object SavePdfDialog: TSaveDialog
    DefaultExt = 'pdf'
    Filter = 'PDF files (*.pdf)|*.pdf'
    Left = 136
    Top = 32
  end
end
