unit TiposDeDados;

interface

type
  TStatusInternet  = (tsiComConexao,tsiSemConexao);
  TStatusCadastral = (sAtivo, sAtivoBloqueado, sInativo);
  TStatusCadastralAI = (scAtivo, scInativo);
  TTipoPessoa      = (tpFisica, tpJuridica, tpNone);
  TSimOuNao        = (snNao,snSim);
  TTipoComissao    = (tcColaborador, tcConsultor);

  function TipoComissaoToInt(pTipo:TTipoComissao):Integer;
  function IntToTipoComissao(pTipo:Integer):TTipoComissao;

  function StatusCadastralToInt(pStatus:TStatusCadastral):Integer;
  function IntToStatusCadastral(pStatus:Integer):TStatusCadastral;

  function StatusCadastralAIToInt(pStatus:TStatusCadastralAI):Integer;
  function IntToStatusCadastralAI(pStatus:Integer):TStatusCadastralAI;

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

function StatusCadastralAIToInt(pStatus:TStatusCadastralAI):Integer;
begin
  case pStatus of
     scAtivo  : Result := 1;
     scInativo: Result := 0;
  end;
end;

function IntToStatusCadastralAI(pStatus:Integer):TStatusCadastralAI;
begin
   case pStatus of
      0 : Result := scInativo;
      1 : Result := scAtivo;
   end;
end;

function TipoComissaoToInt(pTipo:TTipoComissao):Integer;
begin
  case pTipo of
     tcColaborador : Result := 0;
     tcConsultor   : Result := 1;
  end;
end;

function IntToTipoComissao(pTipo:Integer):TTipoComissao;
begin
   case pTipo of
      0 : Result := tcColaborador;
      1 : Result := tcConsultor;
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
