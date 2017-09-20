object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Master-Detail on one table'
  ClientHeight = 97
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    414
    97)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 327
    Height = 13
    Caption = 
      'A demo on how to create a master-detail report with only one tab' +
      'le.'
  end
  object btnCancel: TButton
    Left = 331
    Top = 64
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnGo: TButton
    Left = 250
    Top = 64
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
    Left = 376
    Top = 8
  end
  object Data: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT Employees.Country, SUM([Order Details].UnitPrice * [Order' +
      ' Details].Quantity) AS Sales, COUNT([Order Details].Quantity) AS' +
      ' OrderCount, DatePart('#39'yyyy'#39', Orders.OrderDate) AS SaleYear, Dat' +
      'ePart('#39'q'#39', Orders.OrderDate) AS Quarter FROM ((Employees INNER J' +
      'OIN Orders ON Employees.EmployeeID = Orders.EmployeeID) INNER JO' +
      'IN [Order Details] ON Orders.OrderID = [Order Details].OrderID) ' +
      'GROUP BY Employees.Country, DatePart('#39'yyyy'#39', Orders.OrderDate), ' +
      'DatePart('#39'q'#39', Orders.OrderDate)'
    Parameters = <>
    Left = 80
    Top = 48
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
end
