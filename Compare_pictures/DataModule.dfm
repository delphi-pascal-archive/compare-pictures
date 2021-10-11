object Data: TData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 198
  Top = 114
  Height = 150
  Width = 215
  object Table: TTable
    DatabaseName = '.\'
    TableName = 'BDD.db'
    Left = 48
    Top = 32
    object TableNom: TStringField
      FieldName = 'Nom'
      Size = 40
    end
    object TablePrenom: TStringField
      FieldName = 'Prenom'
      Size = 40
    end
    object TableAdresse: TMemoField
      FieldName = 'Adresse'
      BlobType = ftMemo
      Size = 240
    end
    object TablePhoto: TGraphicField
      FieldName = 'Photo'
      BlobType = ftGraphic
      Size = 240
    end
  end
  object DataSource: TDataSource
    DataSet = Table
    Left = 112
    Top = 32
  end
end
