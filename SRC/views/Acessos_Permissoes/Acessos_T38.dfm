object frmAcessos_T38: TfrmAcessos_T38
  Left = 9
  Top = 35
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Acessos'
  ClientHeight = 613
  ClientWidth = 964
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbNomeDaTela: TLabel
    Left = 0
    Top = 600
    Width = 964
    Height = 13
    Align = alBottom
    Alignment = taRightJustify
    Caption = '[ T38 ] '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 558
    Width = 964
    Height = 42
    Align = alBottom
    TabOrder = 0
    object bConfirma: TcxButton
      Left = 400
      Top = 0
      Width = 100
      Height = 40
      Caption = 'Gravar'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Metropolis'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000562D
        4580AB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FF562D45800000000000000000AB59
        89FFAB5989FFAB5989FFFFFFFEFFFFFFFEFFAB5989FFAB5989FFFFFFFEFFFFFF
        FEFFFFFFFEFFFFFFFEFFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFFFFFFEFFFFFFFEFFAB5989FFAB5989FFFFFFFEFFFFFF
        FEFFFFFFFEFFFFFFFEFFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFFFFFFEFFFFFFFEFFAB5989FFAB5989FFFFFFFEFFFFFF
        FEFFFFFFFEFFFFFFFEFFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
        FEFFFFFFFEFFFFFFFEFFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
        C1FFC1C1C1FFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
        C1FFC1C1C1FFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFAB5989FFAB5989FF0000000000000000AB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FFAB59
        89FFAB5989FFAB5989FFAB5989FFAB5989FFAB5989FF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = bConfirmaClick
    end
  end
  object CheckListBox1: TCheckListBox
    Left = 0
    Top = 118
    Width = 964
    Height = 422
    Color = 8421440
    Columns = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 1
  end
  object CheckListBox2: TCheckListBox
    Left = 515
    Top = 373
    Width = 247
    Height = 74
    Color = 8454143
    Columns = 5
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    Items.Strings = (
      'invisivel'
      'auxiliar')
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 541
    Width = 964
    Height = 17
    Align = alBottom
    TabOrder = 3
  end
  object MediaPlayer1: TMediaPlayer
    Left = 150
    Top = 397
    Width = 253
    Height = 30
    DoubleBuffered = True
    FileName = 'C:\Brena\ACESSOS.AVI'
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 2
    Top = 0
    Width = 962
    Height = 112
    TabOrder = 5
    object Label1: TLabel
      Left = 9
      Top = 2
      Width = 55
      Height = 16
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 64
      Width = 51
      Height = 16
      Caption = 'Grupos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 644
      Top = 4
      Width = 67
      Height = 16
      Caption = 'Contendo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 530
      Top = 4
      Width = 59
      Height = 16
      Caption = 'N'#250'mero '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rgOrdem: TRadioGroup
      Left = 776
      Top = 24
      Width = 130
      Height = 62
      Caption = 'Fun'#231#245'es em Ordem de'
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      TabOrder = 4
      OnClick = rgOrdemClick
    end
    object rgFuncoes: TRadioGroup
      Left = 70
      Top = 24
      Width = 433
      Height = 82
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Produto'
        'Contador'
        'Outros'
        'Agenda'
        'Venda'
        'Or'#231'amento'
        'Compra')
      TabOrder = 1
      OnClick = rgFuncoesClick
    end
    object edUSU_CODIGO: TEdit
      Left = 70
      Top = 1
      Width = 80
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      OnExit = edUSU_CODIGOExit
      OnKeyDown = edUSU_CODIGOKeyDown
    end
    object Edit2: TEdit
      Left = 153
      Top = 0
      Width = 350
      Height = 24
      Color = 8421440
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 40
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object Button1: TButton
      Left = 530
      Top = 56
      Width = 109
      Height = 40
      Caption = '&Marcar Todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 644
      Top = 56
      Width = 109
      Height = 40
      Caption = '&Desmarcar Todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button2Click
    end
    object edFiltro: TEdit
      Left = 644
      Top = 26
      Width = 108
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      OnChange = edFiltroChange
    end
    object edFUN_NUMERO: TEdit
      Left = 530
      Top = 26
      Width = 108
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      OnChange = edFUN_NUMEROChange
      OnKeyPress = edFUN_NUMEROKeyPress
    end
  end
  object Query1: TFDQuery
    Connection = DM.Database1
    Left = 24
    Top = 448
  end
  object Query2: TFDQuery
    Connection = DM.Database1
    Left = 72
    Top = 448
  end
end
