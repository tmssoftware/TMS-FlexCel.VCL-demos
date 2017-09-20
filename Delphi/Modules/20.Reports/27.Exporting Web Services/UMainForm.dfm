object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Exporting Web Services'
  ClientHeight = 113
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    407
    113)
  PixelsPerInch = 96
  TextHeight = 13
  object lblCity: TLabel
    Left = 24
    Top = 11
    Width = 23
    Height = 13
    Caption = 'City:'
  end
  object edCity: TComboBox
    Left = 64
    Top = 8
    Width = 320
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnKeyDown = edCityKeyDown
  end
  object cbOffline: TCheckBox
    Left = 64
    Top = 48
    Width = 281
    Height = 17
    Caption = 'Use offline data (don'#39't connect to the webservice)'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object btnExportPdf: TButton
    Left = 243
    Top = 80
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'PDF'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnExportPdfClick
  end
  object btnCancel: TButton
    Left = 324
    Top = 80
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnExportExcel: TButton
    Left = 162
    Top = 80
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Excel'
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = btnExportExcelClick
  end
  object SaveDialogExcel: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Left = 24
    Top = 64
  end
  object SaveDialogPdf: TSaveDialog
    DefaultExt = 'pdf'
    Filter = 'PDF files|*.pdf'
    Left = 96
    Top = 64
  end
end
