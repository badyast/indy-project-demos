object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 333
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    448
    333)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 115
    Top = 25
    Width = 60
    Height = 13
    Caption = 'DNS-Server:'
  end
  object Label2: TLabel
    Left = 115
    Top = 65
    Width = 42
    Height = 13
    Caption = 'Timeout:'
  end
  object Label3: TLabel
    Left = 317
    Top = 65
    Width = 13
    Height = 13
    Caption = 'ms'
  end
  object Label4: TLabel
    Left = 115
    Top = 105
    Width = 70
    Height = 13
    Caption = 'Domain-Name:'
  end
  object edDNS: TEdit
    Left = 190
    Top = 22
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '8.8.8.8'
  end
  object EdTimeOut: TEdit
    Left = 190
    Top = 62
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '5000'
  end
  object Edit3: TEdit
    Left = 191
    Top = 102
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit3'
  end
  object Button1: TButton
    Left = 115
    Top = 155
    Width = 196
    Height = 25
    Caption = 'Resolve'
    Default = True
    TabOrder = 3
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 35
    Top = 195
    Width = 371
    Height = 121
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object IdDNSResolver: TIdDNSResolver
    QueryType = []
    WaitingTime = 5000
    AllowRecursiveQueries = True
    IPVersion = Id_IPv4
    Left = 30
    Top = 15
  end
end
