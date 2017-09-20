object TablesSlowCount: TTablesSlowCount
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 344
  Width = 517
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Northwind.mdb;Persi' +
      'st Security Info=False;'
    CursorLocation = clUseServer
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 24
  end
  object Categories: TADODataSet
    Connection = ADOConnection
    CursorLocation = clUseServer
    CursorType = ctOpenForwardOnly
    CommandText = 'select * from Categories'
    Parameters = <>
    Left = 80
    Top = 88
  end
  object Products: TADODataSet
    Connection = ADOConnection
    CursorLocation = clUseServer
    CursorType = ctOpenForwardOnly
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
end
