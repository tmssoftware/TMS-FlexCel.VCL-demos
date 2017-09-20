object FCompiler: TFCompiler
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Compiling Demo...'
  ClientHeight = 219
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    442
    219)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 14
    Width = 302
    Height = 13
    Caption = 'The demo has not been compiled yet, so we need to compile it.'
  end
  object MemoFeedback: TMemo
    Left = 16
    Top = 56
    Width = 407
    Height = 146
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 33
    Width = 407
    Height = 17
    Style = pbstMarquee
    TabOrder = 1
  end
end
