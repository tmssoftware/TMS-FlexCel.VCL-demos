object EnterSQL: TEnterSQL
  Left = 0
  Top = 0
  Caption = 'Enter SQL'
  ClientHeight = 218
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    476
    218)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 460
    Height = 39
    Anchors = [akLeft, akTop, akRight]
    Caption = 
      'You can select from the tables: ORDERS, EMPLOYEES, SHIPPERS and ' +
      'CUSTOMERS. You can also do joins bewtween them'
    WordWrap = True
  end
  object edSQL: TMemo
    Left = 8
    Top = 48
    Width = 460
    Height = 121
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'select * from ORDERS')
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 393
    Top = 185
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 312
    Top = 185
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
end
