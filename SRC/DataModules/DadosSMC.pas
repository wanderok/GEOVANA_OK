unit DadosSMC;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MSSQLDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.ODBCBase;

type
  TDM = class(TDataModule)
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    Database1: TFDConnection;
    Query1: TFDQuery;
    qUSUARIO: TFDQuery;
    Query2: TFDQuery;
    qCONFIG: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
