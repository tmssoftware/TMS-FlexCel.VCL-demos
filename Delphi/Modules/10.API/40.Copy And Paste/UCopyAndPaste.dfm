object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Copy and paste example'
  ClientHeight = 242
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 708
    Height = 33
    Align = alTop
    Alignment = taLeftJustify
    Caption = 
      '  1.  Begin by Creating a New TXlsFile object or opening an exis' +
      'ting file...'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 708
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object btnNewFile: TButton
      Left = 14
      Top = 6
      Width = 75
      Height = 25
      Caption = 'New File...'
      TabOrder = 0
      OnClick = btnNewFileClick
    end
    object btnOpenFile: TButton
      Left = 110
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Open File...'
      TabOrder = 1
      OnClick = btnOpenFileClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 74
    Width = 708
    Height = 33
    Align = alTop
    Alignment = taLeftJustify
    Caption = 
      '  2. If you created a new file, Go to Excel, copy some cells, an' +
      'd press the "Paste" button. If you opened a file, skip this step' +
      '.'
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 0
    Top = 107
    Width = 708
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object btnPaste: TButton
      Left = 14
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Paste!'
      TabOrder = 0
      OnClick = btnPasteClick
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 148
    Width = 708
    Height = 33
    Align = alTop
    Alignment = taLeftJustify
    Caption = 
      '  3.  After pasting, you can copy the results back to the clipbo' +
      'ard. Press the "Copy" button.'
    TabOrder = 4
  end
  object Panel6: TPanel
    Left = 0
    Top = 181
    Width = 708
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object btnCopy: TButton
      Left = 14
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Copy'
      TabOrder = 0
      OnClick = btnCopyClick
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Excel files|*.xls;*.xlsx;*.xlsm|All files|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select file to read...'
    Left = 208
    Top = 40
  end
end
