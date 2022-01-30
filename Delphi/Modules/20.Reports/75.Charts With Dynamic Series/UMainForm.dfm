object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Charts With Dynamic Series'
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
    Width = 266
    Height = 13
    Caption = 'A report including charts which have a series per row.'
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
  object btnGo: TButton
    Left = 250
    Top = 64
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Go!'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnGoClick
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Excel files|*.xlsx'
    Left = 376
    Top = 8
  end
end
