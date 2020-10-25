unit TiposDeDados;

interface

type
  TStatusInternet  = (tsiComConexao,tsiSemConexao);
  TStatusCadastral = (sAtivo, sAtivoBloqueado, sInativo);

  function StatusCadastralToInt(pStatus:TStatusCadastral):Integer;
  function IntToStatusCadastral(pStatus:Integer):TStatusCadastral;

implementation

function StatusCadastralToInt(pStatus:TStatusCadastral):Integer;
begin
{ 0 = Ativo
  1 = Ativo mas bloqueado
  2 = Inativo
}
  case pStatus of
     sAtivo         : Result := 0;
     sAtivoBloqueado: Result := 1;
  else
     Result := 2;
  end;
end;

function IntToStatusCadastral(pStatus:Integer):TStatusCadastral;
begin
   case pStatus of
      0 : Result := sAtivo;
      1 : Result := sAtivoBloqueado;
   else
      Result := sInativo;
   end;
end;

end.
