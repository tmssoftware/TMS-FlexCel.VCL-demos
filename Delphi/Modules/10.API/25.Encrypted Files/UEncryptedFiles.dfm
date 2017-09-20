object FEncryptedFiles: TFEncryptedFiles
  Left = 0
  Top = 0
  Caption = 'Encrypted Files'
  ClientHeight = 131
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    349
    131)
  PixelsPerInch = 96
  TextHeight = 13
  object btnCreateFile: TButton
    Left = 136
    Top = 82
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
    Width = 291
    Height = 38
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Shows how to read and write encrypted xls/x files')
    ReadOnly = True
    TabOrder = 1
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Save file to...'
    Left = 288
    Top = 88
  end
end
