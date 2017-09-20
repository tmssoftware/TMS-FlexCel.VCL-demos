object FAdvancedAPI: TFAdvancedAPI
  Left = 0
  Top = 0
  Caption = 'Advanced API'
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
      'More examples on how to use the '
      'FlexCel API.'
      ''
      
        'Note that FlexCel won'#39't convert charts between Xls and Xlsx. So ' +
        'if you '
      
        'want to create an xlsx file, you should use an xlsx template, an' +
        'd same '
      'goes for xls.')
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
  object btnUseXlsx: TCheckBox
    Left = 24
    Top = 154
    Width = 193
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Use XLSX template'
    Checked = True
    State = cbChecked
    TabOrder = 2
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
