object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 554
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 473
    Top = 128
    Width = 105
    Height = 105
  end
  object Image2: TImage
    Left = 473
    Top = 8
    Width = 105
    Height = 105
  end
  object DrawGrid1: TDrawGrid
    Left = 0
    Top = 0
    Width = 401
    Height = 209
    FixedCols = 0
    FixedRows = 0
    TabOrder = 0
    OnKeyDown = DrawGrid1KeyDown
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 424
    Top = 24
  end
  object MainMenu1: TMainMenu
    Left = 424
    Top = 64
    object N1: TMenuItem
      Caption = #1048#1075#1088#1072#1090#1100
      object N11: TMenuItem
        Caption = #1059#1088#1086#1074#1077#1085#1100' 1'
        OnClick = N11Click
      end
      object N21: TMenuItem
        Caption = #1059#1088#1086#1074#1077#1085#1100' 2'
        OnClick = N21Click
      end
      object N31: TMenuItem
        Caption = #1059#1088#1086#1074#1077#1085#1100' 3'
        OnClick = N31Click
      end
      object N41: TMenuItem
        Caption = #1059#1088#1086#1074#1077#1085#1100' 4'
        OnClick = N41Click
      end
      object N51: TMenuItem
        Caption = #1059#1088#1086#1074#1077#1085#1100' 5'
        OnClick = N51Click
      end
      object N61: TMenuItem
        Caption = #1059#1088#1086#1074#1077#1085#1100' 6'
        OnClick = N61Click
      end
    end
  end
end
