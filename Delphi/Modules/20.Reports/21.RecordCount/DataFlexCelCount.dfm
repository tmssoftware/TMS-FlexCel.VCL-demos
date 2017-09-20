object TablesFlexCelCount: TTablesFlexCelCount
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
    CursorType = ctOpenForwardOnly
    CommandText = 
      'select (select count(*)from categories) as __FLEXCELCOUNT , CATE' +
      'GORYID, CATEGORYNAME, DESCRIPTION, PICTURE from Categories'
    Parameters = <>
    Left = 80
    Top = 88
  end
  object Products: TADODataSet
    Connection = ADOConnection
    CursorType = ctOpenForwardOnly
    CommandText = 
      'select CATEGORYID, PRODUCTID, PRODUCTNAME, QUANTITYPERUNIT, UNIT' +
      'SINSTOCK, DISCONTINUED, UNITPRICE from Products'
    Parameters = <>
    Left = 160
    Top = 88
  end
end
