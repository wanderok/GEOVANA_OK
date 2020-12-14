object frmGraficoContadoresSMC: TfrmGraficoContadoresSMC
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Gr'#225'fico de Contadores'
  ClientHeight = 552
  ClientWidth = 1287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart2: TDBChart
    Left = 0
    Top = 0
    Width = 961
    Height = 552
    Gradient.EndColor = 12615680
    Gradient.Visible = True
    Title.Transparent = False
    Title.Visible = False
    Chart3DPercent = 17
    LeftAxis.Visible = False
    Legend.Alignment = laBottom
    Legend.Font.Style = [fsBold]
    Legend.FontSeriesColor = True
    Legend.Frame.Visible = False
    Legend.LegendStyle = lsValues
    Legend.Symbol.Continuous = True
    Legend.Symbol.Gradient.EndColor = 3513587
    Legend.Symbol.Pen.Color = clDefault
    Legend.Symbol.Pen.Width = 0
    Legend.Symbol.Squared = False
    Legend.TextStyle = ltsRightPercent
    Legend.Title.Font.Height = -1
    Legend.Title.Visible = False
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    TabOrder = 0
    OnClick = DBChart2Click
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      17
      15
      17)
    ColorPaletteIndex = 13
    object Series1: TPieSeries
      Legend.Visible = False
      DataSource = qGRAFICOCONTADOR_GC
      ShowInLegend = False
      XLabelsSource = 'CONT_NOME_FANTASIA'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'GC_QTDE'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 967
    Top = 0
    Width = 320
    Height = 552
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GC_QTDE'
        Title.Alignment = taCenter
        Title.Caption = 'Clientes'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONT_NOME_FANTASIA'
        ReadOnly = True
        Title.Caption = 'Contador'
        Width = 200
        Visible = True
      end>
  end
  object qGRAFICOCONTADOR_GC: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'SELECT CONT_NOME_FANTASIA, GC_QTDE'
      'FROM GRAFICOCONTADOR_GC,'
      '     CONTADOR_CONT'
      'WHERE CONT_CODIGO = GC_CONTADOR'
      'ORDER BY GC_QTDE DESC')
    Left = 112
    Top = 60
  end
  object Query1: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'select * from cliente')
    Left = 32
    Top = 156
  end
  object Query2: TFDQuery
    Connection = DM.Database1
    SQL.Strings = (
      'select * from cliente')
    Left = 80
    Top = 156
  end
  object DataSource1: TDataSource
    DataSet = qGRAFICOCONTADOR_GC
    Left = 504
    Top = 56
  end
end
