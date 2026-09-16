object FSigningPdfs: TFSigningPdfs
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Signing PDFs'
  ClientHeight = 163
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
    163)
  PixelsPerInch = 96
  TextHeight = 13
  object SignaturePicture: TImage
    Left = 8
    Top = 170
    Width = 282
    Height = 107
    Center = True
    Proportional = True
    Stretch = True
    OnClick = SignaturePictureClick
  end
  object lblSignatureType: TLabel
    Left = 8
    Top = 11
    Width = 76
    Height = 13
    Caption = 'Signature type:'
  end
  object cbSignatureType: TComboBox
    Left = 8
    Top = 30
    Width = 282
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Items.Strings = (
      'PKCS#7 (adbe.pkcs7.detached)'
      'PAdES B-B (ETSI.CAdES.detached)'
      'PAdES B-T (B-B + timestamp from a TSA)')
  end
  object cbCertify: TCheckBox
    Left = 8
    Top = 61
    Width = 282
    Height = 17
    Caption = 'Certify the document (DocMDP)'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object cbVisibleSignature: TCheckBox
    Left = 8
    Top = 84
    Width = 282
    Height = 17
    Caption = 'Visible Signature (In last page)'
    TabOrder = 2
    OnClick = cbVisibleSignatureClick
  end
  object btnCreateAndSignPdf: TButton
    Left = 8
    Top = 110
    Width = 282
    Height = 45
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Create and sign PDF'
    TabOrder = 3
    OnClick = btnCreateAndSignPdfClick
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
