object frmCLIENTE_HISTORICO_BLOQUEIOS_CHB_T17: TfrmCLIENTE_HISTORICO_BLOQUEIOS_CHB_T17
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Hist'#243'rico de Bloqueios e Desbloqueios do Cliente'
  ClientHeight = 226
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 47
    Width = 609
    Height = 164
    DataSource = dt_CLIENTE_HISTORICO_BLOQUEIOS_CHB
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
        FieldName = 'CHB_DTEVENTO'
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
        FieldName = 'CHB_HREVENTO'
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
        FieldName = 'CHB_EVENTO'
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
        FieldName = 'CHB_USUEVENTO'
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
        FieldName = 'CHB_MAQEVENTO'
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
  object Panel2: TPanel
    Left = 0
    Top = 211
    Width = 609
    Height = 15
    Align = alBottom
    BevelOuter = bvNone
    Caption = '[ T20 ]'
    Color = 15254945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = -359
    ExplicitTop = 217
    ExplicitWidth = 968
  end
  object sql_CLIENTE_HISTORICO_BLOQUEIOS_CHB: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'Select * from CLIENTE_HISTORICO_BLOQUEIOS_CHB')
    Left = 416
    Top = 149
    object sql_CLIENTE_HISTORICO_BLOQUEIOS_CHBCHB_CLIENTE: TStringField
      FieldName = 'CHB_CLIENTE'
      Origin = 'CHB_CLIENTE'
      Required = True
    end
    object sql_CLIENTE_HISTORICO_BLOQUEIOS_CHBCHB_DTEVENTO: TDateField
      FieldName = 'CHB_DTEVENTO'
      Origin = 'CHB_DTEVENTO'
      Required = True
    end
    object sql_CLIENTE_HISTORICO_BLOQUEIOS_CHBCHB_HREVENTO: TStringField
      FieldName = 'CHB_HREVENTO'
      Origin = 'CHB_HREVENTO'
      Required = True
      Size = 5
    end
    object sql_CLIENTE_HISTORICO_BLOQUEIOS_CHBCHB_USUEVENTO: TStringField
      FieldName = 'CHB_USUEVENTO'
      Origin = 'CHB_USUEVENTO'
      Required = True
    end
    object sql_CLIENTE_HISTORICO_BLOQUEIOS_CHBCHB_MAQEVENTO: TStringField
      FieldName = 'CHB_MAQEVENTO'
      Origin = 'CHB_MAQEVENTO'
      Required = True
      Size = 50
    end
    object sql_CLIENTE_HISTORICO_BLOQUEIOS_CHBCHB_EVENTO: TStringField
      FieldName = 'CHB_EVENTO'
      Origin = 'CHB_EVENTO'
    end
  end
  object dt_CLIENTE_HISTORICO_BLOQUEIOS_CHB: TDataSource
    DataSet = sql_CLIENTE_HISTORICO_BLOQUEIOS_CHB
    Left = 456
    Top = 109
  end
end
