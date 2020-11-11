unit Classe_Configuracoes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TConfiguracao = class
  private
    FTrataNuvem : Boolean;
    FQuery      : TFDQuery;

    function getTrataNuvem: Boolean;
   public
      constructor Create;
      destructor Destroy; override;
      property TrataNuvem:Boolean read getTrataNuvem;
      procedure Abrir_configuracoes;
  end;

implementation

{ TConfiguracao }

procedure TConfiguracao.Abrir_configuracoes;
begin
   FQuery.close;
   FQuery.sql.Clear;
   FQuery.sql.Add('SELECT *         ');
   FQuery.sql.Add('  FROM CONFIG_CFG');
   FQuery.Open;

   FTrataNuvem := (FQuery.FieldByName('CFG_TRATA_NUVEM').AsInteger = 1);
end;

constructor TConfiguracao.Create;
begin
   FQuery := TFDQuery.Create(nil);
   FQuery.ConnectionName := 'X';
end;

destructor TConfiguracao.Destroy;
begin
  FQuery.Free;
  inherited;
end;

function TConfiguracao.getTrataNuvem: Boolean;
begin
   Abrir_configuracoes;
   Result := FTrataNuvem;
end;

end.
