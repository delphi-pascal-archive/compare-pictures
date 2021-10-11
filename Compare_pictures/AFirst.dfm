object AfirstPage: TAfirstPage
  Left = 228
  Top = 128
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Compare pictures'
  ClientHeight = 545
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 120
  TextHeight = 16
  object PlPictures: TPanel
    Left = 8
    Top = 8
    Width = 737
    Height = 225
    BevelOuter = bvLowered
    TabOrder = 0
    object LLoad: TLabel
      Left = 138
      Top = 108
      Width = 84
      Height = 18
      Caption = 'Put a photo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BBLoad: TBitBtn
      Left = 259
      Top = 98
      Width = 110
      Height = 31
      Caption = '&Open ...'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = BBLoadClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object PlPicture: TPanel
      Left = 528
      Top = 8
      Width = 193
      Height = 209
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 1
      object RPhoto: TImage
        Left = 8
        Top = 8
        Width = 177
        Height = 193
      end
    end
  end
  object PageControl: TPageControl
    Left = 8
    Top = 240
    Width = 737
    Height = 241
    ActivePage = TBSFiche
    TabOrder = 1
    object TBSFiche: TTabSheet
      Caption = 'DB Records'
      object LNom: TLabel
        Left = 8
        Top = 8
        Width = 43
        Height = 18
        Caption = 'Name'
        FocusControl = DBENom
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LPrenom: TLabel
        Left = 8
        Top = 64
        Width = 57
        Height = 18
        Caption = 'Prenom'
        FocusControl = DBEPrenom
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LAdresse: TLabel
        Left = 8
        Top = 120
        Width = 60
        Height = 18
        Caption = 'Address'
        FocusControl = DBAdresse
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LTof: TLabel
        Left = 458
        Top = 100
        Width = 43
        Height = 18
        Caption = 'Photo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBENom: TDBEdit
        Left = 8
        Top = 32
        Width = 417
        Height = 24
        DataField = 'Nom'
        DataSource = Data.DataSource
        TabOrder = 0
      end
      object DBEPrenom: TDBEdit
        Left = 8
        Top = 88
        Width = 417
        Height = 24
        DataField = 'Prenom'
        DataSource = Data.DataSource
        TabOrder = 1
      end
      object DBAdresse: TDBMemo
        Left = 8
        Top = 144
        Width = 417
        Height = 57
        DataField = 'Adresse'
        DataSource = Data.DataSource
        TabOrder = 2
      end
      object DBPhoto: TDBImage
        Left = 515
        Top = 8
        Width = 198
        Height = 193
        Hint = 'Doubble cliques pour telecharger une image'
        DataField = 'Photo'
        DataSource = Data.DataSource
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = DBPhotoDblClick
      end
    end
    object TBSListe: TTabSheet
      Caption = 'List'
      ImageIndex = 1
      object DBGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 729
        Height = 210
        Align = alClient
        DataSource = Data.DataSource
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Nom'
            Title.Color = clBlack
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Prenom'
            Title.Color = clBlack
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Adresse'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Photo'
            Visible = False
          end>
      end
    end
  end
  object PlButtons: TPanel
    Left = 8
    Top = 488
    Width = 737
    Height = 49
    TabOrder = 2
    object SBReash: TSpeedButton
      Left = 10
      Top = 10
      Width = 271
      Height = 31
      Caption = '&Compare pictures'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SBReashClick
    end
    object SBFermer: TSpeedButton
      Left = 640
      Top = 10
      Width = 81
      Height = 31
      Caption = '&Close'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SBFermerClick
    end
    object DBNavigator: TDBNavigator
      Left = 288
      Top = 10
      Width = 342
      Height = 31
      DataSource = Data.DataSource
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Flat = True
      TabOrder = 0
    end
  end
  object OPD: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 280
    Top = 152
  end
end
