unit Classe_Usuario;

interface

uses Classes, Dialogs, SysUtils,

     FireDAC.Stan.Intf,  FireDAC.Stan.Option, FireDAC.Stan.Param,
     FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
     FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
   TUsuario = class
   private
      FCodigo,
      FNome,
      FSenha   : String;
      FAtivo   : Boolean;
      FLogado  : Integer;
      FLogadoEstacao:String;
      procedure setCodigo(Const Value:String);
      procedure setNome(Const Value:String);
      procedure setSenha(Const Value:String);
      procedure setAtivo(Const Value:Boolean);
      function getCodigo:String;
      function getNome:String;
      function getSenha:String;
      function getAtivo:Boolean;
      function getFLogado: Boolean;
      function getFLogadoEstacao: String;
   published
      property Codigo: String read  getCodigo
                              write setCodigo;

      property Senha: String read getSenha
                            write setSenha;

      property Nome: String read  getNome
                            write setNome;

      property Logado: Boolean read  getFLogado;

      property LogadoEstacao: String read  getFLogadoEstacao;

      function Existe(Const Value:String):Boolean;
      procedure Insert;
      Procedure Update;
      Procedure Logou;
      Procedure Deslogou;
   end;

implementation

{ TUsuario }

uses DadosSMC, FuncoesSMC;

function TUsuario.getAtivo: Boolean;
begin
   result := FAtivo;
end;

function TUsuario.getCodigo: String;
begin
   result := FCodigo;
end;

function TUsuario.getFLogado: Boolean;
begin
   Result := (FLogado = 1);
end;

function TUsuario.getFLogadoEstacao: String;
begin
   Result := FLogadoEstacao;
end;

function TUsuario.getNome: String;
begin
   result := FNome;
end;

function TUsuario.getSenha: String;
begin
   result := FSenha;
end;

procedure TUsuario.Insert;
var qLocal: TFDQuery;
begin
    FAtivo := True; // Sim
    //
    qLocal := TFDQuery.Create(nil);
    qLocal.ConnectionName := 'X';
    qLocal.Close;
    qLocal.SQL.Clear;
    qLocal.SQL.Add('INSERT INTO USUARIO_USU         ');
    qLocal.SQL.Add('    (                           ');
    qLocal.SQL.Add('       USU_CODIGO,              ');
    qLocal.SQL.Add('       USU_NOME,                ');
    qLocal.SQL.Add('       USU_SENHA,               ');
    qLocal.SQL.Add('       USU_ATIVO,               ');
    qLocal.SQL.Add('       USU_ATUALIZADO_NA_NUVEM, ');
    qLocal.SQL.Add('       USU_ATUALIZADO_NA_NUVEMW,');
    qLocal.SQL.Add('       USU_LOGADO,              ');
    qLocal.SQL.Add('       USU_LOGADOESTACAO        ');
    qLocal.SQL.Add('    )                           ');
    qLocal.SQL.Add(' VALUES                         ');
    qLocal.SQL.Add('    (                           ');
    qLocal.SQL.Add('      :USU_CODIGO,              ');
    qLocal.SQL.Add('      :USU_NOME,                ');
    qLocal.SQL.Add('      :USU_SENHA,               ');
    qLocal.SQL.Add('      :USU_ATIVO,               ');
    qLocal.SQL.Add('      :USU_ATUALIZADO_NA_NUVEM, ');
    qLocal.SQL.Add('      :USU_ATUALIZADO_NA_NUVEMW,');
    qLocal.SQL.Add('      :USU_LOGADO,              ');
    qLocal.SQL.Add('      :USU_LOGADOESTACAO        ');
    qLocal.SQL.Add('    )                           ');
    qLocal.ParamByName('USU_CODIGO').AsString := FCodigo;
    qLocal.ParamByName('USU_NOME'  ).AsString := FNome;
    qLocal.ParamByName('USU_SENHA' ).AsString := Criptografar(FSenha);
    qLocal.ParamByName('USU_ATIVO' ).AsInteger:= 1;
    qLocal.ParamByName('USU_ATUALIZADO_NA_NUVEM' ).AsInteger:= 0;
    qLocal.ParamByName('USU_ATUALIZADO_NA_NUVEMW').AsInteger:= 0;
    qLocal.ParamByName('USU_LOGADO'              ).AsInteger:= 0;
    qLocal.ParamByName('USU_LOGADOESTACAO'       ).AsString := '';
    qLocal.ExecSql;
    //
    qLocal.Free;
    Log('Classe_Usuario','Cad Usu '+FCodigo);
end;

procedure TUsuario.Logou;
var qLocal: TFDQuery;
begin
  FLogado := 1;
  FLogadoEstacao := NomeComputador;

  qLocal := TFDQuery.Create(nil);
  qLocal.ConnectionName := 'X';
  qLocal.Close;
  qLocal.SQL.Clear;
  qLocal.SQL.Add('UPDATE USUARIO_USU                                         ');
  qLocal.SQL.Add('   SET USU_LOGADO = 1,                        ');
  qLocal.SQL.Add('       USU_LOGADOESTACAO = :USU_LOGADOESTACAO ');
  qLocal.SQL.Add(' WHERE USU_CODIGO               = :USU_CODIGO              ');
  qLocal.ParamByName('USU_CODIGO'       ).AsString := FCodigo;
  qLocal.ParamByName('USU_LOGADOESTACAO').AsString := FLogadoEstacao;
  qLocal.ExecSql;
  //
  qLocal.Free;
  Log('Classe_Usuario','Logou '+FLogadoEstacao);
end;

procedure TUsuario.setAtivo(const Value: Boolean);
begin
   FAtivo := Value;
end;

procedure TUsuario.setCodigo(const Value: String);
begin
   FCodigo := Value;
end;

procedure TUsuario.setNome(const Value: String);
begin
   FNome := Value;
end;

procedure TUsuario.setSenha(const Value: String);
begin
   FSenha := Value;
end;

procedure TUsuario.Update;
var qLocal: TFDQuery;
begin
  qLocal := TFDQuery.Create(nil);
  qLocal.ConnectionName := 'X';
  qLocal.Close;
  qLocal.SQL.Clear;
  qLocal.SQL.Add('UPDATE USUARIO_USU                                         ');
  qLocal.SQL.Add('   SET USU_NOME                 = :USU_NOME,               ');
  qLocal.SQL.Add('       USU_SENHA                = :USU_SENHA,              ');
  qLocal.SQL.Add('       USU_ATIVO                = :USU_ATIVO,              ');
  qLocal.SQL.Add('       USU_ATUALIZADO_NA_NUVEM  = :USU_ATUALIZADO_NA_NUVEM,');
  qLocal.SQL.Add('       USU_ATUALIZADO_NA_NUVEMW = :USU_ATUALIZADO_NA_NUVEMW');
  qLocal.SQL.Add(' WHERE USU_CODIGO               = :USU_CODIGO              ');
  qLocal.ParamByName('USU_CODIGO').AsString := FCodigo;
  qLocal.ParamByName('USU_NOME'  ).AsString := FNome;
  qLocal.ParamByName('USU_SENHA' ).AsString := Criptografar(FSenha);
  if FAtivo then
     qLocal.ParamByName('USU_ATIVO').AsInteger:= 1
  else
     qLocal.ParamByName('USU_ATIVO').AsInteger:= 0;
  qLocal.ParamByName('USU_ATUALIZADO_NA_NUVEM' ).AsInteger:= 0;
  qLocal.ParamByName('USU_ATUALIZADO_NA_NUVEMW').AsInteger:= 0;
  qLocal.ExecSql;
  //
  qLocal.Free;
  Log('Classe_Usuario','Alt Usu '+FCodigo);
end;

procedure TUsuario.Deslogou;
var qLocal: TFDQuery;
begin
  FLogado := 0;
  FLogadoEstacao := NomeComputador;

  qLocal := TFDQuery.Create(nil);
  qLocal.ConnectionName := 'X';
  qLocal.Close;
  qLocal.SQL.Clear;
  qLocal.SQL.Add('UPDATE USUARIO_USU                                         ');
  qLocal.SQL.Add('   SET USU_LOGADO = 0,                        ');
  qLocal.SQL.Add('       USU_LOGADOESTACAO = :USU_LOGADOESTACAO ');
  qLocal.SQL.Add(' WHERE USU_CODIGO               = :USU_CODIGO              ');
  qLocal.ParamByName('USU_CODIGO'       ).AsString := FCodigo;
  qLocal.ParamByName('USU_LOGADOESTACAO').AsString := FLogadoEstacao;
  qLocal.ExecSql;
  //
  qLocal.Free;
  Log('Classe_Usuario','Deslogou '+FLogadoEstacao);

end;

function TUsuario.Existe(Const Value:String):Boolean;
begin
  if Value = 'MASTER' then
  begin
    FCodigo := Value;
    FNome   := Value;
    FSenha  := fSenhaUsuarioMaster;
    FAtivo  := True;
    FLogado := 0;
    FLogadoEstacao := '';
    Result := True;
    exit;
  end;

  DM.qUSUARIO.close;
  DM.qUSUARIO.sql.clear;
  DM.qUSUARIO.sql.add('SELECT * FROM USUARIO_USU      ');
  DM.qUSUARIO.sql.add(' WHERE USU_CODIGO = :USU_CODIGO');
  DM.qUSUARIO.ParamByName('USU_CODIGO').AsString := Value;
  DM.qUSUARIO.Open;
  if DM.qUSUARIO.Eof then
  begin
       Result := False;
       exit;
  end;
  Result         := True;
  FCodigo        := DM.qUSUARIO.FieldByName('USU_CODIGO').AsString;
  FNome          := DM.qUSUARIO.FieldByName('USU_NOME'  ).AsString;
  FSenha         := Descriptografar(DM.qUSUARIO.FieldByName('USU_SENHA').AsString);
  FAtivo         := (DM.qUSUARIO.FieldByName('USU_ATIVO').AsInteger = 1);
  FLogado        := DM.qUSUARIO.FieldByName('USU_LOGADO'       ).AsInteger;
  FLogadoEstacao := DM.qUSUARIO.FieldByName('USU_LOGADOESTACAO').AsString;
  DM.qUSUARIO.close;
end;

end.
