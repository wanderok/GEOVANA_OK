//Verificado automaticamente em 16/06/2020 09:29
unit CONSULTOR_HISTORICO_BLOQUEIOS_CHB_T23;
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
  TfrmCONSULTOR_HISTORICO_BLOQUEIOS_CHB_T23 = class(TForm)
    sql_CONSULTOR_HISTORICO_BLOQUEIOS_CHB: TFDQuery;
    dt_CONSULTOR_HISTORICO_BLOQUEIOS_CHB: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    lbNomeDaTela: TLabel;
    sql_CONSULTOR_HISTORICO_BLOQUEIOS_CHBCHB_CONSULTOR: TStringField;
    sql_CONSULTOR_HISTORICO_BLOQUEIOS_CHBCHB_DTEVENTO: TDateField;
    sql_CONSULTOR_HISTORICO_BLOQUEIOS_CHBCHB_HREVENTO: TStringField;
    sql_CONSULTOR_HISTORICO_BLOQUEIOS_CHBCHB_USUEVENTO: TStringField;
    sql_CONSULTOR_HISTORICO_BLOQUEIOS_CHBCHB_MAQEVENTO: TStringField;
    sql_CONSULTOR_HISTORICO_BLOQUEIOS_CHBCHB_EVENTO: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCONSULTOR_HISTORICO_BLOQUEIOS_CHB_T23: TfrmCONSULTOR_HISTORICO_BLOQUEIOS_CHB_T23;

implementation

{$R *.dfm}
uses Dados;

procedure TfrmCONSULTOR_HISTORICO_BLOQUEIOS_CHB_T23.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #27 then
     begin
       key := #0;
       Close;
     end;
end;

end.
