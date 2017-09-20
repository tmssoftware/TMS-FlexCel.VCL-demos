object DemoTables: TDemoTables
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 542
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
    Left = 72
    Top = 112
    object ProductsProductID: TIntegerField
      FieldName = 'ProductID'
    end
    object ProductsProductName: TWideMemoField
      FieldName = 'ProductName'
      BlobType = ftWideMemo
    end
    object ProductsSupplierID: TIntegerField
      FieldName = 'SupplierID'
    end
    object ProductsCategoryID: TIntegerField
      FieldName = 'CategoryID'
    end
    object ProductsQuantityPerUnit: TWideMemoField
      FieldName = 'QuantityPerUnit'
      BlobType = ftWideMemo
    end
    object ProductsUnitPrice: TBCDField
      FieldName = 'UnitPrice'
      Precision = 19
    end
    object ProductsUnitsInStock: TSmallintField
      FieldName = 'UnitsInStock'
    end
    object ProductsUnitsOnOrder: TSmallintField
      FieldName = 'UnitsOnOrder'
    end
    object ProductsReorderLevel: TSmallintField
      FieldName = 'ReorderLevel'
    end
    object ProductsDiscontinued: TBooleanField
      FieldName = 'Discontinued'
    end
  end
  object OrderDetails: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from [Order Details] where PRODUCTID = :PRODUCTID'
    DataSource = DsProducts
    MasterFields = 'PRODUCTID'
    Parameters = <
      item
        Name = 'PRODUCTID'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 200
    Top = 144
    object OrderDetailsOrderID: TIntegerField
      FieldName = 'OrderID'
    end
    object OrderDetailsProductID: TIntegerField
      FieldName = 'ProductID'
    end
    object OrderDetailsUnitPrice: TBCDField
      FieldName = 'UnitPrice'
      Precision = 19
    end
    object OrderDetailsQuantity: TSmallintField
      FieldName = 'Quantity'
    end
    object OrderDetailsDiscount: TFloatField
      FieldName = 'Discount'
    end
  end
  object DsProducts: TDataSource
    DataSet = Products
    Left = 128
    Top = 144
  end
end
