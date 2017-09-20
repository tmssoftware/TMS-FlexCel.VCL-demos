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
  object Customers: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Customers'
    Parameters = <>
    Left = 72
    Top = 256
    object CustomersCustomerID: TWideStringField
      FieldName = 'CustomerID'
      Size = 5
    end
    object CustomersCompanyName: TWideMemoField
      FieldName = 'CompanyName'
      BlobType = ftWideMemo
    end
    object CustomersContactName: TWideMemoField
      FieldName = 'ContactName'
      BlobType = ftWideMemo
    end
    object CustomersContactTitle: TWideMemoField
      FieldName = 'ContactTitle'
      BlobType = ftWideMemo
    end
    object CustomersAddress: TWideMemoField
      FieldName = 'Address'
      BlobType = ftWideMemo
    end
    object CustomersCity: TWideMemoField
      FieldName = 'City'
      BlobType = ftWideMemo
    end
    object CustomersRegion: TWideMemoField
      FieldName = 'Region'
      BlobType = ftWideMemo
    end
    object CustomersPostalCode: TWideMemoField
      FieldName = 'PostalCode'
      BlobType = ftWideMemo
    end
    object CustomersCountry: TWideMemoField
      FieldName = 'Country'
      BlobType = ftWideMemo
    end
    object CustomersPhone: TWideMemoField
      FieldName = 'Phone'
      BlobType = ftWideMemo
    end
    object CustomersFax: TWideMemoField
      FieldName = 'Fax'
      BlobType = ftWideMemo
    end
  end
  object Orders: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Orders where CustomerId = :CustomerId'
    DataSource = DsCustomers
    MasterFields = 'CustomerId'
    Parameters = <
      item
        Name = 'CustomerId'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    Left = 224
    Top = 304
    object OrdersOrderID: TIntegerField
      FieldName = 'OrderID'
    end
    object OrdersCustomerID: TWideStringField
      FieldName = 'CustomerID'
      Size = 5
    end
    object OrdersEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
    end
    object OrdersOrderDate: TDateTimeField
      FieldName = 'OrderDate'
    end
    object OrdersRequiredDate: TDateTimeField
      FieldName = 'RequiredDate'
    end
    object OrdersShippedDate: TDateTimeField
      FieldName = 'ShippedDate'
    end
    object OrdersShipVia: TIntegerField
      FieldName = 'ShipVia'
    end
    object OrdersFreight: TBCDField
      FieldName = 'Freight'
      Precision = 19
    end
    object OrdersShipName: TWideMemoField
      FieldName = 'ShipName'
      BlobType = ftWideMemo
    end
    object OrdersShipAddress: TWideMemoField
      FieldName = 'ShipAddress'
      BlobType = ftWideMemo
    end
    object OrdersShipCity: TWideMemoField
      FieldName = 'ShipCity'
      BlobType = ftWideMemo
    end
    object OrdersShipRegion: TWideMemoField
      FieldName = 'ShipRegion'
      BlobType = ftWideMemo
    end
    object OrdersShipPostalCode: TWideMemoField
      FieldName = 'ShipPostalCode'
      BlobType = ftWideMemo
    end
    object OrdersShipCountry: TWideMemoField
      FieldName = 'ShipCountry'
      BlobType = ftWideMemo
    end
  end
  object DsCustomers: TDataSource
    DataSet = Customers
    Left = 128
    Top = 304
  end
  object Employees: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Employees'
    Parameters = <>
    Left = 72
    Top = 128
  end
end
