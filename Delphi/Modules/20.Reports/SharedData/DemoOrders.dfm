object DemoTables: TDemoTables
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 553
  Width = 601
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Northwind.mdb;Persi' +
      'st Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 24
  end
  object Orders: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Orders'
    Parameters = <>
    Left = 120
    Top = 88
  end
  object Customers: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Customers'
    Parameters = <>
    Left = 232
    Top = 88
  end
  object Employees: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Employees'
    Parameters = <>
    Left = 328
    Top = 88
  end
  object Shippers: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Shippers'
    Parameters = <>
    Left = 432
    Top = 88
  end
  object OrderDetails: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from [Order Details]'
    Parameters = <>
    Left = 520
    Top = 88
  end
  object Products: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Products'
    Parameters = <
      item
        Name = 'CATEGORYID'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 120
    Top = 168
  end
  object Suppliers: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Suppliers'
    Parameters = <>
    Left = 232
    Top = 168
  end
  object Categories: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Categories'
    Parameters = <>
    Left = 336
    Top = 168
  end
end
