object Frm_Municipio_T5: TFrm_Municipio_T5
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consultar Munic'#237'pio'
  ClientHeight = 167
  ClientWidth = 372
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbNomeDaTela: TLabel
    Left = 0
    Top = 154
    Width = 372
    Height = 13
    Align = alBottom
    Alignment = taRightJustify
    Caption = 'T5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 358
    ExplicitWidth = 14
  end
  object Edit1: TEdit
    Left = 0
    Top = 0
    Width = 369
    Height = 34
    AutoSelect = False
    AutoSize = False
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = Edit1Change
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 35
    Width = 372
    Height = 119
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnCellClick = DBGrid1CellClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CID_NOME'
        Title.Caption = 'Cidade'
        Width = 218
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UF_SIGLA'
        Title.Alignment = taCenter
        Title.Caption = 'Sigla'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CID_CODIGO'
        Title.Caption = 'IBGE'
        Width = 71
        Visible = True
      end>
  end
  object qLocal: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'select * FROM CIDADE_CID, UF_UF'
      'WHERE CID_UF = UF_CODIGO')
    Left = 184
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = qLocal
    Left = 112
    Top = 88
  end
  object ACBrEnterTab1: TACBrEnterTab
    Left = 256
    Top = 16
  end
end
