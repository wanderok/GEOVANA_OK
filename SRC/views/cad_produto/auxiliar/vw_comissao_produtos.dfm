object frm_comissoes: Tfrm_comissoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Comiss'#245'es Produtos'
  ClientHeight = 237
  ClientWidth = 444
  Color = clMenuBar
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object Label4: TLabel
    Left = 8
    Top = 5
    Width = 200
    Height = 19
    Caption = 'Percentual de Comiss'#227'o '
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object GroupBox26: TGroupBox
    Left = 8
    Top = 104
    Width = 426
    Height = 56
    Caption = '  Comiss'#227'o Externa  '
    Color = clMenuBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label10: TLabel
      Left = 14
      Top = 26
      Width = 47
      Height = 18
      Caption = 'Varejo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label38: TLabel
      Left = 140
      Top = 26
      Width = 75
      Height = 18
      Caption = 'Distribuidor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label41: TLabel
      Left = 290
      Top = 26
      Width = 58
      Height = 18
      Caption = 'Atacado:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EXTERNA_COMISSAO_VAREJO: TEdit
      Left = 67
      Top = 22
      Width = 55
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clCaptionText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object EXTERNA_COMISSAO_DISTRIBUIDOR: TEdit
      Left = 222
      Top = 22
      Width = 55
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clCaptionText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EXTERNA_COMISSAO_ATACADO: TEdit
      Left = 356
      Top = 22
      Width = 57
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clDefault
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object GroupBox25: TGroupBox
    Left = 8
    Top = 40
    Width = 425
    Height = 52
    Caption = '  Comiss'#227'o Balc'#227'o  '
    Color = clMenuBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label42: TLabel
      Left = 11
      Top = 23
      Width = 47
      Height = 18
      Caption = 'Varejo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label85: TLabel
      Left = 139
      Top = 23
      Width = 75
      Height = 18
      Caption = 'Distribuidor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label87: TLabel
      Left = 289
      Top = 23
      Width = 58
      Height = 18
      Caption = 'Atacado:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object BALCAO_COMISSAO_ATACADO: TEdit
      Left = 355
      Top = 19
      Width = 57
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clCaptionText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object BALCAO_COMISSAO_DISTRIBUIDOR: TEdit
      Left = 221
      Top = 19
      Width = 55
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clCaptionText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object BALCAO_COMISSAO_VAREJO: TEdit
      Left = 66
      Top = 19
      Width = 55
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clCaptionText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = -372
    Top = 29
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    Style.BorderColor = clSkyBlue
    Style.Color = clSkyBlue
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clSkyBlue
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = clSkyBlue
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleDisabled.TextColor = clSkyBlue
    TabOrder = 2
    Height = 2
    Width = 817
  end
  object cxButton28: TcxButton
    Left = 331
    Top = 174
    Width = 103
    Height = 44
    Caption = 'Sair'
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Metropolis'
    OptionsImage.Glyph.Data = {
      36100000424D3610000000000000360000002800000020000000200000000100
      2000000000000010000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001010202000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010102020000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000005070F12354EA9C8151E424E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000016204552354EA9C80507
      1013000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000005070F123750AECD4463D8FF4261D3F9151E
      424E000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000162045524261D3F94463D8FF3750
      AECE050710130000000000000000000000000000000000000000000000000000
      0000000000000000000000000101354DA9C74463D8FF4463D8FF4463D8FF4261
      D3F9151E424E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000162045524261D3F94463D8FF4463D8FF4463
      D8FF354EA9C80000010100000000000000000000000000000000000000000000
      0000000000000000000000000000151E414D4261D3F94463D8FF4463D8FF4463
      D8FF4261D3F9151E424E00000000000000000000000000000000000000000000
      00000000000000000000162045524261D3F94463D8FF4463D8FF4463D8FF4261
      D3F9131C3E490000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000151E414D4261D3F94463D8FF4463
      D8FF4463D8FF4261D3F9151E424E000000000000000000000000000000000000
      000000000000162045524261D3F94463D8FF4463D8FF4463D8FF4261D3F9131C
      3E49000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000151E414D4261D3F94463
      D8FF4463D8FF4463D8FF4261D3F9151F434F0000000000000000000000000000
      0000162045524261D3F94463D8FF4463D8FF4463D8FF4261D3F9131C3E490000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000151E414D4261
      D3F94463D8FF4463D8FF4463D8FF4261D3F9151F434F00000000000000001620
      45524261D3F94463D8FF4463D8FF4463D8FF4261D3F9131C3E49000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000151E
      414D4261D3F94463D8FF4463D8FF4463D8FF4261D3F9151F434F162045524261
      D3F94463D8FF4463D8FF4463D8FF4261D3F9131C3E4900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000151E414D4261D3F94463D8FF4463D8FF4463D8FF4261D3F94261D3F94463
      D8FF4463D8FF4463D8FF4261D3F9131C3E490000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000151E414D4261D3F94463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF4261D3F9131C3E49000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000151E414D4261D3F94463D8FF4463D8FF4463D8FF4463
      D8FF4261D3F9131C3E4900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000162045524261D3F94463D8FF4463D8FF4463D8FF4463
      D8FF4261D3F9151F434F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000162045524261D3F94463D8FF4463D8FF4463D8FF4463D8FF4463
      D8FF4463D8FF4261D3F9151F434F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000162045524261D3F94463D8FF4463D8FF4463D8FF4261D3F94261D3F94463
      D8FF4463D8FF4463D8FF4261D3F9151F434F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001620
      45524261D3F94463D8FF4463D8FF4463D8FF4261D3F9131C3E49151E414D4261
      D3F94463D8FF4463D8FF4463D8FF4261D3F9151F434F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000162045524261
      D3F94463D8FF4463D8FF4463D8FF4261D3F9131C3E490000000000000000151E
      414D4261D3F94463D8FF4463D8FF4463D8FF4261D3F9151F434F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000162045524261D3F94463
      D8FF4463D8FF4463D8FF4261D3F9131C3E490000000000000000000000000000
      0000151E414D4261D3F94463D8FF4463D8FF4463D8FF4261D3F9151F434F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000162045524261D3F94463D8FF4463
      D8FF4463D8FF4261D3F9131C3E49000000000000000000000000000000000000
      000000000000151E414D4261D3F94463D8FF4463D8FF4463D8FF4261D3F9151F
      434F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000162046534261D3F94463D8FF4463D8FF4463
      D8FF4261D3F9131C3E4900000000000000000000000000000000000000000000
      00000000000000000000151E414D4261D3F94463D8FF4463D8FF4463D8FF4261
      D3F9151F434F0000000000000000000000000000000000000000000000000000
      0000000000000000000001010202354CA7C54463D8FF4463D8FF4463D8FF4261
      D3F9131C3E490000000000000000000000000000000000000000000000000000
      0000000000000000000000000000151E414D4261D3F94463D8FF4463D8FF4463
      D8FF354CA7C50000010100000000000000000000000000000000000000000000
      000000000000000000000000000004060D0F364EABCA4463D8FF4261D3F9131C
      3E49000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000151E414D4261D3F94463D8FF364F
      ACCB04060E100000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000004060D0F344CA5C3131C3E490000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000151E414D354CA7C50406
      0E10000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000010102020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 3
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
end