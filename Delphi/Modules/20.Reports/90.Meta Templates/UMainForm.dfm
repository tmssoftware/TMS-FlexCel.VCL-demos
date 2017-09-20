object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Meta Templates'
  ClientHeight = 157
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    414
    157)
  PixelsPerInch = 96
  TextHeight = 13
  object btnCancel: TButton
    Left = 331
    Top = 124
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
    Top = 124
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Go!'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnGoClick
  end
  object cbFeeds: TComboBox
    Left = 8
    Top = 16
    Width = 385
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object cbOffline: TCheckBox
    Left = 8
    Top = 64
    Width = 337
    Height = 17
    Caption = 'Use offline data (do not connect to internet)'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object cbShowFeedCount: TCheckBox
    Left = 8
    Top = 87
    Width = 369
    Height = 17
    Caption = 'Show feed number column in the generated report.'
    TabOrder = 4
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Left = 376
    Top = 8
  end
end
