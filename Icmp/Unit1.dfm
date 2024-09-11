object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ICMP'
  ClientHeight = 211
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 25
    Top = 20
    Width = 46
    Height = 13
    Caption = 'Ziel-Host:'
  end
  object edHost: TEdit
    Left = 95
    Top = 17
    Width = 166
    Height = 21
    TabOrder = 0
  end
  object btnGo: TButton
    Left = 95
    Top = 55
    Width = 75
    Height = 25
    Caption = 'Go'
    TabOrder = 1
    OnClick = btnGoClick
  end
  object Memo1: TMemo
    Left = 25
    Top = 95
    Width = 371
    Height = 89
    ReadOnly = True
    TabOrder = 2
  end
  object IdIcmpClient1: TIdIcmpClient
    Protocol = 1
    ProtocolIPv6 = 0
    IPVersion = Id_IPv4
    PacketSize = 1024
    Left = 350
    Top = 15
  end
end
