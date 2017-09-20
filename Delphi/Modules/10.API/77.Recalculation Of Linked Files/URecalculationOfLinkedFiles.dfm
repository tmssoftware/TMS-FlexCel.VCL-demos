object FRecalculationOfLinkedFiles: TFRecalculationOfLinkedFiles
  Left = 0
  Top = 0
  Caption = 'Calculating linked files'
  ClientHeight = 171
  ClientWidth = 816
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    816
    171)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 800
    Height = 153
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 800
      Height = 13
      Align = alTop
      Caption = 
        'In this example we will dynamically create 3 linked files. We wi' +
        'll create a workspace to link the files, and see how recalculati' +
        'on works.'
      WordWrap = True
      ExplicitWidth = 635
    end
    object Label2: TLabel
      Left = 0
      Top = 53
      Width = 58
      Height = 13
      Caption = 'First file: A1'
      FocusControl = CellA1
    end
    object Label3: TLabel
      Left = 0
      Top = 72
      Width = 44
      Height = 13
      Caption = 'Constant'
    end
    object Label4: TLabel
      Left = 192
      Top = 72
      Width = 142
      Height = 13
      Caption = '=[First File.xls]Sheet1!A1 * 2'
    end
    object Label5: TLabel
      Left = 192
      Top = 53
      Width = 72
      Height = 13
      Caption = 'Second file: A1'
      FocusControl = Cell2
    end
    object Label6: TLabel
      Left = 384
      Top = 72
      Width = 156
      Height = 13
      Caption = '=[Second File.xls]Sheet1!A1 * 5'
    end
    object Label7: TLabel
      Left = 384
      Top = 53
      Width = 61
      Height = 13
      Caption = 'Third file: A1'
      FocusControl = Cell3
    end
    object Label8: TLabel
      Left = 576
      Top = 53
      Width = 58
      Height = 13
      Caption = 'First file: A2'
      FocusControl = Cell4
    end
    object Label9: TLabel
      Left = 576
      Top = 72
      Width = 147
      Height = 13
      Caption = '=[Third File.xls]Sheet1!A1 + 7'
    end
    object CellA1: TEdit
      Left = 0
      Top = 91
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = CellA1Change
    end
    object Cell2: TEdit
      Left = 192
      Top = 91
      Width = 169
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object Cell3: TEdit
      Left = 384
      Top = 91
      Width = 169
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object Cell4: TEdit
      Left = 576
      Top = 91
      Width = 169
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
  end
end
