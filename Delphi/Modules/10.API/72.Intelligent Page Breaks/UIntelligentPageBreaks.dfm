object FIntelligentPageBreaks: TFIntelligentPageBreaks
  Left = 0
  Top = 0
  Caption = 'Intelligent Page Breaks'
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
      'A  demo on how to have FlexCel paginate your documents so they '
      'keep their sections together.')
    ReadOnly = True
    TabOrder = 0
  end
  object btnCreateFile: TButton
    Left = 168
    Top = 193
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Create File!'
    TabOrder = 1
    OnClick = btnCreateFileClick
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
