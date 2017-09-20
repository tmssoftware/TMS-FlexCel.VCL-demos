object ProgressDialog: TProgressDialog
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Please wait...'
  ClientHeight = 187
  ClientWidth = 376
  Color = clBtnFace
  Constraints.MaxHeight = 215
  Constraints.MaxWidth = 382
  Constraints.MinHeight = 215
  Constraints.MinWidth = 382
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  GlassFrame.Enabled = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 353
    Height = 113
    AutoSize = False
    Caption = 
      'FlexCel is indexing all documents and text in the demos. This mi' +
      'ght take some time, but full indexing will be made only once. If' +
      ' you have already run MainDemo in this machine, the index will b' +
      'e read from a cache and will be faster.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lblElapsedTime: TLabel
    Left = 8
    Top = 166
    Width = 111
    Height = 13
    Caption = 'Elapsed time: 00:00:00'
  end
  object TimerElapsedTime: TTimer
    Enabled = False
    OnTimer = TimerElapsedTimeTimer
    Left = 176
    Top = 96
  end
end
