object FExcelUserDefinedFunctions: TFExcelUserDefinedFunctions
  Left = 0
  Top = 0
  Caption = 'Excel User Defined Functions'
  ClientHeight = 226
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    402
    226)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 24
    Top = 16
    Width = 352
    Height = 132
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      
        'An example on how to calculate functions that are defined with m' +
        'acros '
      'in Excel.')
    ReadOnly = True
    TabOrder = 0
  end
  object btnGo: TButton
    Left = 168
    Top = 193
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Go!'
    TabOrder = 1
    OnClick = btnGoClick
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsm'
    Filter = 'Excel 2007 or newer|*.xlsm|Excel 97-2003|*.xls'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Save file to...'
    Left = 192
    Top = 136
  end
end
