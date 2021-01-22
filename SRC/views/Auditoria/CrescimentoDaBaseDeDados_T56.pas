unit CrescimentoDaBaseDeDados_T56;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls,
  VCLTee.Series,
  Buttons, ExtCtrls,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  DB, ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, 
  FireDAC.Comp.Client, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.DBChart;

type
  TFrmCrescimentoDaBaseDeDados_T56 = class(TForm)
    qGrafico: TFDQuery;
    DBChart1: TDBChart;
    BitBtn1: TBitBtn;
    Series1: TLineSeries;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnTxDia: TPanel;
    pnTxMes: TPanel;
    pnTxAno: TPanel;
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    Panel3: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCrescimentoDaBaseDeDados_T56: TFrmCrescimentoDaBaseDeDados_T56;

implementation

{$R *.dfm}

uses
  funcoesSMC;

procedure TFrmCrescimentoDaBaseDeDados_T56.FormShow(Sender: TObject);
Var vData1, vData2 : tDateTime;
    vDias,
    vRegistros1, vRegistros2,
    vCresceu, vIndice : Integer;
begin
// quem atualiza a tabela TABELAS_TAB é o aplicativo de ATUALIZA.EXE
  qGrafico.close;
  qGrafico.sql.clear;
  qGrafico.sql.add('SELECT RB_DATA      AS TAB_DATA, ');
  qGrafico.sql.add('       RB_REGISTROS AS REGISTROS ');
  qGrafico.sql.add('  FROM REGISTROSBANCO_RB         ');
  qGrafico.Sql.Add(' ORDER BY RB_DATA                ');
  qGrafico.Open;
  // CALCULO DO ÍNDICE MENSAL DE CRESCIMENTO...
  qGrafico.First;
  vData1      := qGrafico.FieldByName('TAB_DATA' ).AsDateTime;
  vRegistros1 := qGrafico.FieldByName('REGISTROS').AsInteger;
  qGrafico.Last;
  vData2      := qGrafico.FieldByName('TAB_DATA' ).AsDateTime;
  vRegistros2 := qGrafico.FieldByName('REGISTROS').AsInteger;
  vCresceu    := StrToInt(FloattoStr(vRegistros2 - vRegistros1));
  vDias       := StrToInt(FloattoStr(vData2 - vData1));

  if vDias > 0 then
     vIndice := vCresceu DIV vDias
  else
     vIndice := 0;
  pnTxDia.Caption := FormatFloat('#,##0',vIndice);
  pnTxMes.Caption := FormatFloat('#,##0',vIndice*30);
  pnTxAno.Caption := FormatFloat('#,##0',vIndice*365);

end;

procedure TFrmCrescimentoDaBaseDeDados_T56.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key = #27 Then
        begin
           key := #0;
           Close;
        end;

        if key = #13 Then
        begin
           key := #0;
           Perform(Wm_NextDlgCtl,0,0);
        end;

end;

end.
