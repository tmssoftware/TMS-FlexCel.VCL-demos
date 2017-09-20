object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Splt Datasets'
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
    Width = 260
    Height = 13
    Caption = 'Shows how to split a dataset into groups of n records.'
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
    ExplicitLeft = 331
    ExplicitTop = 64
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
    ExplicitLeft = 250
    ExplicitTop = 64
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Left = 376
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
    Left = 216
    Top = 72
  end
  object Employees: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Employees'
    Parameters = <>
    Left = 32
    Top = 72
  end
  object DsEmployees: TDataSource
    DataSet = Employees
    Left = 96
    Top = 72
  end
  object Orders: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 
      'select * from Orders where EmployeeId = :EmployeeId order by ord' +
      'erid'
    DataSource = DsEmployees
    Parameters = <
      item
        Name = 'EmployeeId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 160
    Top = 72
  end
end
