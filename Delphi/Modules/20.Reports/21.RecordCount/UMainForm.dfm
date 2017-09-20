object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'RecordCount'
  ClientHeight = 158
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
    158)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 277
    Height = 13
    Caption = 'The database in this demo returns -1 for the record count'
  end
  object btnCancel: TButton
    Left = 331
    Top = 125
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnGo: TButton
    Left = 250
    Top = 125
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Go!'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnGoClick
  end
  object CountOption: TRadioGroup
    Left = 8
    Top = 27
    Width = 393
    Height = 82
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Select how to perform the record count:'
    ItemIndex = 0
    Items.Strings = (
      'Use __FLEXCELCOUNT'
      'Use SlowCount  (FlexCel will count the rows locally)')
    TabOrder = 2
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Left = 376
    Top = 8
  end
end
