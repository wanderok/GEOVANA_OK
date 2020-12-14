unit GraficoProdutividadeSMC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmGraficoProdutividadeSMC = class(TForm)
    tbGRAFICOUSUARQUIVOSFISCAIS_GUAF: TFDTable;
    DBChart2: TDBChart;
    Series2: TBarSeries;
    procedure FormShow(Sender: TObject);
    procedure DBChart2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGraficoProdutividadeSMC: TfrmGraficoProdutividadeSMC;

implementation

{$R *.dfm}

procedure TfrmGraficoProdutividadeSMC.DBChart2Click(Sender: TObject);
begin
   close;
end;

procedure TfrmGraficoProdutividadeSMC.FormShow(Sender: TObject);
begin
   tbGRAFICOUSUARQUIVOSFISCAIS_GUAF.Open;
end;

end.
