object frm_natureza_operacao_cfop_T43: Tfrm_natureza_operacao_cfop_T43
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 
    'Natureza de Opera'#231#227'o - C'#243'digo Fiscal de Opera'#231#245'es e Presta'#231#245'es -' +
    ' CFOP'
  ClientHeight = 460
  ClientWidth = 915
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 50
    Width = 49
    Height = 16
    Caption = 'Buscar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 166
    Top = 7
    Width = 390
    Height = 19
    Caption = 'C'#243'digo Fiscal de Opera'#231#245'es e Presta'#231#245'es - CFOP'
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object grNatOP: TcxGroupBox
    Left = 175
    Top = 247
    Caption = 'Natureza Opera'#231#227'o'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 73
    Width = 345
    object DBMemo1: TDBMemo
      Left = 11
      Top = 16
      Width = 331
      Height = 51
      DataField = 'DESCRICAO2'
      DataSource = DS_NAT
      TabOrder = 0
    end
  end
  object edFiltro: TEdit
    Left = 8
    Top = 68
    Width = 616
    Height = 26
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = edFiltroChange
  end
  object gdNat: TcxGrid
    Left = 8
    Top = 102
    Width = 899
    Height = 272
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2013White'
    object tbView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = tbViewCellDblClick
      DataController.DataSource = DS_NAT
      DataController.DetailKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '. . . '
      OptionsView.GroupByBox = False
      object tbViewColumn1: TcxGridDBColumn
        Caption = 'CFOP'
        DataBinding.FieldName = 'CODIGO'
        FooterAlignmentHorz = taCenter
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        MinWidth = 50
        Options.Editing = False
        Options.HorzSizing = False
        Width = 50
      end
      object tbViewColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRICAO'
        Options.Editing = False
        Options.AutoWidthSizable = False
        Width = 800
      end
    end
    object gdNatLevel1: TcxGridLevel
      GridView = tbView
    end
  end
  object rgAbrangencia: TRadioGroup
    Left = 630
    Top = 0
    Width = 162
    Height = 99
    Caption = 'Abrang'#234'ncia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Dentro do Estado'
      'Fora do Estado'
      'Exterior')
    ParentFont = False
    TabOrder = 3
    OnClick = rgAbrangenciaClick
  end
  object rgFluxo: TRadioGroup
    Left = 808
    Top = 1
    Width = 98
    Height = 98
    Caption = 'Fluxo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Entrada'
      'Sa'#237'da')
    ParentFont = False
    TabOrder = 4
    OnClick = rgFluxoClick
  end
  object DBMemo2: TDBMemo
    Left = 8
    Top = 376
    Width = 899
    Height = 67
    DataField = 'DESCRICAO2'
    DataSource = DS_NAT
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 32
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
    TabOrder = 6
    Height = 3
    Width = 624
  end
  object Panel2: TPanel
    Left = 0
    Top = 445
    Width = 915
    Height = 15
    Align = alBottom
    BevelOuter = bvNone
    Caption = '[ T43 ] '
    Color = 15254945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
  end
  object SQL_NAT: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'select * from NATUREZADEOPERACAO_NATOP')
    Left = 584
    Top = 104
    object SQL_NATCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 4
    end
    object SQL_NATFORAESTADO: TStringField
      FieldName = 'FORAESTADO'
      Size = 1
    end
    object SQL_NATES: TStringField
      FieldName = 'ES'
      Size = 1
    end
    object SQL_NATICMS: TStringField
      FieldName = 'ICMS'
      Size = 1
    end
    object SQL_NATNAT_TIPO: TStringField
      FieldName = 'NAT_TIPO'
      Size = 2
    end
    object SQL_NATDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object SQL_NATDESCRICAO2: TStringField
      FieldName = 'DESCRICAO2'
      Size = 255
    end
  end
  object DS_NAT: TDataSource
    DataSet = SQL_NAT
    Left = 312
    Top = 136
  end
end
