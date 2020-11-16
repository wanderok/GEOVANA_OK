object frmMOTORISTA_HISTORICO_BLOQUEIOS_MOTHB_T27: TfrmMOTORISTA_HISTORICO_BLOQUEIOS_MOTHB_T27
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Hist'#243'rico de Bloqueios e Desbloqueios do Motorista'
  ClientHeight = 225
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lbNomeDaTela: TLabel
    Left = 0
    Top = 212
    Width = 609
    Height = 13
    Align = alBottom
    Alignment = taRightJustify
    Caption = '[ T27 ] '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 569
    ExplicitWidth = 40
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 47
    Width = 609
    Height = 162
    DataSource = dt_MOTORISTA_HISTORICO_BLOQUEIOS_CONTHB
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MOTHB_DTEVENTO'
        Title.Caption = 'Data'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTHB_HREVENTO'
        Title.Caption = 'Hora'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTHB_EVENTO'
        Title.Caption = 'Evento'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTHB_USUEVENTO'
        Title.Caption = 'Usu'#225'rio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTHB_MAQEVENTO'
        Title.Caption = 'Terminal'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 41
    Align = alTop
    Caption = 'Hist'#243'rico de Eventos de Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object sql_MOTORISTA_HISTORICO_BLOQUEIOS_MOTHB: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'Select * from MOTORISTA_HISTORICO_BLOQUEIOS_MOTHB')
    Left = 416
    Top = 149
    object sql_MOTORISTA_HISTORICO_BLOQUEIOS_MOTHBMOTHB_MOTORISTA: TStringField
      FieldName = 'MOTHB_MOTORISTA'
      Origin = 'MOTHB_MOTORISTA'
      Required = True
    end
    object sql_MOTORISTA_HISTORICO_BLOQUEIOS_MOTHBMOTHB_DTEVENTO: TDateField
      FieldName = 'MOTHB_DTEVENTO'
      Origin = 'MOTHB_DTEVENTO'
      Required = True
    end
    object sql_MOTORISTA_HISTORICO_BLOQUEIOS_MOTHBMOTHB_HREVENTO: TStringField
      FieldName = 'MOTHB_HREVENTO'
      Origin = 'MOTHB_HREVENTO'
      Required = True
      Size = 5
    end
    object sql_MOTORISTA_HISTORICO_BLOQUEIOS_MOTHBMOTHB_USUEVENTO: TStringField
      FieldName = 'MOTHB_USUEVENTO'
      Origin = 'MOTHB_USUEVENTO'
      Required = True
    end
    object sql_MOTORISTA_HISTORICO_BLOQUEIOS_MOTHBMOTHB_MAQEVENTO: TStringField
      FieldName = 'MOTHB_MAQEVENTO'
      Origin = 'MOTHB_MAQEVENTO'
      Required = True
      Size = 50
    end
    object sql_MOTORISTA_HISTORICO_BLOQUEIOS_MOTHBMOTHB_EVENTO: TStringField
      FieldName = 'MOTHB_EVENTO'
      Origin = 'MOTHB_EVENTO'
    end
  end
  object dt_MOTORISTA_HISTORICO_BLOQUEIOS_CONTHB: TDataSource
    DataSet = sql_MOTORISTA_HISTORICO_BLOQUEIOS_MOTHB
    Left = 456
    Top = 109
  end
end
