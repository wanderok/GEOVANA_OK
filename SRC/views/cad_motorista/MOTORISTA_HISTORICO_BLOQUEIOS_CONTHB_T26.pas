//Verificado automaticamente em 16/06/2020 09:29
unit MOTORISTA_HISTORICO_BLOQUEIOS_CONTHB_T26;
{
Ano:2020
================================================================================
|ITEM |DATA |UNIT / FILE         |HISTORICO                                    |
|-----|-----|--------------------|---------------------------------------------|
|  114|26/04|u_funcoes           |Criada esta unit/form para listar o histórico|
|     |     |                    |de bloqueios/desbloqueios do cadastro de um  |
|     |     |                    |Cliente                                      |
================================================================================
}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmMOTORISTA_HISTORICO_BLOQUEIOS_CONTHB_T26 = class(TForm)
    sql_CONTADOR_HISTORICO_BLOQUEIOS_CONTHB: TFDQuery;
    dt_CONTADOR_HISTORICO_BLOQUEIOS_CONTHB: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    lbNomeDaTela: TLabel;
    sql_CONTADOR_HISTORICO_BLOQUEIOS_CONTHBCONTHB_DTEVENTO: TDateField;
    sql_CONTADOR_HISTORICO_BLOQUEIOS_CONTHBCONTHB_HREVENTO: TStringField;
    sql_CONTADOR_HISTORICO_BLOQUEIOS_CONTHBCONTHB_USUEVENTO: TStringField;
    sql_CONTADOR_HISTORICO_BLOQUEIOS_CONTHBCONTHB_MAQEVENTO: TStringField;
    sql_CONTADOR_HISTORICO_BLOQUEIOS_CONTHBCONTHB_EVENTO: TStringField;
    sql_CONTADOR_HISTORICO_BLOQUEIOS_CONTHBCONTHB_CONTADOR: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMOTORISTA_HISTORICO_BLOQUEIOS_CONTHB_T26: TfrmMOTORISTA_HISTORICO_BLOQUEIOS_CONTHB_T26;

implementation

{$R *.dfm}
uses Dados;

procedure TfrmMOTORISTA_HISTORICO_BLOQUEIOS_CONTHB_T26.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #27 then
     begin
       key := #0;
       Close;
     end;
end;

end.
