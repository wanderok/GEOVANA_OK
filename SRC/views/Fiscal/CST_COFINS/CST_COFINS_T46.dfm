object frm_CST_COFINS_T46: Tfrm_CST_COFINS_T46
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'C'#243'digo da Situa'#231#227'o Tribut'#225'ria (CST) do COFINS'
  ClientHeight = 473
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
    Top = 43
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
    Top = 0
    Width = 385
    Height = 19
    Caption = 'C'#243'digo da Situa'#231#227'o Tribut'#225'ria (CST) do COFINS'
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
    Top = 240
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
  end
  object edFiltro: TEdit
    Left = 8
    Top = 61
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
    Top = 93
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
      DataController.DataSource = DS_COFINS
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
        Caption = 'CST COFINS'
        DataBinding.FieldName = 'COFINS_CODIGO'
        FooterAlignmentHorz = taCenter
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        MinWidth = 80
        Options.Editing = False
        Options.HorzSizing = False
        Width = 80
      end
      object tbViewColumn2: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'COFINS_DESCRICAO'
        Options.Editing = False
        Options.AutoWidthSizable = False
        Width = 800
      end
    end
    object gdNatLevel1: TcxGridLevel
      GridView = tbView
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 25
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
    TabOrder = 3
    Height = 3
    Width = 907
  end
  object DBMemo2: TDBMemo
    Left = 8
    Top = 371
    Width = 899
    Height = 89
    DataField = 'COFINS_DESCRICAO'
    DataSource = DS_COFINS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 0
    Top = 458
    Width = 915
    Height = 15
    Align = alBottom
    BevelOuter = bvNone
    Caption = '[ T46 ] '
    Color = 15254945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    ExplicitLeft = -439
    ExplicitTop = 324
    ExplicitWidth = 975
  end
  object SQL_COFINS: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'select * from CST_COFINS')
    Left = 576
    Top = 192
    object SQL_COFINSCOFINS_CODIGO: TStringField
      FieldName = 'COFINS_CODIGO'
      Size = 10
    end
    object SQL_COFINSCOFINS_DESCRICAO: TStringField
      FieldName = 'COFINS_DESCRICAO'
      Size = 255
    end
  end
  object DS_COFINS: TDataSource
    DataSet = SQL_COFINS
    Left = 656
    Top = 168
  end
end
