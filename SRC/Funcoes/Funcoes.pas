unit Funcoes;

interface

uses Dialogs, SysUtils,
     Classe_Avisos,
     Classe_Empresa,
     Classe_Acesso,
     Classe_Usuario,
     Classe_VerificacaoInicial,
     Classe_Configuracoes,
     PesquisaF1_T16,
     MostraMemo,

     DBCtrls,

     Email,

     FireDAC.Stan.Intf,  FireDAC.Stan.Option, FireDAC.Stan.Param,
     FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
     FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

     Vcl.Controls,
     SHELLAPI, {SHELLAPI Para o ShellExecute}
     IniFiles, // arquivos ini,
     MMSystem, {ACTIVEVOICEPROJECTLib_TLB, execwait,Lembrete,}
     Math, Registry,
     stdctrls, Windows, Messages, Classes, Graphics, Forms,
     ExtCtrls, Mask, Grids, Db, Buttons, ComCtrls,
     Dados, DadosNuvem, Winsock, Quickrpt, QRCtrls;

//##############################################################################
type
   TPesquisaF1 = class
   Const
     _PESQUISA_DESCRICAO = 0;
     _PESQUISA_CHAVE     = 1;
   private
       FFiltro,
       FTabela,
       FCodigo,
       FChave,
       FExiste,
       FDescricao          : String;
       FTipoPesquisa       : Integer;
       qLocal              : TFDQuery;
    function Pesquisar(pQuery:TFDQuery):Boolean;
    function Existe:Boolean; overload;
    function Existe(pQueryExterna:TFDQuery):Boolean; overload;
    function Update:Boolean;
    function Insert:Boolean;
    function ProximoCODIGO:String;
    function getCodigo: String;
    function Codigos:String;
    function Chaves: String;
    function Descricoes: String;
    function getFDescricao: String;
    procedure SetCodigo(const Value: String);
    procedure setFDescricao(const Value: String);


   public
      constructor Create;
      destructor Destroy; override;
      property Codigo     : String  read getCodigo     write SetCodigo;
      property Tabela     : String  read FTabela;
      property Descricao  : String  read getFDescricao write setFDescricao;
      function ExisteDescricao(pTabela,pFiltro:String;pQueryExterna:TFDQuery): Boolean;
      function ProcuraDescricao(pTabela,pFiltro:String;pQueryExterna:TFDQuery): Boolean;
      function ExisteCodigo(pTabela,pFiltro:String): Boolean;
      function Gravar:Boolean;
   end;
//##############################################################################
const
 {    Setas = '37,28,40,45,46'
38: Coloca(’ [SETA ACIMA] ‘);
39: Coloca(’ [SETA DIREITA] ‘);
40: Coloca(’ [SETA ABAIXO] ‘);
45: Coloca(’ [INSERT] ‘);
46: Coloca(’ [DEL] ‘);
             }
    Email_Host      = 'server-web4.dal.pz.samtooweb.com';   // 'smtps.bol.com.br'; // smtps.bol.com.br
    //imap 993
    //pop3 995
    //smtp 465

    Email_Erros_Do_Sistema = 'para@wander.eng.br';
    Email_Port      = 993;
    Email_UserId    = 'suporte@wander.eng.br'; // 'suporte@wander.eng.br'; // 'sistemabrena@bol.com.br';
    Email_PassWord  = 'Ab102030'; // 'Ab102030@'; //'Ab102030@'; //'fernanda123';

var Acesso            : TAcesso;
    Avisos            : TAvisos;
    Usuario           : TUsuario;
    VerificacaoInicial: TVerificacaoInicial;
    Empresa           : TEmpresa;
    PesquisaF1        : TPesquisaF1;
    xMemo             : tMemo;
    Configuracoes     : TConfiguracao;

    xxxAtualizado,
    globalFuncoes_Atualizado:String;

procedure ApagaRegistroDeDadosDaTela(pTela:String);
//Apaga os registros de controle contendo os dados da tela
procedure ComparaDadosDaTela(pFrase:String;pTela:Tobject);
//Compara os dados da tela atual com o salvo antes (anterior)
procedure VerificaSeMudouDadoDaTela(pFrase,pTela,pNome,pValor:String);
//Compara os dados da tela atual com o salvo antes (anterior)
procedure SalvaDadosDaTela(Tela:TObject);
//Salva todos os campos da tela
procedure Salvar_DadosDaTela(pTela,pNome,pValor:String);
//028 salva um registro de campo da tela
function UsuarioMASTER:Boolean;
procedure AcessoExclusivoMaster;
procedure MostrarMemo(pMemo:TMemo);
function RemoveAcento(const pText: string): string;
function RemoverObsCorreios(const pText: string): string;
function PesquisarCadastro(pTabela:String;pFiltro,pDescricao:TEdit):Boolean;
function fPesquisarBairro(pCodigo,pDescricao:TEdit):Boolean;
function fPesquisarRegiao(pCodigo,pDescricao:TEdit):Boolean;
function fPesquisarZona(pCodigo,pDescricao:TEdit):Boolean;
function fPesquisarAtividade(pCodigo,pDescricao:TEdit):Boolean;
function fCaption(pTabela:String):String;

function Existe_Outro_CLIENTE_Com_Este_CPF(pCPF,pCliente:String):Boolean;
function Existe_Outro_CLIENTE_Com_Este_CNPJ(pCNPJ,pCliente:String):Boolean;
function Existe_Outro_CLIENTE_Com_Esta_IE(pIE,pCliente:String):Boolean;
function Existe_Outro_CLIENTE_Com_Este_RG(pRG,pCliente:String):Boolean;
function Existe_Outro_FORNECEDOR_Com_Este_CPF(pCPF,pCliente:String):Boolean;
function Existe_Outro_FORNECEDOR_Com_Este_CNPJ(pCNPJ,pCliente:String):Boolean;
function Existe_Outro_FORNECEDOR_Com_Esta_IE(pIE,pCliente:String):Boolean;
function Existe_Outro_FORNECEDOR_Com_Este_RG(pRG,pCliente:String):Boolean;

function Existe_Outro_COLABORADOR_Com_Este_CPF(pCPF,pCliente:String):Boolean;

function Existe_Outro_CONSULTOR_Com_Este_CNPJ(pCNPJ,pCliente:String):Boolean;
function Existe_Outro_CONSULTOR_Com_Este_CPF(pCPF,pCliente:String):Boolean;
function Existe_Outro_CONSULTOR_Com_Esta_IE(pIE,pCliente:String):Boolean;
function Existe_Outro_CONSULTOR_Com_Este_RG(pRG,pCliente:String):Boolean;

function Existe_Outro_CONTADOR_Com_Este_CPF(pCPF,pCliente:String):Boolean;
function Existe_Outro_CONTADOR_Com_Este_CNPJ(pCNPJ,pCliente:String):Boolean;
function Existe_Outro_CONTADOR_Com_Esta_IE(pIE,pCliente:String):Boolean;
function Existe_Outro_CONTADOR_Com_Este_RG(pRG,pCliente:String):Boolean;

procedure Cria_Objetos_das_Classes;
procedure Destroi_Objetos_das_Classes;
//
function selectCEP(pCEP,pRua,pBairro,pCidade,pUF:TEdit):Boolean;
Function RetiraExcessoDeEspacos(pFrase:String):String;
Function CadastrarMunicipio(pCidade,pUF:String):String;
function CadastraBairro(pNomeBairro:String):String;
function FormataFones(pNumero:String):String;
function TelValido(pTel:TEdit): Boolean;
function fCPFValido(pCPF:TEdit): Boolean;
function fCNPJValido(pCNPJ:TEdit):Boolean;
function SelectBairro(pBairro:String;pBairroDescricao:Tedit):Boolean;
function SelectRegiao(pRegiao:String;pRegiaoDescricao:Tedit):Boolean;
function SelectZona(pZona:String;pZonaDescricao:Tedit):Boolean;
function ZeroSeDataNula(pData:String):TDatetime;
function BarrasSeDataNula(pData:String):String;
function DataNoFuturo(pData:TMaskEdit):Boolean;
Function fSemAcentos(pCaracter:Char):Char;  overload;
Function fSemAcentos(pCaracter:String):String;  overload;
Function fLetrasENumeros(pCaracter:Char):Char;
function SoNumero(pCaracter:Char):Char;
function SoValor(pCaracter:Char):Char;
function SoLetra(pCaracter:Char):Char;

procedure Inicio_Padrao_De_Todas_As_Telas_Do_Sistema;
function fPercentualValido(pValor:String):Boolean;
function masctostr(numero:string):string;
function f0ou1(pBoolean:Boolean):Integer;
function SoNumeros(pnumero:String):String;
function SoNumerosI(pnumero:String):Integer;
function SoNumerosOuISENTO(pnumero:String):String;
function Eh_CPF(pNumero:String):Boolean;
function Eh_CNPJ(pNumero:String):Boolean;
function FormataCPF_CGC(CPF_CGC: string):string; //formata o CPF ou CGC com suas respectivas máscaras.
function  CHEK_CGC(var_cgc:string):boolean;
function  CHEK_CPF(var_cpf:string):boolean;
procedure AtualizaFUSADA_FUS(pUSUARIO,pfuncao:String);
Function fNomeDoSistema:String;
procedure Certificado_Digital_Vencendo_Avisar_Usuario_e_Enviar_Email_Ao_Suporte;
function Criptografar(pTexto: String): String;
function DesCriptografar(pTexto: String): String;
Function NomeComputador : String;
function MandaEmail(pEmail,pSubject:String; pTexto:TMemo):Boolean;
function MandaEmailCurto(pEmail,pSubject:String; pTexto:TMemo):Boolean;
function ValorAsc(Letra: String): Byte;
function DataServidor:tDateTime;
function sDataServidor:String;
function HoraServidor:String;
function JaEnviouEmail(pDestinatario,pAssunto:String):Boolean;
function INSERT_EMAIL_EMAIL(pDestinatario,pAssunto:String;pEMAIL_ENVIADO:Integer):Integer;
Procedure INSERT_CORPOEMAIL_CEMAIL(pEMAIL_SEQUENCIAL,pCEMAIL_LINHA:Integer;pCEMAIL_TEXTO:String);
function ProximoEMAIL_SEQUENCIAL:Integer;
//
function ProximoBAI_CODIGO:String;
function ProximoREG_CODIGO:String;
function ProximoZON_CODIGO:String;
function ProximoRAMO_CODIGO:String;
//
Function DataDoExecutavel:String;

procedure Executar_Script(pComando:String);
procedure Executar_Script_Na_Nuvem(pComando:String);

procedure Executar(pComando:String);
procedure Atualizado;
procedure AtualizadoNaNuvem;

//------------------------------------------------------------------------------
Procedure Log(pTela,pEmail,pHistorico:string); overload;
Procedure Log(pTela,pHistorico:string); overload;
Procedure LogErros(pTela,pHistorico:string);
Procedure Log_Salvar(pTipo,pTela,pHistorico:string);
//------------------------------------------------------------------------------

function Ja_Executou_Script(pInformacao:String) : Boolean;

function NaoPreencheuCamposObrigatoriosOuImportantes(pTela:TForm):Boolean;
function HaCamposObrigatorios_tag_100_NaoPreenchidos(pTela:TForm):Boolean;
function HaCamposImportantes_tag_200_NaoPreenchidos(pTela:TForm):Boolean;

procedure Limpar_os_campos_da_Tela(pTela:TForm);
procedure Gravar_Dados_do_Ultimo_Acesso(pEmpresa:String);

implementation

uses ValidadorDeDocumentos;

procedure MostrarMemo(pMemo:TMemo);
begin
  try
    frmMostraMemo := TfrmMostraMemo.Create(nil);
  except
    frmMostraMemo.Free;
    frmMostraMemo := TfrmMostraMemo.Create(nil);
  end;
    frmMostraMemo.Memo.text := pMemo.text;
    frmMostraMemo.ShowModal;
    if vfrmMostraMemo_Gravar then
    begin
       pMemo.text := frmMostraMemo.Memo.text;
    end;
    FreeAndNil(frmMostraMemo);
end;

function Existe_Outro_CLIENTE_Com_Este_CPF(pCPF,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pCPF = '' then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CLI_CODIGO, CLI_NOME_FANTASIA     ');
   qLocal.sql.add('  FROM CLIENTE_CLI, CLIENTE_DETALHE_CLID ');
   qLocal.sql.add(' WHERE CLID_CODIGO =   CLI_CODIGO        ');
   qLocal.sql.add('   AND CLI_CODIGO  <> :CLI_CODIGO        ');
   qLocal.sql.add('   AND CLID_CPF    =  :CLID_CPF          ');
   qLocal.ParamByName('CLI_CODIGO').AsString := pCliente;
   qLocal.ParamByName('CLID_CPF'  ).AsString := SoNumeros(pCPF);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.CPF_existente(qLocal.FieldByName('CLI_NOME_FANTASIA').AsString,
                        qLocal.FieldByName('CLI_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_COLABORADOR_Com_Este_CPF(pCPF,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pCPF = '' then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT COL_CODIGO, COL_NOME_FANTASIA ');
   qLocal.sql.add('  FROM COLABORADOR_COL,              ');
   qLocal.sql.add('       COLABORADOR_DETALHE_COLD      ');
   qLocal.sql.add(' WHERE COLD_CODIGO =   COLD_CODIGO   ');
   qLocal.sql.add('   AND COLD_CODIGO <> :COLD_CODIGO   ');
   qLocal.sql.add('   AND COLD_CPF    =  :COLD_CPF      ');
   qLocal.ParamByName('COL_CODIGO').AsString := pCliente;
   qLocal.ParamByName('COLD_CPF'  ).AsString := SoNumeros(pCPF);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.CPF_existente(qLocal.FieldByName('COL_NOME_FANTASIA').AsString,
                        qLocal.FieldByName('COL_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_FORNECEDOR_Com_Este_CPF(pCPF,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pCPF = '' then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT FOR_CODIGO, FOR_NOME_FANTASIA     ');
   qLocal.sql.add('  FROM FORNECEDOR_FOR, FORNECEDOR_DETALHE_FORD ');
   qLocal.sql.add(' WHERE FORD_CODIGO = FOR_CODIGO          ');
   qLocal.sql.add('   AND FOR_CODIGO  <> :FOR_CODIGO        ');
   qLocal.sql.add('   AND FORD_CPF    =  :FORD_CPF          ');
   qLocal.ParamByName('FOR_CODIGO').AsString := pCliente;
   qLocal.ParamByName('FORD_CPF'  ).AsString := SoNumeros(pCPF);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.CPF_existente(qLocal.FieldByName('FOR_NOME_FANTASIA').AsString,
                        qLocal.FieldByName('FOR_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_CONSULTOR_Com_Este_CPF(pCPF,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pCPF = '' then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CON_CODIGO, CON_NOME_FANTASIA         ');
   qLocal.sql.add('  FROM CONSULTOR_CON, CONSULTOR_DETALHE_COND ');
   qLocal.sql.add(' WHERE COND_CODIGO = CON_CODIGO              ');
   qLocal.sql.add('   AND CON_CODIGO  <> :CON_CODIGO            ');
   qLocal.sql.add('   AND COND_CPF    =  :COND_CPF              ');
   qLocal.ParamByName('CON_CODIGO').AsString := pCliente;
   qLocal.ParamByName('COND_CPF'  ).AsString := SoNumeros(pCPF);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.CPF_existente(qLocal.FieldByName('CON_NOME_FANTASIA').AsString,
                        qLocal.FieldByName('CON_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_CLIENTE_Com_Este_CNPJ(pCNPJ,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pCNPJ = '' then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CLI_CODIGO,                       ');
   qLocal.sql.add('       CLI_NOME_FANTASIA,                ');
   qLocal.sql.add('       CLI_RAZAO_SOCIAL                  ');
   qLocal.sql.add('  FROM CLIENTE_CLI, CLIENTE_DETALHE_CLID ');
   qLocal.sql.add(' WHERE CLID_CODIGO = CLI_CODIGO          ');
   qLocal.sql.add('   AND CLI_CODIGO  <> :CLI_CODIGO        ');
   qLocal.sql.add('   AND CLID_CNPJ   =  :CLID_CNPJ         ');
   qLocal.ParamByName('CLI_CODIGO').AsString := pCliente;
   qLocal.ParamByName('CLID_CNPJ' ).AsString := SoNumeros(pCNPJ);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.CNPJ_existente(qLocal.FieldByName('CLI_NOME_FANTASIA').AsString,
                         qLocal.FieldByName('CLI_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_FORNECEDOR_Com_Este_CNPJ(pCNPJ,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pCNPJ = '' then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT FOR_CODIGO,                       ');
   qLocal.sql.add('       FOR_NOME_FANTASIA,                ');
   qLocal.sql.add('       FOR_RAZAO_SOCIAL                  ');
   qLocal.sql.add('  FROM FORNECEDOR_FOR, FORNECEDOR_DETALHE_FORD ');
   qLocal.sql.add(' WHERE FORD_CODIGO = FOR_CODIGO          ');
   qLocal.sql.add('   AND FOR_CODIGO  <> :FOR_CODIGO        ');
   qLocal.sql.add('   AND FORD_CNPJ   =  :FORD_CNPJ         ');
   qLocal.ParamByName('FOR_CODIGO').AsString := pCliente;
   qLocal.ParamByName('FORD_CNPJ' ).AsString := SoNumeros(pCNPJ);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.CNPJ_existente(qLocal.FieldByName('FOR_NOME_FANTASIA').AsString,
                         qLocal.FieldByName('FOR_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_CONSULTOR_Com_Este_CNPJ(pCNPJ,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pCNPJ = '' then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CON_CODIGO,                       ');
   qLocal.sql.add('       CON_NOME_FANTASIA,                ');
   qLocal.sql.add('       CON_RAZAO_SOCIAL                  ');
   qLocal.sql.add('  FROM CONSULTOR_CON, CONSULTOR_DETALHE_COND ');
   qLocal.sql.add(' WHERE COND_CODIGO = CON_CODIGO          ');
   qLocal.sql.add('   AND CON_CODIGO  <> :CON_CODIGO        ');
   qLocal.sql.add('   AND COND_CNPJ   =  :COND_CNPJ         ');
   qLocal.ParamByName('CON_CODIGO').AsString := pCliente;
   qLocal.ParamByName('COND_CNPJ' ).AsString := SoNumeros(pCNPJ);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.CNPJ_existente(qLocal.FieldByName('CON_NOME_FANTASIA').AsString,
                         qLocal.FieldByName('CON_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_CLIENTE_Com_Esta_IE(pIE,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pIE = ''       then exit;
   if pIE = 'ISENTO' then exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CLI_CODIGO, CLI_NOME_FANTASIA     ');
   qLocal.sql.add('  FROM CLIENTE_CLI, CLIENTE_DETALHE_CLID ');
   qLocal.sql.add(' WHERE CLID_CODIGO = CLI_CODIGO          ');
   qLocal.sql.add('   AND CLI_CODIGO  <> :CLI_CODIGO        ');
   qLocal.sql.add('   AND CLID_IE     =  :CLID_IE           ');
   qLocal.ParamByName('CLI_CODIGO').AsString := pCliente;
   qLocal.ParamByName('CLID_IE'   ).AsString := SoNumerosOuISENTO(pIE);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.IE_existente(qLocal.FieldByName('CLI_NOME_FANTASIA').AsString,
                       qLocal.FieldByName('CLI_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_FORNECEDOR_Com_Esta_IE(pIE,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pIE = ''       then exit;
   if pIE = 'ISENTO' then exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT FOR_CODIGO, FOR_NOME_FANTASIA     ');
   qLocal.sql.add('  FROM FORNECEDOR_FOR, FORNECEDOR_DETALHE_FORD ');
   qLocal.sql.add(' WHERE FORD_CODIGO = FOR_CODIGO          ');
   qLocal.sql.add('   AND FOR_CODIGO  <> :FOR_CODIGO        ');
   qLocal.sql.add('   AND FORD_IE     =  :FORD_IE           ');
   qLocal.ParamByName('FOR_CODIGO').AsString := pCliente;
   qLocal.ParamByName('FORD_IE'   ).AsString := SoNumerosOuISENTO(pIE);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.ie_existente(qLocal.FieldByName('FOR_NOME_FANTASIA').AsString,
                       qLocal.FieldByName('FOR_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_CONSULTOR_Com_Esta_IE(pIE,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pIE = ''       then exit;
   if pIE = 'ISENTO' then exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CON_CODIGO, CON_NOME_FANTASIA     ');
   qLocal.sql.add('  FROM CONSULTOR_CON, CONSULTOR_DETALHE_COND ');
   qLocal.sql.add(' WHERE COND_CODIGO = CON_CODIGO          ');
   qLocal.sql.add('   AND CON_CODIGO  <> :CON_CODIGO        ');
   qLocal.sql.add('   AND COND_IE     =  :COND_IE           ');
   qLocal.ParamByName('CON_CODIGO').AsString := pCliente;
   qLocal.ParamByName('COND_IE'   ).AsString := SoNumerosOuISENTO(pIE);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.ie_existente(qLocal.FieldByName('CON_NOME_FANTASIA').AsString,
                       qLocal.FieldByName('CON_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_CLIENTE_Com_Este_RG(pRG,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pRG = ''       then exit;
   if pRG = 'ISENTO' then exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CLI_CODIGO, CLI_NOME_FANTASIA     ');
   qLocal.sql.add('  FROM CLIENTE_CLI, CLIENTE_DETALHE_CLID ');
   qLocal.sql.add(' WHERE CLID_CODIGO = CLI_CODIGO          ');
   qLocal.sql.add('   AND CLI_CODIGO  <> :CLI_CODIGO        ');
   qLocal.sql.add('   AND CLID_RG     =  :CLID_RG           ');
   qLocal.ParamByName('CLI_CODIGO').AsString := pCliente;
   qLocal.ParamByName('CLID_RG'   ).AsString := SoNumerosOuISENTO(pRG);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.rg_existente(qLocal.FieldByName('CLI_NOME_FANTASIA').AsString,
                       qLocal.FieldByName('CLI_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_FORNECEDOR_Com_Este_RG(pRG,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pRG = ''       then exit;
   if pRG = 'ISENTO' then exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT FOR_CODIGO, FOR_NOME_FANTASIA     ');
   qLocal.sql.add('  FROM FORNECEDOR_FOR, FORNECEDOR_DETALHE_FORD ');
   qLocal.sql.add(' WHERE FORD_CODIGO = FOR_CODIGO          ');
   qLocal.sql.add('   AND FOR_CODIGO  <> :FOR_CODIGO        ');
   qLocal.sql.add('   AND FORD_RG     =  :FORD_RG           ');
   qLocal.ParamByName('FOR_CODIGO').AsString := pCliente;
   qLocal.ParamByName('FORD_RG'   ).AsString := SoNumerosOuISENTO(pRG);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.rg_existente(qLocal.FieldByName('FOR_NOME_FANTASIA').AsString,
                       qLocal.FieldByName('FOR_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_CONSULTOR_Com_Este_RG(pRG,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pRG = ''       then exit;
   if pRG = 'ISENTO' then exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CON_CODIGO, CON_NOME_FANTASIA     ');
   qLocal.sql.add('  FROM CONSULTOR_CON, CONSULTOR_DETALHE_COND ');
   qLocal.sql.add(' WHERE COND_CODIGO = CON_CODIGO          ');
   qLocal.sql.add('   AND CON_CODIGO  <> :CON_CODIGO        ');
   qLocal.sql.add('   AND COND_RG     =  :COND_RG           ');
   qLocal.ParamByName('CON_CODIGO').AsString := pCliente;
   qLocal.ParamByName('COND_RG'   ).AsString := SoNumerosOuISENTO(pRG);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.rg_existente(qLocal.FieldByName('CON_NOME_FANTASIA').AsString,
                       qLocal.FieldByName('CON_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function f0ou1(pBoolean:Boolean):Integer;
begin
  if pBoolean then
     result := 1
  else
     result := 0;
end;

procedure AtualizaFUSADA_FUS(pUSUARIO,pfuncao:String);
var qLocal : TFDQuery;
begin
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('DELETE FUSADA_FUS                ');
   qLocal.sql.add(' WHERE FUS_USUARIO = :FUS_USUARIO');
   qLocal.sql.add('   AND FUS_FUNCAO  = :FUS_FUNCAO ');
   qLocal.ParamByName('FUS_USUARIO').AsString := pUSUARIO;
   qLocal.ParamByName('FUS_FUNCAO' ).AsString := pFUNCAO;
   qLocal.ExecSql;

   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('INSERT INTO FUSADA_FUS  ');
   qLocal.sql.add('     ( FUS_USUARIO,     ');
   qLocal.sql.add('       FUS_FUNCAO)      ');
   qLocal.sql.add('VALUES                  ');
   qLocal.sql.add('     (:FUS_USUARIO,     ');
   qLocal.sql.add('      :FUS_FUNCAO)      ');
   qLocal.ParamByName('FUS_USUARIO').AsString := pUSUARIO;
   qLocal.ParamByName('FUS_FUNCAO' ).AsString := pFUNCAO;
   qLocal.ExecSql;

   qLocal.Free;
end;

procedure Limpar_os_campos_da_Tela(pTela:TForm);
var vComponents,i : integer;
begin
   for vComponents := 0 to pTela.ComponentCount-1 do
   begin
       if (pTela.Components[vComponents] is TRadioGroup) then
       begin
          (pTela.Components[vComponents] as TRadioGroup).ItemIndex := -1;
          (pTela.Components[vComponents] as TRadioGroup).Color := clWhite;
       end;
       if (pTela.Components[vComponents] is TComboBox) then
       begin
          (pTela.Components[vComponents] as TComboBox).Text := '';
          (pTela.Components[vComponents] as TComboBox).ItemIndex := -1;
          (pTela.Components[vComponents] as TComboBox).Color := clWhite;
       end;
       if (pTela.Components[vComponents] is TMemo) then
       begin
          (pTela.Components[vComponents] as TMemo).Lines.Clear;
          (pTela.Components[vComponents] as TMemo).Color := clWhite;
       end;
       if (pTela.Components[vComponents] is TCheckBox) then
       begin
          (pTela.Components[vComponents] as TCheckBox).Checked:=False;
          (pTela.Components[vComponents] as TCheckBox).Color := clWhite;
       end;
       if (pTela.Components[vComponents] is TEdit) then
       begin
          (pTela.Components[vComponents] as TEdit).Text := '';
          if (pTela.Components[vComponents] as TEdit).ReadOnly then
             (pTela.Components[vComponents] as TEdit).Color := clSilver
          else
             (pTela.Components[vComponents] as TEdit).Color := clWhite;
          if (pTela.Components[vComponents] as TEdit).CharCase <> ecLowerCase then
             (pTela.Components[vComponents] as TEdit).CharCase := ecUpperCase;
       end;
       if (pTela.Components[vComponents] is TMaskEdit) then
       begin
          (pTela.Components[vComponents] as TMaskEdit).Text := '';
          if (pTela.Components[vComponents] as TMaskEdit).ReadOnly then
             (pTela.Components[vComponents] as TMaskEdit).Color := clSilver
          else
             (pTela.Components[vComponents] as TMaskEdit).Color := clWhite;
       end;
       if (pTela.Components[vComponents] is TStringGrid) then
       begin
          (pTela.Components[vComponents] as TStringGrid).Color := clWhite;
          for i := 1 to (pTela.Components[vComponents] as TStringGrid).RowCount -1 do
             (pTela.Components[vComponents] as TStringGrid).rows[i].Clear;
       end;
       if (pTela.Components[vComponents] is TMemo) then
       begin
          (pTela.Components[vComponents] as TMemo).Lines.Clear;
       end;
     end;
end;

function Criptografar(pTexto: String): String;
var
   Cont, Cod: Integer;
   Retorna: String;
begin
   for Cont := 1 to Length(pTexto) do
   begin
      Cod := ValorAsc(Copy(pTexto, Cont, 1));
      Retorna := Retorna + Chr(Cod + 7(*valor a ser adicionado - pode ser modificado*));
   end;
   Criptografar := Retorna;
end;

function DesCriptografar(pTexto: String): String;
var
   Cont, Cod: integer;
   Retorna: String;
begin
   for Cont := 1 to Length(pTexto) do
   begin
       Cod := ValorAsc(Copy(pTexto, Cont, 1));
       Retorna := Retorna + Chr(Cod - 7);
   end;
   DesCriptografar := Retorna;
end;

{
function Criptografar(pTexto: String): String;
var
   PosicaoNaString, CaracterASCII: integer;
   Retornar: String;
begin
   for PosicaoNaString := 1 to Length(pTexto) do
   begin
       CaracterASCII := ValorAsc(Copy(pTexto, PosicaoNaString, 1));
       Retornar := Retornar + Chr(CaracterASCII + 7);
   end;
   result := Retornar;
end;

function DesCriptografar(pTexto: String): String;
var
   PosicaoNaString, CaracterASCII: integer;
   Retornar: String;
begin
   for PosicaoNaString := 1 to Length(pTexto) do
   begin
       CaracterASCII := ValorAsc(Copy(pTexto, PosicaoNaString, 1));
       Retornar := Retornar + Chr(CaracterASCII - 7);
   end;
   result := Retornar;
end;
}
function ValorAsc(Letra: String): Byte;
begin
   if Length(letra) > 0 then
      result := Ord(Letra[1])
   else
      result := 0;
end;

procedure Certificado_Digital_Vencendo_Avisar_Usuario_e_Enviar_Email_Ao_Suporte;
var vFrase: String;
begin
     vFrase := 'Certificado Digital vence em '+
               DateToStr(VerificacaoInicial.ValidadeCertificado);
     log('funcoes','wanderok@msn.com',vFrase);
     //Avisos.Avisar(vFrase);
     Avisos.CertificadoDigital(VerificacaoInicial.ValidadeCertificado);
end;

Procedure Log(pTela,pEmail,pHistorico:string); overload;
begin
   //Envia o erro para o email do suporte
   xMemo := tMemo.Create(nil);
   xMemo.Parent := Application.MainForm;
   xMemo.visible := false;
   xMemo.lines.clear;
   xMemo.lines.add('==================================');
   xMemo.lines.add(pHistorico);
   xMemo.lines.add('==================================');
   xMemo.lines.add('Empresa: '          + Empresa.NomeFantasia);
   xMemo.lines.add('Codigo Unisystem: ' + Empresa.CodigoUniSystem);
   xMemo.lines.add('Data: '             + sDataServidor + ' ' + HoraServidor);
   xMemo.lines.add('==================================');
   xMemo.lines.add('Banco de Dados: '   + Acesso.nomeDaConexao);
   xMemo.lines.add('Versao do EXE: '    + DataDoExecutavel);
   xMemo.lines.add('Computador: '       + NomeComputador);
   xMemo.lines.add('Usuario: '          + Usuario.Nome);
   xMemo.Lines.Add('Tela: '             + pTela);
   xMemo.lines.add('==================================');

   MandaEmailCurto(pEmail,
                   'Certificado Digital Vencendo: '+Empresa.NomeFantasia
                   ,xMemo);

   MandaEmailCurto('smc.atendimentos@gmail.com',
                   'Certificado Digital Vencendo: '+Empresa.NomeFantasia
                   ,xMemo);

   xMemo.Free;

   Log(pTela,pHistorico);
end;

Procedure Log(pTela,pHistorico:string); overload;
begin
   Log_Salvar('',pTela,pHistorico);
end;

Procedure LogErros(pTela,pHistorico:string);
begin
   Log_Salvar('E',pTela,pHistorico);
end;

Procedure Log_Salvar(pTipo,pTela,pHistorico:string);
var Q1: TFDQuery;
    vFuncao: String;
    vLOG_SEQUENCIAL, vLetra,
    vLOG_LINHA : integer;
    vFrase,i : String;
begin
   try
     Q1 := TFDQuery.Create(nil);
     Q1.ConnectionName := 'X';

     Q1.Close;
     Q1.Sql.Clear;
     Q1.Sql.Add('SELECT MAX(LOG_SEQUENCIAL) AS MAXIMO FROM LOG_LOG   ');
     Q1.open; //PausaDelay;
     vLOG_SEQUENCIAL := q1.fieldByName('MAXIMO').AsInteger+1;
     vLOG_LINHA      := 0;

     // dividir o historico...
     vFrase := '';
     For vLetra := 1 to length(pHistorico) Do
     begin
        vFrase := vFrase + pHistorico[vLetra];
        if Length(vFrase) >= 255 then
        begin
             inc(vLOG_LINHA);
             Q1.Close;
             Q1.Sql.Clear;
             Q1.Sql.Add('INSERT INTO LOG_LOG   ');
             Q1.Sql.Add('    ( LOG_SEQUENCIAL, ');
             Q1.Sql.Add('      LOG_TELA,       ');
             Q1.Sql.Add('      LOG_EXECUTAVEL, '); // 24/03/19
             Q1.Sql.Add('      LOG_LINHA,      ');
             Q1.Sql.Add('      LOG_DATA,       '); // DATA DA OPERACAO
             Q1.Sql.Add('      LOG_USUARIO,    '); // USUARIO
             Q1.Sql.Add('      LOG_HORA,       '); // HORARIO
             Q1.Sql.Add('      LOG_ACESSO,     '); // NOME DA ROTINA DE ACESSO (CODIGOS DE "CRIAR FUNCOES")
             Q1.Sql.Add('      LOG_FUNCAO,     '); // NOME DA FUNCAO/OPERACAO EXECUTADA
             Q1.Sql.Add('      LOG_HISTORICO,  '); // DESCRICAO DO QUE FOI FEITO
             Q1.Sql.Add('      LOG_DADOANTIGO, '); // SE ALTERACAO, VALOR ANTERIOR
             Q1.Sql.Add('      LOG_DADONOVO,   '); // SE ALTERACAO, VALOR NOVO/ALTERADO
             Q1.Sql.Add('      LOG_TIPO,       '); // I=INCLUSAO, C=CONSULTA, A=ALTERACAO, E=EXCLUSAO, L=LISTAGEM
             Q1.Sql.Add('      LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
             Q1.Sql.Add('      LOG_PEDIDO,       '); // NUMERO DO PEDIDO
             Q1.Sql.Add('      LOG_ESTACAO,      '); // NOME DO COMPUTADOR
             Q1.Sql.Add('      LOG_SEQFINANCEIRO)');
             Q1.Sql.Add('VALUES                ');
             Q1.Sql.Add('    ( :LOG_SEQUENCIAL,');
             Q1.Sql.Add('      :LOG_TELA,      ');
             Q1.Sql.Add('      :LOG_EXECUTAVEL,'); // 24/03/19
             Q1.Sql.Add('      :LOG_LINHA,     ');
             Q1.Sql.Add('      :LOG_DATA,      ');
             Q1.Sql.Add('      :LOG_USUARIO,   ');
             Q1.Sql.Add('      :LOG_HORA,      ');
             Q1.Sql.Add('      :LOG_ACESSO,    ');
             Q1.Sql.Add('      :LOG_FUNCAO,    ');
             Q1.Sql.Add('      :LOG_HISTORICO, ');
             Q1.Sql.Add('      :LOG_DADOANTIGO,');
             Q1.Sql.Add('      :LOG_DADONOVO,  ');
             Q1.Sql.Add('      :LOG_TIPO,      ');
             Q1.Sql.Add('      :LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
             Q1.Sql.Add('      :LOG_PEDIDO,       '); // NUMERO DO PEDIDO
             Q1.Sql.Add('      :LOG_ESTACAO,      '); // NOME DO COMPUTADOR
             Q1.Sql.Add('      :LOG_SEQFINANCEIRO)');
             Q1.ParamByName('LOG_SEQUENCIAL').AsInteger  := vLOG_SEQUENCIAL;
             Q1.ParamByName('LOG_TELA'      ).AsString   := Copy(pTela,1,30);
             Q1.ParamByName('LOG_EXECUTAVEL').AsString   := DataDoExecutavel;
             Q1.ParamByName('LOG_LINHA'     ).AsInteger  := vLOG_LINHA;
             Q1.ParamByName('LOG_DATA'      ).AsDateTime := DataServidor;
             Q1.ParamByName('LOG_USUARIO'   ).AsString   := Usuario.Codigo;
             Q1.ParamByName('LOG_HORA'      ).AsString   := HoraServidor;
             Q1.ParamByName('LOG_ACESSO'    ).AsString   := '';
             Q1.ParamByName('LOG_FUNCAO'    ).AsString   := '';
             Q1.ParamByName('LOG_HISTORICO' ).AsString   := Copy(Uppercase(vFrase),1,255);
             Q1.ParamByName('LOG_DADOANTIGO').AsString   := '';
             Q1.ParamByName('LOG_DADONOVO'  ).AsString   := '';
             Q1.ParamByName('LOG_TIPO'      ).AsString   := pTipo;
             Q1.ParamByName('LOG_CRIPTOGRAFADO').AsString:= 'N';
             Q1.ParamByName('LOG_PEDIDO'    ).AsString   := '';
             Q1.ParamByName('LOG_ESTACAO'   ).AsString   := NomeComputador;
             Q1.ParamByName('LOG_SEQFINANCEIRO').AsInteger  := 0;
             Q1.ExecSql;
           vFrase := '';
        end;
     end;
     inc(vLOG_LINHA);
     Q1.Close;
     Q1.Sql.Clear;
     Q1.Sql.Add('INSERT INTO LOG_LOG   ');
     Q1.Sql.Add('    ( LOG_SEQUENCIAL, ');
     Q1.Sql.Add('      LOG_TELA,       ');
     Q1.Sql.Add('      LOG_EXECUTAVEL,'); // 24/03/19
     Q1.Sql.Add('      LOG_LINHA,      ');
     Q1.Sql.Add('      LOG_DATA,       '); // DATA DA OPERACAO
     Q1.Sql.Add('      LOG_USUARIO,    '); // USUARIO
     Q1.Sql.Add('      LOG_HORA,       '); // HORARIO
     Q1.Sql.Add('      LOG_ACESSO,     '); // NOME DA ROTINA DE ACESSO (CODIGOS DE "CRIAR FUNCOES")
     Q1.Sql.Add('      LOG_FUNCAO,     '); // NOME DA FUNCAO/OPERACAO EXECUTADA
     Q1.Sql.Add('      LOG_HISTORICO,  '); // DESCRICAO DO QUE FOI FEITO
     Q1.Sql.Add('      LOG_DADOANTIGO, '); // SE ALTERACAO, VALOR ANTERIOR
     Q1.Sql.Add('      LOG_DADONOVO,   '); // SE ALTERACAO, VALOR NOVO/ALTERADO
     Q1.Sql.Add('      LOG_TIPO,       '); // I=INCLUSAO, C=CONSULTA, A=ALTERACAO, E=EXCLUSAO, L=LISTAGEM
     Q1.Sql.Add('      LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
     Q1.Sql.Add('      LOG_PEDIDO,       '); // NUMERO DO PEDIDO
     Q1.Sql.Add('      LOG_ESTACAO,      '); // NOME DO COMPUTADOR
     Q1.Sql.Add('      LOG_SEQFINANCEIRO)');
     Q1.Sql.Add('VALUES                ');
     Q1.Sql.Add('    ( :LOG_SEQUENCIAL,');
     Q1.Sql.Add('      :LOG_TELA,      ');
     Q1.Sql.Add('      :LOG_EXECUTAVEL,'); // 24/03/19
     Q1.Sql.Add('      :LOG_LINHA,     ');
     Q1.Sql.Add('      :LOG_DATA,      ');
     Q1.Sql.Add('      :LOG_USUARIO,   ');
     Q1.Sql.Add('      :LOG_HORA,      ');
     Q1.Sql.Add('      :LOG_ACESSO,    ');
     Q1.Sql.Add('      :LOG_FUNCAO,    ');
     Q1.Sql.Add('      :LOG_HISTORICO, ');
     Q1.Sql.Add('      :LOG_DADOANTIGO,');
     Q1.Sql.Add('      :LOG_DADONOVO,  ');
     Q1.Sql.Add('      :LOG_TIPO,      ');
     Q1.Sql.Add('      :LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
     Q1.Sql.Add('      :LOG_PEDIDO,       '); // NUMERO DO PEDIDO
     Q1.Sql.Add('      :LOG_ESTACAO,      '); // NOME DO COMPUTADOR
     Q1.Sql.Add('      :LOG_SEQFINANCEIRO)');
     Q1.ParamByName('LOG_SEQUENCIAL').AsInteger  := vLOG_SEQUENCIAL;
     Q1.ParamByName('LOG_TELA'      ).AsString   := Copy(pTela,1,30);
     Q1.ParamByName('LOG_EXECUTAVEL').AsString   := DataDoExecutavel;
     Q1.ParamByName('LOG_LINHA'     ).AsInteger  := vLOG_LINHA;
     Q1.ParamByName('LOG_DATA'      ).AsDateTime := DataServidor;
     Q1.ParamByName('LOG_USUARIO'   ).AsString   := Usuario.Codigo;
     Q1.ParamByName('LOG_HORA'      ).AsString   := HoraServidor;
     Q1.ParamByName('LOG_ACESSO'    ).AsString   := '';
     Q1.ParamByName('LOG_FUNCAO'    ).AsString   := '';
     Q1.ParamByName('LOG_HISTORICO' ).AsString   := vFrase;
     Q1.ParamByName('LOG_DADOANTIGO').AsString   := '';
     Q1.ParamByName('LOG_DADONOVO'  ).AsString   := '';
     Q1.ParamByName('LOG_TIPO'      ).AsString   := pTipo;
     Q1.ParamByName('LOG_CRIPTOGRAFADO').AsString:= 'N';
     Q1.ParamByName('LOG_PEDIDO'    ).AsString   := '';
     Q1.ParamByName('LOG_ESTACAO'   ).AsString   := NomeComputador;
     Q1.ParamByName('LOG_SEQFINANCEIRO').AsInteger  := 0;
     Q1.ExecSql;
   except
   end;

   Q1.free;
end;

function MandaEmail(pEmail,pSubject:String; pTexto:TMemo):Boolean;
var Q : TFDQuery;
begin
    // RECEBE UM ENDERECO DE EMAIL E ENVIA
    Result := False;

    //EXIT; // 04/04/2020 - SMC

    if pEmail = '' then
      pEmail := 'wanderok@msn.com';

   {
   if pEmail <> fEmailSuporte then
   begin
        q := TFDQuery.Create(nil);
        Q.ConnectionName := 'X';
        Q.close;
        Q.sql.clear;
        Q.sql.add('SELECT CFG_EMAIL FROM CONFIG_CFG ');
        Q.open; //PausaDelay;
        if not Q.Eof Then
           if q.fieldByName('CFG_EMAIL').AsString <> '' then
              pEmail := q.fieldByName('CFG_EMAIL').AsString;
        Q.Free;
   end;
   }
   frmEmail := tfrmEmail.create(Nil);
   frmEmail.Visible := false;
   vEmailCurto := false;
   vAvisarQueEnviou := False;
   frmEmail.edEmail.Text   := pEmail;
   if pSubject <> '' then
      frmEmail.edAssunto.text := LowerCase('SMC '+pSubject+': ' +Empresa.NomeFantasia)
   else
      frmEmail.edAssunto.text := LowerCase('SMC Alerta '+Empresa.NomeFantasia);
   frmEmail.Memo1.Lines.Clear;
   frmEmail.Memo1.Lines.Add('----------------------------------------------------------');
   frmEmail.Memo1.Lines.Add('Empresa: ' + Empresa.NomeFantasia);
   frmEmail.Memo1.Lines.Add('Usuário: ' + Usuario.Codigo + '-'+Usuario.Nome);
   frmEmail.Memo1.Lines.Add('Estação: ' + NomeComputador);
   frmEmail.Memo1.Lines.Add('   Data: ' + DateToStr(DataServidor) + ' ' + HoraServidor);
   frmEmail.Memo1.Lines.Add('----------------------------------------------------------');
   frmEmail.Memo1.Lines.Add(pTexto.Text);
   frmEmail.Memo1.Lines.Add('-------------------------f i m ---------------------------');
   frmEmail.bEnviarEmailClick(Nil);
end;

function MandaEmailCurto(pEmail,pSubject:String; pTexto:TMemo):Boolean;
//var Q : TFDQuery;
begin
    // RECEBE UM ENDERECO DE EMAIL E ENVIA
    Result := False;

   frmEmail := tfrmEmail.create(Nil);
   frmEmail.Visible := false;
   vEmailCurto := true;
   vAvisarQueEnviou := False;
   //xxxMandarEmailSemAvisar := 'N';
   //if pEmail <> '' then
   //   frmEmail.edEmail.Text   := pEmail
   //else
      frmEmail.edEmail.Text   := 'wanderok@msn.com';
   if pSubject <> '' then
      frmEmail.edAssunto.text := pSubject+' ' +Empresa.NomeFantasia
   else
      frmEmail.edAssunto.text := fNomeDoSistema+': '+Empresa.NomeFantasia;
   frmEmail.Memo1.Lines.Clear;
   frmEmail.Memo1.Lines.Add(pTexto.Text);
   vEmail:=pEmail;
   frmEmail.bEnviarEmailClick(Nil);
   Result := vfrmEmailSucesso;
   frmEmail.Free;
end;

Function NomeComputador : String;
var
   lpBuffer : PChar;
   nSize    : DWord;
const
   Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
   nSize := Buff_Size;
   lpBuffer := StrAlloc(Buff_Size);
   GetComputerName(lpBuffer,nSize);
   Result := String(lpBuffer);
   //Result := SEMHIFEM(String(lpBuffer));
   StrDispose(lpBuffer);
end;

function DataServidor:tDateTime;
var Q : TFDQuery;
begin
   try
     Q := TFDQuery.Create(nil);
     Q.ConnectionName := 'X';

     Q.Close;
     Q.SQL.Clear;
     Q.Sql.Add('select getdate() AS DATA');
     Q.open; //PausaDelay;
     Result := StrToDate(Copy(q.fieldByName('DATA').AsString,1,8));
   except
     Result := 0;
   end;
   q.Free;
end;

function sDataServidor:String;
begin
   result := Copy(DateToStr(DataServidor),1,8);
end;

function HoraServidor:String;
var Q : TFDQuery;
begin
   // retorna a hora atual lida do servidor
   try
     Q := TFDQuery.Create(nil);
     Q.ConnectionName := 'X';

     Q.Close;
     Q.SQL.Clear;
     Q.Sql.Add('select convert(char(10),getdate(),108) AS HORA');
     Q.open;
     Result := Copy(TimeToStr(q.fieldByName('HORA').AsDateTime),1,5);
   except
     Result := '';
   end;
   q.Free;
end;

function JaEnviouEmail(pDestinatario,pAssunto:String):Boolean;
var Q : TFDQuery;
begin
    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';
    Q.close;
    Q.sql.clear;
    Q.sql.add('SELECT TOP 1 EMAIL_SEQUENCIAL          ');
    Q.sql.add('  FROM EMAIL_EMAIL                     ');
    Q.sql.add(' WHERE EMAIL_DESTINO = :EMAIL_DESTINO  ');
    Q.sql.add('   AND EMAIL_ASSUNTO = :EMAIL_ASSUNTO  ');
    Q.sql.add('   AND EMAIL_DATA    = :EMAIL_DATA     ');
    Q.ParamByName('EMAIL_DESTINO').AsString   := pDestinatario;
    Q.ParamByName('EMAIL_ASSUNTO').AsString   := pAssunto;
    Q.ParamByName('EMAIL_DATA'   ).AsDateTime := DataServidor;
    Q.open;
    if Q.eof then
       result := False
    else
      result := True;
    Q.Free;
end;

function INSERT_EMAIL_EMAIL(pDestinatario,pAssunto:String;pEMAIL_ENVIADO:Integer):Integer;
var Q : TFDQuery;
    vEMAIL_SEQUENCIAL : integer;
begin
    if JaEnviouEmail(pDestinatario,pAssunto) then
       exit;

    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';

    try
      Q.close;
      Q.sql.clear;
      Q.sql.add('INSERT INTO EMAIL_EMAIL ');
      Q.sql.add(' ( EMAIL_SEQUENCIAL,    ');
      Q.sql.add('   EMAIL_DESTINO,       ');
      Q.sql.add('   EMAIL_ASSUNTO,       ');
      Q.sql.add('   EMAIL_DATA,          ');
      Q.sql.add('   EMAIL_USUARIO,       ');
      Q.sql.add('   EMAIL_ESTACAO,       ');
      Q.sql.add('   EMAIL_DTENVIO,       ');
      Q.sql.add('   EMAIL_HRENVIO,       ');
      Q.sql.add('   EMAIL_ENVIADO,       ');
      Q.sql.add('   EMAIL_HR)            ');
      Q.sql.add('VALUES                  ');
      Q.sql.add(' (:EMAIL_SEQUENCIAL,    ');
      Q.sql.add('  :EMAIL_DESTINO,       ');
      Q.sql.add('  :EMAIL_ASSUNTO,       ');
      Q.sql.add('  :EMAIL_DATA,          ');
      Q.sql.add('  :EMAIL_USUARIO,       ');
      Q.sql.add('  :EMAIL_ESTACAO,       ');
      Q.sql.add('  :EMAIL_DTENVIO,       ');
      Q.sql.add('  :EMAIL_HRENVIO,       ');
      Q.sql.add('  :EMAIL_ENVIADO,       ');
      Q.sql.add('  :EMAIL_HR)            ');
      vEMAIL_SEQUENCIAL := ProximoEMAIL_SEQUENCIAL;
      Q.ParamByName('EMAIL_SEQUENCIAL').AsInteger  := vEMAIL_SEQUENCIAL;
      Q.ParamByName('EMAIL_DESTINO'   ).AsString   := copy(pDestinatario,1,30);
      Q.ParamByName('EMAIL_ASSUNTO'   ).AsString   := copy(pAssunto,1,30);
      Q.ParamByName('EMAIL_DATA'      ).AsDateTime := DataServidor;
      Q.ParamByName('EMAIL_USUARIO'   ).AsString   := copy(Usuario.Codigo,1,10);
      Q.ParamByName('EMAIL_ESTACAO'   ).AsString   := copy(NomeComputador,1,20);
      Q.ParamByName('EMAIL_DTENVIO'   ).AsDateTime := DataServidor;
      Q.ParamByName('EMAIL_HRENVIO'   ).AsString   := HoraServidor;
      Q.ParamByName('EMAIL_ENVIADO'   ).AsInteger  := pEMAIL_ENVIADO;
      Q.ParamByName('EMAIL_HR'        ).AsString   := HoraServidor;
      Q.ExecSql;
      result := vEMAIL_SEQUENCIAL;
    except
    end;
    Q.Free;
end;

Procedure INSERT_CORPOEMAIL_CEMAIL(pEMAIL_SEQUENCIAL,pCEMAIL_LINHA:Integer;pCEMAIL_TEXTO:String);
var Q : TFDQuery;
begin
    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';

    // CORPO DO EMAIL
    Q.close;
    Q.sql.clear;
    Q.sql.add('INSERT INTO CORPOEMAIL_CEMAIL ');
    Q.sql.add(' ( CEMAIL_SEQUENCIAL,         ');
    Q.sql.add('   CEMAIL_LINHA,              ');
    Q.sql.add('   CEMAIL_TEXTO      )        ');
    Q.sql.add('VALUES                        ');
    Q.sql.add(' (:CEMAIL_SEQUENCIAL,         ');
    Q.sql.add('  :CEMAIL_LINHA,              ');
    Q.sql.add('  :CEMAIL_TEXTO      )        ');
    Q.ParamByName('CEMAIL_SEQUENCIAL').AsInteger  := pEMAIL_SEQUENCIAL;
    Q.ParamByName('CEMAIL_LINHA'     ).AsInteger  := pCEMAIL_LINHA;
    Q.ParamByName('CEMAIL_TEXTO'     ).AsString   := pCEMAIL_TEXTO;
    Q.ExecSql;
    Q.Free;
end;

Function ProximoEMAIL_SEQUENCIAL:Integer;
var Q : TFDQuery;
begin
    // retorna o maior sequencial +1 na tabela EMAIL_EMAIL
    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';

    Q.Close;
    Q.Sql.Clear;
    Q.SQL.Add('SELECT MAX(EMAIL_SEQUENCIAL) AS MAIOR ');
    Q.SQL.Add('  FROM EMAIL_EMAIL                    ');
    Q.open; //PausaDelay;
    if Q.eof then
       result := 1
    else
       result := Q.FieldByName('MAIOR').AsInteger + 1;
    q.Free;
end;

function ProximoBAI_CODIGO:String;
var Q : TFDQuery;
    i : Integer;
begin
    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';

  try
    Q.Close;
    Q.Sql.Clear;
    Q.SQL.Add('SELECT MAX(BAI_CODIGO) AS MAIOR ');
    Q.SQL.Add('  FROM BAIRRO_BAI               ');
    Q.open;
    if Q.eof then
       result := '1'
    else
       if Q.FieldByName('MAIOR').AsString = '' then
           result := '1'
       else
           result := FormatFloat('#',Q.FieldByName('MAIOR').AsInteger + 1);
   except
        i := 1;
        Q.Close;
        Q.Sql.Clear;
        Q.SQL.Add('SELECT *                 ');
        Q.SQL.Add('  FROM BAIRRO_BAI        ');
        Q.SQL.Add(' WHERE BAI_CODIGO = :COD ');
        Q.ParamByName('COD').AsString := FormatFloat('#',i);
        Q.open;
        while not Q.eof do
        begin
          Inc(i);
          q.Close;
          Q.ParamByName('COD').AsString := FormatFloat('#',i);
          Q.open;
        end;
        result:= FormatFloat('#',i);
     end;
    q.Free;
end;

function ProximoREG_CODIGO:String;
var Q : TFDQuery;
    i : Integer;
begin
    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';

  try
    Q.Close;
    Q.Sql.Clear;
    Q.SQL.Add('SELECT MAX(REG_CODIGO) AS MAIOR ');
    Q.SQL.Add('  FROM REGIAO_REG               ');
    Q.open;
    if Q.eof then
       result := '1'
    else
       if Q.FieldByName('MAIOR').AsString = '' then
           result := '1'
       else
           result := FormatFloat('#',Q.FieldByName('MAIOR').AsInteger + 1)
   except
        i := 1;
        Q.Close;
        Q.Sql.Clear;
        Q.SQL.Add('SELECT *                 ');
        Q.SQL.Add('  FROM REGIAO_REG        ');
        Q.SQL.Add(' WHERE REG_CODIGO = :COD ');
        Q.ParamByName('COD').AsString := FormatFloat('#',i);
        Q.open;
        while not Q.eof do
        begin
          Inc(i);
          q.Close;
          Q.ParamByName('COD').AsString := FormatFloat('#',i);
          Q.open;
        end;
        result:= FormatFloat('#',i);
     end;

    q.Free;
end;

function ProximoRAMO_CODIGO:String;
var Q : TFDQuery;
    i : Integer;
begin
    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';

  try
      Q.Close;
      Q.Sql.Clear;
      Q.SQL.Add('SELECT MAX(RAMO_CODIGO) AS MAIOR ');
      Q.SQL.Add('  FROM RAMOATIVIDADE_RAMO        ');
      Q.open;
      if Q.eof then
           result := '1'
      else
         if Q.FieldByName('MAIOR').AsString = '' then
             result := '1'
         else
             result := FormatFloat('#',Q.FieldByName('MAIOR').AsInteger + 1);
   except
        i := 1;
        Q.Close;
        Q.Sql.Clear;
        Q.SQL.Add('SELECT RAMO_CODIGO        ');
        Q.SQL.Add('  FROM RAMOATIVIDADE_RAMO ');
        Q.SQL.Add(' WHERE RAMO_CODIGO = :COD ');
        Q.ParamByName('COD').AsString := FormatFloat('#',i);
        Q.open;
        while not Q.eof do
        begin
          q.Close;
          Inc(i);
          Q.ParamByName('COD').AsString := FormatFloat('#',i);
          Q.open;
        end;
        result:= FormatFloat('#',i);
     end;
    q.Free;
end;

function ProximoZON_CODIGO:String;
var Q : TFDQuery;
    i : Integer;
begin
    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';

  try
    Q.Close;
    Q.Sql.Clear;
    Q.SQL.Add('SELECT MAX(ZON_CODIGO) AS MAIOR ');
    Q.SQL.Add('  FROM ZONA_ZON                 ');
    Q.open;
    if Q.eof then
       result := '1'
    else
       if Q.FieldByName('MAIOR').AsString = '' then
           result := '1'
       else
           result := FormatFloat('#',Q.FieldByName('MAIOR').AsInteger + 1);
   except
        i := 1;
        Q.Close;
        Q.Sql.Clear;
        Q.SQL.Add('SELECT *                 ');
        Q.SQL.Add('  FROM ZONA_ZON          ');
        Q.SQL.Add(' WHERE ZON_CODIGO = :COD ');
        Q.ParamByName('COD').AsString := FormatFloat('#',i);
        Q.open;
        while not Q.eof do
        begin
          Inc(i);
          Q.Close;
          Q.ParamByName('COD').AsString := FormatFloat('#',i);
          Q.open;
        end;
        result:= FormatFloat('#',i);
     end;
    q.Free;
end;

Function DataDoExecutavel:String;
var FileDate: integer;
begin
  Result := '';
  try
  FileDate := FileAge(Application.ExeName);
  if FileDate > -1 then
     Result := DateTimeToStr(FileDateToDateTime(FileDate));
  except
  end;
end;

procedure Executar_Script(pComando:String);
var qLocal : TFDQuery;
begin
   if Ja_Executou_Script(pComando) then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   {
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('DISABLE TRIGGER ALL ON DATABASE');
   try
     qLocal.ExecSql;
   finally
   end;
   }
   TRY
      qLocal.Close;
      qLocal.Sql.Clear;
      qLocal.Sql.Add(pComando);
      qLocal.ExecSql;
      Atualizado;
   except
      LogErros('Funcoes','Erro ao executar: '+pComando);
   end;
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('ENABLE TRIGGER ALL ON DATABASE');
   ///qLocal.ExecSql;

   qLocal.Free;
end;

procedure Executar_Script_Na_Nuvem(pComando:String);
begin
   if Ja_Executou_Script('Nuvem:'+pComando) then
      exit;

   {
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('DISABLE TRIGGER ALL ON DATABASE');
   try
     qLocal.ExecSql;
   finally
   end;
   }
   TRY
      DMNuvem.Query1.Close;
      DMNuvem.Query1.Sql.Clear;
      DMNuvem.Query1.Sql.Add(pComando);
      DMNuvem.Query1.ExecSql;
      AtualizadoNaNuvem;
   except
      LogErros('Funcoes','Erro ao executar na Nuvem: '+pComando);
   end;
end;

procedure Executar(pComando:String);
var qLocal : TFDQuery;
begin
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('DISABLE TRIGGER ALL ON DATABASE');
   try
     qLocal.ExecSql;
   finally
   end;
   TRY
      qLocal.Close;
      qLocal.Sql.Clear;
      qLocal.Sql.Add(pComando);
      qLocal.ExecSql;
      Atualizado;
   except
      // LogErros('Funcoes','Erro ao executar: '+pComando);
   end;
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('ENABLE TRIGGER ALL ON DATABASE');
   qLocal.ExecSql;

   qLocal.Free;
end;

procedure Atualizado;
var qLocal : tFDQuery;
begin
    if xxxAtualizado = '' then
       exit;

    qLocal := TFDQuery.Create(nil);
    qLocal.ConnectionName := 'X';

   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT ATU_FUNCAO FROM ATUALIZADO_ATU ');
   qLocal.sql.add(' WHERE ATU_FUNCAO = :ATU_FUNCAO       ');
   qLocal.ParamByName('ATU_FUNCAO').AsString := xxxAtualizado;
   qLocal.Open;
   if not qLocal.eof Then
   begin
      qLocal.Free;
      exit;
   end;

   qLocal.Close;
   qLocal.SQL.clear;
   qLocal.sql.add('INSERT INTO ATUALIZADO_ATU ');
   qLocal.sql.add('     ( ATU_FUNCAO,         ');
   qLocal.sql.add('       ATU_DATA)           ');
   qLocal.sql.add('VALUES                     ');
   qLocal.sql.add('     (:ATU_FUNCAO,         ');
   qLocal.sql.add('      :ATU_DATA)           ');
   qLocal.ParamByName('ATU_FUNCAO').AsString   := xxxAtualizado;
   qLocal.ParamByName('ATU_DATA'  ).AsDateTime := DataServidor; // Now;
   qLocal.ExecSQL;
   qLocal.free;
end;

procedure AtualizadoNaNuvem;
begin
    if xxxAtualizado = '' then
       exit;
    xxxAtualizado := 'Nuvem'+xxxAtualizado;
    Atualizado;
end;

function Ja_Executou_Script(pInformacao:String) : Boolean;
var qLocal : tFDQuery;
begin
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   pInformacao:=Copy(pInformacao,1,255);
   xxxAtualizado := pInformacao;

   result := true;
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT ATU_FUNCAO FROM ATUALIZADO_ATU ');
   qLocal.sql.add(' WHERE ATU_FUNCAO = :ATU_FUNCAO       ');
   qLocal.ParamByName('ATU_FUNCAO').AsString := pInformacao;
   qLocal.Open;
   if qLocal.eof Then
   begin
      xxxAtualizado := pInformacao;
      Atualizado;
      result := false;
   end;
   qLocal.Free;
end;

function NaoPreencheuCamposObrigatoriosOuImportantes(pTela:TForm):Boolean;
begin
  result := true;
  if HaCamposObrigatorios_tag_100_NaoPreenchidos(pTela) then exit;
  if HaCamposImportantes_tag_200_NaoPreenchidos(pTela)  then exit;
  Result := false;
end;

function HaCamposObrigatorios_tag_100_NaoPreenchidos(pTela:TForm):Boolean;
var vComponent:Integer;
begin
   Result := False;
   for vComponent := 0 to pTela.ComponentCount-1 do
   begin
      if pTela.Components[vComponent] is tEdit then
      begin
         if (pTela.Components[vComponent] as tEdit).Tag = 100 then
         begin
            if (pTela.Components[vComponent] as tEdit).Text = '' then
            begin
               Result := True;
               (pTela.Components[vComponent] as tEdit).Color := clAqua;
            end
            else
               (pTela.Components[vComponent] as tEdit).Color := clWhite;
         end;
      end;
      if pTela.Components[vComponent] is tMaskEdit then
      begin
         if (pTela.Components[vComponent] as tMaskEdit).Tag = 100 then
         begin
            if (pTela.Components[vComponent] as tMaskEdit).Text = '' then
            begin
               Result := True;
               (pTela.Components[vComponent] as tMaskEdit).Color := clAqua;
            end
            else
              (pTela.Components[vComponent] as tMaskEdit).Color := clWhite;
         end;
      end;
   end;
   pTela.Refresh;
   Application.ProcessMessages;
   if result then
   begin
     Avisos.CamposObrigatorios;
     exit;
   end;
end;

function HaCamposImportantes_tag_200_NaoPreenchidos(pTela:TForm):Boolean;
var vComponent:Integer;
begin
   result := false;
   for vComponent := 0 to pTela.ComponentCount-1 do
   begin
      if pTela.Components[vComponent] is tEdit then
      begin
         if (pTela.Components[vComponent] as tEdit).Tag = 200 then
         begin
            if (pTela.Components[vComponent] as tEdit).Text = '' then
            begin
               Result := True;
               (pTela.Components[vComponent] as tEdit).Color := clYellow;
            end;
         end;
      end;
      if pTela.Components[vComponent] is tMaskEdit then
      begin
         if (pTela.Components[vComponent] as tMaskEdit).Tag = 200 then
         begin
            if (pTela.Components[vComponent] as tMaskEdit).Text = '' then
            begin
               Result := True;
               (pTela.Components[vComponent] as tMaskEdit).Color := clYellow;
            end;
         end;
      end;
   end;
   pTela.Refresh;
   Application.ProcessMessages;
   if result then
   begin
     {
     if MessageDlg('Deseja preencher os dados importantes (destacados em cor amarela)?', mtConfirmation,
       [mbYes, mbNo], 0) = mrYes then
       result := true
     else
       result := false;
     }
     Result := Avisos.DesejaPreencherCamposSugeridos;
   end;
begin
   end;
end;

procedure Cria_Objetos_das_Classes;
begin
  PesquisaF1    := TPesquisaF1.Create;
  Avisos        := TAvisos.Create;
  Configuracoes := TConfiguracao.Create;
end;

procedure Destroi_Objetos_das_Classes;
begin
    Usuario.Free;
    Empresa.Free;
    PesquisaF1.Free;
    Acesso.Desconectar;
    Acesso.Free;
    Avisos.Free;
    Configuracoes.Free;
    //VerificacaoInicial.Free;
    {
    FreeAndNil(Acesso);
    FreeAndNil(Empresa);
    FreeAndNil(Usuario);
    }
end;

procedure Gravar_Dados_do_Ultimo_Acesso(pEmpresa:String);
var ArquivoIni: TIniFile;
    vSMC_INI:String;
begin
   vSMC_INI := 'Arquivos\SMC_INI';
   ArquivoIni := TIniFile.Create(vSMC_INI);
   ArquivoIni.WriteString('LOGIN','EMPRESA', pEmpresa);
   ArquivoIni.WriteString('LOGIN','USUARIO', Usuario.Codigo);
   ArquivoIni.Free;
end;

function Eh_CPF(pNumero:String):Boolean;
begin
   //Retorna true se o comprimento da string for 11
   result := (length(SoNumeros(pNumero)) = 11);
end;

function Eh_CNPJ(pNumero:String):Boolean;
begin
   //Retorna true se o comprimento da string for 14
   result := (length(SoNumeros(pNumero)) = 14);
end;

function FormataCPF_CGC(CPF_CGC: string):string;
{formata o CPF ou CGC com suas respectivas máscaras.
  Ex: 15132731020355 => 15.132.731/0203-55}
var vDoc   : String;
    vLetra : Char;
    i      : integer;
begin
   vDoc := '';
   if CPF_CGC = '00.000.000/0000-00' then
   begin
      result := CPF_CGC;
      exit;
   end;
   for i := 1 to length(CPF_CGC) Do
   begin
       vLetra := CPF_CGC[i];
       if (vLetra <> ' ') and
          (vLetra <> '.') and
          (vLetra <> ',') and
          (vLetra <> '-') and
          (vLetra <> '/') and
          (vLetra <> '\') Then
          if (vLetra >= '0') and (vLetra <= '9') then
             vDoc := vDoc + vLetra;
   end;
   if length(vDOC)=11 then
       begin
         if CHEK_CPF(vDOC) then
            begin
                insert('.',vDoc,4);
                insert('.',vDoc,8);
                insert('-',vDoc,12);
                result := vDoc;
            end
         else
            begin
               result := '';
               Exit;
            end;
       end
   else
       if length(vDoc)=14 then
           begin
             if CHEK_CGC(vDoc) then
                 begin
                   insert('.',vDoc,3);
                   insert('.',vDoc,7);
                   insert('/',vDoc,11);
                   insert('-',vDoc,16);
                 end
             else
                 begin
                    result := '';
                    exit;
                 end;
           end
       else
          begin
             result := '';
             exit;
          end;

   result := vDoc;
end;

function CHEK_CPF(var_cpf:string):boolean;
(*confere o digito verificador do cpf*)
var
   i,j,sub_tot:integer;

begin
     var_cpf := SoNumeros(var_cpf);
     CHEK_CPF:=true;
     sub_tot:=0;
     j:=2;
     for i:=9 downto 1 do
         begin
         sub_tot:=sub_tot+strtoint(var_cpf[i])*j;
         j:=j+1
         end;

     sub_tot:=sub_tot mod 11;
     if ((sub_tot=0) or (sub_tot=1)) then
        sub_tot:=0
     else
         sub_tot:=11-sub_tot;

     if sub_tot<>strtoint(var_cpf[10]) then
        CHEK_CPF:=false
     else
         begin    (*calcula 2 digito*)
         sub_tot:=0;
         j:=2;
         for i:=10 downto 1 do
             begin
             sub_tot:=sub_tot+strtoint(var_cpf[i])*j;
             j:=j+1;
             end;

         sub_tot:=sub_tot mod 11;
         if ((sub_tot=0) or (sub_tot=1)) then
            sub_tot:=0
         else
             sub_tot:=11-sub_tot;

         if sub_tot<>strtoint(var_cpf[11]) then
            CHEK_CPF:=false;
         end;
end;

function CHEK_CGC(var_cgc:string):boolean;
(*confere o digito verificador do cgc*)
var
   i,j,sub_tot:integer;
begin
     var_cgc := SoNumeros(var_cgc);
     CHEK_CGC:=true;
     j:=2;
     sub_tot:=0;
     for i:=12 downto 1 do
         begin
         if j>9 then
            j:=2;
         sub_tot:=sub_tot+strtoint(var_cgc[i])*j;
         j:=j+1;
         end;
     sub_tot:=sub_tot mod 11;
     if ((sub_tot=0) or (sub_tot=1)) then
        sub_tot:=0
     else
         sub_tot:=11-sub_tot;

     if sub_tot<>strtoint(var_cgc[13]) then
        CHEK_CGC:=false
     else
         begin    (*calcula 2 digito*)
         sub_tot:=0;
         j:=2;
         for i:=13 downto 1 do
         begin
             if j>9 then
                j:=2;
             sub_tot:=sub_tot+strtoint(var_cgc[i])*j;
             j:=j+1;
         end;

         sub_tot:=sub_tot mod 11;
         if ((sub_tot=0) or (sub_tot=1)) then
            sub_tot:=0
         else
             sub_tot:=11-sub_tot;

         if sub_tot<>strtoint(var_cgc[14]) then
            CHEK_CGC:=false;

         end;
end;

function SoNumerosOuISENTO(pnumero:String):String;
var vDigito, vNumero : String;
    i       : integer;
begin
    // recebe uma string e a retorna somente com digitos,
    // ex. recebe 633.403.056-68 e retorna 63340305668
    if pNumero = 'ISENTO' then
    begin
       result := pNumero;
       exit;
    end;

    vNumero := '';
    for i := 1 to length(pNumero) do
    begin
        vDigito := Copy(pNumero,i,1);
        if (vDigito = '1') or
           (vDigito = '2') or
           (vDigito = '3') or
           (vDigito = '4') or
           (vDigito = '5') or
           (vDigito = '6') or
           (vDigito = '7') or
           (vDigito = '8') or
           (vDigito = '9') or
           (vDigito = '0') then
           vNumero := vNumero + vDigito;
        {end
        else
        begin
           try
              StrToInt(vDigito);
              vNumero := vNumero + vDigito
           except
           end;
        end;
        }
    end;
    result := vNumero;
end;
function SoNumeros(pnumero:String):String;
var vDigito, vNumero : String;
    i       : integer;
begin
    // recebe uma string e a retorna somente com digitos,
    // ex. recebe 633.403.056-68 e retorna 63340305668
    vNumero := '';
    for i := 1 to length(pNumero) do
    begin
        vDigito := Copy(pNumero,i,1);
        if (vDigito = '1') or
           (vDigito = '2') or
           (vDigito = '3') or
           (vDigito = '4') or
           (vDigito = '5') or
           (vDigito = '6') or
           (vDigito = '7') or
           (vDigito = '8') or
           (vDigito = '9') or
           (vDigito = '0') then
           vNumero := vNumero + vDigito;
        {end
        else
        begin
           try
              StrToInt(vDigito);
              vNumero := vNumero + vDigito
           except
           end;
        end;
        }
    end;
    result := vNumero;
end;

function SoNumerosI(pnumero:String):Integer;
begin
     Result := StrToInt(SoNumeros(pNumero));
end;

function masctostr(numero:string):string;
(* masctostr = mascara(gerada pela funcao format) to string
   esta funcao recebe uma mascara de numero como parametro gerada pel
   funcao format e gera uma string sem formato
   ex: masctostr('  10.905,25')  =  '10905,25'
       masctostr('R$10.905,25')  =  '10905,25'
       masctostr(' -10.905,25')  = '-10905,25' // wander 02/09/03
*)
var i:integer;
    masctostr_numero1:string;
begin
        if numero = '' then numero := '0';

        for i:=1 to length(numero) do
        begin
           case numero[i] of
             '0'..'9':masctostr_numero1:=masctostr_numero1+numero[i];
             ',':masctostr_numero1:=masctostr_numero1+numero[i];
             '-':masctostr_numero1:=masctostr_numero1+numero[i]; // wander: para incluir os negativos
           end;
        end;
//   masctostr:=masctostr_numero1;
     Result := masctostr_numero1;
     i := i + 1;
     i := i + 1;
end;

function fPercentualValido(pValor:String):Boolean;
var vPercentual : Real;
begin
   result := false;
   try
     vPercentual := StrToFloat(MascToStr(pValor));
     if (vPercentual < 0  ) or
        (vPercentual > 100) then
     begin
       showmessage('Percentual inválido');
       exit;
     end;
   except
     showmessage('Percentual inválido');
     exit;
   end;
   result := true;
end;

Function fSemAcentos(pCaracter:Char):Char;
begin
    if not (pCaracter in [#8,'A'..'Z', 'a'..'z', '0'..'9',' ',',']) then pCaracter := #0;
    Result := pCaracter;
end;

Function fLetrasENumeros(pCaracter:Char):Char;
begin
    if not (pCaracter in [#8,'A'..'Z', 'a'..'z', '0'..'9']) then
       pCaracter := #0;
    Result := pCaracter;
end;

function RemoveAcento(const pText: string): string;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(pText));
end;

function RemoverObsCorreios(const pText: string): string;
var i : integer;
begin
    i := pos('-',pText);
    if i = 0 then
    begin
       result := pText;
       exit;
    end;
    result := Copy(pText,1,i-1);
end;

Function fSemAcentos(pCaracter:String):String;  overload;
var i:integer;
begin
    if pCaracter = '' then
    begin
      result := '';
      exit;
    end;
    for i := 0 to length(pCaracter) do
       if not (pCaracter[i] in [#8,'A'..'Z', 'a'..'z', '0'..'9',' ',',']) then
        pCaracter[i] := #0;
    Result := pCaracter;
end;

function SoNumero(pCaracter:Char):Char;  overload;
begin
    if not (pCaracter in [#8,'0'..'9']) then pCaracter := #0;
    Result := pCaracter;
end;

function SoValor(pCaracter:Char):Char;
begin
    if not (pCaracter in [#8,'0'..'9',',','.']) then pCaracter := #0;
    Result := pCaracter;
end;

function SoLetra(pCaracter:Char):Char;
begin
    if not (pCaracter in [#8,'A'..'Z', 'a'..'z',' ']) then pCaracter := #0;
    Result := pCaracter;
end;

procedure Inicio_Padrao_De_Todas_As_Telas_Do_Sistema;
begin
end;

function DataNoFuturo(pData:TMaskEdit):Boolean;
begin

   result := false;

   exit;

   if pData.Text = '' then
      exit;
   try
     if StrToDate(pData.Text) > DataServidor then
     begin
       result := true;
       Avisos.Avisar('Data no futuro');
       exit;
     end;
   except
       result := true;
       Avisos.Avisar('Data inválida');
       exit;
   end;
end;

function BarrasSeDataNula(pData:String):String;
begin
   if pData = '30/12/1899' then
      result := '  /  /  '
   else
      result := pData;
end;

function ZeroSeDataNula(pData:String):TDatetime;
begin
   if (pData = '30/12/99') or
      (pData = '  /  /  ') or
      (pData = ''        ) then
      result := 0
   else
      result := StrToDate(pData);
end;

function SelectBairro(pBairro:String;pBairroDescricao:Tedit):Boolean;
var qLocal : tFDQuery;
begin
   Result := True;
   pBairroDescricao.Text := '';
   if pBairro = '' then
   begin
      exit;
   end;
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   result := false;
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT BAI_DESCRICAO           ');
   qLocal.sql.add('  FROM BAIRRO_BAI              ');
   qLocal.sql.add(' WHERE BAI_CODIGO = :BAI_CODIGO');
   qLocal.ParamByName('BAI_CODIGO').AsString := pBairro;
   qLocal.Open;
   if qLocal.Eof then
   begin
     qlocal.Free;
     exit;
   end;
   pBairroDescricao.Text := qlocal.FieldByName('BAI_DESCRICAO').AsString;
   qlocal.Free;
   Result := True;
end;

function selectCEP(pCEP,pRua,pBairro,pCidade,pUF:TEdit):Boolean;
var qLocal : tFDQuery;
    vProximoBAI_CODIGO,
    xBairro:String;
begin
   Result := True;
   if pCEP.Text = '' then
   begin
      exit;
   end;
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   result := false;
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT *                       ');
   qLocal.sql.add('  FROM CEP_CEP                 ');
   qLocal.sql.add(' WHERE CEP_NUMERO = :CEP_NUMERO');
   qLocal.ParamByName('CEP_NUMERO').AsString := SoNumeros(pCEP.Text);
   qLocal.Open;
   if qLocal.Eof then
   begin
     qlocal.Free;
     exit;
   end;
   pRua.Text   := qlocal.FieldByName('CEP_LOCAL' ).AsString;
   pCidade.Text:= qlocal.FieldByName('CEP_CIDADE').AsString;
   xBairro     := qlocal.FieldByName('CEP_BAIRRO').AsString;
   pUF.Text    := qlocal.FieldByName('CEP_UF'    ).AsString;

   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT BAI_CODIGO                    ');
   qLocal.sql.add('  FROM BAIRRO_BAI                    ');
   qLocal.sql.add(' WHERE BAI_DESCRICAO = :BAI_DESCRICAO');
   qLocal.ParamByName('BAI_DESCRICAO').AsString := xBairro;
   qLocal.Open;
   if not qLocal.Eof then
   begin
     pBairro.Text:= qlocal.FieldByName('BAI_CODIGO').AsString;
     qlocal.Free;
     exit;
   end;

   vProximoBAI_CODIGO := ProximoBAI_CODIGO;
   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('INSERT INTO BAIRRO_BAI');
   qLocal.Sql.Add('     ( BAI_CODIGO,    ');
   qLocal.Sql.Add('       BAI_DESCRICAO) ');
   qLocal.Sql.Add('VALUES                ');
   qLocal.Sql.Add('     (:BAI_CODIGO,    ');
   qLocal.Sql.Add('      :BAI_DESCRICAO) ');
   qLocal.ParamByName('BAI_CODIGO'   ).AsString := vProximoBAI_CODIGO;
   qLocal.ParamByName('BAI_DESCRICAO').AsString := xBairro;
   qLocal.ExecSql;
   qlocal.Free;

   pBairro.Text:=vProximoBAI_CODIGO;

   Result := True;
end;

function SelectZona(pZona:String;pZonaDescricao:Tedit):Boolean;
var qLocal : tFDQuery;
begin
   Result := True;
   pZonaDescricao.Text := '';
   if pZona = '' then
   begin
      exit;
   end;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   result := false;
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT ZON_DESCRICAO           ');
   qLocal.sql.add('  FROM ZONA_ZON              ');
   qLocal.sql.add(' WHERE ZON_CODIGO = :ZON_CODIGO');
   qLocal.ParamByName('ZON_CODIGO').AsString := pZona;
   qLocal.Open;
   if qLocal.Eof then
   begin
     qlocal.Free;
     exit;
   end;
   pZonaDescricao.Text := qlocal.FieldByName('ZON_DESCRICAO').AsString;
   qlocal.Free;
   Result := True;
end;

function SelectRegiao(pRegiao:String;pRegiaoDescricao:Tedit):Boolean;
var qLocal : tFDQuery;
begin
   Result := True;
   pRegiaoDescricao.Text := '';
   if pRegiao = '' then
   begin
      exit;
   end;
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   result := false;
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT REG_DESCRICAO           ');
   qLocal.sql.add('  FROM REGIAO_REG              ');
   qLocal.sql.add(' WHERE REG_CODIGO = :REG_CODIGO');
   qLocal.ParamByName('REG_CODIGO').AsString := pRegiao;
   qLocal.Open;
   if qLocal.Eof then
   begin
     qlocal.Free;
     exit;
   end;
   pRegiaoDescricao.Text := qlocal.FieldByName('REG_DESCRICAO').AsString;
   qlocal.Free;
   Result := True;
end;

function fCNPJValido(pCNPJ:TEdit): Boolean;
begin
   result := true;
   if trim(pCNPJ.Text) = '' then
      exit;
   pCNPJ.Text :=Trim(pCNPJ.Text);
   result := frmValidadorDeDocumentos.CNPJ_Valido(pCNPJ.Text);
   if result then
      pCNPJ.Text := vVDD_DocumentoFormatado;
end;

function fCPFValido(pCPF:TEdit): Boolean;
begin
   result := true;
   if trim(pCPF.Text) = '' then
      exit;
   pCPF.Text :=Trim(pCPF.Text);
   result := frmValidadorDeDocumentos.CPF_Valido(pCPF.Text);
   if result then
      pCPF.Text := vVDD_DocumentoFormatado;
end;

function TelValido(pTel:TEdit): Boolean;
var vAntes:String;
begin
   if trim(pTel.Text) = '' then
   begin
      result:=true;
      exit;
   end;
   result := false;
   vAntes:=pTel.Text;
   pTel.Text := frmValidadorDeDocumentos.formataTelCel(pTel.Text);
   if pTel.Text = '' then
   begin
       pTel.Text := vAntes;
       exit;
   end;
   Result := True;
end;

function FormataFones(pNumero:String):String;
 begin
   result := frmValidadorDeDocumentos.formataTelCel(pNumero);
 end;

function CadastraBairro(pNomeBairro:String):String;
var qLocal : TFDQuery;
    vProximoBAI_CODIGO:String;
begin
   Result := '';
   pNomeBairro := Trim(pNomeBairro);
   if pNomeBairro = '' then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT BAI_CODIGO              ');
   qLocal.sql.add('  FROM BAIRRO_BAI              ');
   qLocal.sql.add(' WHERE BAI_DESCRICAO = :BAI_DESCRICAO');
   qLocal.ParamByName('BAI_DESCRICAO').AsString := pNomeBairro;
   qLocal.Open;
   if not qLocal.Eof then
   begin
     result := qLocal.FieldByName('BAI_CODIGO').AsString;
     qlocal.Free;
     exit;
   end;

   vProximoBAI_CODIGO := ProximoBAI_CODIGO;
   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('INSERT INTO BAIRRO_BAI');
   qLocal.Sql.Add('     ( BAI_CODIGO,    ');
   qLocal.Sql.Add('       BAI_DESCRICAO) ');
   qLocal.Sql.Add('VALUES                ');
   qLocal.Sql.Add('     (:BAI_CODIGO,    ');
   qLocal.Sql.Add('      :BAI_DESCRICAO) ');
   qLocal.ParamByName('BAI_CODIGO'   ).AsString := vProximoBAI_CODIGO;
   qLocal.ParamByName('BAI_DESCRICAO').AsString := pNomeBairro;
   qLocal.ExecSql;
   qlocal.Free;
   result := vProximoBAI_CODIGO;
end;

Function CadastrarMunicipio(pCidade,pUF:String):String;
var qLocal : TFDQuery;
    vProximoCID_CODIGO:String;
begin
   Result := '';
   pCidade := Trim(pCidade);
   pUF     := Trim(pUF);
   if (pCidade = '') or
      (pUF     = '') then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CID_CODIGO          ');
   qLocal.sql.add('  FROM CIDADE_CID, UF_UF   ');
   qLocal.sql.add(' WHERE UF_CODIGO = CID_UF  ');
   qLocal.sql.add('   AND CID_NOME = :CID_NOME');
   qLocal.sql.add('   AND UF_SIGLA = :UF_SIGLA');
   qLocal.ParamByName('CID_NOME').AsString := pCidade;
   qLocal.ParamByName('UF_SIGLA').AsString := pUF;
   qLocal.Open;
   if not qLocal.Eof then
   begin
     result := qLocal.FieldByName('CID_CODIGO').AsString;
     qlocal.Free;
     exit;
   end;

   Avisos.Avisar('Município ' + pCidade + '/'+pUF+' não cadastrados no IBGE');
   {
   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('INSERT INTO BAIRRO_BAI');
   qLocal.Sql.Add('     ( BAI_CODIGO,    ');
   qLocal.Sql.Add('       BAI_DESCRICAO) ');
   qLocal.Sql.Add('VALUES                ');
   qLocal.Sql.Add('     (:BAI_CODIGO,    ');
   qLocal.Sql.Add('      :BAI_DESCRICAO) ');
   qLocal.ParamByName('BAI_CODIGO'   ).AsString := vProximoBAI_CODIGO;
   qLocal.ParamByName('BAI_DESCRICAO').AsString := pNomeBairro;
   qLocal.ExecSql;
   }
   qlocal.Free;
   result := '';
end;

Function RetiraExcessoDeEspacos(pFrase:String):String;
var i, Tamanho : integer;
    vFraseSemExcessoDeEspacos:String;
begin
   Tamanho := length(pFrase);
   vFraseSemExcessoDeEspacos:='';
   i := 0;
   while i < Tamanho do
   begin
     if pFrase[i]=#0 then
     begin
        inc(i);
        continue;
     end;
     vFraseSemExcessoDeEspacos:=vFraseSemExcessoDeEspacos+pFrase[i];
     if pFrase[i] = ' ' then
     begin
       While (i < Tamanho   ) and
           (pFrase[i]= ' ') do
           inc(i);
     end
     else
       inc(i);
   end;
   result := vFraseSemExcessoDeEspacos;
end;

Function fNomeDoSistema:String;
begin
   Result := 'SMC Plus';
end;

function PesquisarCadastro(pTabela:String;pFiltro,pDescricao:TEdit):Boolean;
begin
   result:=False;
   pDescricao.Text := '';

   frm_PesquisaF1_T16 := Tfrm_PesquisaF1_T16.Create(nil);
   frm_PesquisaF1_T16.Caption := fCaption(pTabela);
   vfrm_PesquisaF1_T16Tabela := pTabela;
   frm_PesquisaF1_T16.ShowModal;
   if vfrm_PesquisaF1_T16 <> '' then
   begin
      pFiltro.Text    := frm_PesquisaF1_T16.qLocal.FieldByName('CODIGO').AsString;
      pDescricao.Text := frm_PesquisaF1_T16.qLocal.FieldByName('DESCRICAO').AsString;
      result          := true;
   end;
   frm_PesquisaF1_T16.Free;
end;

function fPesquisarAtividade(pCodigo,pDescricao:TEdit):Boolean;
begin
   result := PesquisarCadastro('RAMOATIVIDADE_RAMO',pCodigo,pDescricao);
end;

function fPesquisarBairro(pCodigo,pDescricao:TEdit):Boolean;
begin
   result := PesquisarCadastro('BAIRRO_BAI',pCodigo,pDescricao);
end;

function fPesquisarRegiao(pCodigo,pDescricao:TEdit):Boolean;
begin
   result := PesquisarCadastro('REGIAO_REG',pCodigo,pDescricao);
end;

function fPesquisarZona(pCodigo,pDescricao:TEdit):Boolean;
begin
   result := PesquisarCadastro('ZONA_ZON',pCodigo,pDescricao);
end;

function fCaption(pTabela:String):String;
begin
        if  pTabela = 'ZONA_ZON'           then result := 'Cadastro | Zona'
  else  if  pTabela = 'REGIAO_REG'         then result := 'Cadastro | Região'
  else  if  pTabela = 'BAIRRO_BAI'         then result := 'Cadastro | Bairro'
  else  if  pTabela = 'RAMOATIVIDADE_RAMO' then result := 'Cadastro | Atividade'

  else  result := '';
end;

// END.

{ TPesquisaF1 }

function TPesquisaF1.Chaves: String;
begin
        if  FTabela = 'ZONA_ZON'           then result := 'ZON_CODIGO'
  else  if  FTabela = 'REGIAO_REG'         then result := 'REG_CODIGO'
  else  if  FTabela = 'BAIRRO_BAI'         then result := 'BAI_CODIGO'
  else  if  FTabela = 'RAMOATIVIDADE_RAMO' then result := 'RAMO_CODIGO'
  else  result := '';
end;

function TPesquisaF1.Codigos: String;
begin
        if  FTabela = 'ZONA_ZON'           then result := 'ZON_CODIGO'
  else  if  FTabela = 'REGIAO_REG'         then result := 'REG_CODIGO'
  else  if  FTabela = 'BAIRRO_BAI'         then result := 'BAI_CODIGO'
  else  if  FTabela = 'RAMOATIVIDADE_RAMO' then result := 'RAMO_CODIGO'
  else  result := '';
end;

constructor TPesquisaF1.Create;
begin
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
end;

function TPesquisaF1.Descricoes: String;
begin
        if  FTabela = 'ZONA_ZON'           then result := 'ZON_DESCRICAO'
  else  if  FTabela = 'REGIAO_REG'         then result := 'REG_DESCRICAO'
  else  if  FTabela = 'BAIRRO_BAI'         then result := 'BAI_DESCRICAO'
  else  if  FTabela = 'RAMOATIVIDADE_RAMO' then result := 'RAMO_DESCRICAO'
  else  result := '';
end;

destructor TPesquisaF1.Destroy;
begin
   qLocal.Free;
  inherited;
end;

function TPesquisaF1.Existe: Boolean;
begin
   FTipoPesquisa := _PESQUISA_CHAVE;
   result := Pesquisar(qLocal);
end;

function TPesquisaF1.Existe(pQueryExterna: TFDQuery): Boolean;
begin
   result := Pesquisar(pQueryExterna);
end;

function TPesquisaF1.ExisteCodigo(pTabela, pFiltro: String): Boolean;
begin
   FTabela       := pTabela;
   FFiltro       := UpperCase(Trim(pFiltro));
   FChave        := Chaves;
   FTipoPesquisa :=_PESQUISA_CHAVE;
   Result        := Existe;
end;

function TPesquisaF1.ExisteDescricao(pTabela, pFiltro: String;pQueryExterna:TFDQuery): Boolean;
begin
   FTabela       := pTabela;
   FFiltro       := UpperCase(Trim(pFiltro));
   FChave        := Descricoes;
   FDescricao    := Descricoes;
   FTipoPesquisa :=_PESQUISA_DESCRICAO;
   Result        := Existe(pQueryExterna);
end;

function TPesquisaF1.getCodigo: String;
begin
   Result := FCodigo;
end;

function TPesquisaF1.getFDescricao: String;
begin
   result := FDescricao;
end;

function TPesquisaF1.Gravar: Boolean;
var vNovaDescricao:String;
begin
   result := false;
   vNovaDescricao:=FDescricao;
   if ExisteCodigo(FTabela, FCodigo)then
   begin
      FDescricao:=vNovaDescricao;
      result := Update
   end
   else
   begin
      FDescricao:=vNovaDescricao;
      result := Insert;
   end;
end;

function TPesquisaF1.Insert: Boolean;
var vCampoChave,
    vCampoDescricao:String;
begin
   vCampoChave    := Codigos;
   vCampoDescricao:= Descricoes;

   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('INSERT INTO ' + FTabela      );
   qLocal.Sql.Add('     ( '+ vCampoChave +','   );
   qLocal.Sql.Add('       '+ vCampoDescricao+')');
   qLocal.Sql.Add('VALUES                      ');
   qLocal.Sql.Add('     (:CODIGO,              ');
   qLocal.Sql.Add('      :DESCRICAO)           ');
   qLocal.ParamByName('CODIGO'   ).AsString := FCodigo;
   qLocal.ParamByName('DESCRICAO').AsString := FDescricao;
   qLocal.ExecSql;
end;

function TPesquisaF1.Pesquisar(pQuery:TFDQuery): Boolean;
begin
   pQuery.Close;
   pQuery.SQL.Clear;
   pQuery.Sql.Add('SELECT '+ Codigos    + ' AS CODIGO,   ');
   pQuery.Sql.Add(           Descricoes + ' AS DESCRICAO ');
   pQuery.Sql.Add('  FROM ' + FTabela                     );
   case FTipoPesquisa of
      _PESQUISA_DESCRICAO:
      begin
         if FFiltro <> '' then
         begin
            pQuery.Sql.Add(' WHERE ' + FChave + ' LIKE :ARGUMENTO');
            pQuery.ParamByName('ARGUMENTO').AsString := '%'+FFiltro+'%';
         end;
         pQuery.Sql.Add(' ORDER BY ' + FChave);
      end;
      _PESQUISA_CHAVE:
      begin
         pQuery.Sql.Add(' WHERE ' + FChave     + ' = :ARGUMENTO1');
//         pQuery.Sql.Add('    OR ' + Descricoes + ' = :ARGUMENTO2');
         pQuery.ParamByName('ARGUMENTO1').AsString := FFiltro;
//         pQuery.ParamByName('ARGUMENTO2').AsString := FDescricao;
      end;
   end;
   pQuery.Open;
   if not pQuery.eof then
      if FTipoPesquisa = _PESQUISA_CHAVE then
             FDescricao  := pQuery.FieldByName('DESCRICAO').AsString;

   Result := not pQuery.Eof;
end;

function TPesquisaF1.ProcuraDescricao(pTabela, pFiltro: String;
  pQueryExterna: TFDQuery): Boolean;
begin
   FTabela       := pTabela;
   FFiltro       := UpperCase(Trim(pFiltro));
   FChave        := Descricoes;
   FDescricao    := Descricoes;
   FTipoPesquisa :=_PESQUISA_CHAVE;
   Result        := Existe(pQueryExterna);
end;

function TPesquisaF1.ProximoCODIGO: String;
begin
        if FTabela = 'ZONA_ZON'           then result := ProximoZON_CODIGO
   else if FTabela = 'REGIAO_REG'         then result := ProximoREG_CODIGO
   else if FTabela = 'BAIRRO_BAI'         then result := ProximoBAI_CODIGO
   else if FTabela = 'RAMOATIVIDADE_RAMO' then result := ProximoRAMO_CODIGO
   else
   begin
      Log('Funcoes','TPesquisaF1.ProximoCODIGO: Defina Proximo'+FTabela);
      Avisos.Avisar('TPesquisaF1.ProximoCODIGO: Defina Proximo'+FTabela);
      result := '';
   end;
end;

procedure TPesquisaF1.SetCodigo(const Value: String);
begin
   if trim(Value) = '' then
      FCodigo := ProximoCODIGO
   else
      FCodigo := Value;
end;

procedure TPesquisaF1.setFDescricao(const Value: String);
begin
   FDescricao := Copy(Value,1,50);
end;

function TPesquisaF1.Update: Boolean;
var vCampoChave,
    vCampoDescricao:String;
begin
   try
    vCampoChave    := Codigos;
    vCampoDescricao:= Descricoes;

     qLocal.Close;
     qLocal.SQL.Clear;
     qLocal.Sql.Add('UPDATE ' + FTabela);
     qLocal.Sql.Add('   SET ' + vCampoDescricao  + ' = :DESCRICAO');
     qLocal.Sql.Add(' WHERE ' + vCampoChave      + ' = :CODIGO   ');
     qLocal.ParamByName('CODIGO'   ).AsString := FCodigo;
     qLocal.ParamByName('DESCRICAO').AsString := FDescricao;
     qLocal.ExecSql;
     Result := True;
   except
     Result := False;
   end;
end;

function Existe_Outro_CONTADOR_Com_Este_CPF(pCPF,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pCPF = '' then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CONT_CODIGO, CONT_NOME_FANTASIA         ');
   qLocal.sql.add('  FROM CONTADOR_CONT, CONTADOR_DETALHE_CONTD ');
   qLocal.sql.add(' WHERE CONTD_CODIGO = CONT_CODIGO              ');
   qLocal.sql.add('   AND CONT_CODIGO  <> :CONT_CODIGO            ');
   qLocal.sql.add('   AND CONTD_CPF    =  :CONTD_CPF              ');
   qLocal.ParamByName('CONT_CODIGO').AsString := pCliente;
   qLocal.ParamByName('CONTD_CPF'  ).AsString := SoNumeros(pCPF);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.CPF_existente(qLocal.FieldByName('CONT_NOME_FANTASIA').AsString,
                        qLocal.FieldByName('CONT_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_CONTADOR_Com_Este_CNPJ(pCNPJ,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pCNPJ = '' then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CONT_CODIGO,                       ');
   qLocal.sql.add('       CONT_NOME_FANTASIA,                ');
   qLocal.sql.add('       CONT_RAZAO_SOCIAL                  ');
   qLocal.sql.add('  FROM CONTADOR_CONT, CONTADOR_DETALHE_CONTD ');
   qLocal.sql.add(' WHERE CONTD_CODIGO = CONT_CODIGO          ');
   qLocal.sql.add('   AND CONT_CODIGO  <> :CONT_CODIGO        ');
   qLocal.sql.add('   AND CONTD_CNPJ   =  :CONTD_CNPJ         ');
   qLocal.ParamByName('CONT_CODIGO').AsString := pCliente;
   qLocal.ParamByName('CONTD_CNPJ' ).AsString := SoNumeros(pCNPJ);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.CNPJ_existente(qLocal.FieldByName('CONT_NOME_FANTASIA').AsString,
                         qLocal.FieldByName('CONT_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_CONTADOR_Com_Esta_IE(pIE,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pIE = ''       then exit;
   if pIE = 'ISENTO' then exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CONT_CODIGO, CONT_NOME_FANTASIA     ');
   qLocal.sql.add('  FROM CONTADOR_CONT, CONTADOR_DETALHE_CONTD ');
   qLocal.sql.add(' WHERE CONTD_CODIGO = CONT_CODIGO          ');
   qLocal.sql.add('   AND CONT_CODIGO  <> :CONT_CODIGO        ');
   qLocal.sql.add('   AND CONTD_IE     =  :CONTD_IE           ');
   qLocal.ParamByName('CONT_CODIGO').AsString := pCliente;
   qLocal.ParamByName('CONTD_IE'   ).AsString := SoNumerosOuISENTO(pIE);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.ie_existente(qLocal.FieldByName('CONT_NOME_FANTASIA').AsString,
                       qLocal.FieldByName('CONT_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function Existe_Outro_CONTADOR_Com_Este_RG(pRG,pCliente:String):Boolean;
var qLocal : TFDQuery;
begin
   Result := False;
   if pRG = ''       then exit;
   if pRG = 'ISENTO' then exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT CONT_CODIGO, CONT_NOME_FANTASIA     ');
   qLocal.sql.add('  FROM CONTADOR_CONT, CONTADOR_DETALHE_CONTD ');
   qLocal.sql.add(' WHERE CONTD_CODIGO = CONT_CODIGO          ');
   qLocal.sql.add('   AND CONT_CODIGO  <> :CONT_CODIGO        ');
   qLocal.sql.add('   AND CONTD_RG     =  :CONTD_RG           ');
   qLocal.ParamByName('CONT_CODIGO').AsString := pCliente;
   qLocal.ParamByName('CONTD_RG'   ).AsString := SoNumerosOuISENTO(pRG);
   qLocal.Open;
   if qLocal.eof then
   begin
      qLocal.Free;
      exit;
   end;
   Avisos.rg_existente(qLocal.FieldByName('CONT_NOME_FANTASIA').AsString,
                       qLocal.FieldByName('CONT_CODIGO').AsString);
   qLocal.Free;
   result := true;
end;

function UsuarioMASTER:Boolean;
begin
  result := (Usuario.Codigo = 'MASTER');
end;

procedure AcessoExclusivoMaster;
begin
  Avisos.Avisar('Acesso exclusivo do MASTER.');
end;

procedure SalvaDadosDaTela(Tela:TObject);
var xNome, xValor:String;
    i, item : integer;
begin
   // Recebe uma tela e salva o conteuo de todos os seus
   // edits, maskedits, radiogroup
   //---------------------------------------------
   for i := 0 to (Tela as tForm).ComponentCount - 1 Do
   begin
     xNome:='';
     // Edits
     if ((Tela as tForm).Components[i] is tEdit) then
     begin
        xNome  := ((Tela as tForm).Components[i] as tEdit).Name;
        xValor := ((Tela as tForm).Components[i] as tEdit).Text;
     end;
     // MaskEdits
     if ((Tela as tForm).Components[i] is tMaskEdit) then
     begin
        xNome  := ((Tela as tForm).Components[i] as tMaskEdit).Name;
        xValor := ((Tela as tForm).Components[i] as tMaskEdit).Text;
     end;
     // RadioGroups
     if ((Tela as tForm).Components[i] is tRadioGroup) then
     begin
        xNome  := ((Tela as tForm).Components[i] as tRadioGroup).Caption;
        item   := ((Tela as tForm).Components[i] as tRadioGroup).ItemIndex;
        if item = -1 then
           xValor := 'Não informado'
        else
           xValor := ((Tela as tForm).Components[i] as tRadioGroup).Items[item];
     end;
     // Checkboxes
     if ((Tela as tForm).Components[i] is TCheckbox) then
     begin
        xNome  := ((Tela as tForm).Components[i] as TCheckbox).Caption;
        if ((Tela as tForm).Components[i] as TCheckbox).Checked then
           xValor := 'Marcado'
        else
           xValor := 'Desmarcado';
     end;

     if xNome <> '' then
        Salvar_DadosDaTela((Tela as tForm).Name,xNome,xValor);
   end;
end;

procedure Salvar_DadosDaTela(pTela,pNome,pValor:String);
begin
  // Salva um registro de dado da tela
  DM.Query1.Close;
  DM.Query1.Sql.Clear;
  DM.Query1.Sql.Add('INSERT INTO DADOSTELA_DT');
  DM.Query1.Sql.Add('    ( DT_USUARIO,       ');
  DM.Query1.Sql.Add('      DT_ESTACAO,       ');
  DM.Query1.Sql.Add('      DT_TELA,          ');
  DM.Query1.Sql.Add('      DT_NOME,          ');
  DM.Query1.Sql.Add('      DT_VALOR)         ');
  DM.Query1.Sql.Add('VALUES                  ');
  DM.Query1.Sql.Add('    (:DT_USUARIO,       ');
  DM.Query1.Sql.Add('     :DT_ESTACAO,       ');
  DM.Query1.Sql.Add('     :DT_TELA,          ');
  DM.Query1.Sql.Add('     :DT_NOME,          ');
  DM.Query1.Sql.Add('     :DT_VALOR)         ');
  DM.Query1.ParamByName('DT_USUARIO').AsString := Usuario.Codigo;
  DM.Query1.ParamByName('DT_ESTACAO').AsString := NomeComputador;
  DM.Query1.ParamByName('DT_NOME'   ).AsString := pNome;
  DM.Query1.ParamByName('DT_VALOR'  ).AsString := pValor;
  DM.Query1.ParamByName('DT_TELA'   ).AsString := pTela;
  DM.Query1.ExecSql;
end;

procedure ComparaDadosDaTela(pFrase:String;pTela:Tobject);
var xNome, xValor, xNomeDaTela:String;
    i : integer;
begin
   xNomeDaTela := (pTela as tForm).Name;

   for i := 0 to (pTela as tForm).ComponentCount - 1 Do
   begin
     xNome:='';
     // Edits
     if ((pTela as tForm).Components[i] is tEdit) then
     begin
        xNome  := ((pTela as tForm).Components[i] as tEdit).Name;
        xValor := ((pTela as tForm).Components[i] as tEdit).Text;
     end;
     // MaskEdits
     if ((pTela as tForm).Components[i] is tMaskEdit) then
     begin
        xNome  := ((pTela as tForm).Components[i] as tMaskEdit).Name;
        xValor := ((pTela as tForm).Components[i] as tMaskEdit).Text;
     end;
     // RadioGroups
     if ((pTela as tForm).Components[i] is tRadioGroup) then
     begin
        xNome  := ((pTela as tForm).Components[i] as tRadioGroup).Name;
        xValor := IntToStr(((pTela as tForm).Components[i] as tRadioGroup).ItemIndex);
     end;
     // Checkboxes
     if ((pTela as tForm).Components[i] is TCheckbox) then
     begin
        xNome  := ((pTela as tForm).Components[i] as TCheckbox).Name;
        if ((pTela as tForm).Components[i] as TCheckbox).Checked then
           xValor := 'Marcado'
        else
           xValor := 'Desmarcado';
     end;

     VerificaSeMudouDadoDaTela(pFrase,xNomeDaTela,xNome,xValor)
   end;
   ApagaRegistroDeDadosDaTela(xNomeDaTela);
end;

procedure VerificaSeMudouDadoDaTela(pFrase,pTela,pNome,pValor:String);
var vValorAntesDeAlterar:String;
begin
  DM.Query1.Close;
  DM.Query1.Sql.Clear;
  DM.Query1.Sql.Add('SELECT DT_VALOR                 ');
  DM.Query1.Sql.Add('  FROM DADOSTELA_DT             ');
  DM.Query1.Sql.Add(' WHERE DT_USUARIO = :DT_USUARIO ');
  DM.Query1.Sql.Add('   AND DT_ESTACAO = :DT_ESTACAO ');
  DM.Query1.Sql.Add('   AND DT_TELA    = :DT_TELA    ');
  DM.Query1.Sql.Add('   AND DT_NOME    = :DT_NOME    ');
  DM.Query1.ParamByName('DT_USUARIO').AsString := Usuario.Codigo;
  DM.Query1.ParamByName('DT_ESTACAO').AsString := NomeComputador;
  DM.Query1.ParamByName('DT_NOME'   ).AsString := pNome;
  DM.Query1.ParamByName('DT_TELA'   ).AsString := pTela;
  DM.Query1.Open;
  if DM.Query1.eof then
     exit;

  vValorAntesDeAlterar := DM.Query1.FieldByName('DT_VALOR').AsString;
  if vValorAntesDeAlterar  = pValor then
     exit;

  // Houve mudancas - registrar
  if Trim(vValorAntesDeAlterar) = '' then
     vValorAntesDeAlterar := '(vazio)';

  if Trim(pValor) = '' then
     pValor := '(vazio)';

  Log(pTela,'Alterou '+pFrase+ ', '+pNome + ' de ' + vValorAntesDeAlterar
             + ' para ' + pValor +'( '+pTela+' )');
end;

procedure ApagaRegistroDeDadosDaTela(pTela:String);
begin
  // Apaga os registros de controle contendo os dados da tela
  DM.Query1.Close;
  DM.Query1.Sql.Clear;
  DM.Query1.Sql.Add('DELETE FROM DADOSTELA_DT        ');
  DM.Query1.Sql.Add(' WHERE DT_USUARIO = :DT_USUARIO ');
  DM.Query1.Sql.Add('   AND DT_ESTACAO = :DT_ESTACAO ');
  DM.Query1.Sql.Add('   AND DT_TELA    = :DT_TELA    ');
  DM.Query1.ParamByName('DT_USUARIO').AsString := Usuario.Codigo;
  DM.Query1.ParamByName('DT_ESTACAO').AsString := NomeComputador;
  DM.Query1.ParamByName('DT_TELA'   ).AsString := pTela;
  DM.Query1.ExecSql;
end;


end.

{
8: Coloca(’ [BACKSPACE] ‘);
9: Coloca(’ [TAB] ‘);
12: Coloca(’ [ALT] ‘);
13: Coloca(’ [ENTER] ‘);
16: Coloca(’ [SHIFT] ‘);
17: Coloca(’ [CONTROL] ‘);
18: Coloca(’ [ALT] ‘);
20: Coloca(’ [CAPS LOCK] ‘);
21: Coloca(’ [PAGE UP] ‘);
27: Coloca(’ [ESC] ‘);
33: Coloca(’ [PAGE UP] ‘);
34: Coloca(’ [PAGE DOWN] ‘);
35: Coloca(’ [END] ‘);
36: Coloca(’ [HOME] ‘);
37: Coloca(’ [SETA ESQUERDA] ‘);
38: Coloca(’ [SETA ACIMA] ‘);
39: Coloca(’ [SETA DIREITA] ‘);
40: Coloca(’ [SETA ABAIXO] ‘);
45: Coloca(’ [INSERT] ‘);
46: Coloca(’ [DEL] ‘);
91: Coloca(’ [WIN ESQUERDA] ‘);
92: Coloca(’ [WIN DIREITA] ‘);
93: Coloca(’ [MENU POP-UP] ‘);
96: Coloca(’0&8242;);
97: Coloca(’1&8242;);
98: Coloca(’2&8242;);
99: Coloca(’3&8242;);
100: Coloca(’4&8242;);
101: Coloca(’5&8242;);
102: Coloca(’6&8242;);
103: Coloca(’7&8242;);
104: Coloca(’8&8242;);
105: Coloca(’9&8242;);
106: Coloca(’ [NUM *] ‘);
107: Coloca(’ [NUM +] ‘);
109: Coloca(’ [NUM -] ‘);
110: Coloca(’ [NUM SEP. DECIMAL] ‘);
111: Coloca(’ [NUM /] ‘);
112: Coloca(’ [F1] ‘);
113: Coloca(’ [F2] ‘);
114: Coloca(’ [F3] ‘);
115: Coloca(’ [F4] ‘);
116: Coloca(’ [F5] ‘);
117: Coloca(’ [F6] ‘);
118: Coloca(’ [F7] ‘);
119: Coloca(’ [F8] ‘);
120: Coloca(’ [F9] ‘);
121: Coloca(’ [F10] ‘);
122: Coloca(’ [F11] ‘);
123: Coloca(’ [F12] ‘);
144: Coloca(’ [NUM LOCK] ‘);
186: Coloca(’Ç’);
187: Coloca(’=´);
188: Coloca(’,´);
189: Coloca(’-´);
190: Coloca(’.´);
191: Coloca(’;´);
192: Coloca(’ [APÓSTROFO] ‘);
193: Coloca(’/´);
194: Coloca(’ [NUM PONTO] ‘);
219: Coloca(’´’);
220: Coloca(’]´);
221: Coloca(’[´);
222: Coloca(’~´);
226: Coloca(’\´);
}
