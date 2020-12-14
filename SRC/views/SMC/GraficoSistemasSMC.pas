unit GraficoSistemasSMC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.DBChart, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmGraficoSistemasSMC = class(TForm)
    DBChart2: TDBChart;
    Series1: TPieSeries;
    DBGrid1: TDBGrid;
    qGRAFICOSISTEMA_GS: TFDQuery;
    Query1: TFDQuery;
    Query2: TFDQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBChart2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Contar_SMC;
    procedure Contar_SMCPLUS;
    procedure Contar_Merchant;
    procedure Contar_GETransporte;
    procedure Contar_MDe;

  public
    { Public declarations }
  end;

var
  frmGraficoSistemasSMC: TfrmGraficoSistemasSMC;

implementation

{$R *.dfm}

uses Funcoes;

procedure TfrmGraficoSistemasSMC.Contar_GETransporte;
begin
    Query1.close;
    Query1.sql.clear;
    Query1.sql.add('SELECT COUNT(*) AS QTDE     ');
    Query1.sql.add('  FROM CLIENTE_DETALHE_CLID ');
    Query1.sql.add(' WHERE CLID_GETRANSPORTE = 1');
    Query1.Open;
    Query2.close;
    Query2.sql.clear;
    Query2.sql.add('INSERT INTO GRAFICOSISTEMA_GS ( ');
    Query2.sql.add('             GS_SISTEMA,        ');
    Query2.sql.add('             GS_QTDE )           ');
    Query2.sql.add('VALUES (                         ');
    Query2.sql.add('            :GS_SISTEMA,        ');
    Query2.sql.add('            :GS_QTDE )           ');
    Query2.ParamByName('GS_SISTEMA').AsString  := 'GE TRANSP';
    Query2.ParamByName('GS_QTDE'   ).AsInteger := Query1.FieldByName('QTDE').AsInteger;
    Query2.execsql;
end;

procedure TfrmGraficoSistemasSMC.Contar_MDe;
begin
    Query1.close;
    Query1.sql.clear;
    Query1.sql.add('SELECT COUNT(*) AS QTDE     ');
    Query1.sql.add('  FROM CLIENTE_DETALHE_CLID ');
    Query1.sql.add(' WHERE CLID_MDE = 1         ');
    Query1.Open;
    Query2.close;
    Query2.sql.clear;
    Query2.sql.add('INSERT INTO GRAFICOSISTEMA_GS ( ');
    Query2.sql.add('             GS_SISTEMA,        ');
    Query2.sql.add('             GS_QTDE )           ');
    Query2.sql.add('VALUES (                         ');
    Query2.sql.add('            :GS_SISTEMA,        ');
    Query2.sql.add('            :GS_QTDE )           ');
    Query2.ParamByName('GS_SISTEMA').AsString  := 'MDE';
    Query2.ParamByName('GS_QTDE'   ).AsInteger := Query1.FieldByName('QTDE').AsInteger;
    Query2.execsql;
end;

procedure TfrmGraficoSistemasSMC.Contar_Merchant;
begin
    Query1.close;
    Query1.sql.clear;
    Query1.sql.add('SELECT COUNT(*) AS QTDE     ');
    Query1.sql.add('  FROM CLIENTE_DETALHE_CLID ');
    Query1.sql.add(' WHERE CLID_MERCHANT = 1    ');
    Query1.Open;
    Query2.close;
    Query2.sql.clear;
    Query2.sql.add('INSERT INTO GRAFICOSISTEMA_GS ( ');
    Query2.sql.add('             GS_SISTEMA,        ');
    Query2.sql.add('             GS_QTDE )           ');
    Query2.sql.add('VALUES (                         ');
    Query2.sql.add('            :GS_SISTEMA,        ');
    Query2.sql.add('            :GS_QTDE )           ');
    Query2.ParamByName('GS_SISTEMA').AsString  := 'MERCHANT';
    Query2.ParamByName('GS_QTDE'   ).AsInteger := Query1.FieldByName('QTDE').AsInteger;
    Query2.execsql;
end;

procedure TfrmGraficoSistemasSMC.Contar_SMC;
begin
    Query1.close;
    Query1.sql.clear;
    Query1.sql.add('SELECT COUNT(*) AS QTDE     ');
    Query1.sql.add('  FROM CLIENTE_DETALHE_CLID ');
    Query1.sql.add(' WHERE CLID_SMC = 1         ');
    Query1.Open;
    Query2.close;
    Query2.sql.clear;
    Query2.sql.add('INSERT INTO GRAFICOSISTEMA_GS ( ');
    Query2.sql.add('             GS_SISTEMA,        ');
    Query2.sql.add('             GS_QTDE )           ');
    Query2.sql.add('VALUES (                         ');
    Query2.sql.add('            :GS_SISTEMA,        ');
    Query2.sql.add('            :GS_QTDE )           ');
    Query2.ParamByName('GS_SISTEMA').AsString  := 'SMC';
    Query2.ParamByName('GS_QTDE'   ).AsInteger := Query1.FieldByName('QTDE').AsInteger;
    Query2.execsql;
end;

procedure TfrmGraficoSistemasSMC.Contar_SMCPLUS;
begin
    Query1.close;
    Query1.sql.clear;
    Query1.sql.add('SELECT COUNT(*) AS QTDE     ');
    Query1.sql.add('  FROM CLIENTE_DETALHE_CLID ');
    Query1.sql.add(' WHERE CLID_SMCPLUS = 1     ');
    Query1.Open;
    Query2.close;
    Query2.sql.clear;
    Query2.sql.add('INSERT INTO GRAFICOSISTEMA_GS ( ');
    Query2.sql.add('             GS_SISTEMA,        ');
    Query2.sql.add('             GS_QTDE )           ');
    Query2.sql.add('VALUES (                         ');
    Query2.sql.add('            :GS_SISTEMA,        ');
    Query2.sql.add('            :GS_QTDE )           ');
    Query2.ParamByName('GS_SISTEMA').AsString  := 'SMCPLUS';
    Query2.ParamByName('GS_QTDE'   ).AsInteger := Query1.FieldByName('QTDE').AsInteger;
    Query2.execsql;
end;

procedure TfrmGraficoSistemasSMC.DBChart2Click(Sender: TObject);
begin
   close;
end;

procedure TfrmGraficoSistemasSMC.FormShow(Sender: TObject);
begin
    Executar('TRUNCATE TABLE GRAFICOSISTEMA_GS');

    Contar_SMC;
    Contar_SMCPLUS;
    Contar_Merchant;
    Contar_GETransporte;
    Contar_MDe;

    qGRAFICOSISTEMA_GS.close;
    qGRAFICOSISTEMA_GS.sql.clear;
    qGRAFICOSISTEMA_GS.sql.Add('SELECT GS_SISTEMA,        ');
    qGRAFICOSISTEMA_GS.sql.Add('       GS_QTDE            ');
    qGRAFICOSISTEMA_GS.sql.Add('  FROM GRAFICOSISTEMA_GS  ');
    qGRAFICOSISTEMA_GS.sql.Add(' ORDER BY GS_QTDE DESC    ');
    qGRAFICOSISTEMA_GS.Open;

end;


end.
