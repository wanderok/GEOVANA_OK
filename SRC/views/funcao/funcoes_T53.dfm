object frm_funcoes_T53: Tfrm_funcoes_T53
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atalho para Fun'#231#245'es do Sistema'
  ClientHeight = 532
  ClientWidth = 577
  Color = clMenuBar
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 4
    Width = 70
    Height = 18
    Caption = 'Consulta:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbNomeDaTela: TLabel
    Left = 0
    Top = 519
    Width = 577
    Height = 13
    Align = alBottom
    Alignment = taRightJustify
    Caption = '[ T53 ] '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 537
    ExplicitWidth = 40
  end
  object Label24: TLabel
    Left = 70
    Top = 32
    Width = 152
    Height = 13
    Caption = '(C'#243'digo / Reduzido / Fun'#231#227'o...)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object gdProds: TcxGrid
    Left = 0
    Top = 50
    Width = 577
    Height = 463
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2013White'
    object tbView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.DetailKeyFieldNames = 'CODIGO'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = ' . . .'
      OptionsView.GroupByBox = False
      object TS_CODIGO: TcxGridDBColumn
        Caption = 'C'#243'd'
        DataBinding.FieldName = 'TS_CODIGO'
        FooterAlignmentHorz = taCenter
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        MinWidth = 50
        Options.Editing = False
        Options.AutoWidthSizable = False
        Options.EditAutoHeight = ieahNone
        Options.HorzSizing = False
        Width = 50
      end
      object TS_NOMECURTO: TcxGridDBColumn
        Caption = 'Reduzido'
        DataBinding.FieldName = 'TS_NOMECURTO'
        MinWidth = 100
        Options.Editing = False
        Options.AutoWidthSizable = False
        Options.EditAutoHeight = ieahNone
        Options.HorzSizing = False
        VisibleForEditForm = bFalse
        Width = 100
      end
      object TS_DESCRICAO: TcxGridDBColumn
        Caption = 'Fun'#231#227'o'
        DataBinding.FieldName = 'TS_DESCRICAO'
        MinWidth = 405
        Options.Editing = False
        Options.AutoWidthSizable = False
        Options.EditAutoHeight = ieahNone
        Options.HorzSizing = False
        Width = 405
      end
    end
    object gdProdsLevel1: TcxGridLevel
      GridView = tbView
    end
  end
  object edFiltro: TEdit
    Left = 70
    Top = 0
    Width = 382
    Height = 26
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = edFiltroChange
  end
  object DataSource1: TDataSource
    DataSet = qLocal
    Left = 400
    Top = 160
  end
  object qLocal: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'select * from TELAS_SISTEMA_TS')
    Left = 400
    Top = 208
  end
end
