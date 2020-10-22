unit Classe_TributacaoISS;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option;

type
   TISS = class
   private
      FAliquota   : Real;
      function getFAliquota: Real;
      procedure setFAliquota(const Value: Real);
   public
      property Aliquota   : Real    read getFAliquota   write setFAliquota;
   end;

implementation

{ TISS }

function TISS.getFAliquota: Real;
begin
   result := self.FAliquota;
end;

procedure TISS.setFAliquota(const Value: Real);
begin
   FAliquota := Value;
end;

end.
