unit Classe_ContaContabil;

interface

uses Classes, Dialogs, SysUtils,

     FireDAC.Stan.Intf,  FireDAC.Stan.Option, FireDAC.Stan.Param,
     FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
     FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
   TContaContabil = class
   private
      FCodigo,
      FReduzido,
      FNome    : String;
      FAtivo,
      FExiste  : Boolean;
      FTipo,
      FNatureza: Integer;
      FUsu,
      FEstacao : String;
      FData    : TDatetime;
      FHora    : String;
    function getFAtivo: Boolean;
    function getFCodigo: String;
    function getFData: TDateTime;
    function getFHora: String;
    function getFNatureza: Integer;
    function getFNome: String;
    function getFReduzido: String;
    function getFEstacao: String;
    function getFTipo: Integer;
    function getFUsu: String;
    procedure setFAtivo(const Value: Boolean);
    procedure setFCodigo(const Value: String);
    procedure setFData(const Value: TDateTime);
    procedure setFHora(const Value: String);
    procedure setFNatureza(const Value: Integer);
    procedure setFNome(const Value: String);
    procedure setFReduzido(const Value: String);
    procedure setFEstacao(const Value: String);
    procedure setFTipo(const Value: Integer);
    procedure setFUsu(const Value: String);
    procedure Insert;
    Procedure Update;
   published
      constructor Create;
      destructor Destroy; override;
      property Codigo  : String    read  getFCodigo   write setFCodigo;
      property Reduzido: String    read  getFReduzido write setFReduzido;
      property Nome    : String    read  getFNome     write setFNome;
      property Ativo   : Boolean   read  getFAtivo    write setFAtivo;
      property Tipo    : Integer   read  getFTipo     write setFTipo;
      property Natureza: Integer   read  getFNatureza write setFNatureza;
      property Usu     : String    read  getFUsu      write setFUsu;
      property TEstacao: String    read  getFEstacao  write setFEstacao;
      property Data    : TDateTime read  getFData     write setFData;
      property Hora    : String    read  getFHora     write setFHora;
      function Existe:Boolean;
      procedure Gravar;
   end;

var qLocal: TFDQuery;

implementation

{ TContaContabil }

uses DadosSMC, FuncoesSMC;


constructor TContaContabil.Create;
begin
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName :='X';
end;

destructor TContaContabil.Destroy;
begin
  qLocal.Free;
  inherited;
end;

function TContaContabil.Existe: Boolean;
begin
  Result := False;
  FExiste := False;

  qLocal.close;
  qLocal.sql.clear;
  qLocal.sql.add('SELECT * FROM CONTA_CONTABIL_CC'  );
  qLocal.sql.add(' WHERE CC_CODIGO   = :CC_CODIGO'  );
  if FReduzido <> '' then
  begin
     qLocal.sql.add('    OR CC_REDUZIDO = :CC_REDUZIDO');
     qLocal.ParamByName('CC_REDUZIDO').AsString := FReduzido;
  end;
  qLocal.ParamByName('CC_CODIGO'  ).AsString := FCodigo;
  qLocal.Open;
  if qLocal.Eof then
     exit;
  FExiste        := True;
  Result         := True;
  FCodigo        := qLocal.FieldByName('CC_CODIGO'  ).AsString;
  FReduzido      := qLocal.FieldByName('CC_REDUZIDO').AsString;
  FNome          := qLocal.FieldByName('CC_NOME'    ).AsString;
  FAtivo         := (qLocal.FieldByName('CC_STATUS' ).AsInteger = 1);
  FTipo          := qLocal.FieldByName('CC_TIPO'    ).AsInteger;
  FNatureza      := qLocal.FieldByName('CC_NATUREZA').AsInteger;
  FUsu           := qLocal.FieldByName('CC_USU'     ).AsString;
  FEstacao       := qLocal.FieldByName('CC_ESTACAO' ).AsString;
  FData          := qLocal.FieldByName('CC_DT'      ).AsDatetime;
  FHora          := qLocal.FieldByName('CC_HR'      ).AsString;
  qLocal.close;
end;

function TContaContabil.getFAtivo: Boolean;
begin
   Result := FAtivo;
end;

function TContaContabil.getFCodigo: String;
begin
   Result := FCodigo;
end;

function TContaContabil.getFData: TDateTime;
begin
   Result := FData;
end;

function TContaContabil.getFHora: String;
begin
   Result := FHora;
end;

function TContaContabil.getFNatureza: Integer;
begin
   Result := FNatureza;
end;

function TContaContabil.getFNome: String;
begin
   Result := FNome;
end;

function TContaContabil.getFReduzido: String;
begin
   Result := FReduzido;
end;

function TContaContabil.getFEstacao: String;
begin
   Result := FEstacao;
end;

function TContaContabil.getFTipo: Integer;
begin
   Result := FTipo;
end;

function TContaContabil.getFUsu: String;
begin
   Result := FUsu;
end;

procedure TContaContabil.Gravar;
begin
   if FExiste then
      Update
   else
      Insert;
end;

procedure TContaContabil.Insert;
begin
  qLocal.Close;
  qLocal.SQL.Clear;
  qLocal.SQL.Add('INSERT INTO CONTA_CONTABIL_CC (');
  qLocal.SQL.Add('       CC_CODIGO,              ');
  qLocal.SQL.Add('       CC_REDUZIDO,            ');
  qLocal.SQL.Add('       CC_NOME,                ');
  qLocal.SQL.Add('       CC_STATUS,              ');
  qLocal.SQL.Add('       CC_TIPO,                ');
  qLocal.SQL.Add('       CC_NATUREZA,            ');
  qLocal.SQL.Add('       CC_USU,                 ');
  qLocal.SQL.Add('       CC_ESTACAO,             ');
  qLocal.SQL.Add('       CC_DT,                  ');
  qLocal.SQL.Add('       CC_HR)                  ');
  qLocal.SQL.Add('VALUES (                       ');
  qLocal.SQL.Add('      :CC_CODIGO,              ');
  qLocal.SQL.Add('      :CC_REDUZIDO,            ');
  qLocal.SQL.Add('      :CC_NOME,                ');
  qLocal.SQL.Add('      :CC_STATUS,              ');
  qLocal.SQL.Add('      :CC_TIPO,                ');
  qLocal.SQL.Add('      :CC_NATUREZA,            ');
  qLocal.SQL.Add('      :CC_USU,                 ');
  qLocal.SQL.Add('      :CC_ESTACAO,             ');
  qLocal.SQL.Add('      :CC_DT,                  ');
  qLocal.SQL.Add('      :CC_HR)                  ');
  qLocal.ParamByName('CC_CODIGO'  ).AsString  := FCodigo;
  qLocal.ParamByName('CC_REDUZIDO').AsString  := FReduzido;
  qLocal.ParamByName('CC_NOME'    ).AsString  := FNome;
  if FAtivo then
    qLocal.ParamByName('CC_STATUS').AsInteger := 1
  else
    qLocal.ParamByName('CC_STATUS').AsInteger := 0;
  qLocal.ParamByName('CC_TIPO'    ).AsInteger := FTipo;
  qLocal.ParamByName('CC_NATUREZA').AsInteger := FNatureza;
  qLocal.ParamByName('CC_USU'     ).AsString  := Usuario.Codigo;
  qLocal.ParamByName('CC_ESTACAO' ).AsString  := NomeComputador;
  qLocal.ParamByName('CC_DT'      ).AsDatetime:= DataServidor;
  qLocal.ParamByName('CC_HR'      ).AsString  := HoraServidor;
  qLocal.ExecSql;
  //
  Log('Classe_Contabil','Cad Conta '+FCodigo+'-'+FNome);
end;

procedure TContaContabil.setFAtivo(const Value: Boolean);
begin
   FAtivo := Value;
end;

procedure TContaContabil.setFCodigo(const Value: String);
begin
    FCodigo := Value;
end;

procedure TContaContabil.setFData(const Value: TDateTime);
begin
   FData := Value;
end;

procedure TContaContabil.setFHora(const Value: String);
begin
   FHora := Value;
end;

procedure TContaContabil.setFNatureza(const Value: Integer);
begin
   FNatureza := Value;
end;

procedure TContaContabil.setFNome(const Value: String);
begin
   FNome := Value;
end;

procedure TContaContabil.setFReduzido(const Value: String);
begin
   FReduzido := Value;
end;

procedure TContaContabil.setFEstacao(const Value: String);
begin
   FEstacao := Value;
end;

procedure TContaContabil.setFTipo(const Value: Integer);
begin
   FTipo := Value;
end;

procedure TContaContabil.setFUsu(const Value: String);
begin
   FUsu := Value;
end;

procedure TContaContabil.Update;
begin
  qLocal.Close;
  qLocal.SQL.Clear;
  qLocal.SQL.Add('UPDATE CONTA_CONTABIL_CC                                   ');
  qLocal.SQL.Add('   SET CC_REDUZIDO              = :CC_REDUZIDO,            ');
  qLocal.SQL.Add('       CC_NOME                  = :CC_NOME,                ');
  qLocal.SQL.Add('       CC_STATUS                = :CC_STATUS,              ');
  qLocal.SQL.Add('       CC_TIPO                  = :CC_TIPO,                ');
  qLocal.SQL.Add('       CC_NATUREZA              = :CC_NATUREZA             ');
  qLocal.SQL.Add(' WHERE CC_CODIGO                = :CC_CODIGO               ');
  qLocal.ParamByName('CC_CODIGO'  ).AsString := FCodigo;
  qLocal.ParamByName('CC_REDUZIDO').AsString := FReduzido;
  qLocal.ParamByName('CC_NOME'    ).AsString := FNome;
  if FAtivo then
    qLocal.ParamByName('CC_STATUS').AsInteger:= 1
  else
    qLocal.ParamByName('CC_STATUS').AsInteger:= 0;
  qLocal.ParamByName('CC_TIPO'    ).AsInteger:= FTipo;
  qLocal.ParamByName('CC_NATUREZA').AsInteger:= FNatureza;
  qLocal.ExecSql;
  //
  Log('Classe_Contabil','Alt Conta '+FCodigo+'-'+FNome);
end;

end.
