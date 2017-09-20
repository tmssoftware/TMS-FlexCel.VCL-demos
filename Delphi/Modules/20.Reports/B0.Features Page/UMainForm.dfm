object MainForm: TMainForm
  Left = 0
  Top = 0
  ActiveControl = btnExportExcel
  Caption = 'FlexCel Features'
  ClientHeight = 86
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    456
    86)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 27
    Width = 433
    Height = 13
    Caption = 
      'Files will be saved in a folder "Features" under the folder wher' +
      'e the application is running. '
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 287
    Height = 13
    Caption = 'This sample will create a report with  some  FlexCel features'
  end
  object btnExportPdf: TButton
    Left = 203
    Top = 53
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'PDF'
    ModalResult = 1
    TabOrder = 0
    OnClick = btnExportPdfClick
  end
  object btnExportExcel: TButton
    Left = 122
    Top = 53
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Excel'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = btnExportExcelClick
  end
  object btnExportHTML: TButton
    Left = 284
    Top = 53
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'HTML'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnExportHTMLClick
  end
  object btnCancel: TButton
    Left = 373
    Top = 53
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
