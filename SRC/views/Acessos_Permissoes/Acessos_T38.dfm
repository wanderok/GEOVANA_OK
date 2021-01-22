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
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 555
    Width = 964
    Height = 42
    TabOrder = 0
    object bConfirma: TcxButton
      Left = 432
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
    Top = 187
    Width = 964
    Height = 350
    Color = 8421440
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
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
    Top = 538
    Width = 964
    Height = 17
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
    Height = 187
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
      Left = 274
      Top = 154
      Width = 124
      Height = 16
      Caption = 'Tela ou Contendo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 12
      Top = 155
      Width = 132
      Height = 16
      Caption = 'N'#250'mero da Fun'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rgFuncoes: TRadioGroup
      Left = 70
      Top = 24
      Width = 888
      Height = 116
      Columns = 5
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        '1.Auditoria'
        '2.Centro de Custo'
        '3.Cliente'
        '4.Colaborador'
        '5.Compra'
        '6.Configura'#231#245'es'
        '7.Consultor'
        '8.Contabilidade'
        '9.Contador'
        '10.Empresa'
        '11.Fornecedor'
        '12.MDe'
        '13.Motorista'
        '14.Nfce'
        '15.Nfe'
        '16.Nuvem'
        '17.Or'#231'amento'
        '18.Ordens de Servi'#231'o'
        '19.Produto'
        '20.Ramo de Atividade'
        '21.Regi'#227'o'
        '22.Tipo de Colaborador'
        '23.Transportadora'
        '24.Tributa'#231#245'es'
        '25.Usu'#225'rio'
        '26.Venda'
        '27.Zona'
        '28.Outros'
        '29.SMC')
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
      Width = 800
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
      TabOrder = 6
    end
    object Button1: TButton
      Left = 730
      Top = 141
      Width = 109
      Height = 40
      Caption = '&Marcar Todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 844
      Top = 141
      Width = 109
      Height = 40
      Caption = '&Desmarcar Todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button2Click
    end
    object edFiltro: TEdit
      Left = 401
      Top = 152
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
      Left = 149
      Top = 152
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
    object rgOrdem: TRadioGroup
      Left = 512
      Top = 140
      Width = 217
      Height = 45
      Caption = 'Fun'#231#245'es em Ordem de'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      TabOrder = 7
      OnClick = rgOrdemClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 598
    Width = 964
    Height = 15
    Align = alBottom
    BevelOuter = bvNone
    Caption = '[ T38 ]'
    Color = 15254945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
    ExplicitLeft = -8
    ExplicitTop = 477
    ExplicitWidth = 972
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
