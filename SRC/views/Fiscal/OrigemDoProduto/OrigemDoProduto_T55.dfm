object frm_OrigemDoProduto_T55: Tfrm_OrigemDoProduto_T55
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'C'#243'digo da Origem do Produto'
  ClientHeight = 331
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 206
    Top = 0
    Width = 240
    Height = 19
    Caption = 'C'#243'digo da Origem do Produto'
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 3
    Top = 35
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
  object lbNomeDaTela: TLabel
    Left = 0
    Top = 318
    Width = 728
    Height = 13
    Align = alBottom
    Alignment = taRightJustify
    Caption = '[ T55 ] '
    Color = 15254945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ExplicitLeft = 688
    ExplicitWidth = 40
  end
  object gdNat: TcxGrid
    Left = 1
    Top = 89
    Width = 725
    Height = 226
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2013White'
    object tbView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DS_CEST
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
      object OP_CODIGO: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'OP_CODIGO'
        FooterAlignmentHorz = taCenter
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        MinWidth = 60
        Options.Editing = False
        Options.HorzSizing = False
        Width = 60
      end
      object OP_DESCRICAO: TcxGridDBColumn
        Caption = 'Origem'
        DataBinding.FieldName = 'OP_DESCRICAO'
        Options.Editing = False
        Width = 660
      end
    end
    object gdNatLevel1: TcxGridLevel
      GridView = tbView
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 22
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
    TabOrder = 1
    Height = 3
    Width = 728
  end
  object edFiltro: TEdit
    Left = 3
    Top = 54
    Width = 616
    Height = 26
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnChange = edFiltroChange
  end
  object qLocal: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'select * from ORIGEM_PRODUTO_OP')
    Left = 384
    Top = 144
  end
  object DS_CEST: TDataSource
    DataSet = qLocal
    Left = 312
    Top = 136
  end
end
