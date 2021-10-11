program PicturesCompare;

uses
  Forms,
  AFirst in 'AFirst.pas' {AfirstPage},
  DataModule in 'DataModule.pas' {Data: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAfirstPage, AfirstPage);
  Application.CreateForm(TData, Data);
  Application.Run;
end.
