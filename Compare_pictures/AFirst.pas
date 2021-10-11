unit AFirst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Buttons, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids,
  Mask, ExtDlgs, DB;

type
  TAfirstPage = class(TForm)
    PlPictures: TPanel;
    PageControl: TPageControl;
    TBSFiche: TTabSheet;
    TBSListe: TTabSheet;
    LLoad: TLabel;
    BBLoad: TBitBtn;
    PlButtons: TPanel;
    SBReash: TSpeedButton;
    SBFermer: TSpeedButton;
    DBNavigator: TDBNavigator;
    LNom: TLabel;
    DBENom: TDBEdit;
    LPrenom: TLabel;
    DBEPrenom: TDBEdit;
    LAdresse: TLabel;
    DBAdresse: TDBMemo;
    LTof: TLabel;
    DBGrid: TDBGrid;
    PlPicture: TPanel;
    RPhoto: TImage;
    DBPhoto: TDBImage;
    OPD: TOpenPictureDialog;
    procedure BBLoadClick(Sender: TObject);
    procedure DBPhotoDblClick(Sender: TObject);
    procedure SBReashClick(Sender: TObject);
    procedure SBFermerClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  AfirstPage: TAfirstPage;

implementation

uses DataModule;

{$R *.dfm}

Procedure CompareBitmaps(Const BitmapA, BitmapB:  TBitmap;
                           VAR Total, Sim, Diff:  Integer);
// Total:total des pixel, Sim:Pixels similaires, Diff:Pixels dirréfents
    Type

      TRGBTripleArray =  ARRAY[WORD] OF TRGBTriple;
      pRGBTripleArray =  ^TRGBTripleArray;

    Var
      i   :  INTEGER;
      j   :  INTEGER;
      RowA:  pRGBTripleArray;
      RowB:  pRGBTripleArray;

  begin
// Forcer les deux Bitmaps à avoir les même dimensions (hauteur et largeur)
    Assert( (BitmapA.width  = BitmapB.width) AND
            (BitmapA.height = BitmapB.height),  'Different sizes');

// Forcer les deux Bitmaps à avoir le meme format de pixel= pf24bit
    BitmapA.PixelFormat := pf24bit;
    BitmapB.PixelFormat := pf24bit;
// calculer le ttal de pixels
// total= Largeur * hauteur
    Total  := BitmapA.width * BitmapA.height;
//Initialiser la variable des pixels similaires
    SIM  := 0;
// Initialiser la variable des pixels de différence
    Diff := 0;
// pour j do 0 jusqu'à la hauteur de BitmapA alors
    For j := 0 to BitmapA.Height-1 do
    begin
      RowA := BitmapA.Scanline[j];
      RowB := BitmapB.Scanline[j];
// pour i do 0 jusqu'à la largeur de BitmapA alors
      For i := 0 to BitmapA.Width-1 DO
      begin

{$IFDEF DELPHI6}
{$DEFINE SIMPLEWAY}
{$ENDIF}
{$IFDEF SIMPLEWAY}

//Si le pixel de A est égale au pixel de B alors (c'est une simulations des pixels)
        If   RowA[i] = RowB[i] Then
// incrémonter la valeur des pixel similaires
        inc(Sim)
// Si non Pixels de A n'égale pas à pixel de B alors (c'est une différence de pixels)
        else inc(Diff)
{$ELSE}              // D3 and D4 cannot use "simple" way
        // "bug" in earlier versions forces more code for test
        If   (RowA[i].RGBtRed   = RowB[i].RGBtRed)   AND
             (RowA[i].RGBtGreen = RowB[i].RGBtGreen) AND
             (RowA[i].RGBtBlue  = RowB[i].RGBtBlue)
        Then inc(Sim)
        Else inc(Diff)
{$ENDIF}

      End

    End
end {CompareBitmaps};

procedure TAfirstPage.BBLoadClick(Sender: TObject);
begin
If OPD.Execute then
RPhoto.Picture.LoadFromFile(OPD.FileName);
end;

procedure TAfirstPage.DBPhotoDblClick(Sender: TObject);
begin
if (Data.Table.State in [DsEdit,DsInsert]) then

if OPD.Execute then
DBPhoto.Picture.LoadFromFile(OPD.FileName);
end;

procedure TAfirstPage.SBReashClick(Sender: TObject);
  VAR
    NPhoto1:  TBitmap;
    NPhoto2:  TBitmap;       // Nouvelles photos  Bitmaps
    PixelsDiffer:  INTEGER;  // pixels de dirrérence
    PixelsMatch :  INTEGER;  // Pixels simillaires
    PixelsTotal :  INTEGER;  // Total des pixels pour chauqe image
begin
// Créer les nouvelles photos
  NPhoto1:= TBitmap.Create;
  NPhoto2:= TBitmap.Create;
  Try
// Affecter la photo Recherchée à la nouvelle photo pour la comparaison
    NPhoto2.Assign(RPhoto.Picture);

// Mettre la table en premier enregistrement
Data.Table.First;
//Repeter

Repeat
  // Affecter la photo eregistré dans la BDD à la nouvelle photo crée
    NPhoto1.Assign(DBPhoto.Picture);
  // Comparer les deux nouvelles photos total des pixels, pixels sémilaires, et de différence
    CompareBitmaps(NPhoto1, NPhoto2, PixelsTotal, PixelsMatch, PixelsDiffer);
  // si il y'a aucune différence
 if PixelsDiffer=0 then
  begin
   //Affichier un message
    ShowMessage('This is a: '+ Data.Table.Fields[0].Text+ ', '+  Data.Table.Fields[1].Text);
   // annuler l''opération suivante
    exit;
  // Si non
  end else
   // Se mettre au deuxième enregistrement
    Data.Table.Next;
// terminer -repeter- si la fin de fichier
until Data.Table.Eof

  Finally
  //Libérer les nouvelles photos crées
      NPhoto1.Free;
      NPhoto2.Free
  end // Fin de Try

end;

procedure TAfirstPage.SBFermerClick(Sender: TObject);
begin
 Application.Terminate; // terminer l'application
end;

end.
