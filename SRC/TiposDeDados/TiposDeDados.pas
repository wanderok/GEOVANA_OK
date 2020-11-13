unit TiposDeDados;

interface

type
  TStatusInternet  = (tsiComConexao,tsiSemConexao);
  TStatusCadastral = (sAtivo, sAtivoBloqueado, sInativo);
  TTipoPessoa      = (tpFisica, tpJuridica, tpNone);
  TSimOuNao        = (snNao,snSim);

  function StatusCadastralToInt(pStatus:TStatusCadastral):Integer;
  function IntToStatusCadastral(pStatus:Integer):TStatusCadastral;

  function TipoPessoaToString(pTipoPessoa:TTipoPessoa):String;
  function StringToTipoPessoa(pTipoPessoa:String):TTipoPessoa;

  function SimOuNaoToInt(pSimOuNao:TSimOuNao):Integer;
  function intToSimOuNao(pSimOuNao:Integer):TSimOuNao;

implementation

function StatusCadastralToInt(pStatus:TStatusCadastral):Integer;
begin
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

function TipoPessoaToString(pTipoPessoa:TTipoPessoa):String;
begin
  case pTipoPessoa of
     tpFisica   : Result := 'F';
     tpJuridica : Result := 'J';
     tpNone     : Result := '';
  else
     Result := '';
  end;
end;

function SimOuNaoToInt(pSimOuNao:TSimOuNao):Integer;
begin
   case pSimOuNao of
      snNao : Result := 0;
      snSim : Result := 1;
   end;
end;

function intToSimOuNao(pSimOuNao:Integer):TSimOuNao;
begin
   case pSimOuNao of
      0 : Result := snNao;
      1 : Result := snSim;
   end;
end;

function StringToTipoPessoa(pTipoPessoa:String):TTipoPessoa;
begin
  if pTipoPessoa = 'F' then
     Result := tpFisica
  else
  if pTipoPessoa = 'J' then
     Result := tpJuridica
  else
    Result  := tpNone;
end;

end.
