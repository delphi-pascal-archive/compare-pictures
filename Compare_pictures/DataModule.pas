unit DataModule;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TData = class(TDataModule)
    Table: TTable;
    DataSource: TDataSource;
    TableNom: TStringField;
    TablePrenom: TStringField;
    TableAdresse: TMemoField;
    TablePhoto: TGraphicField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Data: TData;

implementation

{$R *.dfm}

procedure TData.DataModuleCreate(Sender: TObject);
begin
Table.Open
end;

end.
