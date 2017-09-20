object FeaturesDataModule: TFeaturesDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 418
  Width = 569
  object Categories: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Categories'
    Parameters = <>
    Left = 80
    Top = 88
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=features.mdb;Persis' +
      't Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 24
  end
  object Features: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 
      'select * from Features where CategoryId = :CategoryId order by P' +
      'ositionInSheet'
    DataSource = DsCategories
    Parameters = <
      item
        Name = 'CategoryId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 168
    Top = 88
  end
  object Hyperlinks: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from Hyperlinks where FeaturesId = :FeaturesId'
    DataSource = DsFeatures
    Parameters = <
      item
        Name = 'FeaturesId'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 256
    Top = 88
  end
  object DsCategories: TDataSource
    DataSet = Categories
    Left = 128
    Top = 144
  end
  object DsFeatures: TDataSource
    DataSet = Features
    Left = 216
    Top = 144
  end
end
