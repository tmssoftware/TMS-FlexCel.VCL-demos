object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Direct SQL'
  ClientHeight = 160
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    414
    160)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 310
    Height = 13
    Caption = 'A demo on how to write SQL statements directly in the template.'
  end
  object Label2: TLabel
    Left = 24
    Top = 53
    Width = 100
    Height = 13
    Caption = 'Get orders between:'
  end
  object btnCancel: TButton
    Left = 331
    Top = 127
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnGo: TButton
    Left = 250
    Top = 127
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Go!'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnGoClick
  end
  object dtStartDate: TDateTimePicker
    Left = 24
    Top = 72
    Width = 113
    Height = 21
    Date = 35065.48535746528000000
    Time = 35065.48535746528000000
    TabOrder = 2
  end
  object dtEndDate: TDateTimePicker
    Left = 168
    Top = 72
    Width = 113
    Height = 21
    Date = 35431.48535746528000000
    Time = 35431.48535746528000000
    TabOrder = 3
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xlsx'
    Filter = 'Excel 2007 or newer|*.xlsx|Excel 97-2003|*.xls'
    Left = 376
    Top = 8
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Northwind.mdb;Persi' +
      'st Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 112
  end
end
