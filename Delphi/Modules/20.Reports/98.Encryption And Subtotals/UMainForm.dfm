object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Encryption and Subtotals'
  ClientHeight = 329
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    482
    329)
  PixelsPerInch = 96
  TextHeight = 13
  object btnCancel: TButton
    Left = 399
    Top = 296
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnGo: TButton
    Left = 318
    Top = 296
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Go!'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnGoClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 466
    Height = 81
    Anchors = [akLeft, akTop, akRight]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 379
      Height = 13
      Caption = 
        'The template is protected with a password to open. On this demo,' +
        ' it is "flexcel"'
    end
    object OpenPassTemplate: TLabeledEdit
      Left = 8
      Top = 45
      Width = 217
      Height = 21
      EditLabel.Width = 154
      EditLabel.Height = 13
      EditLabel.Caption = 'Password to open the template:'
      TabOrder = 0
      Text = 'flexcel'
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 95
    Width = 466
    Height = 194
    Anchors = [akLeft, akTop, akRight]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 421
      Height = 26
      Caption = 
        'Here we enter the passwords we want to protect the generated she' +
        'ets and workbook. Leave them blank to have no password.'
      WordWrap = True
    end
    object OpenPassGenerated: TLabeledEdit
      Left = 8
      Top = 69
      Width = 185
      Height = 21
      EditLabel.Width = 175
      EditLabel.Height = 13
      EditLabel.Caption = 'Password to open the generated file'
      TabOrder = 0
      Text = 'open'
    end
    object ModifyPassGenerated: TLabeledEdit
      Left = 8
      Top = 116
      Width = 185
      Height = 21
      EditLabel.Width = 183
      EditLabel.Height = 13
      EditLabel.Caption = 'Password to modify the generated file'
      TabOrder = 1
      Text = 'modify'
    end
    object ProtectWorkbookPass: TLabeledEdit
      Left = 216
      Top = 69
      Width = 137
      Height = 21
      EditLabel.Width = 218
      EditLabel.Height = 13
      EditLabel.Caption = 'Password to protect the generated workbook'
      TabOrder = 2
      Text = 'workbook'
    end
    object ProtectSheetPass: TLabeledEdit
      Left = 216
      Top = 116
      Width = 137
      Height = 21
      EditLabel.Width = 204
      EditLabel.Height = 13
      EditLabel.Caption = 'Password to protect the generated sheets'
      TabOrder = 3
      Text = 'sheet'
    end
    object ProtectWorkbook: TCheckBox
      Left = 375
      Top = 71
      Width = 74
      Height = 17
      Caption = 'Protect'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object ProtectSheet: TCheckBox
      Left = 375
      Top = 118
      Width = 74
      Height = 17
      Caption = 'Protect'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object ReservingUser: TLabeledEdit
      Left = 8
      Top = 164
      Width = 185
      Height = 21
      EditLabel.Width = 185
      EditLabel.Height = 13
      EditLabel.Caption = 'Reserving user: (for modify password)'
      TabOrder = 6
      Text = 'flexcel user'
    end
    object RecommendReadOnly: TCheckBox
      Left = 216
      Top = 168
      Width = 217
      Height = 17
      Caption = 'Recommend read only'
      TabOrder = 7
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Left = 408
    Top = 8
  end
end
