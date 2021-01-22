object FrmCrescimentoDaBaseDeDados_T56: TFrmCrescimentoDaBaseDeDados_T56
  Left = 17
  Top = 143
  AutoSize = True
  Caption = 
    'Crescimento da Base de Dados do Brena (N'#250'mero de Registros Armaz' +
    'enados) [ T56 ]'
  ClientHeight = 489
  ClientWidth = 986
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 339
    Top = 44
    Width = 163
    Height = 13
    Caption = 'Taxa de Crescimento Mensal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 4
    Top = 44
    Width = 156
    Height = 13
    Caption = 'Taxa de Crescimento Di'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 725
    Top = 44
    Width = 155
    Height = 13
    Caption = 'Taxa de Crescimento Anual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBChart1: TDBChart
    Left = 0
    Top = 65
    Width = 986
    Height = 391
    Title.AutoSize = False
    Title.Font.Height = -13
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      '')
    Title.AdjustFrame = False
    LeftAxis.AxisValuesFormat = '#.##0'
    LeftAxis.ExactDateTime = False
    LeftAxis.Visible = False
    View3D = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object BitBtn1: TBitBtn
      Left = 704
      Top = 528
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      TabOrder = 0
    end
    object Series1: TLineSeries
      Legend.Visible = False
      Marks.Frame.Color = clBlue
      Marks.Visible = True
      Marks.Style = smsValue
      DataSource = qGrafico
      PercentFormat = '##0'
      SeriesColor = clBlue
      ShowInLegend = False
      Title = 'Registros Armazenados'
      ValueFormat = '#,##0'
      XLabelsSource = 'TAB_DATA'
      Brush.BackColor = clDefault
      LinePen.Color = clBlue
      LinePen.Width = 2
      Pointer.InflateMargins = False
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'TAB_DATA'
      YValues.Name = 'Y'
      YValues.Order = loNone
      YValues.ValueSource = 'REGISTROS'
    end
  end
  object pnTxDia: TPanel
    Left = 161
    Top = 38
    Width = 100
    Height = 25
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnTxMes: TPanel
    Left = 507
    Top = 38
    Width = 100
    Height = 25
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object pnTxAno: TPanel
    Left = 885
    Top = 38
    Width = 100
    Height = 25
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 452
    Width = 986
    Height = 17
    Align = alBottom
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 986
    Height = 32
    Align = alTop
    Caption = 'Crescimento da Base de Dados'
    Color = 33023
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object Panel3: TPanel
    Left = 0
    Top = 469
    Width = 986
    Height = 20
    Align = alBottom
    Caption = '[ T40 ]'
    Color = 33023
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
  end
  object qGrafico: TFDQuery
    ConnectionName = 'x'
    SQL.Strings = (
      'SELECT TAB_DATA, SUM(TAB_REGISTROS) AS REGISTROS '
      'FROM TABELAS_TAB'
      'GROUP BY TAB_DATA'
      'ORDER BY TAB_DATA')
    Left = 256
    Top = 80
  end
end
