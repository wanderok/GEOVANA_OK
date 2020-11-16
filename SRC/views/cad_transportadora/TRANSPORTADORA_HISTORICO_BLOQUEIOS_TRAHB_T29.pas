//Verificado automaticamente em 16/06/2020 09:29
unit TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB_T29;
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
  TfrmTRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB_T29 = class(TForm)
    sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB: TFDQuery;
    dt_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    lbNomeDaTela: TLabel;
    sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_TRANSPORTADORA: TStringField;
    sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_DTEVENTO: TDateField;
    sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_HREVENTO: TStringField;
    sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_USUEVENTO: TStringField;
    sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_MAQEVENTO: TStringField;
    sql_TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHBTRAHB_EVENTO: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB_T29: TfrmTRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB_T29;

implementation

{$R *.dfm}
uses Dados;

procedure TfrmTRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB_T29.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #27 then
     begin
       key := #0;
       Close;
     end;
end;

end.
