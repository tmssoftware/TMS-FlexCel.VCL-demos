object PasswordDialog: TPasswordDialog
  Left = 0
  Top = 0
  ActiveControl = edPassword
  BorderStyle = bsDialog
  Caption = 'File is password protected'
  ClientHeight = 126
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    381
    126)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 208
    Height = 13
    Caption = 'Please enter the password to open the file:'
  end
  object lblFileName: TLabel
    Left = 16
    Top = 27
    Width = 14
    Height = 13
    Caption = 'file'
  end
  object Button1: TButton
    Left = 201
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
    Left = 282
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
    Left = 16
    Top = 59
    Width = 341
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
end
