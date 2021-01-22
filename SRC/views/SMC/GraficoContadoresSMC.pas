unit GraficoContadoresSMC;

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
  TfrmGraficoContadoresSMC = class(TForm)
    DBChart2: TDBChart;
    Series1: TPieSeries;
    DBGrid1: TDBGrid;
    qGRAFICOCONTADOR_GC: TFDQuery;
    Query1: TFDQuery;
    Query2: TFDQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DBChart2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGraficoContadoresSMC: TfrmGraficoContadoresSMC;

implementation

{$R *.dfm}

uses FuncoesSMC;

procedure TfrmGraficoContadoresSMC.DBChart2Click(Sender: TObject);
begin
   close;
end;

procedure TfrmGraficoContadoresSMC.FormShow(Sender: TObject);
begin
    Executar('TRUNCATE TABLE GRAFICOCONTADOR_GC');

    Query1.close;
    Query1.sql.clear;
    Query1.sql.add('SELECT CONT_CODIGO,                      ');
    Query1.sql.add('       COUNT(*) AS QTDE                  ');
    Query1.sql.add('  FROM CLIENTE_CLI                       ');
    Query1.sql.add('  LEFT OUTER JOIN CLIENTE_DETALHE_CLID   ');
    Query1.sql.add('    ON CLID_CODIGO = CLI_CODIGO          ');
    Query1.sql.add('  LEFT OUTER JOIN CONTADOR_CONT          ');
    Query1.sql.add('    ON CONT_CODIGO = CLID_CDCONTADOR     ');
    Query1.sql.add(' GROUP BY CONT_CODIGO                    ');
    Query1.Open;
    while NOT Query1.Eof do
    begin
        Query2.close;
        Query2.sql.clear;
        Query2.sql.add('INSERT INTO GRAFICOCONTADOR_GC ( ');
        Query2.sql.add('             GC_CONTADOR,        ');
        Query2.sql.add('             GC_QTDE )           ');
        Query2.sql.add('VALUES (                         ');
        Query2.sql.add('            :GC_CONTADOR,        ');
        Query2.sql.add('            :GC_QTDE )           ');
        Query2.ParamByName('GC_CONTADOR').AsString  := Query1.FieldByName('CONT_CODIGO').AsString;
        Query2.ParamByName('GC_QTDE'    ).AsInteger := Query1.FieldByName('QTDE'       ).AsInteger;
        Query2.execsql;
        Query1.Next;
    end;
    qGRAFICOCONTADOR_GC.close;
    qGRAFICOCONTADOR_GC.sql.clear;
    qGRAFICOCONTADOR_GC.sql.Add('SELECT CONT_NOME_FANTASIA,      ');
    qGRAFICOCONTADOR_GC.sql.Add('       GC_QTDE                  ');
    qGRAFICOCONTADOR_GC.sql.Add('  FROM GRAFICOCONTADOR_GC,      ');
    qGRAFICOCONTADOR_GC.sql.Add('       CONTADOR_CONT            ');
    qGRAFICOCONTADOR_GC.sql.Add(' WHERE CONT_CODIGO = GC_CONTADOR');
    qGRAFICOCONTADOR_GC.sql.Add(' ORDER BY GC_QTDE DESC          ');
    qGRAFICOCONTADOR_GC.Open;
end;


end.
