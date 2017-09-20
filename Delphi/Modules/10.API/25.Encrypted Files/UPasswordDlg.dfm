object PasswordDlg: TPasswordDlg
  Left = 0
  Top = 0
  ActiveControl = edPassword
  BorderStyle = bsDialog
  Caption = 'File is password protected'
  ClientHeight = 126
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    318
    126)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 232
    Height = 13
    Caption = 'Please enter the password to open the template'
  end
  object Label2: TLabel
    Left = 8
    Top = 27
    Width = 112
    Height = 13
    Caption = 'Hint: Password is 42'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 138
    Top = 93
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 219
    Top = 93
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object edPassword: TEdit
    Left = 8
    Top = 56
    Width = 289
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
end
