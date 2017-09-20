object MailDialog: TMailDialog
  Left = 0
  Top = 0
  ActiveControl = edFrom
  Caption = 'Send mail...'
  ClientHeight = 320
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    472
    320)
  PixelsPerInch = 96
  TextHeight = 13
  object edFrom: TLabeledEdit
    Left = 56
    Top = 24
    Width = 385
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'From'
    LabelPosition = lpLeft
    TabOrder = 0
    Text = 'myname@mycompany.com'
    OnExit = edFromExit
  end
  object edTo: TLabeledEdit
    Left = 56
    Top = 51
    Width = 385
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 12
    EditLabel.Height = 13
    EditLabel.Caption = 'To'
    LabelPosition = lpLeft
    TabOrder = 1
    Text = 'user@hiscompany.com'
  end
  object edSubject: TLabeledEdit
    Left = 56
    Top = 78
    Width = 385
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'Subject'
    LabelPosition = lpLeft
    TabOrder = 2
    Text = 'A test from FlexCel'
  end
  object edOutServer: TLabeledEdit
    Left = 128
    Top = 126
    Width = 313
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 100
    EditLabel.Height = 13
    EditLabel.Caption = 'Outgoing Mail Server'
    LabelPosition = lpLeft
    TabOrder = 3
    Text = 'pop.mycompany.com'
  end
  object btnSend: TButton
    Left = 285
    Top = 277
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Send'
    Default = True
    TabOrder = 7
    OnClick = btnSendClick
  end
  object btnCancel: TButton
    Left = 366
    Top = 277
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 8
  end
  object edPort: TLabeledEdit
    Left = 128
    Top = 177
    Width = 313
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 20
    EditLabel.Height = 13
    EditLabel.Caption = 'Port'
    LabelPosition = lpLeft
    TabOrder = 4
    Text = '587'
  end
  object edUserName: TLabeledEdit
    Left = 128
    Top = 204
    Width = 313
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'User Name'
    LabelPosition = lpLeft
    TabOrder = 5
  end
  object edPassword: TLabeledEdit
    Left = 128
    Top = 231
    Width = 313
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Password'
    LabelPosition = lpLeft
    PasswordChar = '*'
    TabOrder = 6
  end
  object cbUseTLS: TCheckBox
    Left = 128
    Top = 153
    Width = 97
    Height = 17
    Caption = 'Use TLS'
    Checked = True
    State = cbChecked
    TabOrder = 9
    OnClick = cbUseTLSClick
  end
  object Mailer: TIdSMTP
    IOHandler = SSLHandler
    SASLMechanisms = <>
    Left = 80
    Top = 272
  end
  object Msg: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 136
    Top = 272
  end
  object SSLHandler: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 192
    Top = 272
  end
end
