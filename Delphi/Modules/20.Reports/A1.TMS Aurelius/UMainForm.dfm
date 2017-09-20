object MainForm: TMainForm
  Left = 0
  Top = 0
  ActiveControl = btnExportExcel
  Caption = 'TMS Aurelius'
  ClientHeight = 97
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    414
    97)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 317
    Height = 13
    Caption = 'Shows how to create a report from data in the TMS Aurelius ORM.'
  end
  object btnCancel: TButton
    Left = 331
    Top = 64
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnExportHTML: TButton
    Left = 242
    Top = 64
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'HTML'
    ModalResult = 1
    TabOrder = 0
    OnClick = btnExportHTMLClick
  end
  object btnExportPdf: TButton
    Left = 161
    Top = 64
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'PDF'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnExportPdfClick
  end
  object btnExportExcel: TButton
    Left = 80
    Top = 64
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Excel'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = btnExportExcelClick
  end
  object SaveDialogXls: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Left = 40
  end
  object SaveDialogPdf: TSaveDialog
    DefaultExt = 'pdf'
    Filter = 'PDF files|*.pdf'
    Left = 24
    Top = 48
  end
  object SaveDialogHtml: TSaveDialog
    DefaultExt = 'htm'
    Filter = 'HTML files|*.htm'
    Left = 360
    Top = 8
  end
end
