object frmTRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB_T29: TfrmTRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB_T29
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Hist'#243'rico de Bloqueios e Desbloqueios da Transportadora'
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
    DataSource = dt_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB
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
        FieldName = 'TRAHB_DTEVENTO'
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
        FieldName = 'TRAHB_HREVENTO'
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
        FieldName = 'TRAHB_EVENTO'
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
        FieldName = 'TRAHB_USUEVENTO'
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
        FieldName = 'TRAHB_MAQEVENTO'
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
  object Panel17: TPanel
    Left = 0
    Top = 210
    Width = 609
    Height = 15
    Align = alBottom
    BevelOuter = bvNone
    Caption = '[ T29 ]'
    Color = 15254945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = -22
    ExplicitWidth = 631
  end
  object sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'Select * from TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB')
    Left = 416
    Top = 149
    object sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_TRANSPORTADORA: TStringField
      FieldName = 'TRAHB_TRANSPORTADORA'
      Origin = 'TRAHB_TRANSPORTADORA'
      Required = True
    end
    object sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_DTEVENTO: TDateField
      FieldName = 'TRAHB_DTEVENTO'
      Origin = 'TRAHB_DTEVENTO'
      Required = True
    end
    object sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_HREVENTO: TStringField
      FieldName = 'TRAHB_HREVENTO'
      Origin = 'TRAHB_HREVENTO'
      Required = True
      Size = 5
    end
    object sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_USUEVENTO: TStringField
      FieldName = 'TRAHB_USUEVENTO'
      Origin = 'TRAHB_USUEVENTO'
      Required = True
    end
    object sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_MAQEVENTO: TStringField
      FieldName = 'TRAHB_MAQEVENTO'
      Origin = 'TRAHB_MAQEVENTO'
      Required = True
      Size = 50
    end
    object sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_EVENTO: TStringField
      FieldName = 'TRAHB_EVENTO'
      Origin = 'TRAHB_EVENTO'
    end
  end
  object dt_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB: TDataSource
    DataSet = sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB
    Left = 456
    Top = 109
  end
end
