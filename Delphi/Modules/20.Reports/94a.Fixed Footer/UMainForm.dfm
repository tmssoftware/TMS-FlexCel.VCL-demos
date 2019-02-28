object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Fixed Footer'
  ClientHeight = 122
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    390
    122)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 308
    Height = 13
    Caption = 'Shows how to create a report with a footer fixed at the bottom.'
  end
  object btnCancel: TButton
    Left = 307
    Top = 89
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnGo: TButton
    Left = 226
    Top = 89
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Go!'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnGoClick
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Left = 344
    Top = 8
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Northwind.mdb;Persi' +
      'st Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 8
  end
  object Customers: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Customers'
    Parameters = <>
    Left = 104
    Top = 64
  end
  object Orders: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Orders order by orderid'
    Parameters = <
      item
        Name = 'EmployeeId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 56
    Top = 64
  end
end
