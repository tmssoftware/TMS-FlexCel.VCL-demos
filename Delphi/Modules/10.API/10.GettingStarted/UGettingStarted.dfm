object FGettingStarted: TFGettingStarted
  Left = 0
  Top = 0
  Caption = 'Getting Started'
  ClientHeight = 168
  ClientWidth = 241
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    241
    168)
  PixelsPerInch = 96
  TextHeight = 13
  object btnCreateFile: TButton
    Left = 80
    Top = 127
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Create File!'
    TabOrder = 0
    OnClick = btnCreateFileClick
  end
  object Memo1: TMemo
    Left = 24
    Top = 16
    Width = 183
    Height = 75
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'A first demo on how to create a '
      'basic xls/x file with the FlexCel API.')
    ReadOnly = True
    TabOrder = 1
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Save file to...'
    Left = 192
    Top = 136
  end
end
