object frmGraficoProdutividadeSMC: TfrmGraficoProdutividadeSMC
  Left = 0
  Top = 0
  Caption = 'Gr'#225'fico de Produtividade'
  ClientHeight = 360
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart2: TDBChart
    Left = 0
    Top = 0
    Width = 767
    Height = 360
    Gradient.EndColor = 12615680
    Gradient.Visible = True
    Title.Text.Strings = (
      'PRODUTIVIDADE')
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
    Align = alClient
    TabOrder = 0
    OnClick = DBChart2Click
    ExplicitLeft = 416
    ExplicitWidth = 351
    ExplicitHeight = 225
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      17
      15
      17)
    ColorPaletteIndex = 13
    object Series2: TBarSeries
      ColorEachPoint = True
      Marks.Style = smsLabelPercentValue
      DataSource = tbGRAFICOUSUARQUIVOSFISCAIS_GUAF
      XLabelsSource = 'GUAF_USU'
      UseYOrigin = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      XValues.ValueSource = 'GUAF_QTDE'
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'GUAF_QTDE'
    end
  end
  object tbGRAFICOUSUARQUIVOSFISCAIS_GUAF: TFDTable
    Active = True
    Connection = DM.Database1
    UpdateOptions.UpdateTableName = 'GRAFICOUSUARQUIVOSFISCAIS_GUAF'
    TableName = 'GRAFICOUSUARQUIVOSFISCAIS_GUAF'
    Left = 320
    Top = 136
  end
end
