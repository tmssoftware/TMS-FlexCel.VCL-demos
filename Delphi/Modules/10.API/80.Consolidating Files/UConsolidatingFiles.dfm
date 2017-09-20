object FConsolidatingFiles: TFConsolidatingFiles
  Left = 0
  Top = 0
  Caption = 'Consolidating Files'
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
      'A demo on how to consolidate several files into one.'
      ''
      
        'After pressing the "Go!" button multiselect all the files you wa' +
        'nt to '
      'consolidate by using shift and ctrl.')
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
  object cbOnlyData: TCheckBox
    Left = 24
    Top = 154
    Width = 352
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Copy only data (don'#39't copy margins,  zoom, etc)'
    TabOrder = 2
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsm'
    Filter = 'Excel 2007 or newer|*.xlsm|Excel 97-2003|*.xls'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Save file to...'
    Left = 96
    Top = 176
  end
  object OpenDialog: TOpenDialog
    Filter = 'Excel Files|*.xls;*.xlsx;*.xlsm|All Files|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Title = 'Select all the files you want to consolidate into one'
    Left = 32
    Top = 176
  end
end
