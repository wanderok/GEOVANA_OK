object frm_cad_fornecedor_T19: Tfrm_cad_fornecedor_T19
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro | Fornecedor'
  ClientHeight = 483
  ClientWidth = 968
  Color = clWhite
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label16: TLabel
    Left = 22
    Top = 111
    Width = 63
    Height = 18
    Caption = 'Atividade:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 5
    Top = 27
    Width = 51
    Height = 18
    Caption = 'C'#243'digo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 172
    Top = 25
    Width = 39
    Height = 18
    Caption = 'Ativo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 172
    Top = 56
    Width = 54
    Height = 18
    Caption = 'Inativo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 172
    Top = 40
    Width = 78
    Height = 18
    Caption = 'Bloqueado'
    Font.Charset = ANSI_CHARSET
    Font.Color = 33023
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbNomeDaTela: TLabel
    Left = 0
    Top = 470
    Width = 968
    Height = 13
    Align = alBottom
    Alignment = taRightJustify
    Caption = '[ T19 ] '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 928
    ExplicitWidth = 40
  end
  object rgStatus: TRadioGroup
    Left = 143
    Top = 8
    Width = 111
    Height = 73
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      ''
      ''
      '')
    ParentFont = False
    TabOrder = 1
  end
  object gpData: TGroupBox
    Left = 260
    Top = 8
    Width = 301
    Height = 73
    Caption = '  Datas '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    object Label13: TLabel
      Left = 9
      Top = 16
      Width = 58
      Height = 18
      Caption = 'Cadastro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbInativo: TLabel
      Left = 101
      Top = 16
      Width = 53
      Height = 18
      Caption = 'Bloqueio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 221
      Top = 16
      Width = 68
      Height = 18
      Caption = 'Inativa'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btDetalhesBloqueio: TcxButton
      Left = 173
      Top = 37
      Width = 34
      Height = 26
      Hint = 'Detalhes do bloqueio'
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Metropolis'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000020000000E0B14308329448DFB1D2F58A5000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000020000000E0D1937883C6DB2FF5BB1F9FF325196F4000000000000
        00000000000100000004000000090000000D0000000F0000000F0000000C0000
        00070000000E0F1D3C864A7CBCFF73C4FFFF467CC3FF17254485000000000000
        0002000000081C130F465A3B31BC7C5043F87F5244FF7B4E42FA57382FC11E14
        1059112142875686C2FF88D0FFFF5186C7FF142343880000000F000000010302
        02104A332C91946B5DFDC6ACA1FFE4D1C6FFEDDDD2FFE2D0C5FFC0A599FF855C
        50FF6E6B7EFF98D4F8FF5B8ECBFF152545840000000D00000002000000076046
        3DA6B39288FFE9DAD0FFDAC0A1FFCBA87AFFC49B66FFCCAA7EFFDCC2A5FFE5D2
        C6FF9A766AFF736A77FF162747850000000E00000002000000002A201D4AAE88
        7CFFEFE6DFFFCDA67CFFCDA26BFFE3C28CFFEDD5A2FFE7CD9EFFD3B182FFD0AE
        88FFE7D5CAFF885F53FF25181464000000070000000000000000755B53ACDFCE
        C9FFDDC1A8FFC99865FFE8BE83FFE9C388FFEDCA97FFEFD3A7FFF2D9B0FFD5B1
        87FFDBBEA6FFC5ACA2FF5A3D33C10000000C0000000000000000A9877CE9F8F4
        F2FFC79873FFDEAB77FFEFCDABFFF0D0B1FFEDC9A1FFECC69AFFEFCFA9FFE9C9
        A4FFC89B77FFE6D6CEFF7C5448F10000000F0000000000000000C09C90FFFDFD
        FCFFBE875FFFEDCFB9FFF5DFD2FFF2D6C1FFF1CFB4FFEDC6A4FFECC19BFFEFC8
        A6FFC08B67FFF1E6DFFF8B6154FF0000000F0000000000000000AF9186E6F9F5
        F4FFC69474FFE8CDC3FFF9E8E4FFF6DED2FFF3D4C2FFF0CBB2FFEBB78EFFE5B7
        92FFC59172FFEBDFD9FF866055EE0000000D0000000000000000876F68B0E7D9
        D4FFE2C6B7FFC89072FFFAEFF2FFF9E7E4FFF6DDD3FFF1C8B2FFEBAF88FFC98E
        6CFFDCBBAAFFD3C0B7FF6B4F46BC00000009000000000000000026201E36CCAF
        A7FAFBF8F7FFCF9F88FFC78E72FFE9CDC6FFEDC7B5FFDD9F79FFC88865FFCE9D
        84FFF5EFEBFFB39387FF2A201D52000000040000000000000000000000036454
        4F84D9C2BAFFFDFBFAFFE2C6B8FFCB977EFFC08163FFCB977DFFE0C4B4FFFAF6
        F5FFC9B0A7FF6B564EA700000009000000010000000000000000000000000202
        020762534D81CEB2A9FAEADDD8FFF9F5F4FFFFFFFFFFF9F5F4FFE9DCD7FFC8AC
        A2FC62504B900404031000000002000000000000000000000000000000000000
        000000000003241F1D3486726BADB69B91E6CCADA1FFB99C92E988736CB22822
        1F3E000000060000000100000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      TabStop = False
      OnClick = btDetalhesBloqueioClick
    end
    object edDataCadastro: TMaskEdit
      Left = 8
      Top = 37
      Width = 73
      Height = 26
      Hint = 'Data de Cadastro'
      TabStop = False
      Color = clWhite
      EditMask = '!99/99/00;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '  /  /  '
    end
    object edDataBloqueio: TMaskEdit
      Left = 99
      Top = 37
      Width = 74
      Height = 26
      Hint = 'Data em que ficou inativo'
      TabStop = False
      Color = clWhite
      EditMask = '!99/99/00;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '  /  /  '
    end
    object edDataInativo: TMaskEdit
      Left = 221
      Top = 37
      Width = 74
      Height = 26
      Hint = 'Data em que ficou inativo'
      TabStop = False
      Color = clWhite
      EditMask = '!99/99/00;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '  /  /  '
    end
  end
  object edCodigo: TEdit
    Left = 3
    Top = 47
    Width = 137
    Height = 31
    Hint = 'C'#243'digo do Cliente'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    OnExit = edCodigoExit
    OnKeyDown = edCodigoKeyDown
  end
  object GroupBox5: TGroupBox
    Left = 558
    Top = 8
    Width = 403
    Height = 73
    Caption = '  '#218'ltima Altera'#231#227'o '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    object TLabel
      Left = 18
      Top = 18
      Width = 31
      Height = 17
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 86
      Top = 18
      Width = 31
      Height = 17
      Caption = 'Hora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 152
      Top = 18
      Width = 50
      Height = 17
      Caption = 'Usu'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 253
      Top = 17
      Width = 55
      Height = 17
      Caption = 'Terminal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 497
      Top = 20
      Width = 42
      Height = 13
      Caption = 'Detalhes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edUSU: TEdit
      Tag = 3
      Left = 152
      Top = 37
      Width = 101
      Height = 26
      TabStop = False
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edDT: TMaskEdit
      Tag = 3
      Left = 18
      Top = 37
      Width = 68
      Height = 26
      Hint = 'Data em que ficou inativo'
      TabStop = False
      Color = clWhite
      EditMask = '!99/99/00;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '  /  /  '
    end
    object edHR: TEdit
      Left = 86
      Top = 37
      Width = 66
      Height = 26
      TabStop = False
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edEstacao: TEdit
      Tag = 3
      Left = 253
      Top = 37
      Width = 110
      Height = 26
      TabStop = False
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object bHistoricoAlteracoes: TcxButton
      Left = 364
      Top = 37
      Width = 35
      Height = 26
      Hint = 'Hist'#243'rico de Bloqueios'
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Metropolis'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000020000000E0B14308329448DFB1D2F58A5000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000020000000E0D1937883C6DB2FF5BB1F9FF325196F4000000000000
        00000000000100000004000000090000000D0000000F0000000F0000000C0000
        00070000000E0F1D3C864A7CBCFF73C4FFFF467CC3FF17254485000000000000
        0002000000081C130F465A3B31BC7C5043F87F5244FF7B4E42FA57382FC11E14
        1059112142875686C2FF88D0FFFF5186C7FF142343880000000F000000010302
        02104A332C91946B5DFDC6ACA1FFE4D1C6FFEDDDD2FFE2D0C5FFC0A599FF855C
        50FF6E6B7EFF98D4F8FF5B8ECBFF152545840000000D00000002000000076046
        3DA6B39288FFE9DAD0FFDAC0A1FFCBA87AFFC49B66FFCCAA7EFFDCC2A5FFE5D2
        C6FF9A766AFF736A77FF162747850000000E00000002000000002A201D4AAE88
        7CFFEFE6DFFFCDA67CFFCDA26BFFE3C28CFFEDD5A2FFE7CD9EFFD3B182FFD0AE
        88FFE7D5CAFF885F53FF25181464000000070000000000000000755B53ACDFCE
        C9FFDDC1A8FFC99865FFE8BE83FFE9C388FFEDCA97FFEFD3A7FFF2D9B0FFD5B1
        87FFDBBEA6FFC5ACA2FF5A3D33C10000000C0000000000000000A9877CE9F8F4
        F2FFC79873FFDEAB77FFEFCDABFFF0D0B1FFEDC9A1FFECC69AFFEFCFA9FFE9C9
        A4FFC89B77FFE6D6CEFF7C5448F10000000F0000000000000000C09C90FFFDFD
        FCFFBE875FFFEDCFB9FFF5DFD2FFF2D6C1FFF1CFB4FFEDC6A4FFECC19BFFEFC8
        A6FFC08B67FFF1E6DFFF8B6154FF0000000F0000000000000000AF9186E6F9F5
        F4FFC69474FFE8CDC3FFF9E8E4FFF6DED2FFF3D4C2FFF0CBB2FFEBB78EFFE5B7
        92FFC59172FFEBDFD9FF866055EE0000000D0000000000000000876F68B0E7D9
        D4FFE2C6B7FFC89072FFFAEFF2FFF9E7E4FFF6DDD3FFF1C8B2FFEBAF88FFC98E
        6CFFDCBBAAFFD3C0B7FF6B4F46BC00000009000000000000000026201E36CCAF
        A7FAFBF8F7FFCF9F88FFC78E72FFE9CDC6FFEDC7B5FFDD9F79FFC88865FFCE9D
        84FFF5EFEBFFB39387FF2A201D52000000040000000000000000000000036454
        4F84D9C2BAFFFDFBFAFFE2C6B8FFCB977EFFC08163FFCB977DFFE0C4B4FFFAF6
        F5FFC9B0A7FF6B564EA700000009000000010000000000000000000000000202
        020762534D81CEB2A9FAEADDD8FFF9F5F4FFFFFFFFFFF9F5F4FFE9DCD7FFC8AC
        A2FC62504B900404031000000002000000000000000000000000000000000000
        000000000003241F1D3486726BADB69B91E6CCADA1FFB99C92E988736CB22822
        1F3E000000060000000100000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      TabStop = False
      OnClick = bHistoricoAlteracoesClick
    end
  end
  object pgControlPessoa: TPageControl
    Left = 5
    Top = 95
    Width = 620
    Height = 139
    ActivePage = tsPessoaFisica
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object tsPessoaFisica: TTabSheet
      Caption = 'Pessoa F'#237'sica'
      object Label25: TLabel
        Left = 10
        Top = 46
        Width = 44
        Height = 18
        Caption = 'Nome:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 230
        Top = 79
        Width = 89
        Height = 18
        Caption = 'Org. Emissor:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label30: TLabel
        Left = 424
        Top = 80
        Width = 62
        Height = 17
        Caption = 'Emiss'#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Helvetica Neue'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 30
        Top = 79
        Width = 24
        Height = 18
        Caption = 'RG:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 20
        Top = 15
        Width = 34
        Height = 18
        Caption = 'CPF:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 239
        Top = 15
        Width = 81
        Height = 18
        Caption = 'Nascimento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 448
        Top = 16
        Width = 37
        Height = 18
        Caption = 'Sexo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edRG: TEdit
        Left = 60
        Top = 76
        Width = 165
        Height = 26
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnExit = edRGExit
        OnKeyPress = edIEKeyPress
      end
      object edRG_OrgaoEmissor: TEdit
        Left = 323
        Top = 75
        Width = 83
        Height = 26
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnKeyPress = edNOMEKeyPress
      end
      object edNOME: TEdit
        Left = 61
        Top = 44
        Width = 548
        Height = 26
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        TabOrder = 3
        OnExit = edNOMEExit
        OnKeyPress = edNOMEKeyPress
      end
      object edCPF: TEdit
        Left = 61
        Top = 12
        Width = 166
        Height = 26
        Hint = 'CPF'
        CharCase = ecUpperCase
        Color = 8454016
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = edCNPJEnter
        OnExit = edCPFExit
        OnKeyPress = edCPFKeyPress
      end
      object edDataNascimento: TMaskEdit
        Left = 324
        Top = 11
        Width = 83
        Height = 26
        Color = 8454016
        EditMask = '!99/99/00;1;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 8
        ParentFont = False
        TabOrder = 1
        Text = '  /  /  '
        OnExit = edDataNascimentoExit
      end
      object cbSexo: TComboBox
        Left = 489
        Top = 11
        Width = 121
        Height = 26
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Items.Strings = (
          'MASCULINO'
          'FEMININO')
      end
      object edRG_DataEmissao: TMaskEdit
        Left = 488
        Top = 75
        Width = 83
        Height = 26
        Color = clWhite
        EditMask = '!99/99/00;1;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 8
        ParentFont = False
        TabOrder = 6
        Text = '  /  /  '
        OnExit = edRG_DataEmissaoExit
      end
      object cxButton2: TcxButton
        Left = 409
        Top = 10
        Width = 25
        Height = 26
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Metropolis'
        OptionsImage.Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000020000000E0B14308329448DFB1D2F58A5000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000020000000E0D1937883C6DB2FF5BB1F9FF325196F4000000000000
          00000000000100000004000000090000000D0000000F0000000F0000000C0000
          00070000000E0F1D3C864A7CBCFF73C4FFFF467CC3FF17254485000000000000
          0002000000081C130F465A3B31BC7C5043F87F5244FF7B4E42FA57382FC11E14
          1059112142875686C2FF88D0FFFF5186C7FF142343880000000F000000010302
          02104A332C91946B5DFDC6ACA1FFE4D1C6FFEDDDD2FFE2D0C5FFC0A599FF855C
          50FF6E6B7EFF98D4F8FF5B8ECBFF152545840000000D00000002000000076046
          3DA6B39288FFE9DAD0FFDAC0A1FFCBA87AFFC49B66FFCCAA7EFFDCC2A5FFE5D2
          C6FF9A766AFF736A77FF162747850000000E00000002000000002A201D4AAE88
          7CFFEFE6DFFFCDA67CFFCDA26BFFE3C28CFFEDD5A2FFE7CD9EFFD3B182FFD0AE
          88FFE7D5CAFF885F53FF25181464000000070000000000000000755B53ACDFCE
          C9FFDDC1A8FFC99865FFE8BE83FFE9C388FFEDCA97FFEFD3A7FFF2D9B0FFD5B1
          87FFDBBEA6FFC5ACA2FF5A3D33C10000000C0000000000000000A9877CE9F8F4
          F2FFC79873FFDEAB77FFEFCDABFFF0D0B1FFEDC9A1FFECC69AFFEFCFA9FFE9C9
          A4FFC89B77FFE6D6CEFF7C5448F10000000F0000000000000000C09C90FFFDFD
          FCFFBE875FFFEDCFB9FFF5DFD2FFF2D6C1FFF1CFB4FFEDC6A4FFECC19BFFEFC8
          A6FFC08B67FFF1E6DFFF8B6154FF0000000F0000000000000000AF9186E6F9F5
          F4FFC69474FFE8CDC3FFF9E8E4FFF6DED2FFF3D4C2FFF0CBB2FFEBB78EFFE5B7
          92FFC59172FFEBDFD9FF866055EE0000000D0000000000000000876F68B0E7D9
          D4FFE2C6B7FFC89072FFFAEFF2FFF9E7E4FFF6DDD3FFF1C8B2FFEBAF88FFC98E
          6CFFDCBBAAFFD3C0B7FF6B4F46BC00000009000000000000000026201E36CCAF
          A7FAFBF8F7FFCF9F88FFC78E72FFE9CDC6FFEDC7B5FFDD9F79FFC88865FFCE9D
          84FFF5EFEBFFB39387FF2A201D52000000040000000000000000000000036454
          4F84D9C2BAFFFDFBFAFFE2C6B8FFCB977EFFC08163FFCB977DFFE0C4B4FFFAF6
          F5FFC9B0A7FF6B564EA700000009000000010000000000000000000000000202
          020762534D81CEB2A9FAEADDD8FFF9F5F4FFFFFFFFFFF9F5F4FFE9DCD7FFC8AC
          A2FC62504B900404031000000002000000000000000000000000000000000000
          000000000003241F1D3486726BADB69B91E6CCADA1FFB99C92E988736CB22822
          1F3E000000060000000100000000000000000000000000000000}
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        TabStop = False
        OnClick = cxButton2Click
      end
    end
    object tsPessoaJuridica: TTabSheet
      Caption = 'Pessoa Jur'#237'dica'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      object lbl3: TLabel
        Left = 9
        Top = 79
        Width = 103
        Height = 18
        Caption = 'Nome Fantasia:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl7: TLabel
        Left = 67
        Top = 14
        Width = 45
        Height = 18
        Caption = 'CNPJ:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 315
        Top = 16
        Width = 92
        Height = 18
        Caption = 'Insc Estadual:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 27
        Top = 47
        Width = 85
        Height = 18
        Caption = 'Raz'#227'o Social:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edCNPJ: TEdit
        Left = 119
        Top = 11
        Width = 166
        Height = 26
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 0
        OnEnter = edCNPJEnter
        OnExit = edCNPJExit
        OnKeyPress = edCNPJKeyPress
      end
      object edNomeFantasia: TEdit
        Left = 119
        Top = 75
        Width = 481
        Height = 26
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        TabOrder = 3
        OnKeyPress = edNOMEKeyPress
      end
      object edRazaoSocial: TEdit
        Left = 119
        Top = 43
        Width = 481
        Height = 26
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 50
        ParentFont = False
        TabOrder = 2
        OnKeyPress = edNOMEKeyPress
      end
      object edIE: TEdit
        Left = 413
        Top = 11
        Width = 187
        Height = 26
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 1
        OnEnter = edCNPJEnter
        OnExit = edIEExit
        OnKeyPress = edIEKeyPress
      end
      object cxButton1: TcxButton
        Left = 284
        Top = 11
        Width = 25
        Height = 26
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        LookAndFeel.SkinName = 'Metropolis'
        OptionsImage.Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000020000000E0B14308329448DFB1D2F58A5000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000020000000E0D1937883C6DB2FF5BB1F9FF325196F4000000000000
          00000000000100000004000000090000000D0000000F0000000F0000000C0000
          00070000000E0F1D3C864A7CBCFF73C4FFFF467CC3FF17254485000000000000
          0002000000081C130F465A3B31BC7C5043F87F5244FF7B4E42FA57382FC11E14
          1059112142875686C2FF88D0FFFF5186C7FF142343880000000F000000010302
          02104A332C91946B5DFDC6ACA1FFE4D1C6FFEDDDD2FFE2D0C5FFC0A599FF855C
          50FF6E6B7EFF98D4F8FF5B8ECBFF152545840000000D00000002000000076046
          3DA6B39288FFE9DAD0FFDAC0A1FFCBA87AFFC49B66FFCCAA7EFFDCC2A5FFE5D2
          C6FF9A766AFF736A77FF162747850000000E00000002000000002A201D4AAE88
          7CFFEFE6DFFFCDA67CFFCDA26BFFE3C28CFFEDD5A2FFE7CD9EFFD3B182FFD0AE
          88FFE7D5CAFF885F53FF25181464000000070000000000000000755B53ACDFCE
          C9FFDDC1A8FFC99865FFE8BE83FFE9C388FFEDCA97FFEFD3A7FFF2D9B0FFD5B1
          87FFDBBEA6FFC5ACA2FF5A3D33C10000000C0000000000000000A9877CE9F8F4
          F2FFC79873FFDEAB77FFEFCDABFFF0D0B1FFEDC9A1FFECC69AFFEFCFA9FFE9C9
          A4FFC89B77FFE6D6CEFF7C5448F10000000F0000000000000000C09C90FFFDFD
          FCFFBE875FFFEDCFB9FFF5DFD2FFF2D6C1FFF1CFB4FFEDC6A4FFECC19BFFEFC8
          A6FFC08B67FFF1E6DFFF8B6154FF0000000F0000000000000000AF9186E6F9F5
          F4FFC69474FFE8CDC3FFF9E8E4FFF6DED2FFF3D4C2FFF0CBB2FFEBB78EFFE5B7
          92FFC59172FFEBDFD9FF866055EE0000000D0000000000000000876F68B0E7D9
          D4FFE2C6B7FFC89072FFFAEFF2FFF9E7E4FFF6DDD3FFF1C8B2FFEBAF88FFC98E
          6CFFDCBBAAFFD3C0B7FF6B4F46BC00000009000000000000000026201E36CCAF
          A7FAFBF8F7FFCF9F88FFC78E72FFE9CDC6FFEDC7B5FFDD9F79FFC88865FFCE9D
          84FFF5EFEBFFB39387FF2A201D52000000040000000000000000000000036454
          4F84D9C2BAFFFDFBFAFFE2C6B8FFCB977EFFC08163FFCB977DFFE0C4B4FFFAF6
          F5FFC9B0A7FF6B564EA700000009000000010000000000000000000000000202
          020762534D81CEB2A9FAEADDD8FFF9F5F4FFFFFFFFFFF9F5F4FFE9DCD7FFC8AC
          A2FC62504B900404031000000002000000000000000000000000000000000000
          000000000003241F1D3486726BADB69B91E6CCADA1FFB99C92E988736CB22822
          1F3E000000060000000100000000000000000000000000000000}
        TabOrder = 4
        TabStop = False
        OnClick = cxButton1Click
      end
    end
  end
  object grpEndereco: TGroupBox
    Left = 5
    Top = 272
    Width = 620
    Height = 197
    Caption = '  Endere'#231'o  '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    TabStop = True
    object Label22: TLabel
      Left = 192
      Top = 83
      Width = 43
      Height = 17
      Caption = 'Bairro:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 473
      Top = 142
      Width = 23
      Height = 17
      Caption = 'UF:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 42
      Top = 142
      Width = 64
      Height = 17
      Caption = 'Mun'#237'cipio:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 10
      Top = 107
      Width = 96
      Height = 17
      Caption = 'Complemento:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 50
      Top = 83
      Width = 56
      Height = 17
      Caption = 'N'#250'mero:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 14
      Top = 54
      Width = 92
      Height = 17
      Caption = 'Rua | Avenida:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 70
      Top = 174
      Width = 36
      Height = 17
      Caption = 'Zona:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 342
      Top = 171
      Width = 50
      Height = 17
      Caption = 'Regi'#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 71
      Top = 26
      Width = 34
      Height = 18
      Caption = 'CEP:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 539
      Top = 142
      Width = 35
      Height = 17
      Caption = 'C'#243'd.:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Helvetica Neue'
      Font.Style = []
      ParentFont = False
    end
    object bPesqBairro: TcxButton
      Left = 300
      Top = 78
      Width = 25
      Height = 26
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Metropolis'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000020000000E0B14308329448DFB1D2F58A5000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000020000000E0D1937883C6DB2FF5BB1F9FF325196F4000000000000
        00000000000100000004000000090000000D0000000F0000000F0000000C0000
        00070000000E0F1D3C864A7CBCFF73C4FFFF467CC3FF17254485000000000000
        0002000000081C130F465A3B31BC7C5043F87F5244FF7B4E42FA57382FC11E14
        1059112142875686C2FF88D0FFFF5186C7FF142343880000000F000000010302
        02104A332C91946B5DFDC6ACA1FFE4D1C6FFEDDDD2FFE2D0C5FFC0A599FF855C
        50FF6E6B7EFF98D4F8FF5B8ECBFF152545840000000D00000002000000076046
        3DA6B39288FFE9DAD0FFDAC0A1FFCBA87AFFC49B66FFCCAA7EFFDCC2A5FFE5D2
        C6FF9A766AFF736A77FF162747850000000E00000002000000002A201D4AAE88
        7CFFEFE6DFFFCDA67CFFCDA26BFFE3C28CFFEDD5A2FFE7CD9EFFD3B182FFD0AE
        88FFE7D5CAFF885F53FF25181464000000070000000000000000755B53ACDFCE
        C9FFDDC1A8FFC99865FFE8BE83FFE9C388FFEDCA97FFEFD3A7FFF2D9B0FFD5B1
        87FFDBBEA6FFC5ACA2FF5A3D33C10000000C0000000000000000A9877CE9F8F4
        F2FFC79873FFDEAB77FFEFCDABFFF0D0B1FFEDC9A1FFECC69AFFEFCFA9FFE9C9
        A4FFC89B77FFE6D6CEFF7C5448F10000000F0000000000000000C09C90FFFDFD
        FCFFBE875FFFEDCFB9FFF5DFD2FFF2D6C1FFF1CFB4FFEDC6A4FFECC19BFFEFC8
        A6FFC08B67FFF1E6DFFF8B6154FF0000000F0000000000000000AF9186E6F9F5
        F4FFC69474FFE8CDC3FFF9E8E4FFF6DED2FFF3D4C2FFF0CBB2FFEBB78EFFE5B7
        92FFC59172FFEBDFD9FF866055EE0000000D0000000000000000876F68B0E7D9
        D4FFE2C6B7FFC89072FFFAEFF2FFF9E7E4FFF6DDD3FFF1C8B2FFEBAF88FFC98E
        6CFFDCBBAAFFD3C0B7FF6B4F46BC00000009000000000000000026201E36CCAF
        A7FAFBF8F7FFCF9F88FFC78E72FFE9CDC6FFEDC7B5FFDD9F79FFC88865FFCE9D
        84FFF5EFEBFFB39387FF2A201D52000000040000000000000000000000036454
        4F84D9C2BAFFFDFBFAFFE2C6B8FFCB977EFFC08163FFCB977DFFE0C4B4FFFAF6
        F5FFC9B0A7FF6B564EA700000009000000010000000000000000000000000202
        020762534D81CEB2A9FAEADDD8FFF9F5F4FFFFFFFFFFF9F5F4FFE9DCD7FFC8AC
        A2FC62504B900404031000000002000000000000000000000000000000000000
        000000000003241F1D3486726BADB69B91E6CCADA1FFB99C92E988736CB22822
        1F3E000000060000000100000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 9
      TabStop = False
      OnClick = bPesqBairroClick
    end
    object bPesqCEP: TcxButton
      Left = 204
      Top = 17
      Width = 25
      Height = 26
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Metropolis'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000020000000E0B14308329448DFB1D2F58A5000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000020000000E0D1937883C6DB2FF5BB1F9FF325196F4000000000000
        00000000000100000004000000090000000D0000000F0000000F0000000C0000
        00070000000E0F1D3C864A7CBCFF73C4FFFF467CC3FF17254485000000000000
        0002000000081C130F465A3B31BC7C5043F87F5244FF7B4E42FA57382FC11E14
        1059112142875686C2FF88D0FFFF5186C7FF142343880000000F000000010302
        02104A332C91946B5DFDC6ACA1FFE4D1C6FFEDDDD2FFE2D0C5FFC0A599FF855C
        50FF6E6B7EFF98D4F8FF5B8ECBFF152545840000000D00000002000000076046
        3DA6B39288FFE9DAD0FFDAC0A1FFCBA87AFFC49B66FFCCAA7EFFDCC2A5FFE5D2
        C6FF9A766AFF736A77FF162747850000000E00000002000000002A201D4AAE88
        7CFFEFE6DFFFCDA67CFFCDA26BFFE3C28CFFEDD5A2FFE7CD9EFFD3B182FFD0AE
        88FFE7D5CAFF885F53FF25181464000000070000000000000000755B53ACDFCE
        C9FFDDC1A8FFC99865FFE8BE83FFE9C388FFEDCA97FFEFD3A7FFF2D9B0FFD5B1
        87FFDBBEA6FFC5ACA2FF5A3D33C10000000C0000000000000000A9877CE9F8F4
        F2FFC79873FFDEAB77FFEFCDABFFF0D0B1FFEDC9A1FFECC69AFFEFCFA9FFE9C9
        A4FFC89B77FFE6D6CEFF7C5448F10000000F0000000000000000C09C90FFFDFD
        FCFFBE875FFFEDCFB9FFF5DFD2FFF2D6C1FFF1CFB4FFEDC6A4FFECC19BFFEFC8
        A6FFC08B67FFF1E6DFFF8B6154FF0000000F0000000000000000AF9186E6F9F5
        F4FFC69474FFE8CDC3FFF9E8E4FFF6DED2FFF3D4C2FFF0CBB2FFEBB78EFFE5B7
        92FFC59172FFEBDFD9FF866055EE0000000D0000000000000000876F68B0E7D9
        D4FFE2C6B7FFC89072FFFAEFF2FFF9E7E4FFF6DDD3FFF1C8B2FFEBAF88FFC98E
        6CFFDCBBAAFFD3C0B7FF6B4F46BC00000009000000000000000026201E36CCAF
        A7FAFBF8F7FFCF9F88FFC78E72FFE9CDC6FFEDC7B5FFDD9F79FFC88865FFCE9D
        84FFF5EFEBFFB39387FF2A201D52000000040000000000000000000000036454
        4F84D9C2BAFFFDFBFAFFE2C6B8FFCB977EFFC08163FFCB977DFFE0C4B4FFFAF6
        F5FFC9B0A7FF6B564EA700000009000000010000000000000000000000000202
        020762534D81CEB2A9FAEADDD8FFF9F5F4FFFFFFFFFFF9F5F4FFE9DCD7FFC8AC
        A2FC62504B900404031000000002000000000000000000000000000000000000
        000000000003241F1D3486726BADB69B91E6CCADA1FFB99C92E988736CB22822
        1F3E000000060000000100000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 10
      TabStop = False
      Visible = False
    end
    object cxButton4: TcxButton
      Left = 446
      Top = 166
      Width = 25
      Height = 26
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Metropolis'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000020000000E0B14308329448DFB1D2F58A5000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000020000000E0D1937883C6DB2FF5BB1F9FF325196F4000000000000
        00000000000100000004000000090000000D0000000F0000000F0000000C0000
        00070000000E0F1D3C864A7CBCFF73C4FFFF467CC3FF17254485000000000000
        0002000000081C130F465A3B31BC7C5043F87F5244FF7B4E42FA57382FC11E14
        1059112142875686C2FF88D0FFFF5186C7FF142343880000000F000000010302
        02104A332C91946B5DFDC6ACA1FFE4D1C6FFEDDDD2FFE2D0C5FFC0A599FF855C
        50FF6E6B7EFF98D4F8FF5B8ECBFF152545840000000D00000002000000076046
        3DA6B39288FFE9DAD0FFDAC0A1FFCBA87AFFC49B66FFCCAA7EFFDCC2A5FFE5D2
        C6FF9A766AFF736A77FF162747850000000E00000002000000002A201D4AAE88
        7CFFEFE6DFFFCDA67CFFCDA26BFFE3C28CFFEDD5A2FFE7CD9EFFD3B182FFD0AE
        88FFE7D5CAFF885F53FF25181464000000070000000000000000755B53ACDFCE
        C9FFDDC1A8FFC99865FFE8BE83FFE9C388FFEDCA97FFEFD3A7FFF2D9B0FFD5B1
        87FFDBBEA6FFC5ACA2FF5A3D33C10000000C0000000000000000A9877CE9F8F4
        F2FFC79873FFDEAB77FFEFCDABFFF0D0B1FFEDC9A1FFECC69AFFEFCFA9FFE9C9
        A4FFC89B77FFE6D6CEFF7C5448F10000000F0000000000000000C09C90FFFDFD
        FCFFBE875FFFEDCFB9FFF5DFD2FFF2D6C1FFF1CFB4FFEDC6A4FFECC19BFFEFC8
        A6FFC08B67FFF1E6DFFF8B6154FF0000000F0000000000000000AF9186E6F9F5
        F4FFC69474FFE8CDC3FFF9E8E4FFF6DED2FFF3D4C2FFF0CBB2FFEBB78EFFE5B7
        92FFC59172FFEBDFD9FF866055EE0000000D0000000000000000876F68B0E7D9
        D4FFE2C6B7FFC89072FFFAEFF2FFF9E7E4FFF6DDD3FFF1C8B2FFEBAF88FFC98E
        6CFFDCBBAAFFD3C0B7FF6B4F46BC00000009000000000000000026201E36CCAF
        A7FAFBF8F7FFCF9F88FFC78E72FFE9CDC6FFEDC7B5FFDD9F79FFC88865FFCE9D
        84FFF5EFEBFFB39387FF2A201D52000000040000000000000000000000036454
        4F84D9C2BAFFFDFBFAFFE2C6B8FFCB977EFFC08163FFCB977DFFE0C4B4FFFAF6
        F5FFC9B0A7FF6B564EA700000009000000010000000000000000000000000202
        020762534D81CEB2A9FAEADDD8FFF9F5F4FFFFFFFFFFF9F5F4FFE9DCD7FFC8AC
        A2FC62504B900404031000000002000000000000000000000000000000000000
        000000000003241F1D3486726BADB69B91E6CCADA1FFB99C92E988736CB22822
        1F3E000000060000000100000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 11
      TabStop = False
      OnClick = cxButton4Click
    end
    object bPesqMunicipio: TcxButton
      Left = 355
      Top = 136
      Width = 25
      Height = 26
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Metropolis'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000020000000E0B14308329448DFB1D2F58A5000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000020000000E0D1937883C6DB2FF5BB1F9FF325196F4000000000000
        00000000000100000004000000090000000D0000000F0000000F0000000C0000
        00070000000E0F1D3C864A7CBCFF73C4FFFF467CC3FF17254485000000000000
        0002000000081C130F465A3B31BC7C5043F87F5244FF7B4E42FA57382FC11E14
        1059112142875686C2FF88D0FFFF5186C7FF142343880000000F000000010302
        02104A332C91946B5DFDC6ACA1FFE4D1C6FFEDDDD2FFE2D0C5FFC0A599FF855C
        50FF6E6B7EFF98D4F8FF5B8ECBFF152545840000000D00000002000000076046
        3DA6B39288FFE9DAD0FFDAC0A1FFCBA87AFFC49B66FFCCAA7EFFDCC2A5FFE5D2
        C6FF9A766AFF736A77FF162747850000000E00000002000000002A201D4AAE88
        7CFFEFE6DFFFCDA67CFFCDA26BFFE3C28CFFEDD5A2FFE7CD9EFFD3B182FFD0AE
        88FFE7D5CAFF885F53FF25181464000000070000000000000000755B53ACDFCE
        C9FFDDC1A8FFC99865FFE8BE83FFE9C388FFEDCA97FFEFD3A7FFF2D9B0FFD5B1
        87FFDBBEA6FFC5ACA2FF5A3D33C10000000C0000000000000000A9877CE9F8F4
        F2FFC79873FFDEAB77FFEFCDABFFF0D0B1FFEDC9A1FFECC69AFFEFCFA9FFE9C9
        A4FFC89B77FFE6D6CEFF7C5448F10000000F0000000000000000C09C90FFFDFD
        FCFFBE875FFFEDCFB9FFF5DFD2FFF2D6C1FFF1CFB4FFEDC6A4FFECC19BFFEFC8
        A6FFC08B67FFF1E6DFFF8B6154FF0000000F0000000000000000AF9186E6F9F5
        F4FFC69474FFE8CDC3FFF9E8E4FFF6DED2FFF3D4C2FFF0CBB2FFEBB78EFFE5B7
        92FFC59172FFEBDFD9FF866055EE0000000D0000000000000000876F68B0E7D9
        D4FFE2C6B7FFC89072FFFAEFF2FFF9E7E4FFF6DDD3FFF1C8B2FFEBAF88FFC98E
        6CFFDCBBAAFFD3C0B7FF6B4F46BC00000009000000000000000026201E36CCAF
        A7FAFBF8F7FFCF9F88FFC78E72FFE9CDC6FFEDC7B5FFDD9F79FFC88865FFCE9D
        84FFF5EFEBFFB39387FF2A201D52000000040000000000000000000000036454
        4F84D9C2BAFFFDFBFAFFE2C6B8FFCB977EFFC08163FFCB977DFFE0C4B4FFFAF6
        F5FFC9B0A7FF6B564EA700000009000000010000000000000000000000000202
        020762534D81CEB2A9FAEADDD8FFF9F5F4FFFFFFFFFFF9F5F4FFE9DCD7FFC8AC
        A2FC62504B900404031000000002000000000000000000000000000000000000
        000000000003241F1D3486726BADB69B91E6CCADA1FFB99C92E988736CB22822
        1F3E000000060000000100000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 12
      TabStop = False
      OnClick = bPesqMunicipioClick
    end
    object bPesqZona: TcxButton
      Left = 176
      Top = 166
      Width = 25
      Height = 26
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Metropolis'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000020000000E0B14308329448DFB1D2F58A5000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000020000000E0D1937883C6DB2FF5BB1F9FF325196F4000000000000
        00000000000100000004000000090000000D0000000F0000000F0000000C0000
        00070000000E0F1D3C864A7CBCFF73C4FFFF467CC3FF17254485000000000000
        0002000000081C130F465A3B31BC7C5043F87F5244FF7B4E42FA57382FC11E14
        1059112142875686C2FF88D0FFFF5186C7FF142343880000000F000000010302
        02104A332C91946B5DFDC6ACA1FFE4D1C6FFEDDDD2FFE2D0C5FFC0A599FF855C
        50FF6E6B7EFF98D4F8FF5B8ECBFF152545840000000D00000002000000076046
        3DA6B39288FFE9DAD0FFDAC0A1FFCBA87AFFC49B66FFCCAA7EFFDCC2A5FFE5D2
        C6FF9A766AFF736A77FF162747850000000E00000002000000002A201D4AAE88
        7CFFEFE6DFFFCDA67CFFCDA26BFFE3C28CFFEDD5A2FFE7CD9EFFD3B182FFD0AE
        88FFE7D5CAFF885F53FF25181464000000070000000000000000755B53ACDFCE
        C9FFDDC1A8FFC99865FFE8BE83FFE9C388FFEDCA97FFEFD3A7FFF2D9B0FFD5B1
        87FFDBBEA6FFC5ACA2FF5A3D33C10000000C0000000000000000A9877CE9F8F4
        F2FFC79873FFDEAB77FFEFCDABFFF0D0B1FFEDC9A1FFECC69AFFEFCFA9FFE9C9
        A4FFC89B77FFE6D6CEFF7C5448F10000000F0000000000000000C09C90FFFDFD
        FCFFBE875FFFEDCFB9FFF5DFD2FFF2D6C1FFF1CFB4FFEDC6A4FFECC19BFFEFC8
        A6FFC08B67FFF1E6DFFF8B6154FF0000000F0000000000000000AF9186E6F9F5
        F4FFC69474FFE8CDC3FFF9E8E4FFF6DED2FFF3D4C2FFF0CBB2FFEBB78EFFE5B7
        92FFC59172FFEBDFD9FF866055EE0000000D0000000000000000876F68B0E7D9
        D4FFE2C6B7FFC89072FFFAEFF2FFF9E7E4FFF6DDD3FFF1C8B2FFEBAF88FFC98E
        6CFFDCBBAAFFD3C0B7FF6B4F46BC00000009000000000000000026201E36CCAF
        A7FAFBF8F7FFCF9F88FFC78E72FFE9CDC6FFEDC7B5FFDD9F79FFC88865FFCE9D
        84FFF5EFEBFFB39387FF2A201D52000000040000000000000000000000036454
        4F84D9C2BAFFFDFBFAFFE2C6B8FFCB977EFFC08163FFCB977DFFE0C4B4FFFAF6
        F5FFC9B0A7FF6B564EA700000009000000010000000000000000000000000202
        020762534D81CEB2A9FAEADDD8FFF9F5F4FFFFFFFFFFF9F5F4FFE9DCD7FFC8AC
        A2FC62504B900404031000000002000000000000000000000000000000000000
        000000000003241F1D3486726BADB69B91E6CCADA1FFB99C92E988736CB22822
        1F3E000000060000000100000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = False
      TabOrder = 13
      TabStop = False
      OnClick = bPesqZonaClick
    end
    object edRua: TEdit
      Tag = 100
      Left = 112
      Top = 49
      Width = 502
      Height = 26
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = edNOMEKeyPress
    end
    object edCEP: TEdit
      Tag = 100
      Left = 112
      Top = 21
      Width = 86
      Height = 26
      CharCase = ecUpperCase
      Color = 8454016
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = edCEPExit
      OnKeyPress = edCEPKeyPress
    end
    object edNumero: TEdit
      Tag = 100
      Left = 112
      Top = 78
      Width = 72
      Height = 26
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edNumeroKeyPress
    end
    object edBairro: TEdit
      Tag = 100
      Left = 240
      Top = 78
      Width = 59
      Height = 26
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      OnExit = edBairroExit
    end
    object edBairroDescricao: TEdit
      Left = 326
      Top = 78
      Width = 288
      Height = 26
      TabStop = False
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object edComplemento: TEdit
      Left = 112
      Top = 107
      Width = 502
      Height = 26
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 4
      OnKeyPress = edNOMEKeyPress
    end
    object edEnderecoMunicipioIBGE: TEdit
      Left = 379
      Top = 136
      Width = 65
      Height = 26
      TabStop = False
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      OnExit = edEnderecoMunicipioIBGEExit
      OnKeyPress = edCPFKeyPress
    end
    object edCidade: TEdit
      Tag = 100
      Left = 112
      Top = 136
      Width = 242
      Height = 26
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnExit = edCidadeExit
      OnKeyPress = edNOMEKeyPress
    end
    object edEnderecoUF: TEdit
      Left = 498
      Top = 136
      Width = 39
      Height = 26
      TabStop = False
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object edEnderecoUFIBGE: TEdit
      Left = 575
      Top = 136
      Width = 39
      Height = 26
      TabStop = False
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
    object edZona: TEdit
      Left = 112
      Top = 166
      Width = 65
      Height = 26
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 7
      OnExit = edZonaExit
      OnKeyPress = edCPFKeyPress
    end
    object edZonaDescricao: TEdit
      Left = 202
      Top = 166
      Width = 136
      Height = 26
      TabStop = False
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
    end
    object edRegiao: TEdit
      Left = 392
      Top = 166
      Width = 53
      Height = 26
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 8
      OnExit = edRegiaoExit
      OnKeyPress = edCPFKeyPress
    end
    object edRegiaoDescricao: TEdit
      Left = 472
      Top = 166
      Width = 142
      Height = 26
      TabStop = False
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 18
    end
  end
  object cxButton8: TcxButton
    Left = 634
    Top = 422
    Width = 110
    Height = 44
    Caption = 'Consultar'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Metropolis'
    OptionsImage.Glyph.Data = {
      36100000424D3610000000000000360000002800000020000000200000000100
      2000000000000010000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      0002000000040000000500000004000000020000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000040000
      000A000000110000001400000011000000090000000300000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000001000000050000000D0307
      10380F2455C01D448BFA152F63BD040810310000000900000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000001000000050000000D0408133D1D45
      83EC5294CBFF63AEE5FF8AB5DAFF203E70C20000001100000004000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000001000000040000000D040A143C214E8DEC5AA8
      DEFF4598E0FF93D4F6FFEAF8FEFF2C5696F00000001400000005000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000001000000040000000C050C163B265695EC5CA9DFFF3E94
      DDFF92D3F6FFEAF9FFFF76B2DDFF254878C20000001100000004000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      0002000000030000000400000004000000040000000400000004000000030000
      000100000001000000040000000C0D0B0B392B5E9CEC5BABE0FF4096DFFF92D3
      F6FFEAF9FFFF86C8EEFF32619FEC070D16380000000A00000002000000000000
      0000000000000000000000000000000000000000000100000003000000050000
      00080000000B0000000E0000000F00000010000000100000000E0000000B0000
      0008000000070000000C110A08397B4C3EF58792A6FF4398E0FF93D4F6FFEAF9
      FFFF87C7EEFF3468A4EC070E183D0000000D0000000400000001000000000000
      00000000000000000000000000010000000200000004000000090C0807263B28
      21835C3D34C4775045F77A5145FF794F42FF794F43FF5C3B33CA3B26208C110B
      093700000014110A083B784C40EBAC8071FF835548FFA7BAC7FFEAF9FFFF88C8
      F0FF376CA9EC080F193C0000000D000000050000000100000000000000000000
      0000000000000000000100000002000000060604041749332C96856154F7B294
      89FFCFB8ADFFEBD9CFFFECDCD0FFECDBD0FFEBDBD0FFCFB8ACFFAE9084FF815A
      4EFF4E332BB76A4438EEA77D6FFF8F6354FFC3A79FFFC8B2AAFFB2CAD9FF3A71
      ADEC08101A3B0000000D00000005000000010000000000000000000000000000
      0000000000000000000200000006140E0C2F725246D9B59A8FFFE6D4CAFFF0E3
      DAFFF9F2EBFFFDF9F3FFFFFCF7FFFFFCF7FFFDFAF3FFFAF3EDFFF3E7DEFFE6D4
      CAFFAE9084FF7B5447FF745045FFBDA29AFFFDFCFBFFDDCEC8FF895F53F5110F
      0F390000000C0000000400000001000000000000000000000000000000000000
      00000000000100000005110C0B29886459EDD4C2B9FFEFE0D7FFF9F2EAFFF3EA
      DEFFD4BB9CFFC09D73FFB38855FFB48956FFC49F75FFD7BE9FFFF4EBDFFFFBF5
      F0FFF0E2D9FFCDB6ABFF825A4FFFB2A29DFFD4C6C1FF825C51EB140D0B390000
      000C000000040000000100000000000000000000000000000000000000000000
      000100000003050403127A594FD5D6C5BEFFEEE2D8FFFCF6EFFFDBC5ACFFB489
      59FFCDA872FFDDC18AFFEBD49DFFECD7A2FFE2C995FFD2B481FFBC9362FFDFCA
      B0FFFDF9F3FFF1E5DCFFCCB4A9FF815D52FF6F4D41EE110B09390000000C0000
      0004000000010000000000000000000000000000000000000000000000000000
      0001000000054836307FC1ACA3FFF0E4DDFFF8F0E8FFC4A17EFFBC915EFFDCB7
      7AFFE3BF7FFFE3C07FFFE4C585FFE7CC8FFFEBD39BFFEFDCABFFE7D4A4FFC7A2
      71FFCBAC86FFFAF5EDFFF0E3DAFFB5998EFF5A3E35BD00000015000000070000
      0001000000000000000000000000000000000000000000000000000000010000
      0003090706179B786DF5F2EBE7FFF3E8E1FFCEB094FFBD8F5CFFDFB371FFDFB7
      74FFE2BA79FFE3BE7FFFE5C385FFE6C78AFFE9CB91FFEBD198FFEED9A8FFF0DE
      B2FFCAA578FFD7BD9FFFF7EFE8FFE8D7CEFF8E695CFC150E0C3A000000080000
      0002000000000000000000000000000000000000000000000000000000010000
      000443332E6FC8B2AAFFF5EDE8FFECDDD0FFAE7A4FFFDAA867FFDEAE6DFFDFB2
      73FFE2B77AFFE4BB7FFFE4BF85FFE6C38BFFE9C790FFEAC994FFEBCD98FFEED6
      A9FFEDD6AEFFBF9065FFF1E4D8FFF1E7DFFFBAA095FF4A342E940000000B0000
      0003000000000000000000000000000000000000000000000000000000010000
      0005735950B5E5D9D6FFF3EAE3FFCCAA91FFC28A55FFDDA768FFDFAC6DFFDFAF
      73FFE2B379FFE4B77FFFE5BA83FFE7BF89FFE9C38FFFEAC493FFEBC696FFEBC9
      99FFF0D4AEFFD5AF87FFD8BAA0FFF5EBE4FFDAC6BDFF74544AD50000000E0000
      0004000000000000000000000000000000000000000000000000000000010000
      0005947369E0F8F4F3FFF3E9E2FFB17F5EFFD2955EFFDDA368FFE1AC76FFEAC4
      A0FFEDCBADFFEDC8A7FFE9C39CFFE7B98AFFE8BC8BFFE9BF90FFE9C092FFEAC2
      95FFECC9A0FFE5C29DFFC59877FFF6EEE8FFEADCD4FF8F6A5EFA020101130000
      0004000000000000000000000000000000000000000000000000000000010000
      0006A58379F1FFFEFEFFF3EBE5FFA46946FFD89961FFE1AA78FFF0D5C3FFF0D4
      C2FFEFCFBBFFEECDB4FFEECAAEFFECC7A7FFE8B98DFFE8B88CFFE8BA90FFE8BB
      91FFEABE95FFECC7A5FFBD8966FFF8F0EBFFF1E4DDFF9C7669FF0B0807220000
      0005000000010000000000000000000000000000000000000000000000010000
      0005AA897EF1FFFFFFFFF5EDE9FFA16544FFDB9861FFEECBB6FFF4DCD3FFF2D8
      CBFFF1D4C3FFEFCFBCFFEFCBB5FFEDC8AFFFEABF9FFFE7B189FFE7B38BFFE7B4
      8CFFE7B68EFFEAC1A2FFBF8669FFF7F1ECFFF2E7E1FF9F7A6EFF0907061E0000
      0004000000010000000000000000000000000000000000000000000000010000
      000498796FD7FAF7F6FFF8F2EFFFAB7158FFCF8B59FFF6E2DDFFF6E1DCFFF4DC
      D3FFF3D8CCFFF1D2C3FFEFCEBCFFEFCAB6FFEDC5ADFFE6AC85FFE6AE86FFE6AE
      89FFE7B08BFFE3B495FFC69278FFF6EFEAFFF0E6E2FF987568F4020101120000
      0004000000000000000000000000000000000000000000000000000000010000
      0003776058A8EAE0DCFFFBF8F7FFC39A88FFBC764EFFF7E6E4FFF8E6E5FFF6E1
      DDFFF4DCD4FFF3D7CCFFF1D1C3FFF0CDBCFFEEC7B3FFE5A67FFFE6A782FFE6A8
      83FFE7AC89FFD39C7EFFD6B2A0FFF5EDE8FFE4D7D2FF7F6358CC0000000C0000
      0003000000000000000000000000000000000000000000000000000000010000
      000244383361D6C2BBFFFFFEFEFFE7D6CEFF9F593DFFECCBBCFFF9EBECFFF8E6
      E5FFF6E1DDFFF4DBD4FFF3D6CCFFF1D1C3FFEBBDA5FFE3A27AFFE4A37CFFE4A3
      7CFFE5AA89FFBC7D65FFEDDED7FFF4ECE7FFCCB6AFFF53423B89000000090000
      0002000000000000000000000000000000000000000000000000000000000000
      000109070711AF9187E9F8F4F3FFFBF9F8FFBD9381FFAD6A4AFFF8E9E9FFF9EB
      ECFFF7E6E5FFF6E1DDFFF4DBD3FFF2D1C5FFE4A57FFFE19D74FFE29E75FFE29F
      77FFC6896CFFD4AD9DFFF5F0EAFFF6F0EDFFAE8C80FA120E0D28000000050000
      0001000000000000000000000000000000000000000000000000000000000000
      00010000000350413D6DDAC4BEFFFFFFFFFFF8F2F1FFB17F6AFFA86444FFE5BF
      AFFFF6E1DEFFF5DDD7FFEEC7B5FFE19F76FFE0996DFFE19A6EFFDA946BFFBF7F
      62FFC99A87FFF6EEEAFFF9F4F1FFD0BBB3FF5E4B449000000009000000030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000010202020791776EBFE8DAD6FFFFFFFFFFFBF8F6FFCDAC9EFF9F5D
      43FFBC744EFFCE855BFFDC9265FFDC9266FFD28A62FFC6825FFFB5765CFFDABB
      AEFFF7F2EEFFF9F5F2FFE5D9D4FF95776DD60B08081A00000004000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000020E0C0B16A98E83DAE9DDD7FFFFFFFFFFFCFAFAFFEBDC
      D5FFC69F90FFB27C66FFA46248FFA7664BFFBA856FFFD0A999FFEEE0D9FFF8F2
      EFFFFCF9F9FFE6D9D5FFAC8C82EA1A15132F0000000600000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000001000000020E0C0B17957D74C2DCC8C1FFFAF6F5FFFFFF
      FFFFFEFBFBFFFAF8F6FFF9F5F2FFF8F3F0FFF9F4F1FFFBF6F5FFFDFBFBFFFAF8
      F7FFD8C4BCFF9B8075D516121129000000060000000200000001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000100000002020202075345406DB99B90E9DDCA
      C2FFEEE5E1FFFAF8F7FFFFFFFFFFFFFFFFFFFAF7F6FFEEE5E1FFDBC7BFFFBA9C
      91F25B4B457F0706051200000005000000020000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000003090807104036
      3256826D65A8A1877DCEB7998EEBBE9E92F49F847BCF877068B2463935610E0C
      0B19000000060000000300000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000010000
      0002000000030000000400000005000000060000000500000005000000040000
      0002000000010000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000010000000100000001000000010000000100000001000000010000
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 6
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = cxButton8Click
  end
  object cxButton21: TcxButton
    Left = 753
    Top = 422
    Width = 98
    Height = 44
    Caption = 'Gravar'
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
      0000000000004B273C70964E78E0AB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FF964E78E04B273C70000000000000000000000000000000000000
      000000000000964E78E0AB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFF
      FFFFFFFFFFFFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB59
      89FFAB5989FFAB5989FF964E78E0000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFF
      FFFFFFFFFFFFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFF
      FFFFFFFFFFFFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFF
      FFFFFFFFFFFFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFF
      FFFFFFFFFFFFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFF
      FFFFFFFFFFFFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFC1C1
      C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
      C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFC1C1
      C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
      C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FF00000000AB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
      000000000000AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
      89FFAB5989FFAB5989FFAB5989FF000000000000000000000000000000000000
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
    TabOrder = 7
    TabStop = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = cxButton21Click
  end
  object cxButton28: TcxButton
    Left = 858
    Top = 422
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
    TabOrder = 8
    TabStop = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = cxButton28Click
  end
  object GroupBox3: TGroupBox
    Left = 634
    Top = 87
    Width = 327
    Height = 255
    Caption = '  Contatos  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object TLabel
      Left = 42
      Top = 26
      Width = 50
      Height = 18
      Caption = 'Fone 1:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 68
      Top = 126
      Width = 24
      Height = 18
      Caption = 'Cel:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 20
      Top = 158
      Width = 72
      Height = 18
      Caption = 'WhatsApp:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 36
      Top = 192
      Width = 56
      Height = 18
      Caption = 'E-mail 1:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 42
      Top = 58
      Width = 50
      Height = 18
      Caption = 'Fone 2:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 6
      Top = 94
      Width = 86
      Height = 18
      Caption = 'Respons'#225'vel:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object TLabel
      Left = 36
      Top = 224
      Width = 56
      Height = 18
      Caption = 'E-mail 2:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox8: TGroupBox
      Left = 184
      Top = -5
      Width = 253
      Height = 3
      TabOrder = 7
    end
    object edFone1: TEdit
      Tag = 200
      Left = 98
      Top = 22
      Width = 120
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      OnEnter = edCNPJEnter
      OnExit = edFone1Exit
      OnKeyPress = edCPFKeyPress
    end
    object edCel: TEdit
      Tag = 200
      Left = 98
      Top = 122
      Width = 120
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 11
      ParentFont = False
      TabOrder = 3
      OnEnter = edCNPJEnter
      OnExit = edFone1Exit
      OnKeyPress = edCPFKeyPress
    end
    object edWhatsApp: TEdit
      Tag = 200
      Left = 98
      Top = 154
      Width = 120
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 11
      ParentFont = False
      TabOrder = 4
      OnEnter = edCNPJEnter
      OnExit = edFone1Exit
      OnKeyPress = edCPFKeyPress
    end
    object edEmail1: TEdit
      Tag = 200
      Left = 98
      Top = 188
      Width = 207
      Height = 26
      CharCase = ecLowerCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 5
      OnExit = edEmail1Exit
    end
    object edFone2: TEdit
      Left = 98
      Top = 54
      Width = 120
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      OnEnter = edCNPJEnter
      OnExit = edFone1Exit
      OnKeyPress = edCPFKeyPress
    end
    object edNomeContato: TEdit
      Tag = 200
      Left = 98
      Top = 90
      Width = 207
      Height = 26
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edNOMEKeyPress
    end
    object edEmail2: TEdit
      Left = 98
      Top = 220
      Width = 207
      Height = 26
      CharCase = ecLowerCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 6
      OnExit = edEmail1Exit
    end
  end
  object GroupBox1: TGroupBox
    Left = 634
    Top = 342
    Width = 327
    Height = 79
    Caption = ' Observa'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    object mmObservacoes: TMemo
      Left = 3
      Top = 19
      Width = 320
      Height = 56
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'mmObservacoes')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnClick = mmObservacoesClick
    end
  end
  object cbProdutorRural: TCheckBox
    Left = 54
    Top = 240
    Width = 135
    Height = 23
    Caption = 'Produtor Rural'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 3
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    PesquisarIBGE = True
    OnBuscaEfetuada = ACBrCEP1BuscaEfetuada
    Left = 240
    Top = 272
  end
end
