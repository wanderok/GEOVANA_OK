unit Classe_EmpresaTributacao;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,

     Classe_TributacaoPIS,
     Classe_TributacaoCOFINS,
     Classe_TributacaoISS;

type

  TTributosDeEmpresa = class
   private
	  FPIS    : TPIS;
	  FCOFINS : TCOFINS;
	  FISS    : TISS;
   public
    Constructor Create;
    Destructor  Destroy; Override;
    property PIS    : TPIS    read FPIS    write FPIS;
    property COFINS : TCOFINS read FCOFINS write FCOFINS;
    property ISS    : TISS    read FISS    write FISS;
  end;

implementation
{ TEmpresa }

uses FuncoesSMC;

var qEmpresa: TFDQuery;


{ TTributosDeEmpresa }

constructor TTributosDeEmpresa.Create;
begin
   FPIS    := TPIS.Create;
   FCOFINS := TCOFINS.Create;
   FISS    := TISS.Create;
end;

destructor TTributosDeEmpresa.Destroy;
begin
  FPIS.Free;
  FCOFINS.Free;
  FISS.Free;
  inherited;
end;

end.
