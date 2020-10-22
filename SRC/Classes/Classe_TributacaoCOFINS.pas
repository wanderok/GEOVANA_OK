unit Classe_TributacaoCOFINS;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option;

type
   TCOFINS = class
   private
      FCumulativo : Boolean;
      FAliquota   : Real;
      function getFCumulativo: Boolean;
      procedure setFCumulativo(const Value: Boolean);
    function getFAliquota: Real;
    procedure setFAliquota(const Value: Real);
   public
      property Cumulativo : Boolean read getFCumulativo write setFCumulativo;
      property Aliquota   : Real    read getFAliquota   write setFAliquota;
   end;

implementation

{ TCOFINS }

function TCOFINS.getFAliquota: Real;
begin
   result := self.FAliquota;
end;

function TCOFINS.getFCumulativo: Boolean;
begin
   result := self.FCumulativo;
end;

procedure TCOFINS.setFAliquota(const Value: Real);
begin
   FAliquota := Value;
end;

procedure TCOFINS.setFCumulativo(const Value: Boolean);
begin
   FCumulativo := Value;
end;

end.
