//Verificado automaticamente em 16/06/2020 09:29
unit FORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18;
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
  TfrmFORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18 = class(TForm)
    sql_FORNECEDOR_HISTORICO_BLOQUEIOS_FHB: TFDQuery;
    dt_FORNECEDOR_HISTORICO_BLOQUEIOS_FHB: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    lbNomeDaTela: TLabel;
    sql_FORNECEDOR_HISTORICO_BLOQUEIOS_FHBFHB_CLIENTE: TStringField;
    sql_FORNECEDOR_HISTORICO_BLOQUEIOS_FHBFHB_DTEVENTO: TDateField;
    sql_FORNECEDOR_HISTORICO_BLOQUEIOS_FHBFHB_HREVENTO: TStringField;
    sql_FORNECEDOR_HISTORICO_BLOQUEIOS_FHBFHB_USUEVENTO: TStringField;
    sql_FORNECEDOR_HISTORICO_BLOQUEIOS_FHBFHB_MAQEVENTO: TStringField;
    sql_FORNECEDOR_HISTORICO_BLOQUEIOS_FHBFHB_EVENTO: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18: TfrmFORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18;

implementation

{$R *.dfm}
uses Dados;

procedure TfrmFORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     if key = #27 then
     begin
       key := #0;
       Close;
     end;
end;

end.
