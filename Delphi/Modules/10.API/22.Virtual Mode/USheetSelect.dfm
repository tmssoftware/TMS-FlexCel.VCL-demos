object FSheetSelect: TFSheetSelect
  Left = 0
  Top = 0
  Caption = 'Select sheet to open...'
  ClientHeight = 292
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SheetList: TListBox
    Left = 0
    Top = 0
    Width = 310
    Height = 251
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = SheetListDblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 251
    Width = 310
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      310
      41)
    object btnOk: TButton
      Left = 144
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 225
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
