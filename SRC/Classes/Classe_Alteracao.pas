unit Classe_Alteracao;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,

     funcoes;

type
   TAlteracao = class
   private
       FUsuario            : String;
       FData               : TDateTime;
       FHora               : String;
       FEstacao            : String;
       FDataBloqueio,
       fDataLiberacao,
       fDataInativo        : TDateTime;
       FDataString,
       FDataBloqueioString,
       FDataLiberacaoString,
       FDataInativoString  : String;
       function getData: String;
       function getEstacao: String;
       function getHora: String;
       function getUsuario: String;
    function  getDataBloqueio: String;
    procedure setDataBloqueio(const Value: String);
    function getDataLiberacao: String;
    procedure setDataLiberacao(const Value: String);
    function getDataInativo: String;
    procedure setDataInativo(const Value: String);
    procedure setData(const Value: String);
    procedure setEstacao(const Value: String);
    procedure setHora(const Value: String);
    procedure setUsuario(const Value: String);
   public
       property Usuario      : String read getUsuario       write setUsuario;
       property Data         : String read getData          write setData;
       property Hora         : String read getHora          write setHora;
       property Estacao      : String read getEstacao       write setEstacao;
       property DataBloqueio : String read getDataBloqueio  write setDataBloqueio;
       property DataLiberacao: String read getDataLiberacao write setDataLiberacao;
       property DataInativo  : String read getDataInativo   write setDataInativo;
   end;

implementation

{ TAlteracao }

function TAlteracao.getDataInativo: String;
begin
   result := BarrasSeDataNula(DateToStr(FDataInativo));
end;

function TAlteracao.getData: String;
begin
   result := BarrasSeDataNula(DateToStr(FData));
end;

function TAlteracao.getDataBloqueio: String;
begin
   result := BarrasSeDataNula(FDataBloqueioString);
end;

function TAlteracao.getDataLiberacao: String;
begin
   result := BarrasSeDataNula(FDataLiberacaoString);
end;

function TAlteracao.getEstacao: String;
begin
   result := FEstacao;
end;

function TAlteracao.getHora: String;
begin
   result := FHora;
end;

function TAlteracao.getUsuario: String;
begin
   result := FUsuario;
end;
procedure TAlteracao.setDataInativo(const Value: String);
begin
   if Value = '  /  /  ' then
      FDataInativo := 0
   else
      FDataInativo := StrToDate(Value);
   FDataInativoString := Value;
end;

procedure TAlteracao.setData(const Value: String);
begin
   FDataString := Value;
   FData       := ZeroSeDataNula(value);
end;

procedure TAlteracao.setDataBloqueio(const Value: String);
begin
   if Value = '  /  /  ' then
      FDataBloqueio := 0
   else
      FDataBloqueio := StrToDate(Value);
   FDataBloqueioString := Value;
end;

procedure TAlteracao.setDataLiberacao(const Value: String);
begin
   if Value = '  /  /  ' then
      FDataLiberacao := 0
   else
      FDataLiberacao := StrToDate(Value);
   FDataLiberacaoString := Value;
end;

procedure TAlteracao.setEstacao(const Value: String);
begin
   FEstacao := Value;
end;

procedure TAlteracao.setHora(const Value: String);
begin
   FHora := Value;
end;

procedure TAlteracao.setUsuario(const Value: String);
begin
   FUsuario := Value;
end;

end.
