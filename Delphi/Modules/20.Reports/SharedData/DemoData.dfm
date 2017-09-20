object DemoTables: TDemoTables
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 553
  Width = 470
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
  object Categories: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Categories'
    Parameters = <>
    Left = 80
    Top = 88
  end
  object Products: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Products where CATEGORYID = :CATEGORYID'
    DataSource = DsCategories
    Parameters = <
      item
        Name = 'CATEGORYID'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 216
    Top = 112
  end
  object DsCategories: TDataSource
    DataSet = Categories
    Left = 152
    Top = 112
  end
  object OrderDetails: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from [Order Details] where PRODUCTID = :PRODUCTID'
    DataSource = DsProducts
    Parameters = <
      item
        Name = 'PRODUCTID'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 344
    Top = 144
  end
  object DsProducts: TDataSource
    DataSet = Products
    Left = 272
    Top = 144
  end
  object Employees: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Employees'
    Parameters = <>
    Left = 72
    Top = 256
  end
  object Orders: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Orders where EmployeeId = :EmployeeId'
    DataSource = DsEmployees
    Parameters = <
      item
        Name = 'EmployeeId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 224
    Top = 304
  end
  object DsEmployees: TDataSource
    DataSet = Employees
    Left = 128
    Top = 304
  end
  object Suppliers: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Suppliers'
    Parameters = <>
    Left = 72
    Top = 368
  end
  object Shippers: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Shippers'
    Parameters = <>
    Left = 72
    Top = 432
  end
end
