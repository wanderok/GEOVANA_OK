object frm_painel_SMC_T36: Tfrm_painel_SMC_T36
  Left = 0
  Top = 0
  Caption = 'Painel de Controle SMC'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 201
    Align = alClient
    TabOrder = 0
    object lbNomeDaTela: TLabel
      Left = 1
      Top = 187
      Width = 445
      Height = 13
      Align = alBottom
      Alignment = taRightJustify
      Caption = '[ T36 ] '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 406
      ExplicitWidth = 40
    end
    object bFinanceiro: TButton
      Left = 32
      Top = 80
      Width = 105
      Height = 49
      Caption = 'Financeiro'
      TabOrder = 0
    end
    object bFiscal: TButton
      Left = 160
      Top = 80
      Width = 105
      Height = 49
      Caption = 'Fiscal'
      TabOrder = 1
      OnClick = bFiscalClick
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 445
      Height = 41
      Align = alTop
      Caption = 'P A I N E L    D E   C O N T R O L E     S M C'
      Color = 15254945
      ParentBackground = False
      TabOrder = 2
    end
    object bComercial: TButton
      Left = 288
      Top = 80
      Width = 105
      Height = 49
      Caption = 'Comercial'
      TabOrder = 3
      OnClick = bComercialClick
    end
  end
end
