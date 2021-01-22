object frm_reg_tributario_T4: Tfrm_reg_tributario_T4
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Regime Tribut'#225'rio'
  ClientHeight = 527
  ClientWidth = 960
  Color = 16250871
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 26
    Top = 0
    Width = 459
    Height = 18
    Caption = 'C'#243'digo de Situa'#231#227'o da Opera'#231#227'o para Simples Nacional - CSOSN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 26
    Top = 335
    Width = 906
    Height = 17
    Caption = 
      'O CSOSN ser'#225' usado na NF-e exclusivamente quando o CRT for igual' +
      ' a [1], e substituir'#225' os c'#243'digos da Tabela B - Tributa'#231#227'o pelo I' +
      'CMS do'
  end
  object Label3: TLabel
    Left = 26
    Top = 359
    Width = 582
    Height = 17
    Caption = 
      'Anexo C'#243'dgio de Situa'#231#227'o Tribut'#225'ria - CST do Conv'#234'nio s/n'#186' de 15' +
      ' de dezembro de 1970.'
  end
  object Label5: TLabel
    Left = 20
    Top = 386
    Width = 864
    Height = 17
    Caption = 
      'Permite o aproveitamento do cr'#233'dito de ICMS no valor de       co' +
      'rrespondente '#224' al'#237'quota de             % nos termos do art 23 da' +
      ' LC 123.'
  end
  object Shape1: TShape
    Left = 0
    Top = 382
    Width = 960
    Height = 2
    Pen.Color = clHighlight
  end
  object Label6: TLabel
    Left = 388
    Top = 385
    Width = 26
    Height = 19
    Caption = ' R$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 26
    Top = 30
    Width = 61
    Height = 25
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 93
    Top = 30
    Width = 866
    Height = 25
    TabOrder = 1
    Text = 'Edit1'
  end
  object GroupBox1: TGroupBox
    Left = 26
    Top = 65
    Width = 933
    Height = 260
    Caption = '                                     '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 2
      Width = 151
      Height = 19
      Caption = '  Regime Tribut'#225'rio  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RadioButton1: TRadioButton
      Left = 13
      Top = 24
      Width = 532
      Height = 17
      Caption = 
        '0. (400) N'#227'o tributada pelo Simples Nacional. Lucro Real ou Pres' +
        'umido.'
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 13
      Top = 47
      Width = 501
      Height = 17
      Caption = '1. (101) Simples Nacional com permiss'#227'o de cr'#233'dito.'
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 13
      Top = 93
      Width = 540
      Height = 17
      Caption = 
        '3. (103) Isen'#231#227'o do ICMS no Simples Nacional para faixa de recei' +
        'ta bruta.'
      TabOrder = 2
    end
    object RadioButton4: TRadioButton
      Left = 13
      Top = 70
      Width = 501
      Height = 17
      Caption = '2. (102) Simples Nacional sem permiss'#227'o de cr'#233'dito.'
      TabOrder = 3
    end
    object RadioButton5: TRadioButton
      Left = 13
      Top = 185
      Width = 501
      Height = 17
      Caption = '7. (300) Imune.'
      TabOrder = 4
    end
    object RadioButton6: TRadioButton
      Left = 13
      Top = 162
      Width = 900
      Height = 17
      Caption = 
        '6. (203) Isen'#231#227'o do ICMS no Simples Nacional para faixa de recei' +
        'ta bruta e com cobran'#231'a do ICMS por Substitui'#231#227'o Tribut'#225'ria.'
      TabOrder = 5
    end
    object RadioButton7: TRadioButton
      Left = 13
      Top = 139
      Width = 772
      Height = 17
      Caption = 
        '5. (202) Simples Nacional sem permiss'#227'o de cr'#233'dito e com cobran'#231 +
        'a do ICMS por Substitui'#231#227'o Tribut'#225'ria.'
      TabOrder = 6
    end
    object RadioButton8: TRadioButton
      Left = 13
      Top = 116
      Width = 772
      Height = 17
      Caption = 
        '4. (201) Simples Nacional com permiss'#227'o de cr'#233'dito e com cobran'#231 +
        'a do ICMS por Substitui'#231#227'o Tribut'#225'ria.'
      TabOrder = 7
    end
    object RadioButton9: TRadioButton
      Left = 13
      Top = 231
      Width = 501
      Height = 17
      Caption = '9. (900) Outros.'
      TabOrder = 8
    end
    object RadioButton10: TRadioButton
      Left = 13
      Top = 208
      Width = 854
      Height = 17
      Caption = 
        '8. (500) ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria ' +
        '(substitu'#237'do) ou por atencipa'#231#227'o.'
      TabOrder = 9
    end
  end
  object Edit3: TEdit
    Left = 610
    Top = 382
    Width = 44
    Height = 25
    TabOrder = 3
    Text = 'Edit1'
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 405
    Width = 951
    Height = 108
    Caption = '  Par'#226'metros de Tributa'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNone
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    TabStop = True
    object grpPisCofins: TGroupBox
      Left = 162
      Top = 24
      Width = 279
      Height = 81
      Caption = '  PIS | COFINS               PIS      -    COFINS '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object edPISAliquota: TEdit
        Left = 144
        Top = 17
        Width = 49
        Height = 26
        Color = 8454016
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'Edit1'
      end
      object edCOFINSAliquota: TEdit
        Left = 220
        Top = 17
        Width = 49
        Height = 26
        Color = 8454016
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = '0,00'
      end
      object rgPISCumulativo: TRadioGroup
        Left = 2
        Top = 16
        Width = 135
        Height = 60
        Ctl3D = False
        DoubleBuffered = False
        Items.Strings = (
          'N'#227'o Comulativo'
          'Cumulativo')
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object cbTratarICMS_Diferimento: TcxCheckBox
      Left = 447
      Top = 79
      Caption = 'Tratar ICMS de Diferimento (CST 51) (depende da UF)'
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      Style.BorderColor = clWindow
      Style.Color = clBtnHighlight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNone
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      Style.Shadow = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 3
    end
    object GroupBox3: TGroupBox
      Left = 453
      Top = 23
      Width = 159
      Height = 50
      Caption = '  ISS  '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      object Label11: TLabel
        Left = 59
        Top = 20
        Width = 20
        Height = 18
        Caption = '%:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edISSAliquota: TEdit
        Left = 84
        Top = 16
        Width = 49
        Height = 26
        Color = 8454016
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Edit1'
      end
    end
    object grpIPI: TGroupBox
      Left = 10
      Top = 21
      Width = 135
      Height = 52
      Caption = '  IPI  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cbContribuinteIPI: TcxCheckBox
        Left = 20
        Top = 21
        Caption = 'Contribuinte'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        Style.BorderColor = clWindow
        Style.Color = clBtnHighlight
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNone
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.NativeStyle = False
        Style.LookAndFeel.SkinName = 'Office2013White'
        Style.Shadow = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.SkinName = 'Office2013White'
        StyleHot.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.SkinName = 'Office2013White'
        TabOrder = 0
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 512
    Width = 960
    Height = 15
    Align = alBottom
    BevelOuter = bvNone
    Caption = '[ T4 ]'
    Color = 15254945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    ExplicitTop = 246
    ExplicitWidth = 286
  end
end
