object frmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22: TfrmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Hist'#243'rico de Bloqueios e Desbloqueios do Colaborador'
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 47
    Width = 609
    Height = 162
    DataSource = dt_COLABORADOR_HISTORICO_BLOQUEIOS_COLHB
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
        FieldName = 'COLB_DTEVENTO'
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
        FieldName = 'COLHB_HREVENTO'
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
        FieldName = 'COLHB_EVENTO'
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
        FieldName = 'COLHB_USUEVENTO'
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
        FieldName = 'COLHB_MAQEVENTO'
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
    Top = 210
    Width = 609
    Height = 15
    Align = alBottom
    BevelOuter = bvNone
    Caption = '[ T22 ]'
    Color = 15254945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = -363
    ExplicitWidth = 972
  end
  object sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHB: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'Select * from COLABORADOR_HISTORICO_BLOQUEIOS_COLHB')
    Left = 416
    Top = 149
    object sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_COLABORADOR: TStringField
      FieldName = 'COLHB_COLABORADOR'
      Origin = 'COLHB_COLABORADOR'
      Required = True
    end
    object sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_DTEVENTO: TDateField
      FieldName = 'COLHB_DTEVENTO'
      Origin = 'COLHB_DTEVENTO'
      Required = True
    end
    object sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_HREVENTO: TStringField
      FieldName = 'COLHB_HREVENTO'
      Origin = 'COLHB_HREVENTO'
      Required = True
      Size = 5
    end
    object sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_USUEVENTO: TStringField
      FieldName = 'COLHB_USUEVENTO'
      Origin = 'COLHB_USUEVENTO'
      Required = True
    end
    object sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_MAQEVENTO: TStringField
      FieldName = 'COLHB_MAQEVENTO'
      Origin = 'COLHB_MAQEVENTO'
      Required = True
      Size = 50
    end
    object sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_EVENTO: TStringField
      FieldName = 'COLHB_EVENTO'
      Origin = 'COLHB_EVENTO'
    end
  end
  object dt_COLABORADOR_HISTORICO_BLOQUEIOS_COLHB: TDataSource
    DataSet = sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHB
    Left = 456
    Top = 109
  end
end
