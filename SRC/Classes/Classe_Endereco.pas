unit Classe_Endereco;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,

     FuncoesSMC;

type
   TEndereco = class
   private
       FRua,
       FNumero,
       FComplemento,
       FBairro,
	     FCidade,
       FCEP          : String;
    function  getFRua: String;
    procedure setFRua(const Value: String);
    function  getFCEP: String;
    procedure setFCEP(const Value: String);
    function  getFNumero: String;
    procedure setFNumero(const Value: String);
    function getFComplemento: String;
    procedure setFComplemento(const Value: String);
    function getFBairro: String;
    procedure setFBairro(const Value: String);
    function getFCidade: String;
    procedure setFCidade(const Value: String);
   public
       property Rua         : String read getFRua         write setFRua;
       property Numero      : String read getFNumero      write setFNumero;
       property Complemento : String read getFComplemento write setFComplemento;
       property Bairro      : String read getFBairro      write setFBairro;
       property Cidade      : String read getFCidade      write setFCidade;
       property CEP         : String read getFCEP         write setFCEP;
   end;

implementation

{ TEndereco }

function TEndereco.getFBairro: String;
begin
   Result := FBairro;
end;

function TEndereco.getFCEP: String;
begin
    Result := FCEP;
end;

function TEndereco.getFCidade: String;
begin
   result := FCidade;
end;

function TEndereco.getFComplemento: String;
begin
   Result := FComplemento;
end;

function TEndereco.getFNumero: String;
begin
   Result := FNumero;
end;

function TEndereco.getFRua: String;
begin
    Result := FRua;
end;

procedure TEndereco.setFBairro(const Value: String);
begin
   FBairro := Copy(Value,1,10);
end;

procedure TEndereco.setFCEP(const Value: String);
begin
   FCEP := Copy(SoNumeros(Value),1,8);
end;

procedure TEndereco.setFCidade(const Value: String);
begin
   FCidade := Copy(Value,1,10);
end;

procedure TEndereco.setFComplemento(const Value: String);
begin
   FComplemento := Copy(Value,1,50);
end;

procedure TEndereco.setFNumero(const Value: String);
begin
   if Value = '' then
      FNumero := 'SN'
   else
      FNumero := Copy(Value,1,10);
end;

procedure TEndereco.setFRua(const Value: String);
begin
   FRua := Copy(Value,1,40);
end;

end.
