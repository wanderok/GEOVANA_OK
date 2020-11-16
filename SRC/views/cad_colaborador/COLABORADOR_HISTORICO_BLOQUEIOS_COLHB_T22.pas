//Verificado automaticamente em 16/06/2020 09:29
unit COLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22;
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
  TfrmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22 = class(TForm)
    sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHB: TFDQuery;
    dt_COLABORADOR_HISTORICO_BLOQUEIOS_COLHB: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    lbNomeDaTela: TLabel;
    sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_COLABORADOR: TStringField;
    sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_DTEVENTO: TDateField;
    sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_HREVENTO: TStringField;
    sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_USUEVENTO: TStringField;
    sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_MAQEVENTO: TStringField;
    sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHBCOLHB_EVENTO: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22: TfrmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22;

implementation

{$R *.dfm}
uses Dados;

procedure TfrmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #27 then
     begin
       key := #0;
       Close;
     end;
end;

end.
