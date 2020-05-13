object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Getting Started'
  ClientHeight = 242
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
    242)
  PixelsPerInch = 96
  TextHeight = 13
  object edName: TLabeledEdit
    Left = 40
    Top = 40
    Width = 337
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 91
    EditLabel.Height = 13
    EditLabel.Caption = 'Tell me your name:'
    TabOrder = 0
  end
  object edURL: TLabeledEdit
    Left = 40
    Top = 88
    Width = 337
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 160
    EditLabel.Height = 13
    EditLabel.Caption = 'Your Web page (without http://):'
    TabOrder = 1
    Text = 'www.tmssoftware.com'
  end
  object cbAutoOpen: TCheckBox
    Left = 40
    Top = 136
    Width = 297
    Height = 17
    Caption = 'Auto open the generated file without saving it.'
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 331
    Top = 209
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnGo: TButton
    Left = 250
    Top = 209
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Go!'
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = btnGoClick
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Left = 40
    Top = 176
  end
end
