unit Classe_Contato;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,

     funcoes;

type
   TContato = class
   private
       FNome,
       FFone1,
       FFone2,
       FCel1,
       FWhatsApp,
       FEmail1,
       FEmail2:String;
    function getFCel: String;
    function getFEmail1: String;
    function getFEmail2: String;
    function getFFone1: String;
    function getFFone2: String;
    function getFNome: String;
    function getFWhatsApp: String;
    procedure setFCel(const Value: String);
    procedure setFEmail1(const Value: String);
    procedure setFEmail2(const Value: String);
    procedure setFFone1(const Value: String);
    procedure setFFone2(const Value: String);
    procedure setFNome(const Value: String);
    procedure setFWhatsApp(const Value: String);
   public
       property Nome     : String read getFNome     write setFNome;
       property Fone1    : String read getFFone1    write setFFone1;
       property Fone2    : String read getFFone2    write setFFone2;
       property Cel      : String read getFCel      write setFCel;
       property WhatsApp : String read getFWhatsApp write setFWhatsApp;
       property Email1   : String read getFEmail1   write setFEmail1;
       property Email2   : String read getFEmail2   write setFEmail2;
   end;
implementation

{ TContato }

function TContato.getFCel: String;
begin
   result := FCel1;
end;

function TContato.getFEmail1: String;
begin
   result := FEmail1;
end;

function TContato.getFEmail2: String;
begin
   result := FEmail2;
end;

function TContato.getFFone1: String;
begin
   result := FFone1;
end;

function TContato.getFFone2: String;
begin
   result := FFone2;
end;

function TContato.getFNome: String;
begin
   result := FNome;
end;

function TContato.getFWhatsApp: String;
begin
   result := FWhatsApp;
end;

procedure TContato.setFCel(const Value: String);
begin
   FCel1 := Copy(Value,1,9);
end;

procedure TContato.setFEmail1(const Value: String);
begin
   FEmail1 := Copy(Value,1,30);
end;

procedure TContato.setFEmail2(const Value: String);
begin
   FEmail2 := Copy(Value,1,30);
end;

procedure TContato.setFFone1(const Value: String);
begin
   FFone1 := Copy(Value,1,8);
end;

procedure TContato.setFFone2(const Value: String);
begin
   FFone2 := Copy(Value,1,8);
end;

procedure TContato.setFNome(const Value: String);
begin
   FNome := Copy(Value,1,50);
end;

procedure TContato.setFWhatsApp(const Value: String);
begin
   FWhatsApp := Copy(Value,1,9);
end;

end.
