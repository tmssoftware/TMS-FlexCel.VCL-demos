object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Using HTML formatted text with FlexCel'
  ClientHeight = 115
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    497
    115)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 433
    Height = 39
    Caption = 
      'This demo originally got the data from Yahoo Travel webservice, ' +
      'but the service has been shut down. As getting the data from the' +
      ' wenservice is not important for the demo, we will use offline d' +
      'ata. '
    WordWrap = True
  end
  object btnCancel: TButton
    Left = 414
    Top = 82
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 0
    OnClick = btnCancelClick
  end
  object btnExportExcel: TButton
    Left = 242
    Top = 82
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Excel'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = btnExportExcelClick
  end
  object btnExportPdf: TButton
    Left = 323
    Top = 82
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'PDF'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnExportPdfClick
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Left = 376
    Top = 8
  end
  object SaveDialogPdf: TSaveDialog
    DefaultExt = 'pdf'
    Filter = 'PDF files|*.pdf'
    Left = 176
    Top = 66
  end
  object SaveDialogExcel: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Left = 104
    Top = 66
  end
end
