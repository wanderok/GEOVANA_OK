{ v 15.10.16 11:18 }
unit u_funcoes;
{
================================================================================
|   DATA   |DESENVOLVEDOR|HISTORICO DA ALTERACAO DO CODIGO                     |
|----------|-------------|-----------------------------------------------------|
|20/02/2020|WANDER       |Transportadas para esta unit todas as fun��es que    |
|          |             |haviam sido desenvolvidas para o projeto que iria    |
|          |             |substituir este. Encontram-se reunidas em um mesmo   |
|        01|             |local no corpo desta unit.                           |
|----------|-------------|-----------------------------------------------------|
|21/02/2020|WANDER       |Criada a function UsuarioMASTER que retorna true se o|
|        04|             |usu�rio logado � o MASTER e false em caso contr�rio. |
|----------|-------------|-----------------------------------------------------|
|21/02/2020|WANDER       |A vari�vel "public_Usuario_Logado" passou a se chamar|
|        05|             |Global_Usuario_Logado seguindo o padr�o j� existente.|
|----------|-------------|-----------------------------------------------------|
|22/02/2020|WANDER       |Criada a fun��o Float_to_String para padronizar a    |
|        23|             |formata��o e o tratamento de convers�es de valores   |
|          |             |do tipo real para string formatada 9.999,99          |
|----------|-------------|-----------------------------------------------------|
|27/02/2020|WANDER       |Criada a fun��o fnatureza_operacaoDESCRICAO          |
|        44|             |que recebe o ID de uma Natureza de Opera��o e retorna|
|          |             |sua descri��o, se houver, e vazio se n�o houver.     |
|----------|-------------|-----------------------------------------------------|
|27/02/2020|WANDER       |Criada a fun��o fColaboradorNOME que recebe o codigo |
|        47|             |de um Colaborador e retorna seu nome, se houver, e   |
|          |             |vazio se n�o houver.                                 |
================================================================================
| ITEM|DATA  HR|DESENVOLVEDOR/UNIT  |HISTORICO                                 |
|-----|--------|--------------------|------------------------------------------|
|  127|11/05/20|wander              |Criada vari�vel Global_Filial_Em_Uso      |
|     |   15:09|u_funcoes           |para controlar a Filial ativa (em uso)    |
|-----|--------|--------------------|------------------------------------------|
|  130|11/05/20|wander              |A fun��o RegistraLog passou a criar a     |
|     |   19:12|u_funcoes           |coluna LOG_EMPRESA na taleba LOG_LOG      |
|     |        |                    |caso n�o exista. Esta coluna armazenar� o |
|     |        |                    |luna O C�DIGO                             |
|-----|--------|--------------------|------------------------------------------|
|  131|11/05/20|wander              |A fun��o RegistraLog passoua salvar o c�d.|
|     |   19:22|u_funcoes           |da empresa associada ao evento (log)      |
|     |        |                    |Coluna LOG_EMPRESA                        |
|-----|--------|--------------------|------------------------------------------|
|  132|13/05/20|wander              |Criada a fun��o PossuiFiliais que retorna |
|     |   10:28|u_funcoes           |TRUE se h� mais de uma empresa cadastrada |
|     |        |                    |no SMC, e FALSE se n�o                    |
================================================================================
}
interface

uses
  VCL.Forms, VCL.Dialogs, VCL.StdCtrls, cxCheckBox,
  FireDAC.Comp.Client, frxClass, Winapi.Windows, System.SysUtils,
  VCL.DBCtrls, VCL.Graphics, VCL.ComCtrls, cxButtons, dxBar,
  VCL.DBGrids, VCL.Grids, System.Classes, Data.DB,
  cxDropDownEdit, VCL.mask, IdGlobal,
  IdText, IdAttachmentFile, DateUtils,
  IdMessage, IniFiles,
  WinInet,

  IdSSLOpenSSL, IdSMTP, IdBaseComponent,
  IdExplicitTLSClientServerBase, Winapi.ShellAPI, System.IOUtils, cxmemo,
  cxcalendar, System.Variants,
  StrUtils, TlHelp32, extCtrls, cxDBEdit,
  cxGridCustomTableView, cxGraphics, VCL.controls, System.math,
  U_ConfNFCE, spdNFCeType, erro, System.Types,
  IdTCPConnection, IdRawBase,
  IdIcmpClient, Winsock, relatorios, xmlintf,
  IdHTTP, xmldoc, h_Files, h_functions, S_Module, h_net, registry,

  Bde.DBTables;

// Constantes do sistema
const
   _Cor_ReadOnly        : tColor = clSilver;
   _Cor_CampoObrigatorio: tColor = $00E6E6E6;

//##############################################################################
//                    FUNCOES DESENVOLVIDAS PELO WANDER
//##############################################################################
//Retorna a descri��o do tipo de movimento se existir. Se n�o existir retorna vazio
function fTPMOV_DESCRICAO(pTPMOV_CODIGO:String):String;
//Verifica se � filiais cadastradas no sistema
Function PossuiFiliais:Boolean;
//Retorna o nome da Empresa/Filial
function DescricaoEmpresa(pEMP_CODIGO:String):String;
//Verifica se uma empresa existe
function ExisteEmpresa(pEMP_CODIGO:String):Boolean;
//Cria a o cad da empresa matriz
procedure Criar_Empresa_Matriz;
//Retorna o pr�ximo c�digo de Cliente
function ProximoClienteCODIGO:Integer;
//Recebe uma data e a devolve no formato string ou vazio se a data for inv�lida
function DataValida(pData:TDateTime):String;
//Recebe o c�digo de uma Regi�o e retorna sua Descri��o
function DescricaoREGIAO(pCodigo:String):String;
//recebe uma string e a retorna sem acentos
Function fTiraAcentos(pFraseComAcentos:String):String;
//Recebe uma sigla de UF e verifica se existe.
function UfInvalida(UF:String):Boolean;
//Recebe um codigo de Colaborador e retorna seu nome
function NomeColaborador(pCodigo:String):String;
//Recebe um codigo de Cliente e um Evento e registra no Hist�rico
procedure Registrar_Historico_Bloqueios(pCliente:Integer;pEvento:String);
//Recebe um codigo de Ramo de Ativiadde retorna sua descricao
function DescricaoCAD_RAMO_ATIVIDADE(pCODIGO:String):String;
//Retorna o pr�ximo c�digo sequencial para um produto novo
function ProximoProdutoCODIGO:Integer;
//Retorna o pr�ximo c�digo sequencial para uma nova regi�o
function ProximoREG_CODIGO:Integer;
//Recebe um codigo de centro de custos e retorna sua classificacao e descricao
function DescricaoCentroDeCustos(pCentroDeCusto:Integer):String;
//Recebe um codigo de conta cont�bil e retorna sua classificacao e descricao
function DescricaoPlanoDeContas(pContaContabil:Integer):String;
//Recebe o c�digo de uma unidade de medida e retorna seu nome
function NomeUND(pCodigo:Integer):String;
//Elimina endere�os sem a RUA informada
Procedure LimpaEnderecos;
//Recebe a sigla de uma Municipio e retorna seu codigo IBGE
function CodigoMunicipio(pMunicipio,pUF:String):String;
//Recebe a sigra de uma UF e retorna seu codigo IBGE
function CodigoUF(pUF:String):String;
// Recebe uma string e retona vazio se for uma sequencia de asteriscos '***'
// ou a retorna, se nao for
function SemAsteriscos(pString:String):String;
// recebe uma data e a retorna no formato AAMM
function DataAAMM(pData:TDateTime):String;
// Cria tabela auxiliar de venda
procedure Criar_Tabela_Temporaria_de_Venda(pTabela:String);
// Destroi tabela auxiliar de venda
procedure Destruir_Tabela_Temporaria_de_Venda(pTabela:String);

// verifica se uma tabela existe no banco de dados
function Existe_Tabela(pNomeTabela:String):Boolean;
// Sobrecarrega funcao ApenasLetras para receber e retornar strings
function ApenasLetras(pFrase: String): String; Overload;
// Retorna a data do servidor com string
function sDataServidor:String;
procedure ApagaRegistroDeDadosDaTela(pTela:String);
// Apaga os registros de controle contendo os dados da tela
procedure ComparaDadosDaTela(pFrase:String;pTela:Tobject);
// Compara os dados da tela atual com o salvo antes (anterior)
procedure VerificaSeMudouDadoDaTela(pFrase,pTela,pNome,pValor:String);
// Compara os dados da tela atual com o salvo antes (anterior)
procedure SalvaDadosDaTela(Tela:TObject);
// Salva todos os campos da tela
procedure Salvar_DadosDaTela(pTela,pNome,pValor:String);
// salva um registro de campo da tela
function UsuarioMASTER_SenhaCorreta(pUsuario,pSenha:String):Boolean;
// retorna true se a senah do usu�rio est� correta e retorna false se incorreta
function UsuarioMASTER:Boolean;
// retorna true se o usu�rio logado � o MASTER e false em caso contr�rio
function TemAcesso(pUsuario,pFuncao:string):Boolean;
// verificar se o usu�rio tem acesso a determinado recurso/funcionalidade do sistema
procedure RegistraLog(pEvento:String);
// Registra um evento do sistema
function DataServidor:tDatetime;
//  retorna a data do servidor para nao usar a data da esta��o
function HoraServidor:String;
//  retorna a Hora do servidor para nao usar a data da esta��o
procedure Executar(pTexto:String);
// executa scripts no banco de dados
function Cripto(Texto: String): String;
// Criptografa Texto
function DesCripto(Texto: String): String;
// Descriptografa Texto
function ValorAsc(Letra: String): Byte;
// retorna o valor ASC de Letra
function NaoAtualizado(pInformacao:String) : Boolean;
// Verifica se determinado script (pInformacao) ja foi aplicado ao banco de dados
Function NomeComputador : String;
// retorna o nome da estacao
procedure UsuarioLogou;
// Seta o usuario como "logado"
procedure UsuarioDeslogou;
// Seta o usuario como "deslogado"
procedure AcessoExclusivoMaster;
// Exibe mensagem padr�o : "Acesso exclusivo do suporte..."
function fUltimaNFe(pNFe_SeRIE:String):integer;
// Retorna o �ltimo n�mero de NFe emitida nesta s�rie
function Float_to_String(pValor:real):String;
// Recebe um valor num�rico ponto flutuante e devolve em string formatada 9.999,99
Function ProximaNotaFiscal(pSerie:Integer):Integer;
// Retorna o pr�ximo c�digo sequencial do tipo de movimento
function ProxTPMOV:String;
// Retorna o pr�ximo n�mero de NFe
function SoNumeros(numero:string):Integer;
// Recebe uma string contendo um n�mero formatado (mask) e retorna um inteiro
// Limpa a m�scara...
function SoNumerosX(numero:string):String;
// Recebe uma string contendo um n�mero formatado (mask) e retorna uma string
// Limpa a m�scara...
Function Zeros(Frase: String; Comprimento:Integer) : String;
// Recebe uma string e seu comprimento e preenche com Zeros a esquerda at� completar
function masctostr(numero:string):string;
// recebe uma string formatada e a retorna sem formata��o
procedure RecalculaSaldoEstoque(pProduto:String;pData:TdateTime);
// Recebe o ID de uma natureza de opera��o e retorna sua descri��o, se existir
function fnatureza_operacaoDESCRICAO(pID:Integer):String;
// Recebe o Codigo de um Colaborador e retorna seu nome, se existir
function fColaboradorNOME(pCodigo:Integer):String;
// Valida CNPJ
function  CHEK_CGC(var_cgc:string):boolean;
// Valida CPF
function  CHEK_CPF(var_cpf:string):boolean;

//##############################################################################
//                FIM DAS FUNCOES DESENVOLVIDAS PELO WANDER
//##############################################################################

procedure AlteraChecks(CheckMarcado: TcxCheckBox; ChecksDesmarcar: array of TcxCheckBox);
{ Procedimento para desmarcar checks quando apenas um estiver selecionado nas consultas. }

procedure MarcaChecks(CheckMarcado: TcxCheckBox; ChecksDesmarcar: array of TcxCheckBox);
{ Procedimento para desmarcar checks quando apenas um estiver selecionado nas consultas. }

function ConsultarCadastros(Consulta: TFDQuery; Texto, Tabela, Coluna, Parametro, Status, TipoItem, CampoTipoItem: String; dataInicio, dataFim: TDate): String;
{ Procedimento para consultar dado informado pelo usu�rio nas telas de cadastro. }

procedure ConsultarNCM_CFOP_CSOSN(Consulta: TFDQuery; Texto, Tabela, Coluna, Parametro: String);
{ Procedimento para consultar CSOSN, CEST E NCM. }

function VerificaAberta(Referencia: TForm): boolean;
{ Fun��o para verificar se a janela requisitada j� est� aberta. }

function ListarTodosCadastros(Consulta: TFDQuery; Tabela: String): String;
{ Procedimento para consultar todos os cadastros e preencher no grid das telas de consulta. }

procedure ImprimirGridConsulta(ConsultaRelatorio, ConsultaGrid: TFDQuery; Relatorio: TfrxReport; CaminhoRelatorio: String);
{ Procedimento para imprimir um relat�rio apenas com os dados do grid da consultas. }

function colorirestoque(value: String; estoque_minimo: extended): Integer;

function ApenasLetras(Tecla: Char): Char; overload;
{ Fun��o para permitir preenchimento de um campo apenas com letras. }

function ApenasNumeros(Tecla: Char): Char; overload;
function ApenasNumeros(Tecla: Char; arr_keys: array of Char): Char; overload;
{ Fun��o para permitir preenchimento de um campo apenas com n�meros. }

function isKeyNumLetter(Tecla: Word): boolean;
function NumLetter(Tecla: Char): Char; overload;
function NumLetter(Tecla: Char; remove_chars: array of Char): Char; overload;
{ Fun��o para permitir preenchimento de um campo apenas com n�meros. }

function isKeyControl(Tecla: Word): boolean;
{ Fun��o para verificar se tecla digitada � uma tecla de controle }

function ContarQuantidadeCaracteres(Edit: TDBEdit; Key: Char; NomeCampo: String; QtdCaracteres: Integer): Char;
{ Procedimento para contar a quantidade de caracteres em um campo e limitar os mesmos. }

function CamposObrigatorios(ArrayDbEdit: array of TDBEdit; NomeCamposDBEdit: array of String; ArrayDbLookup: array of TDBLookupComboBox;
  NomeCamposDBLookup: array of String; ArraycxComboBox: array of TcxComboBox; NomeComboBox: array of String): boolean; overload;

function CamposObrigatorios(ArrayEdit: array of TEdit; NomeCamposEdit: array of String): boolean; overload;

function CamposObrigatorios(ArrayDbEdit: array of TDBEdit; NomeCamposDBEdit: array of String; ArraycxDateEdit: array of TCxDateEdit;
  NomeCamposcxDateEdit: array of String): boolean; overload;

function CamposObrigatorios(ArrayDbEdit: array of TDBEdit; NomeCamposDBEdit: array of String; ArrayEdit: array of TEdit; NomeCamposEdit: array of String)
  : boolean; overload;

function CamposObrigatorios(ArraycxDBTextEdit: array of TcxDBTextEdit; NomeCamposcxDBTextEdit: array of string;
  ArraycxDBCurrencyedit: array of TcxDBCurrencyEdit; NomeCamposcxDBCurrencyEdit: Array of string): boolean; overload;

function CamposObrigatorios(ArrayDbEdit: array of TDBEdit; NomeCamposDBEdit: array of String; ArrayDbLookup: array of TDBLookupComboBox;
  NomeCamposDBLookup: array of String; ArraycxComboBox: array of TcxComboBox; NomeComboBox: array of String; ArrayMaskEdit: array of TMaskEdit;
  NomeCamposTMaskEdit: array of String): boolean; overload;

procedure CamposObrigatorios_CorPadrao(ArrayDbEdit: array of TDBEdit; ArrayDbLookup: array of TDBLookupComboBox;
  ArraycxComboBox: array of TcxComboBox); overload;
{ Procedimento para voltar a cor padr�o dos campos. }

procedure CamposObrigatorios_CorPadrao(ArrayEdit: array of TEdit; ArrayDbEdit: array of TDBEdit); overload;

procedure CamposObrigatorios_CorPadrao(ArrayDbEdit: array of TDBEdit; ArrayDbLookup: array of TDBLookupComboBox; ArraycxComboBox: array of TcxComboBox;
  ArrayMaskEdit: array of TMaskEdit); overload;

procedure CamposObrigatorios_CorPadrao(ArrayDbEdit: array of TDBEdit; ArraycxDateEdit: array of TCxDateEdit); overload;
{ Procedimento para voltar a cor padr�o dos campos. }

function RemoverCaracteresEspeciais(Texto: String; const substituir: string = ''): String;
{ Procedimento para retirar caracteres especiais. }

function RemoverQuebraLinhas(Texto: String): String;
{ Procedimento para retirar caracteres breaklines. }

function RemoverUTF8(Texto: String): String;
{ Procedimento para retirar caracteres breaklines. }

procedure CamposOpcionais(ArrayDbEdit: array of TDBEdit; ArrayNomeCampos: array of string);
{ Procedimento para informar mensagem de finaliza��o do cadastro e preenchimento dos campos opcionais caso necess�rio. }

procedure AlterarEnabled(xObject: array of tcontrol; Enabled: boolean);
{ Procedimento para habilitar ou n�o a edi��o dos campos quando preenchidos ap�s consulta no grid. }

procedure AlterarVisible(xObject: array of tcontrol; Visible: boolean);

procedure AlterarReadOnly(xObject: array of TEdit; Read: boolean);
{ Procedimento para habilitar ou n�o a visibilidade dos campos quando preenchidos ap�s consulta no grid. }

procedure LimparCampos(ArrayEdit: array of TEdit);
{ Procedimento para limpar um rol de edits. }

function VerificaEstadoCheck(ArrayCheckBox: array of TcxCheckBox; EstadoDesejado: boolean): boolean;
{ Procedimento para verificar os estados de checks. }

procedure AlteraDBChecks(ChecksDesmarcar:  TDBCheckBox; CheckMarcado: array of TDBCheckBox
);
{ Procedimento para desmarcar checks quando apenas um estiver selecionado em um cadastro }

procedure TeclasAtalho(Key: Word; ArrayKey: array of Integer; ArrayBotoes: array of TcxButton);
{ Procedimento para criar teclas de atalho }

procedure Principal_TeclasAtalho(Key: Word; ArrayKey: array of Integer; ArrayBotoes: array of tdxbarlargebutton);
{ Procedimento para criar teclas de atalho no form principal }

procedure IniciarCadastro(ArrayBotoes: array of TcxButton; IniciaCadastro: boolean);
{ Prodecure para alterar comportamento dos botoes no momento do cadastro }

procedure ValidarIE(IE: TDBEdit);
{ Prodecure para validar entrada de dados nos campos de Inscri��o }

function IsNumber(Texto: String): boolean;
{ Fun��o para verificar se um dado � do tipo num�rico }

procedure ExcluirCadastro(Consulta: TFDQuery; DesativarQuery: boolean = true);
{ Procedimento para excluir um cadastro }

function RemoverEspacoEmBranco(Texto: String; const substituir: string = ''): String;
{ Procedimento para remover espa�o em branco }

function DuplicarCadastro(CADASTRO: TFDQuery; Tabela, Codigo: String): Integer;
{ Procedimento para duplicar cadastros com popmenu nos grids }

function ValidarCpf(CPF_Text: string): boolean;
{ Fun��o para validar CPF nos cadastros }

function ValidarCnpj(xCNPJ: String): boolean;
{ Fun��o para validar CNPJ nos cadastros }

procedure ConsultarCPF(Consulta: TFDQuery; Texto: TDBEdit; Tabela, Coluna, Parametro: String);
{ Fun��o para verificar se CPF j� est� cadastrado no sistema }

procedure ConsultarCNPJ(Consulta: TFDQuery; Texto: TDBEdit; Tabela, Coluna, Parametro: String);
{ Fun��o para verificar se CNPJ j� est� cadastrado no sistema }

function TrocaVirgPPto(Valor: string): String;
{ Fun��o para trocar virgula por ponto em string }

function FormatarQuantidadeKG(edt_quantidade: TEdit; Key: Char): Char;
{ Fun��o para formatar o campo de quantidade com 0,000 para unidade em KG }

procedure ZerarValorDigitado;
{ Procedure para zerar valor da variavel interna }

procedure GridZebrado(GRID: TDBGRID; Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState); overload;
procedure GridZebrado(ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo); overload;
{ Procedure zebrar as cores do grid }

function obterNroResultado(const aXML, aTag, aEndTag: string): string;
{ Fun��o obter resultado da tag da xml }

procedure MoverXML(CaminhoOrigem, CaminhoDestino: String);
{ Procedure para mover os arquivos xmls para suas pastas }

procedure AppendFile(Caminho, Texto: String; Position: Integer = 0);
{ Procedure para escrever no final de um arquivo }

procedure DeletarXMLPendente(CaminhoOrigem: string);
{ Procedure para mover os arquivos xmls para suas pastas }

procedure ColorirStatusGrid(GRID: TDBGRID; Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState; Cor: Array of Integer;
  ValorPreencher: array of String; ValorBanco: TStringField); overload;
procedure ColorirStatusGrid(GRID: TDBGRID; Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState; Colors: array of Integer;
  value_to_fill: array of variant; value_to_compare: extended); overload;
{ Fun��o para colorir os valores dos dados no preenchimento do grid }

procedure MostrarBarraLateralGrid(GRID: TDBGRID; VERTICAL, HORIZONTAL: boolean);
{ Sempre mostrar barra lateral Grid }

function MonthToDBMonth(Dia, Mes: String): string;
{ Formatar mes para mes do banco }

procedure CamposEditaveis(ArrayEdit: array of TEdit; IniciaEdicao: boolean);
{ Procedure para destacar os campos editaveis na tela de nfe }

function ColorByStatus(value: variant; ArrValues: array of variant; ArrColors: array of Integer): Integer;
{ Function para destacar os campos pelo status }

function FormatarTag(Tag: extended; const ReturnMethod: Word = varString): variant;
{ Fun��o para formatar tag antes de passar para o dataset da NFCE - Formato: 9999,00 }
function FormatarTagDescricao(xDesc: string): string;

function DoublePathBar(pathdir: String): String;
{ function that return path with double bar sliced separated }

procedure CNPJCPF(Field: TMaskEdit); overload;
procedure CNPJCPF(Field: TDBEdit); overload;
function Format_CPF_CNPJ(value: string): string;
{ Procedure to assign a maks value to a field according to his kind, if cnpj or cpf }

procedure WnAlerta(Titulo, Mensagem: String); overload;
procedure WnAlerta(Titulo, Mensagem: String; Font: Integer); overload;
procedure WnAlerta(Titulo, Mensagem: String; Align: TAlignment; Font: Integer); overload;
{ Janela de Alerta }
procedure WnErro(Titulo, Mensagem: String); overload;
procedure WnErro(Titulo, Mensagem: String; Align: TAlignment; Font: Integer); overload;
{ Janela de Erro }
procedure WnInfo(Titulo, Mensagem: String); overload;
procedure WnInfo(Titulo, Mensagem: String; Align: TAlignment; Font: Integer); overload;
procedure WnInfo(Titulo, Mensagem: String; Align: TAlignment; Font, Timer: Integer); overload;

{ Janela de Informa��o }
function WnConfirmacao(Titulo, Mensagem: String): boolean; overload;
function WnConfirmacao(Titulo, Mensagem: String; Font: Integer): boolean; overload;
{ Janela de Confirma��o }

function EnDecryptString(StrValue: String; Chave: Word): String; overload;

function hexaToInt(s: string): Int64;

procedure EnviarArquivosFiscais;
{ Enviar arquivos fiscais }

function Calcdata(Partner: String): string;

function SimpleQuery(query: String; Conn: TfdConnection = nil): TFDQuery; overload;
function SimpleQuery(query: String; arr_params: array of variant; Conn: TfdConnection = nil): TFDQuery; overload;

function ExecQuery(query: String; Conn: TfdConnection = nil): TFDQuery; overload;
function ExecQuery(query: String; arr_params: array of variant; Conn: TfdConnection = nil): TFDQuery; overload;

function ZeroLeft(strx: string; qtde: Integer): string;

function AutoComplete(Edit: TEdit; MiniQuery: string; FieldIndex: Integer): TFDQuery;

function LimitOccurences(const StringValue: string; const CharToFind: Char; CountOcurr: Integer; Key: Char): Char;

function Arredondar(const value: extended): extended;
function Arredonda(Value: Extended; Decimals: Integer): Extended;

function FindCharInStr(const Str: string; const Char: string): Integer;

function MachineName: string;

procedure RestartAPP;

function getAllowUpdate: boolean;

procedure ExecuteCommand(xComand: String; const SW_STATE: Integer = SW_HIDE);

function UserName: string;

procedure ManWorking;

procedure MovimentarEstoque(Remover: boolean; CodigoVenda: String);

procedure MovimentarCaixa;

procedure SaveToFile(const FileName, Content: string);

function FormatarMoeda(const value: extended; const ResultType: Integer = 256): variant;

procedure FormatTelefone(const Edt: TMaskEdit);

function SearchFiles(Dir, Pattern: string): TArray<string>;

function getSerialKey: string;

function getNomeFantasia(const NotFoundDef: string = 'EMPRESA N�O CADASTRADA'): string;

function formataData(s: TDateTime): string;

function LoadContent(FromFile: string): string;

function SelectFile(CurrentDir: string = 'C:\'; Filters: string = ''): string;

function CalcularDescontos(Cod_Venda: string; cod_item: string; var desconto_base: extended; var reatear_diff_desconto: boolean): extended;

function CalcularAcrescimos(Cod_Venda: string; cod_item: string; var acrescimo_base: extended; var reatear_diff_acrescimo: boolean): extended;

function formatarqtde(qtde: extended): string;

procedure VencimentoCertificado;

function clickOnTittle(GRID: TDBGRID): boolean;
{ Verificar se no duplo click do grid o cursor est� no cabe�alho das colunas }

function ping(const _Host: string): boolean;

function camelCase(const Word: string): string;

function Extenso(Valor: extended): string;

procedure DragAndDrop(var Sender, Source: tObject);

procedure ConsultarCep(const CEP: string; var edt_uf, edt_cidade, edt_rua, edt_bairro: string);

procedure ConsultarCep1(const CEP: string; var edt_uf, edt_cidade, edt_bairro: string);

function ExistsNetwork: Boolean;

function NumeroTerminal: integer;

procedure LimparCamposDB(ArrayEdit: array of TDBEdit);

{$R+}

var
  Global_Usuario_Logado:String; // Wander : User Name do usu�rio logado
  Global_Filial_Em_Uso :String; // Wander : C�digo (ID) da Filial em uso (ativa)

implementation

uses carregando_dados, alerta, confirmacao, informacao, u_diretorios,
  desenvolvimento, v_Env, v_Dir, h_DB, c_Globals;

const
   _constante_VersaoDoSistema = '1.00';

var
  ValorDigitado: String;
  GlobalTimerSet: Cardinal;


procedure ZerarValorDigitado;
begin
  ValorDigitado := '';
end;

function TrocaVirgPPto(Valor: string): String;
begin
  if Valor <> '' then
  begin
    Valor := StringReplace(Valor, ',', '.', [RFREPLACEALL]);
  end;
  result := Valor;
end;

procedure WnAlerta(Titulo, Mensagem: String);
begin
  TFunctions.write_log(Titulo + ':' + Mensagem);
  frm_alerta := tfrm_alerta.Create(nil);
  frm_alerta.Titulo(Titulo);
  frm_alerta.Mensagem(Mensagem);
  frm_alerta.ShowModal;
  frm_alerta.Free;
end;

function UserName: string;
begin
  result := GetEnvironmentVariable('USERNAME');
end;

procedure ManWorking;
begin
  if not VerificaAberta(FMR_desenvolvimento) then
  begin
    FMR_desenvolvimento := TFMR_desenvolvimento.Create(Application);
    FMR_desenvolvimento.ShowModal;
  end;
end;

procedure MovimentarEstoque(Remover: boolean; CodigoVenda: String);
{ Se o argumento "Remover" for true, retira a quantidade dos itens vendidos para o estoque, caso contr�rio, retorna as quantidades para o estoque }
var
  qry_temp, qry_temp_aux: TFDQuery;
  I, qtderecords: Integer;
begin
  with qry_temp_aux do
  begin
    qry_temp_aux := TFDQuery.Create(nil);
    connection := module.connection;
    Close;
    sql.Clear;
  end;
  with qry_temp do
  begin
    qry_temp := TFDQuery.Create(nil);
    connection := module.connection;
    sql.Add('SELECT * FROM VENDA_ITEM WHERE CODIGO_VENDA = ' + quotedstr(CodigoVenda));
    open;
    FetchAll;
    qtderecords := RecordCount;
    for I := 1 to qtderecords do
    begin
      qry_temp_aux.Close;
      qry_temp_aux.sql.Clear;
      qry_temp_aux.sql.Add('SELECT CODIGO,SALDO FROM PRODUTO WHERE CODIGO = ' + quotedstr(FieldByName('CODIGO_PRODUTO').value));
      qry_temp_aux.open;
      qry_temp_aux.Edit;
      if Remover then
      begin
        qry_temp_aux.FieldByName('SALDO').value := qry_temp_aux.FieldByName('SALDO').value - FieldByName('QUANTIDADE').value { Retirar do estoque }
      end
      else
        qry_temp_aux.FieldByName('SALDO').value := qry_temp_aux.FieldByName('SALDO').value + FieldByName('QUANTIDADE').value;
      { Retornar estoque }
      qry_temp_aux.POST;
      Next;
    end;
  end;
  qry_temp_aux.destroy;
  qry_temp.destroy;
end;

procedure MovimentarCaixa;
begin
  { TODO -oPaulo Barros -cFinanceiro : Definir Estrutura da movimentan��o, centro de custos, tipos de movimentos e etc }

end;

procedure SaveToFile(const FileName, Content: string);
var
  xxFile: tstringList;
begin
  xxFile := tstringList.Create;
  xxFile.Text := Content;
  xxFile.SaveToFile(FileName);
  xxFile.Free;
end;

procedure FormatTelefone(const Edt: TMaskEdit);
var
  tel: string;
  tamanho: Integer;
begin
  tel := RemoverEspacoEmBranco(RemoverCaracteresEspeciais(Edt.Text));
  tamanho := length(tel);
  if (tamanho = 8) then { 8 digitos sem 69 }
    Edt.EditMask := '!\(\6\9\) 9999-9999;1'
  else if (tamanho = 9) then { 9 digitos sem 69 }
    Edt.EditMask := '!\(\6\9\) 99999-9999;1';
  if (tamanho = 10) then { 8 digitos }
    Edt.EditMask := '!\(99\) 9999-9999;1'
  else if (tamanho = 11) then { 9 digitos }
    Edt.EditMask := '!\(99\) 99999-9999;1';
end;

function FormatarMoeda(const value: extended; const ResultType: Integer = 256): variant;
begin
  if FloatToStr(value) = '0' then
    result := TFunctions.IfThen(ResultType, [varString, vardouble], ['R$ 0,00', 0])
  else
    result := TFunctions.IfThen(ResultType, [varString, vardouble], ['R$ ' + FORMATFLOAT('###,##0.00', value),
      TFunctions.replace(FORMATFLOAT('###,##0.00', value), '.', vardouble)]);
end;

procedure WnAlerta(Titulo, Mensagem: String; Align: TAlignment; Font: Integer);
begin
  TFunctions.write_log(Titulo + ':' + Mensagem);
  frm_alerta := tfrm_alerta.Create(nil);
  frm_alerta.Titulo(Titulo);
  frm_alerta.memo_texto.Properties.Alignment := Align;
  frm_alerta.memo_texto.Style.Font.Size := Font;
  frm_alerta.Mensagem(Mensagem);
  frm_alerta.ShowModal;
  frm_alerta.Free;
end;

procedure WnAlerta(Titulo, Mensagem: String; Font: Integer); overload;
begin
  TFunctions.write_log(Titulo + ':' + Mensagem);
  frm_alerta := tfrm_alerta.Create(nil);
  frm_alerta.Titulo(Titulo);
  frm_alerta.memo_texto.Style.Font.Size := Font;
  frm_alerta.Mensagem(Mensagem);
  frm_alerta.ShowModal;
  frm_alerta.Free;
end;

function MachineName: string;
begin
  result := GetEnvironmentVariable('COMPUTERNAME');
end;

procedure RestartAPP;
var
  comand: String;
begin
  ExecuteCommand('schtasks /delete /tn "SMC_LIGHT" /F', SW_HIDE);
  ExecuteCommand('schtasks /delete /tn "DELETE_SMC_LIGHT" /F', SW_HIDE);
  ExecuteCommand('schtasks /create /tn "SMC_LIGHT" /tr ' + pathexe + 'SMC_LIGHT.exe /sc once /sd ' + formatdatetime('dd/mm/yyyy', date) + ' /st ' +
    formatdatetime('HH:mm:ss', incsecond(now, 40)) + ' /F', SW_HIDE);
  ExecuteCommand('schtasks /create /tn "DELETE_SMC_LIGHT" /tr "schtasks /delete /tn "SMC_LIGHT" /F" /sc once /sd ' + formatdatetime('dd/mm/yyyy ', date) +
    ' /st ' + formatdatetime('HH:mm:ss ', incminute(now, 01)) + ' /F', SW_HIDE);
  Application.Terminate;
end;

procedure ExecuteCommand(xComand: String; const SW_STATE: Integer = SW_HIDE);
var
  SHE: SHELLEXECUTEINFO;
begin
  FillChar(SHE, SizeOf(SHE), 0);
  SHE.cbSize := SizeOf(SHE);
  SHE.fMask := See_Mask_NoCloseProcess;
  SHE.Wnd := 0;
  SHE.lpVerb := pChar('open');
  SHE.lpFile := pChar('cmd');
  SHE.lpParameters := pChar('/C ' + xComand);
  SHE.nShow := SW_STATE;
  ShellExecuteEx(@SHE);
  WaitForSingleObject(SHE.hProcess, Infinite);
end;

function getAllowUpdate: boolean;
var
  ini: TIniFile;
begin
  try
    if FileExists(confini) then
    begin
      ini := TIniFile.Create(confini);
      result := ('s' = ini.readString('atualizacao', 'atualiza', 'n')) or ('S' = ini.readString('atualizacao', 'atualiza', 'n'));
    end;
  finally
    ini.Free;
  end;
end;

function WnConfirmacao(Titulo, Mensagem: String): boolean;
var
  int: Integer;
begin
  frm_confirmacao := tfrm_confirmacao.Create(nil);
  frm_confirmacao.limpar;
  frm_confirmacao.Titulo(Titulo);
  frm_confirmacao.Mensagem(Mensagem);
  int := frm_confirmacao.ShowModal;
  frm_confirmacao.Free;
  if int = 1 then { sim }
    result := true
  else if int = 2 then { n�o }
    result := false
  else
    result := false;
end;

function WnConfirmacao(Titulo, Mensagem: String; Font: Integer): boolean;
var
  int: Integer;
begin
  frm_confirmacao := tfrm_confirmacao.Create(nil);
  frm_confirmacao.limpar;
  frm_confirmacao.Titulo(Titulo);
  frm_confirmacao.memo_texto.Style.Font.Size := Font;
  frm_confirmacao.Mensagem(Mensagem);
  int := frm_confirmacao.ShowModal;
  frm_confirmacao.Free;
  if int = 1 then { sim }
    result := true
  else if int = 2 then { n�o }
    result := false;
end;

function EnDecryptString(StrValue: String; Chave: Word): String;
var
  I: Integer;
  OutValue: String;
begin
  OutValue := '';
  for I := 1 to length(StrValue) do
    OutValue := OutValue + Char(Not(ord(StrValue[I]) - Chave));
  result := OutValue;
end;

function hexaToInt(s: string): Int64;
begin
  if (s <> '') and (s[1] <> '$') then
    result := strToInt64('$' + s)
  else
    result := strToInt64(s);
end;

procedure WnInfo(Titulo, Mensagem: String);
begin
  frm_informacao := tfrm_informacao.Create(nil);
  frm_informacao.Titulo(Titulo);
  frm_informacao.Mensagem(Mensagem);
  frm_informacao.ShowModal;
  frm_informacao.Free;
end;

procedure WnInfo(Titulo, Mensagem: String; Align: TAlignment; Font: Integer);
begin
  frm_informacao := tfrm_informacao.Create(nil);
  frm_informacao.Titulo(Titulo);
  frm_informacao.Mensagem(Mensagem);
  frm_informacao.memo_texto.Properties.Alignment := Align;
  frm_informacao.memo_texto.Style.Font.Size := Font;
  frm_informacao.ShowModal;
  frm_informacao.Free;
end;

procedure WnInfo(Titulo, Mensagem: String; Align: TAlignment; Font, Timer: Integer);
begin
  frm_informacao := tfrm_informacao.Create(nil);
  frm_informacao.Titulo(Titulo);
  frm_informacao.Mensagem(Mensagem);
  frm_informacao.memo_texto.Properties.Alignment := Align;
  frm_informacao.memo_texto.Style.Font.Size := Font;
  frm_informacao.Timer := Timer;
  frm_informacao.ShowModal;
  frm_informacao.Free;
end;

procedure WnErro(Titulo, Mensagem: String);
begin
  TFunctions.write_log(Titulo + ':' + Mensagem);
  frm_erro := tfrm_erro.Create(nil);
  frm_erro.Titulo(Titulo);
  frm_erro.Mensagem(Mensagem);
  frm_erro.ShowModal;
  frm_erro.Free;
end;

procedure WnErro(Titulo, Mensagem: String; Align: TAlignment; Font: Integer);
begin
  TFunctions.write_log(Titulo + ':' + Mensagem);
  frm_erro := tfrm_erro.Create(nil);
  frm_erro.Titulo(Titulo);
  frm_erro.memo_texto.Properties.Alignment := Align;
  frm_erro.memo_texto.Style.Font.Size := Font;
  frm_erro.Mensagem(Mensagem);
  frm_erro.ShowModal;
  frm_erro.Free;
end;

function DoublePathBar(pathdir: String): String;
begin
  result := StringReplace(pathdir, '\', '\\', [RFREPLACEALL]);
end;

procedure AlteraChecks(CheckMarcado: TcxCheckBox; ChecksDesmarcar: array of TcxCheckBox);

var
  I: Integer;
begin
  for I := Low(ChecksDesmarcar) to High(ChecksDesmarcar) do
    if CheckMarcado.Checked then
      ChecksDesmarcar[I].Checked := false;
end;


procedure MarcaChecks(CheckMarcado: TcxCheckBox; ChecksDesmarcar: array of TcxCheckBox);

var
  I: Integer;
begin
  for I := Low(ChecksDesmarcar) to High(ChecksDesmarcar) do
    if CheckMarcado.Checked then
      ChecksDesmarcar[I].Checked := true;
end;


procedure AlteraDBChecks(ChecksDesmarcar:  TDBCheckBox; CheckMarcado: array of TDBCheckBox);

var
  I: Integer;
begin
  for I := Low(CheckMarcado) to High(CheckMarcado) do
    if ChecksDesmarcar.Checked then
      CheckMarcado[I].Checked := true;
end;

function ConsultarCadastros(Consulta: TFDQuery; Texto, Tabela, Coluna, Parametro, Status, TipoItem, CampoTipoItem: String; dataInicio, dataFim: TDate): String;

var
  m_dataInicio, m_dataFim, qry: string;
begin
  with Consulta do
  begin
    Close;
    sql.Clear;
    qry := 'SELECT * FROM ' + Tabela;
    if Coluna <> '' then
    begin
      qry := qry + ' WHERE ' + Coluna + ' LIKE ' + Texto;
    end;
    if (dataInicio <> 0) and (dataFim <> 0) then
    begin
      m_dataInicio := quotedstr(formatdatetime('yyyy/mm/dd', dataInicio));
      m_dataFim := quotedstr(formatdatetime('yyyy/mm/dd', dataFim));
      qry := qry + ' AND data_cadastro between ' + m_dataInicio + ' AND ' + m_dataFim;
    end;
    if Status <> '' then
    begin
      Status := quotedstr(TipoItem);
      qry := qry + ' AND status_cadastral LIKE ' + Status;
    end;
    if TipoItem <> '' then
    begin
      TipoItem := quotedstr(TipoItem);
      qry := qry + (' AND ' + CampoTipoItem + ' LIKE ' + TipoItem);
    end;
    sql.Add(qry);
    open;
    result := inttostr(RecordCount);
  end;
end;

procedure ConsultarNCM_CFOP_CSOSN(Consulta: TFDQuery; Texto, Tabela, Coluna, Parametro: String);
begin
  with Consulta do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM ' + Tabela);
    sql.Add(' WHERE ' + Coluna + ' LIKE :' + Parametro);
    params[0].value := '%' + Texto + '%';
    open;
  end;
end;

function ListarTodosCadastros(Consulta: TFDQuery; Tabela: String): String;
begin
  with Consulta do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM ' + Tabela);
    sql.Add('ORDER BY codigo LIMIT 100');
    open;
    Consulta.FetchAll;
    result := inttostr(RecordCount);
  end;
end;

function VerificaAberta(Referencia: TForm): boolean;
var
  I: Word;
begin
  result := false;

  for I := 0 to Screen.FormCount - 1 do
    if Screen.Forms[I] = Referencia then
    begin
      if (Referencia.Enabled = true) and (Referencia.Visible = true) then
        Referencia.SetFocus;
      result := true;
      Break;
    end;
end;

procedure ImprimirGridConsulta(ConsultaRelatorio, ConsultaGrid: TFDQuery; Relatorio: TfrxReport; CaminhoRelatorio: String);

var
  sql_anterior: String;
begin
  with ConsultaRelatorio do
  begin
    Close;
    sql_anterior := ConsultaRelatorio.sql.Text;
    sql.Clear;
    sql.Text := ConsultaGrid.sql.Text;
    params := ConsultaGrid.params;
    open;
  end;
  with Relatorio do
  begin
    Relatorio.LoadFromFile(CaminhoRelatorio, true);
    Relatorio.ShowReport(true);
  end;

  with ConsultaRelatorio do
  begin
    Close;
    sql.Clear;
    sql.Text := sql_anterior;
    params.Clear;
    open;
  end;
end;

function colorirestoque(value: String; estoque_minimo: extended): Integer;
var
  sEstoque: extended;
begin
  if value <> emptystr then
  begin
    sEstoque := strtofloat(value);
    result := ColorByStatus(sEstoque, [0, IfThen(estoque_minimo = 0, 10, estoque_minimo)], [clWebRed, clWebDarkOrange, clWebDarkgreen])
  end
  else
    result := clWhite;
end;

function ApenasLetras(Tecla: Char): Char;
begin
  if not(Tecla in ['a' .. 'z', 'A' .. 'Z', Char(8), Char(3), Char(22), Char(32), Char(24), Char(127)]) then
    result := #0
  else
    result := Tecla;
  { Char(3) = Ctrl C
    Char(8) = BackSpace
    Char(22) = Ctrl V
    Char(24) = Ctrl X
    Char(127) = Del }
end;

function ApenasLetras(pFrase: String): String;
var vLetra : Char;
    vFrase : String;
    i      : integer;
begin
    // recebe uma frase e a retorna sem espacos
    vFrase := '';
    for i := 1 to length(pFrase) do
    begin
        vLetra := pFrase[i]; // Copy(pFrase,i,1);
        vLetra := ApenasLetras(vLetra);
        if vLetra <> '' then
           vFrase := vFrase + vLetra;
    end;
    result := vFrase;
end;

function ApenasNumeros(Tecla: Char): Char;
begin
  if not(Tecla in ['0' .. '9', Char(3), Char(8), Char(22), Char(24), Char(44), Char(127)]) then
    result := #0
  else
    result := Tecla;
  { Char(3) = Ctrl C
    Char(8) = BackSpace
    Char(22) = Ctrl V
    Char(24) = Ctrl X
    Char(44) = ,
    Char(127) = Del }
end;

function ApenasNumeros(Tecla: Char; arr_keys: array of Char): Char; overload;
var
  ch: Char;
begin
  result := #0;
  if not(Tecla in ['0' .. '9', Char(3), Char(8), Char(22), Char(24), Char(44), Char(127)]) then
  begin
    for ch in arr_keys do
      if ch = Tecla then
      begin
        result := Tecla;
        exit;
      end;
  end
  else
    result := Tecla;
  { Char(3) = Ctrl C
    Char(8) = BackSpace
    Char(22) = Ctrl V
    Char(24) = Ctrl X
    Char(44) = ,
    Char(127) = Del }
end;

function isKeyNumLetter(Tecla: Word): boolean;
begin
  if Tecla in [Word('0') .. Word('9'), Word('a') .. Word('z'), Word('A') .. Word('Z'), Word(VK_BACK), Word(VK_DELETE)] then
    result := true
  else
    result := false;
end;

function NumLetter(Tecla: Char): Char;
begin
  if Tecla in [Char('0') .. Char('9'), Char('a') .. Char('z'), Char('A') .. Char('Z'), Char(VK_BACK), Char(VK_DELETE), Char(VK_SPACE)] then
    result := Tecla
  else
    result := #0;
end;

function NumLetter(Tecla: Char; remove_chars: array of Char): Char;
var
  I: Integer;
begin
  Tecla := NumLetter(Tecla);
  for I := Low(remove_chars) to High(remove_chars) do
    result := TFunctions.IfThen(Tecla = Char(remove_chars[I]), #0, Tecla);
end;

function isKeyControl(Tecla: Word): boolean;
begin
  if Tecla in [VK_CONTROL, VK_SHIFT, VK_MENU, VK_F1 .. VK_F12, VK_DELETE, VK_BACK] then
    result := true
  else
    result := false;
end;

function ContarQuantidadeCaracteres(Edit: TDBEdit; Key: Char; NomeCampo: String; QtdCaracteres: Integer): Char;

var
  MensagemAviso: String;
begin
  MensagemAviso := 'Campo ' + quotedstr(NomeCampo) + ' n�o deve ter mais do que ' + inttostr(QtdCaracteres) +
    ' caracteres (contando com os espa�os em branco).';
  if length(Edit.Text) > (QtdCaracteres - 1) then
  begin
    WnAlerta('Quantidade de Caracteres', MensagemAviso);
    result := #0;
    Edit.Text := copy(Edit.Text, 0, length(Edit.Text) - 1);
    Edit.SetFocus;
    Edit.SelectAll;
  end
  else
    result := Key;
end;

function CamposObrigatorios(ArrayDbEdit: array of TDBEdit; NomeCamposDBEdit: array of String; ArrayDbLookup: array of TDBLookupComboBox;
  NomeCamposDBLookup: array of String; ArraycxComboBox: array of TcxComboBox; NomeComboBox: array of String): boolean;

var
  I: Integer;
  msg_campos, msg_final: String;
begin
  for I := 0 to length(ArrayDbEdit) - 1 do { Verifica��o apenas para dbedits }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArrayDbEdit[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposDBEdit[I];
      ArrayDbEdit[I].Color := clMoneyGreen;
    end
    else
      ArrayDbEdit[I].Color := clWhite;
  end;

  for I := 0 to length(ArrayDbLookup) - 1 do { Verifica��o apenas para dblookup }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArrayDbLookup[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposDBLookup[I];
      ArrayDbLookup[I].Color := clMoneyGreen;
    end
    else
      ArrayDbLookup[I].Color := clWhite;
  end;
  for I := 0 to length(ArraycxComboBox) - 1 do { Verifica��o apenas para TComboBox }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArraycxComboBox[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeComboBox[I];
      ArraycxComboBox[I].Style.Color := clMoneyGreen;
    end
    else
      ArraycxComboBox[I].Style.Color := clWhite;
  end;
  if msg_campos <> '' then
  begin
    msg_final := 'Os seguintes campos s�o obrigat�rios:' + msg_campos + slinebreak + 'Por Favor, preencha os campos destacados para poder prosseguir.';
    WnAlerta('Campos Obrigat�rios', msg_final, taleftjustify, 11);
    result := true;
  end
  else
    result := false;
end;
{ rever mudan�a, otimizar c�digo 04-10 }
{ utilizar overload de m�todo e separar as declara��es para cada tipo de dado 15-12 }

function CamposObrigatorios(ArraycxDBTextEdit: array of TcxDBTextEdit; NomeCamposcxDBTextEdit: array of string;
  ArraycxDBCurrencyedit: array of TcxDBCurrencyEdit; NomeCamposcxDBCurrencyEdit: array of string): boolean; overload;
var
  I: Integer;
  msg_campos, msg_final: string;
begin
  for I := 0 to length(ArraycxDBTextEdit) - 1 do { Verifica��o apenas para cxdbtextedits }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArraycxDBTextEdit[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposcxDBTextEdit[I];
      ArraycxDBTextEdit[I].Style.Color := clMoneyGreen;
    end
    else
      ArraycxDBTextEdit[I].Style.Color := clWhite;
  end;
  for I := 0 to length(ArraycxDBCurrencyedit) - 1 do { Verifica��o apenas para cxdbcurencyedits }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArraycxDBCurrencyedit[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposcxDBCurrencyEdit[I];
      ArraycxDBCurrencyedit[I].Style.Color := clMoneyGreen;
    end
    else
      ArraycxDBCurrencyedit[I].Style.Color := clWhite;
  end;
  if msg_campos <> '' then
  begin
    msg_final := 'Os seguintes campos s�o obrigat�rios:' + msg_campos + slinebreak + 'Por Favor, preencha os campos destacados para poder prosseguir.';
    WnAlerta('Campos Obrigat�rios', msg_final, taleftjustify, 11);
    result := true;
  end
  else
    result := false;
end;

function CamposObrigatorios(ArrayEdit: array of TEdit; NomeCamposEdit: array of String): boolean; overload;

var
  I: Integer;
  msg_campos, msg_final: String;
begin
  for I := 0 to length(ArrayEdit) - 1 do { Verifica��o apenas para dbedits }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArrayEdit[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposEdit[I];
      ArrayEdit[I].Color := clMoneyGreen;
    end
    else
      ArrayEdit[I].Color := clWhite;
  end;
  if msg_campos <> '' then
  begin
    msg_final := 'Os seguintes campos s�o obrigat�rios:' + msg_campos + slinebreak + 'Por Favor, preencha os campos destacados para poder prosseguir.';
    WnAlerta('Campos Obrigat�rios', msg_final, taleftjustify, 11);
    result := true;
  end
  else
    result := false;
end;

function CamposObrigatorios(ArrayDbEdit: array of TDBEdit; NomeCamposDBEdit: array of String; ArraycxDateEdit: array of TCxDateEdit;
  NomeCamposcxDateEdit: array of String): boolean; overload;

var
  I: Integer;
  msg_campos, msg_final: String;
begin
  for I := 0 to length(ArrayDbEdit) - 1 do { Verifica��o apenas para dbedits }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArrayDbEdit[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposDBEdit[I];
      ArrayDbEdit[I].Color := clMoneyGreen;
    end
    else
      ArrayDbEdit[I].Color := clWhite;
  end;
  for I := 0 to length(ArraycxDateEdit) - 1 do { Verifica��o apenas para dbedits }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArraycxDateEdit[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposcxDateEdit[I];
      ArraycxDateEdit[I].Style.Color := clMoneyGreen;
    end
    else
      ArraycxDateEdit[I].Style.Color := clWhite;
  end;
  if msg_campos <> '' then
  begin
    msg_final := 'Os seguintes campos s�o obrigat�rios:' + msg_campos + slinebreak + 'Por Favor, preencha os campos destacados para poder prosseguir.';
    WnAlerta('Campos Obrigat�rios', msg_final, taleftjustify, 11);
    result := true;
  end
  else
    result := false;
end;

function CamposObrigatorios(ArrayDbEdit: array of TDBEdit; NomeCamposDBEdit: array of String; ArrayEdit: array of TEdit; NomeCamposEdit: array of String)
  : boolean; overload;

var
  I: Integer;
  msg_campos, msg_final: String;
begin
  for I := 0 to length(ArrayDbEdit) - 1 do { Verifica��o apenas para dbedits }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArrayDbEdit[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposDBEdit[I];
      ArrayDbEdit[I].Color := clMoneyGreen;
    end
    else
      ArrayDbEdit[I].Color := clWhite;
  end;
  for I := 0 to length(ArrayEdit) - 1 do { Verifica��o apenas para dbedits }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArrayEdit[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposEdit[I];
      ArrayEdit[I].Color := clMoneyGreen;
    end
    else
      ArrayEdit[I].Color := clWhite;
  end;
  if msg_campos <> '' then
  begin
    msg_final := 'Os seguintes campos s�o obrigat�rios:' + msg_campos + slinebreak + 'Por Favor, preencha os campos destacados para poder prosseguir.';
    WnAlerta('Campos Obrigat�rios', msg_final, taleftjustify, 11);
    result := true;
  end
  else
    result := false;
end;

function RemoverCaracteresEspeciais(Texto: String; const substituir: string = ''): String;
begin
  Texto := StringReplace(Texto, '/', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '@', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '$', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '#', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '!', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '%', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '&', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '*', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '(', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, ')', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '-', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '.', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, ',', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, #39, substituir, [RFREPLACEALL]);
  // Aspa simples
  Texto := StringReplace(Texto, '^', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '?', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '`', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '~', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '+', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '=', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '"', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '\', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '|', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '[', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, ']', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '{', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '}', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, ':', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, ';', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '>', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '<', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'C', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'c', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '"', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', substituir, [RFREPLACEALL]);
  Texto := StringReplace(Texto, ':', substituir, [RFREPLACEALL]);
  result := Texto;
end;

function RemoverQuebraLinhas(Texto: String): String;
begin
  Texto := StringReplace(Texto, '> <', '><', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '> ', '>', [RFREPLACEALL]);
  Texto := StringReplace(Texto, ' <', '<', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '< ', '<', [RFREPLACEALL]);
  Texto := StringReplace(Texto, ' >', '>', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '>' + slinebreak + '<', '><', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '>' + slinebreak, '>', [RFREPLACEALL]);
  Texto := StringReplace(Texto, #13, emptystr, [RFREPLACEALL]);
  Texto := StringReplace(Texto, #13#10, ' ', [RFREPLACEALL]);
  Texto := StringReplace(Texto, slinebreak, emptystr, [RFREPLACEALL]);
  result := Texto;
end;

function RemoverUTF8(Texto: String): String;
begin
  Texto := StringReplace(Texto, '�', 'a', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'e', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'i', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'o', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'u', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'a', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'e', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'i', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'o', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'u', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'a', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'e', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'i', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'o', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'u', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'a', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'e', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'i', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'o', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'u', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'a', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'o', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'n', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'c', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'A', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'E', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'I', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'O', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'U', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'A', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'E', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'I', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'O', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'U', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'A', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'E', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'I', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'O', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'U', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'A', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'E', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'I', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'O', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'U', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'A', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'O', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'N', [RFREPLACEALL]);
  Texto := StringReplace(Texto, '�', 'C', [RFREPLACEALL]);
  result := Texto;
end;

function RemoverEspacoEmBranco(Texto: String; const substituir: string = ''): String;
begin
  Texto := StringReplace(Texto, #32, substituir, [RFREPLACEALL]);
  result := Texto;
end;

procedure CamposObrigatorios_CorPadrao(ArrayDbEdit: array of TDBEdit; ArrayDbLookup: array of TDBLookupComboBox; ArraycxComboBox: array of TcxComboBox);
var
  I: Integer;
begin
  for I := 0 to length(ArrayDbEdit) - 1 do { Verifica��o apenas para dbedits }
    ArrayDbEdit[I].Color := clWhite;
  for I := 0 to length(ArrayDbLookup) - 1 do { Verifica��o apenas para dblookups }
    ArrayDbLookup[I].Color := clWhite;
  for I := 0 to length(ArraycxComboBox) - 1 do { Verifica��o apenas para tcxcombobox }
    ArraycxComboBox[I].Style.Color := clWhite;
end;

function CamposObrigatorios(ArrayDbEdit: array of TDBEdit; NomeCamposDBEdit: array of String; ArrayDbLookup: array of TDBLookupComboBox;
  NomeCamposDBLookup: array of String; ArraycxComboBox: array of TcxComboBox; NomeComboBox: array of String; ArrayMaskEdit: array of TMaskEdit;
  NomeCamposTMaskEdit: array of String): boolean;
var
  I: Integer;
  msg_campos, msg_final: String;
begin
  for I := 0 to length(ArrayDbEdit) - 1 do { Verifica��o apenas para dbedits }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArrayDbEdit[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposDBEdit[I];
      ArrayDbEdit[I].Color := clMoneyGreen;
    end
    else
      ArrayDbEdit[I].Color := clWhite;
  end;

  for I := 0 to length(ArrayDbLookup) - 1 do { Verifica��o apenas para dblookup }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArrayDbLookup[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposDBLookup[I];
      ArrayDbLookup[I].Color := clMoneyGreen;
    end
    else
      ArrayDbLookup[I].Color := clWhite;
  end;
  for I := 0 to length(ArraycxComboBox) - 1 do { Verifica��o apenas para TComboBox }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArraycxComboBox[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeComboBox[I];
      ArraycxComboBox[I].Style.Color := clMoneyGreen;
    end
    else
      ArraycxComboBox[I].Style.Color := clWhite;
  end;
  for I := 0 to length(ArrayMaskEdit) - 1 do { Verifica��o apenas para TMaskEdit }
  begin
    if RemoverEspacoEmBranco(RemoverCaracteresEspeciais(ArrayMaskEdit[I].Text)) = '' then
    begin
      msg_campos := msg_campos + slinebreak + NomeCamposTMaskEdit[I];
      ArrayMaskEdit[I].Color := clMoneyGreen;
    end
    else
      ArrayMaskEdit[I].Color := clWhite;
  end;
  if msg_campos <> '' then
  begin
    msg_final := 'Os seguintes campos s�o obrigat�rios:' + msg_campos + slinebreak + 'Por Favor, preencha os campos destacados para poder prosseguir.';
    WnAlerta('Campos Obrigat�rios', msg_final, taleftjustify, 11);
    result := true;
  end
  else
    result := false;
end;

function SearchFiles(Dir, Pattern: string): TArray<string>;
var
  qtderec: Integer;
  searchResult: TSearchRec;
  Files: TArray<string>;
begin
  qtderec := 1;
  if findfirst(Dir + Pattern, faAnyFile, searchResult) = 0 then
  begin
    SetLength(Files, qtderec);
    repeat
      Files[qtderec - 1] := searchResult.Name;
      Inc(qtderec);
      SetLength(Files, qtderec);
    until FindNext(searchResult) <> 0;
  end;
  result := Files;
end;

function getSerialKey: string;
begin
  result := EnDecryptString(TIniFile.Create(confini).readString('dados_liberacao', 'codlibera', ''), 236);
end;

function getNomeFantasia(const NotFoundDef: string = 'EMPRESA N�O CADASTRADA'): string;
var
  qry: TFDQuery;
begin
  qry := SimpleQuery('SELECT NOME_FANTASIA FROM EMPRESA');
  if qry <> nil then
    result := qry.Fields[0].Text
  else
    result := NotFoundDef;
end;

procedure CamposObrigatorios_CorPadrao(ArrayEdit: array of TEdit; ArrayDbEdit: array of TDBEdit); overload;
var
  I: Integer;
begin
  for I := 0 to length(ArrayEdit) - 1 do { Verifica��o apenas para dbedits }
    ArrayEdit[I].Color := clWhite;
  for I := 0 to length(ArrayDbEdit) - 1 do { Verifica��o apenas para dbedits }
    ArrayDbEdit[I].Color := clWhite;
end;

procedure CamposObrigatorios_CorPadrao(ArrayDbEdit: array of TDBEdit; ArrayDbLookup: array of TDBLookupComboBox; ArraycxComboBox: array of TcxComboBox;
  ArrayMaskEdit: array of TMaskEdit); overload;
var
  I: Integer;
begin
  for I := 0 to length(ArrayDbEdit) - 1 do { Verifica��o apenas para dbedits }
    ArrayDbEdit[I].Color := clWhite;
  for I := 0 to length(ArrayDbLookup) - 1 do { Verifica��o apenas para dblookups }
    ArrayDbLookup[I].Color := clWhite;
  for I := 0 to length(ArraycxComboBox) - 1 do { Verifica��o apenas para tcxcombobox }
    ArraycxComboBox[I].Style.Color := clWhite;
  for I := 0 to length(ArrayMaskEdit) - 1 do { Verifica��o apenas para tcxcombobox }
    ArrayMaskEdit[I].Color := clWhite;
end;

procedure CamposObrigatorios_CorPadrao(ArrayDbEdit: array of TDBEdit; ArraycxDateEdit: array of TCxDateEdit); overload;

var
  I: Integer;
begin
  for I := 0 to length(ArrayDbEdit) - 1 do { Verifica��o apenas para dbedits }
    ArrayDbEdit[I].Color := clWhite;
  for I := 0 to length(ArraycxDateEdit) - 1 do { Verifica��o apenas para dbedits }
    ArraycxDateEdit[I].Style.Color := clWhite;
end;

procedure CamposOpcionais(ArrayDbEdit: array of TDBEdit; ArrayNomeCampos: array of string);

const
  msg_padrao = 'Cadastro conclu�do com sucesso!';
  msg_aux = '� recomendado o preenchimento dos seguintes campos:';

var
  I: Integer;
  msg_campos, msg_final: String;
begin
  msg_final := msg_padrao;
  for I := 0 to length(ArrayDbEdit) - 1 do { Verifica��o apenas para dbedits }
  begin
    if RemoverCaracteresEspeciais(ArrayDbEdit[I].Text) = '' then
      if msg_campos = '' then
        msg_campos := ArrayNomeCampos[I]
      else
        msg_campos := msg_campos + slinebreak + ArrayNomeCampos[I];
  end;
  if msg_campos <> '' then
    msg_final := msg_padrao + slinebreak + msg_aux + slinebreak + msg_campos;
  Application.MessageBox(stringtoolestr(msg_final), 'Conclu�do', MB_ICONASTERISK + MB_OK);

end;

procedure AlterarEnabled(xObject: array of tcontrol; Enabled: boolean);
var
  I: Integer;
begin
  for I := 0 to length(xObject) - 1 do { Verifica��o apenas para dbedits }
  begin
    xObject[I].Enabled := Enabled;
  end;
end;

procedure AlterarVisible(xObject: array of tcontrol; Visible: boolean);
var
  I: Integer;
begin
  for I := 0 to length(xObject) - 1 do { Verifica��o apenas para grupos }
  begin
    xObject[I].Visible := Visible;
  end;
end;

procedure AlterarReadOnly(xObject: array of TEdit; Read: boolean);
var
  I: Integer;
begin
  for I := 0 to length(xObject) - 1 do { Verifica��o apenas para grupos }
  begin
    xObject[I].readonly := Read;
  end;
end;

procedure LimparCamposDB(ArrayEdit: array of TDBEdit);
var
  I: Integer;
begin
  for I := 0 to length(ArrayEdit) - 1 do
  begin
    ArrayEdit[I].Text := '';
  end;
end;

procedure LimparCampos(ArrayEdit: array of TEdit);

var
  I: Integer;
begin
  for I := 0 to length(ArrayEdit) - 1 do
  begin
    ArrayEdit[I].Text := '';
  end;
end;

function Arredondar(const value: extended): extended;
  function Dizima(Str: String): boolean;

  var
    x, z: Integer;
  begin
    for x := 1 to length(Str) do
      if (Str[1] = Str[x]) then
      begin
        result := true;
        for z := 1 to length(Str) do
        begin
          if (Str[1] = Str[z]) then
            result := true
          else
            result := false;
        end;
        if result = true then
          Break;
      end
      else
        result := false;
  end;

var
  ArrFrac, NewArrFrac: string;
  I: Integer;
begin
  ArrFrac := FloatToStr(frac(value));
  if ArrFrac[1] = '0' then
    if ArrFrac[2] = ',' then
      ArrFrac := StringReplace(ArrFrac, '0,', '', [RFREPLACEALL]);
  if length(ArrFrac) > 3 then
  begin
    if Dizima(ArrFrac) then
      NewArrFrac := ArrFrac[1] + inttostr(StrToInt(ArrFrac[2]) + 1)
    else
    begin
      NewArrFrac := '';
      for I := 1 to 3 do
        NewArrFrac := NewArrFrac + ArrFrac[I];
      if StrToInt(NewArrFrac[3]) > 5 then
        NewArrFrac := NewArrFrac[1] + inttostr(StrToInt(NewArrFrac[2]) + 1)
      else if StrToInt(NewArrFrac[2]) < 5 then
        NewArrFrac := NewArrFrac[1] + inttostr(StrToInt(NewArrFrac[2]) - 1)
    end;
  end
  else
    NewArrFrac := ArrFrac[1] + inttostr(StrToInt(ArrFrac[2]));
  result := int(value) + strtofloat('0,' + NewArrFrac);
end;

function Arredonda(Value: Extended; Decimals: Integer): Extended;
var
 Factor, Fraction: Extended;
begin
 Factor := IntPower(10, Decimals);
 { A convers�o para string e depois para float evita
   erros de arredondamentos indesej�veis. }
 Value := StrToFloat(FloatToStr(Value * Factor));
 Result := Int(Value);
 Fraction := Frac(Value);
 //if Fraction >= 0.5 then
 if Fraction >= 0.495 then
   Result := Result + 1
 else if Fraction <= -0.5 then
   Result := Result - 1;
 Result := Result / Factor;
end;

function FindCharInStr(const Str: string; const Char: string): Integer;
var
  I, occurencies: Integer;
begin
  occurencies := 0;
  for I := 1 to length(Str) do
    if Str[I] = Char then
      occurencies := occurencies + 1;
  result := occurencies;
end;

function VerificaEstadoCheck(ArrayCheckBox: array of TcxCheckBox; EstadoDesejado: boolean): boolean;

var
  I: Integer;
  TodosDesmarcados: boolean;
begin
  for I := 0 to length(ArrayCheckBox) - 1 do
  begin
    if ArrayCheckBox[I].Checked = EstadoDesejado then
    begin
      TodosDesmarcados := true;
      if (I = length(ArrayCheckBox) - 1) and (TodosDesmarcados = true) then
        result := true
      else if (I = length(ArrayCheckBox) - 1) and (TodosDesmarcados = false) then
        result := false;
    end
    else
    begin
      TodosDesmarcados := false;
      result := false;
      exit;
      Break;
    end;
  end
end;

procedure TeclasAtalho(Key: Word; ArrayKey: array of Integer; ArrayBotoes: array of TcxButton);

var
  I: Integer;
begin
  if Key = VK_ESCAPE then
    Screen.ActiveForm.Close;
  for I := 0 to length(ArrayKey) - 1 do { Verifica��o apenas para Teclas }
  begin
    if Key = ArrayKey[I] then
      ArrayBotoes[I].Click;
  end;
end;

procedure Principal_TeclasAtalho(Key: Word; ArrayKey: array of Integer; ArrayBotoes: array of tdxbarlargebutton);

var
  I: Integer;
begin
  for I := 0 to length(ArrayKey) - 1 do { Verifica��o apenas para Teclas }
  begin
    if Key = ArrayKey[I] then
      ArrayBotoes[I].Click;
  end;
end;

procedure IniciarCadastro(ArrayBotoes: array of TcxButton; IniciaCadastro: boolean);

var
  I: Integer;
begin
  for I := 0 to length(ArrayBotoes) - 1 do { Verifica��o apenas para Bot�es }
  begin
    if IniciaCadastro then
    begin
      if (I = 0) then
        ArrayBotoes[I].Visible := false { botao incluir }
      else if (I = 1) then
        ArrayBotoes[I].Enabled := true { botao cancelar }
      else
        ArrayBotoes[I].Enabled := false; { outros botoes }
    end
    else
    begin
      if (I = 0) then
        ArrayBotoes[I].Visible := true { botao incluir }
      else if (I = 1) then
        ArrayBotoes[I].Enabled := false { botao cancelar }
      else
        ArrayBotoes[I].Enabled := true; { outros botoes }
    end;
  end;
end;

procedure ValidarIE(IE: TDBEdit);
  procedure msg;
  begin
    Application.MessageBox('Informe uma numera��o para Inscri��o Estadual ou ''ISENTO'' caso n�o possua.', 'Mensagem do Sistema', MB_ICONWARNING + MB_OK);
    IE.SelectAll;
    IE.SetFocus;
    exit;
  end;

var
  I: Integer;
begin
  if IE.Text = emptystr then
    msg
  else
    for I := 0 to length(IE.Text) - 1 do
    begin
      if IE.Text <> 'ISENTO' then
      begin
        if not IsNumber(IE.Text) then
        begin
          msg;
          Break;
        end;
      end;
    end
end;

function IsNumber(Texto: String): boolean;
var
  I: Int64;
begin
  try
    if TryStrToInt64(Texto, I) then
      result := true
    else
      result := false;
  except
    result := false;
  end;
end;

procedure ExcluirCadastro(Consulta: TFDQuery; DesativarQuery: boolean = true);
begin
  Consulta.delete;
  if DesativarQuery then
     Consulta.Active := false;
  WnInfo('Excluir', 'Cadastro foi exclu�do com sucesso.');
end;

function DuplicarCadastro(CADASTRO: TFDQuery; Tabela, Codigo: String): Integer;
var
  Campo: string;
  SEQUENCIA, I: Integer;
  duplicate_query: TFDQuery;
begin
  SEQUENCIA := SimpleQuery('SELECT MAX(CODIGO) as SEQUENCIA FROM ' + Tabela).Fields[0].asInteger + 1;
  duplicate_query := SimpleQuery('SELECT * FROM ' + Tabela + ' WHERE CODIGO=' + Codigo);
  with CADASTRO do
  begin
    for I := 0 to Pred(CADASTRO.Fields.Count) do
    begin
      Campo := duplicate_query.Fields[I].FieldName;
      FieldByName(Campo).value := duplicate_query.FieldByName(Campo).value;
    end;
    FieldByName('CODIGO').Clear;
    FieldByName('CODIGO').value := SEQUENCIA;
    result := SEQUENCIA;
  end;
end;

procedure ClienteViraFornecedor(CADASTRO: TFDQuery; Tabela, Codigo: String);

var
  Campo: string;
  SEQUENCIA, I: Integer;
  query: TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.connection := CADASTRO.connection;
  with query do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT max(codigo) as ultimo_registro FROM ' + Tabela);
    open;
    SEQUENCIA := query.FieldByName('ultimo_registro').asInteger + 1;
    Close;
    sql.Clear;
    sql.Add(CADASTRO.sql.Text);
    paramByName('pcodigo').value := StrToInt(Codigo);
    open;
  end;
  with CADASTRO do
  begin
    Active := true;
    insert;
    for I := 0 to Pred(CADASTRO.Fields.Count) do
    begin
      Campo := query.Fields[I].FieldName;
      FieldByName(Campo).value := query.FieldByName(Campo).value;
    end;
    FieldByName('CODIGO').Clear;
    FieldByName('CODIGO').value := SEQUENCIA;
  end;
end;

function ValidarCpf(CPF_Text: string): boolean;

var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: Integer;
  d1, d2: Integer;
  digitado, calculado: string;
begin
  n1 := StrToInt(CPF_Text[1]);
  n2 := StrToInt(CPF_Text[2]);
  n3 := StrToInt(CPF_Text[3]);
  n4 := StrToInt(CPF_Text[4]);
  n5 := StrToInt(CPF_Text[5]);
  n6 := StrToInt(CPF_Text[6]);
  n7 := StrToInt(CPF_Text[7]);
  n8 := StrToInt(CPF_Text[8]);
  n9 := StrToInt(CPF_Text[9]);
  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
  d1 := 11 - (d1 mod 11);
  if d1 >= 10 then
    d1 := 0;
  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
  d2 := 11 - (d2 mod 11);
  if d2 >= 10 then
    d2 := 0;
  calculado := inttostr(d1) + inttostr(d2);
  digitado := CPF_Text[10] + CPF_Text[11];
  if calculado = digitado then
    ValidarCpf := true
  else
    ValidarCpf := false;
end;

function ValidarCnpj(xCNPJ: String): boolean;

Var
  d1, d4, xx, nCount, fator, resto, digito1, digito2: Integer;
  Check: String;
begin
  d1 := 0;
  d4 := 0;
  xx := 1;
  for nCount := 1 to length(xCNPJ) - 2 do
  begin
    if pos(copy(xCNPJ, nCount, 1), '/-.') = 0 then
    begin
      if xx < 5 then
      begin
        fator := 6 - xx;
      end
      else
      begin
        fator := 14 - xx;
      end;
      d1 := d1 + StrToInt(copy(xCNPJ, nCount, 1)) * fator;
      if xx < 6 then
      begin
        fator := 7 - xx;
      end
      else
      begin
        fator := 15 - xx;
      end;
      d4 := d4 + StrToInt(copy(xCNPJ, nCount, 1)) * fator;
      xx := xx + 1;
    end;
  end;
  resto := (d1 mod 11);
  if resto < 2 then
  begin
    digito1 := 0;
  end
  else
  begin
    digito1 := 11 - resto;
  end;
  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
  begin
    digito2 := 0;
  end
  else
  begin
    digito2 := 11 - resto;
  end;
  Check := inttostr(digito1) + inttostr(digito2);
  if Check <> copy(xCNPJ, succ(length(xCNPJ) - 2), 2) then
  begin
    result := false;
  end
  else
  begin
    result := true;
  end;
end;

procedure ConsultarCPF(Consulta: TFDQuery; Texto: TDBEdit; Tabela, Coluna, Parametro: String);

var
  QueryTemp: TFDQuery;
begin
  QueryTemp := TFDQuery.Create(nil);
  QueryTemp.connection := Consulta.connection;
  with QueryTemp do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM ' + Tabela);
    sql.Add(' WHERE ' + Coluna + ' LIKE :' + Parametro);
    params[0].value := '%' + Texto.Text + '%';
    open;
    if RecordCount <> 0 then
    begin
      Application.MessageBox('Existe Cadastro com este CPF!!! ', 'Mensagem do Sistema.', MB_ICONWARNING + MB_OK);
      Texto.SelectAll;
      Texto.SetFocus;
    end;
  end;
  QueryTemp.destroy;
end;

procedure ConsultarCNPJ(Consulta: TFDQuery; Texto: TDBEdit; Tabela, Coluna, Parametro: String);

var
  QueryTemp: TFDQuery;
begin
  QueryTemp := TFDQuery.Create(nil);
  QueryTemp.connection := Consulta.connection;
  with QueryTemp do
  begin
    Close;
    sql.Clear;
    sql.Add('SELECT * FROM ' + Tabela);
    sql.Add(' WHERE ' + Coluna + ' LIKE :' + Parametro);
    params[0].value := '%' + Texto.Text + '%';
    open;
    if RecordCount <> 0 then
    begin
      Application.MessageBox('Existe Cadastro com este CNPJ!!! ', 'Mensagem do Sistema.', MB_ICONWARNING + MB_OK);
      Texto.SelectAll;
      Texto.SetFocus;
    end;
  end;
  QueryTemp.destroy;
end;

function FormatarQuantidadeKG(edt_quantidade: TEdit; Key: Char): Char;

var
  ValorAnterior: string;
begin
  if not(Key in [#8]) then
  begin
    if not(Key in ['0' .. '9']) then
    begin
      Key := #0;
    end;
    if (length(ValorDigitado) = 0) then
    begin
      ValorAnterior := StringOfchar(Key, 1);
      ValorDigitado := ValorDigitado + ValorAnterior;
      edt_quantidade.Text := '0,00' + ValorDigitado;
      edt_quantidade.SelStart := length(edt_quantidade.Text);
      ValorAnterior := '';
      Key := #0;
    end;
    if Key <> #0 then
    begin
      if (length(ValorDigitado) = 1) then
      begin
        ValorAnterior := StringOfchar(Key, 1);
        ValorDigitado := ValorDigitado + ValorAnterior;
        edt_quantidade.Text := '0,0' + ValorDigitado;
        edt_quantidade.SelStart := length(edt_quantidade.Text);
        ValorAnterior := '';
        Key := #0;
      end;
      if Key <> #0 then
      begin
        if (length(ValorDigitado) = 2) then
        begin
          ValorAnterior := StringOfchar(Key, 1);
          ValorDigitado := ValorDigitado + ValorAnterior;
          edt_quantidade.Text := '0,' + ValorDigitado;
          edt_quantidade.SelStart := length(edt_quantidade.Text);
          ValorAnterior := '';
          Key := #0;
        end;
        if Key <> #0 then
        begin
          if (length(ValorDigitado) = 3) then
          begin
            ValorAnterior := StringOfchar(Key, 1);
            ValorDigitado := ValorDigitado + ValorAnterior;
            edt_quantidade.Text := ValorDigitado[1] + ',' + ValorDigitado[2] + ValorDigitado[3] + ValorDigitado[4];
            edt_quantidade.SelStart := length(edt_quantidade.Text);
            ValorAnterior := '';
            Key := #0;
          end;
        end;
        if Key <> #0 then
        begin
          if (length(ValorDigitado) = 4) then
          begin
            ValorAnterior := StringOfchar(Key, 1);
            ValorDigitado := ValorDigitado + ValorAnterior;
            edt_quantidade.Text := ValorDigitado[1] + ValorDigitado[2] + ',' + ValorDigitado[3] + ValorDigitado[4] + ValorDigitado[5];
            edt_quantidade.SelStart := length(edt_quantidade.Text);
            ValorAnterior := '';
            Key := #0;
          end;
          if Key <> #0 then
          begin
            if (length(ValorDigitado) = 5) then
            begin
              Key := #0;
            end;
          end;
        end;
      end;
    end;
  end
  else
  // Apagando os dados
  begin
    if (length(ValorDigitado) = 5) then
    begin
      ValorDigitado := ValorDigitado[1] + ValorDigitado[2] + ValorDigitado[3] + ValorDigitado[4];
      edt_quantidade.Text := ValorDigitado[1] + ',' + ValorDigitado[2] + ValorDigitado[3] + ValorDigitado[4];
      edt_quantidade.SelStart := length(edt_quantidade.Text);
      ValorAnterior := '';
      Key := #0;
    end;
    if Key <> #0 then
    begin
      if (length(ValorDigitado) = 4) then
      begin
        ValorDigitado := ValorDigitado[1] + ValorDigitado[2] + ValorDigitado[3];
        edt_quantidade.Text := '0,' + ValorDigitado;
        edt_quantidade.SelStart := length(edt_quantidade.Text);
        ValorAnterior := '';
        Key := #0;
      end;
      if Key <> #0 then
      begin
        if (length(ValorDigitado) = 3) then
        begin
          ValorDigitado := ValorDigitado[1] + ValorDigitado[2];
          edt_quantidade.Text := '0,0' + ValorDigitado;
          edt_quantidade.SelStart := length(edt_quantidade.Text);
          ValorAnterior := '';
          Key := #0;
        end;
        if Key <> #0 then
        begin
          if (length(ValorDigitado) = 2) then
          begin
            ValorDigitado := ValorDigitado[1];
            edt_quantidade.Text := '0,00' + ValorDigitado;
            edt_quantidade.SelStart := length(edt_quantidade.Text);
            ValorAnterior := '';
            Key := #0;
          end;
        end;
        if Key <> #0 then
        begin
          if (length(ValorDigitado) = 1) then
          begin
            ValorDigitado := '';
            edt_quantidade.Text := '0,000';
            edt_quantidade.SelStart := length(edt_quantidade.Text);
            ValorAnterior := '';
            Key := #0;
          end;
        end;
        if Key <> #0 then
        begin
          if (length(ValorDigitado) = 0) then
          begin
            Key := #0;
          end;
        end;
      end;
    end;
  end;
  result := Key;
end;

procedure GridZebrado(GRID: TDBGRID; Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Odd(GRID.DataSource.DataSet.RecNo) then // �ndice Impar
  begin
    GRID.Canvas.Brush.Color := clWebGainsboro; // Seleciona cor
    GRID.Canvas.FillRect(Rect); // Pinta Grid
  end;
  if (gdFocused in State) then
  begin
    GRID.Canvas.Brush.Color := clWebDodgerBlue;
    GRID.Canvas.Font.Color := clWhite;
    GRID.Canvas.FillRect(Rect);
  end;
  GRID.DefaultDrawColumnCell(Rect, DataCol, Column, State); // Muda Status

  GRID.options := [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTitleClick];

end;

procedure GridZebrado(ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
begin
  if Odd(AViewInfo.GridRecord.RecordIndex) Then
    ACanvas.Brush.Color := clWebGainsboro;
end;

function obterNroResultado(const aXML, aTag, aEndTag: string): string;

var
  _Posini, _Posfim: Integer;
Begin
  result := '';
  _Posini := pos(aTag, aXML);
  _Posfim := pos(aEndTag, aXML);
  if (_Posini > 0) then
  begin
    Inc(_Posini, length(aTag));
    result := copy(aXML, _Posini + 1, (_Posfim - _Posini) - 1);
  end;
end;

procedure MoverXML(CaminhoOrigem, CaminhoDestino: String);

var
  origem, destino: PWideChar;
begin
  origem := PWideChar(CaminhoOrigem);
  destino := PWideChar(CaminhoDestino);
  MoveFile(origem, destino);
end;

procedure AppendFile(Caminho, Texto: String; Position: Integer = 0);
{ 0 - Fim do arquivo
  1 - In�cio do arquivo }
var
  FileXML: TextFile;
  DadosArquivo: tstringList;
begin
  DadosArquivo := tstringList.Create;
  DadosArquivo.LoadFromFile(Caminho);
  AssignFile(FileXML, Caminho);
  Rewrite(FileXML);
  if Position = 0 then
    DadosArquivo.Text := DadosArquivo.Text + Texto
  else if Position = 1 then
    DadosArquivo.Text := Texto + DadosArquivo.Text;
  DadosArquivo.Text := RemoverQuebraLinhas(DadosArquivo.Text);
  write(FileXML, DadosArquivo.Text);
  CloseFile(FileXML);
  DadosArquivo.destroy;
end;

procedure DeletarXMLPendente(CaminhoOrigem: String);

var
  origem: PWideChar;
begin
  origem := PWideChar(CaminhoOrigem);
  deletefile(origem);
end;

procedure ColorirStatusGrid(GRID: TDBGRID; Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState; Cor: Array of Integer;
  ValorPreencher: array of String; ValorBanco: TStringField);

var
  I: Integer;
begin
  with GRID do
  begin
    for I := Low(ValorPreencher) to High(ValorPreencher) do
      if ValorPreencher[I] = ValorBanco.value then
      // �ndice Impar
      begin
        Canvas.Font.Color := Cor[I]; // Seleciona cor
        Canvas.FillRect(Rect); // Pinta Grid
        DefaultDrawColumnCell(Rect, DataCol, Column, State); // Muda Status
      end;
  end;
end;

procedure ColorirStatusGrid(GRID: TDBGRID; Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState; Colors: array of Integer;
  value_to_fill: array of variant; value_to_compare: extended);

var
  I: Integer;
begin
  with GRID do
  begin

    Canvas.Font.Color := ColorByStatus(value_to_compare, value_to_fill, Colors); // Seleciona cor
    Canvas.FillRect(Rect); // Pinta Grid
    DefaultDrawColumnCell(Rect, DataCol, Column, State); // Muda Status

  end;
end;

procedure MostrarBarraLateralGrid(GRID: TDBGRID; VERTICAL, HORIZONTAL: boolean);
begin
  ShowScrollBar(GRID.Handle, SB_VERT, VERTICAL);
  ShowScrollBar(GRID.Handle, SB_HORZ, HORIZONTAL);
end;

function MonthToDBMonth(Dia, Mes: String): string;

var
  MesAux: String;
begin
  MesAux := formatdatetime('yyyy', date) + '-';
  MesAux := MesAux + Mes + '-';
  MesAux := MesAux + Dia;
  result := MesAux;
end;

procedure CamposEditaveis(ArrayEdit: array of TEdit; IniciaEdicao: boolean);

var
  I, j: Integer;
begin
  if IniciaEdicao then

    for I := Low(ArrayEdit) to High(ArrayEdit) do
      ArrayEdit[I].Color := clWebLightSkyBlue
  else
    for I := Low(ArrayEdit) to High(ArrayEdit) do
      ArrayEdit[I].Color := clWindow;
end;

function ColorByStatus(value: variant; ArrValues: array of variant; ArrColors: array of Integer): Integer;
var
  kindof, I: Integer;
begin
  result := clWhite;
  kindof := varType(value) and VarTypeMask;
  if (kindof = varInteger) or (kindof = vardouble) then
  begin
    if value <= ArrValues[0] then
      result := ArrColors[0]
    else if (value > ArrValues[0]) and (value < ArrValues[1]) then
      result := ArrColors[1]
    else if value >= ArrValues[1] then
      result := ArrColors[2]
  end
  else
  begin
    for I := Low(ArrValues) to High(ArrValues) do
      if value = ArrValues[I] then
        result := ArrColors[I]
  end;
end;

function FormatarTag(Tag: extended; const ReturnMethod: Word = varString): variant;
var
  strTag, arrTagStr, intPart, fraPart, fraPartAux, Separador: string;
  index, x: Integer;
begin
  if ReturnMethod = varString then
    Separador := '.'
  else if ReturnMethod = vardouble then
    Separador := ',';
  fraPart := '';
  intPart := '';
  arrTagStr := '';
  strTag := '';
  fraPartAux := '';
  index := 0;
  if (Tag <> 0) then
  begin
    arrTagStr := FloatToStr(Tag);
    index := AnsiPos(',', arrTagStr);
    if index <> 0 then
    begin
      for x := 1 to index - 1 do
      begin
        intPart := intPart + arrTagStr[x]; { Parte Inteira }
      end;
      fraPartAux := copy(arrTagStr, index + 1, length(arrTagStr));
      { Parte Fracin�ria }
      fraPart := fraPartAux[1];
      if length(fraPartAux) >= 2 then
        fraPart := fraPart + fraPartAux[2]
      else
        fraPart := fraPart + '0';
    end
    else
    begin
      intPart := arrTagStr;
      fraPart := '00';
    end;
    strTag := intPart + Separador + fraPart;
  end
  else
    strTag := '0' + Separador + '00';
  result := varastype(strTag, ReturnMethod);
end;

function FormatarTagDescricao(xDesc: string): string;
var
  x: Integer;
begin
  xDesc := RemoverCaracteresEspeciais(xDesc);
  xDesc := copy(xDesc, 1, 110);
  if length(xDesc) <> 0 then
    for x := Low(xDesc) to high(xDesc) do
      if xDesc[x] = ' ' then
        xDesc := copy(xDesc, x + 1, 110)
      else
        Break;
  result := xDesc;
end;

procedure CNPJCPF(Field: TMaskEdit);
var
  cpfcnpj: string;
begin
  cpfcnpj := RemoverEspacoEmBranco(RemoverCaracteresEspeciais(Field.Text));
  if length(cpfcnpj) = 11 then { CPF }
    Field.EditMask := '000\.000\.000\-00;1;_'
  else if length(cpfcnpj) = 14 then
    Field.EditMask := '00\.000\.000/0000-00;1;_'
  else
    Field.EditMask := '';
end;

procedure CNPJCPF(Field: TDBEdit);
var
  cpfcnpj: string;
begin
  cpfcnpj := RemoverEspacoEmBranco(RemoverCaracteresEspeciais(Field.Text));
  if length(cpfcnpj) = 11 then { CPF }
    Field.Field.EditMask := '000\.000\.000\-00;1;_'
  else if length(cpfcnpj) = 14 then
    Field.Field.EditMask := '00\.000\.000/0000-00;1;_';
end;

function Format_CPF_CNPJ(value: string): string;
var
  cpfcnpj: string;
begin
  cpfcnpj := RemoverEspacoEmBranco(RemoverCaracteresEspeciais(value));
  if length(cpfcnpj) = 11 then { CPF }
    result := copy(cpfcnpj, 1, 3) + '.' + copy(cpfcnpj, 4, 3) + '.' + copy(cpfcnpj, 7, 3) + '-' + copy(cpfcnpj, 10, 2)
  else if length(cpfcnpj) = 14 then
    result := copy(cpfcnpj, 1, 2) + '.' + copy(cpfcnpj, 3, 3) + '.' + copy(cpfcnpj, 6, 3) + '/' + copy(cpfcnpj, 9, 4) + '-' + copy(cpfcnpj, 13, 2);
end;

function Calcdata(Partner: String): string;
var
  FullyDate: string;
  my_date: TDate;
begin
  my_date := incmonth(date, -1);
  FullyDate := formatdatetime(Partner, my_date);
  result := FullyDate;
end;

function SimpleQuery(query: String; Conn: TfdConnection = nil): TFDQuery;
var
  qry_tmp: TFDQuery;
begin
  try
    qry_tmp := TFDQuery.Create(nil);
    if Conn = nil then
      Conn := module.connection;
    with qry_tmp do
    begin
      connection := Conn;
      Close;
      sql.Clear;
      open(query);
      FetchAll;
      if RecordCount <> 0 then
        result := qry_tmp
      else if RecordCount = 0 then
        result := nil;
    end;
  except
    on e: exception do
      WnErro('Erro', e.Message + slinebreak);
  end;
end;

function SimpleQuery(query: String; arr_params: array of variant; Conn: TfdConnection = nil): TFDQuery; overload;
var
  qry_tmp: TFDQuery;
  I: Integer;
begin
  try
    qry_tmp := TFDQuery.Create(nil);
    if Conn = nil then
      Conn := module.connection;
    with qry_tmp do
    begin
      connection := Conn;
      Close;
      sql.Clear;
      sql.Add(query);
      open(query, arr_params);
      FetchAll;
      if RecordCount <> 0 then
        result := qry_tmp
      else if RecordCount = 0 then
        result := nil;
    end;
  except
    on e: exception do
      WnErro('Erro', e.Message + slinebreak);
  end;
end;

function ExecQuery(query: String; Conn: TfdConnection = nil): TFDQuery;
var
  qry_tmp: TFDQuery;
begin
  try
    qry_tmp := TFDQuery.Create(nil);
    if Conn = nil then
      Conn := module.connection;
    with qry_tmp do
    begin
      connection := Conn;
      Close;
      sql.Clear;
      sql.Add(query);
      Execsql;
    end;
  except
    on e: exception do
      WnErro('Erro', e.Message + slinebreak);
  end;
end;

function ExecQuery(query: String; arr_params: array of variant; Conn: TfdConnection = nil): TFDQuery; overload;
var
  qry_tmp: TFDQuery;
  I: Integer;
begin
  try
    qry_tmp := TFDQuery.Create(nil);
    if Conn = nil then
      Conn := module.connection;
    with qry_tmp do
    begin
      connection := Conn;
      Close;
      sql.Clear;
      Execsql(query, arr_params);
    end;
  except
    on e: exception do
      WnErro('Erro', e.Message + slinebreak);
  end;
end;

function ZeroLeft(strx: string; qtde: Integer): string;

var
  fmt: string;
  I: Integer;
begin
  for I := 1 to qtde do
    fmt := '0' + fmt;
  result := FORMATFLOAT(RemoverEspacoEmBranco(fmt), strtofloat(strx));
end;

function AutoComplete(Edit: TEdit; MiniQuery: string; FieldIndex: Integer): TFDQuery;

var
  Posicao, Aux, cursorback: Integer;
  txt: string;
  qry: TFDQuery;
begin
  sleep(100);
  qry := SimpleQuery(MiniQuery);
  if qry = nil then
    result := nil
  else
  begin
    txt := qry.Fields[FieldIndex].Text;
    if txt <> emptystr then
    begin
      Posicao := length(Edit.Text);
      For Aux := length(Edit.Text) + 1 to length(txt) do
      begin
        Edit.Text := Edit.Text + txt[Aux];
      end;
      Edit.SelStart := Posicao;
      Edit.SelLength := length(Edit.Text);
      result := qry;
    end;
  end;
end;

function LimitOccurences(const StringValue: string; const CharToFind: Char; CountOcurr: Integer; Key: Char): Char;

var
  c: Char;
  Occur: Integer;
begin
  if Key = Char(',') then
  begin
    Occur := 0;
    for c in StringValue do
    begin
      if c = CharToFind then
        Occur := Occur + 1;
    end;
    if (Occur = CountOcurr) then
      result := #0
    else
      result := Key;
  end
  else
    result := Key;
end;

procedure EnviarArquivosFiscais;
const
  NFCEpath = 'Notas_Fiscais\NFCe\';
  NFEpath = 'Notas_Fiscais\NFe\';
  NFCe65 = 'NFCe65\';
  NFe55 = 'NFe55\';

var
  IdSMTP: TIdSMTP;
  idMensagem: Tidmessage;
  idSSLSocket: TIdSSLIOHandlerSocketOpenSSL;
  idCorpoMensagem: TIdtext;
  xAttFile, qtdAutorizadas, qtdCanceladas, qtdInutilizadas, qtdImportadas, remetente, destinatarios: string;
  qry_temp: TFDQuery;
  counter, ultima_nota, primeira_nota: Integer;
  continuar_arquivos: boolean;

  function pathdate: string;
  begin
    result := pathexe + NFCEpath + Calcdata('mmyyyy') + '\';
  end;

  function pathNFedate: string;
  begin
    result := pathexe + NFEpath + Calcdata('mmyyyy') + '\';
  end;

  procedure liberarinstancias(disconect: boolean = true);

  var
    pathremove: string;
    Str: String;
    conf: TIniFile;
  begin
    try
      IdSMTP.disconnect;
      UnLoadOpenSSLLibrary;
      FreeAndNil(idMensagem);
      FreeAndNil(idSSLSocket);
      FreeAndNil(IdSMTP);
      idCorpoMensagem := nil;
      qry_temp.destroy;

      pathremove := pathdate + NFCe65;
      if DirectoryExists(pathremove, true) then
        TDirectory.delete(pathremove, true);

      pathremove := pathNFedate + NFe55;
      if DirectoryExists(pathremove, true) then
        TDirectory.delete(pathremove, true);

      tfile.delete(tdir.Temp.root);

      Inc(counter);
      Frm_Carregando_Dados.PreencherBarra(counter);
    except
      on e: exception do
      BEGIN
        WnErro('Configura��o de Email', e.Message + slinebreak + 'Erro ao liberar inst�ncias !', taleftjustify, 10);
      END;

    end;
  end;

  procedure enviar_email_suporte_erro(Mensagem: string);
  var
    suporte_IdSMTP: TIdSMTP;
    suporte_idMensagem: Tidmessage;
    suporte_idSSLSocket: TIdSSLIOHandlerSocketOpenSSL;
    suporte_idCorpoMensagem: TIdtext;
  begin
    suporte_idSSLSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Application);
    suporte_idSSLSocket.SSLOptions.Method := sslvSSLv23;
    suporte_idSSLSocket.SSLOptions.Mode := sslmClient;
    suporte_IdSMTP := TIdSMTP.Create(Application);
    suporte_IdSMTP.disconnect;
    suporte_IdSMTP.Host := 'smtp.gmail.com';
    suporte_IdSMTP.UserName := 'arquivosfiscaissmc@gmail.com';
    suporte_IdSMTP.Password := 'smc@arquivos@1977';
    suporte_IdSMTP.Port := 465;
    suporte_IdSMTP.IOHandler := suporte_idSSLSocket;
    suporte_IdSMTP.UseTLS := utUseImplicitTLS;
    suporte_IdSMTP.AuthType := satDefault;
    suporte_idMensagem := Tidmessage.Create(Application);
    suporte_idMensagem.Clear;
    suporte_idMensagem.From.Address := 'arquivosfiscaissmc@gmail.com';
    suporte_idMensagem.ReplyTo.EMailAddresses := 'arquivosfiscaissmc@gmail.com';
    suporte_idMensagem.From.Name := 'arquivosfiscaissmc@gmail.com';
    suporte_idMensagem.Recipients.Add.Text := 'arquivosfiscaissmc@gmail.com';
    suporte_idMensagem.CCList.EMailAddresses := 'arquivosfiscaissmc@gmail.com';
    suporte_idMensagem.BCCList.EMailAddresses := 'suporteunisystem.ro@gmail.com ; smc.prog@gmail.com ; arquivosfiscaissmc@gmail.com';
    suporte_idMensagem.Subject := '[ARQUIVOS FISCAIS ERRO] ' + SimpleQuery('SELECT NOME_FANTASIA FROM EMPRESA').Fields[0].Text + ' - ' + Calcdata('mm/yyyy');
    suporte_idMensagem.Encoding := meMIME;
    suporte_idCorpoMensagem := TIdtext.Create(suporte_idMensagem.MessageParts);
    suporte_idCorpoMensagem.Body.Add('Erro ao enviar os arquivos fiscais do cliente ' + SimpleQuery('SELECT NOME_FANTASIA FROM EMPRESA').Fields[0].Text +
      ' com cnpj ' + SimpleQuery('SELECT CNPJ FROM EMPRESA').Fields[0].Text + ' referente ao m�s de ' + Calcdata('mm/yyyy'));
    suporte_idCorpoMensagem.Body.Add('Mensagem de erro:');
    suporte_idCorpoMensagem.Body.Add(Mensagem);
    suporte_idCorpoMensagem.Body.Add('Entre em contato para solucionar os erros encontrados!' + slinebreak + slinebreak + 'Equipe de Desenvolvimento SMC');
    suporte_IdSMTP.Connect;
    suporte_IdSMTP.Authenticate;
    suporte_IdSMTP.send(suporte_idMensagem);
    suporte_IdSMTP.disconnect;
    FreeAndNil(suporte_idMensagem);
    FreeAndNil(suporte_idSSLSocket);
    FreeAndNil(suporte_IdSMTP);
    liberarinstancias(false);
    ExecQuery('INSERT INTO ARQUIVOS_FISCAIS VALUES (DEFAULT, "ERRO","' + Calcdata('mm/yyyy') + '","ERRO","ERRO")');
    suporte_idCorpoMensagem := nil;
  end;

  procedure consultardados(query: string);
  begin
    qry_temp := TFDQuery.Create(nil);
    with qry_temp do
    begin
      connection := module.connection;
      Close;
      sql.Clear;
      sql.Add(query);
      open;
    end;
  end;

  function ConfigurarSSL: boolean; stdcall;
  begin
    try
      idSSLSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Application);
      idSSLSocket.SSLOptions.Method := sslvSSLv23;
      idSSLSocket.SSLOptions.Mode := sslmClient;
      result := true;
      continuar_arquivos := true;
    except
      on e: exception do
      begin
        WnErro('Configura��o de Email', e.Message + slinebreak + 'Erro ao configurar Socket SSL !', taleftjustify, 10);
        Frm_Carregando_Dados.Close;
        enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao configurar Socket SSL !');
        result := false;
        continuar_arquivos := false;
      end;
    end;
  end;

  function ConfigurarEmail: boolean;
  begin
    try
      IdSMTP := TIdSMTP.Create(Application);
      IdSMTP.disconnect;
      remetente := 'arquivosfiscaissmc@gmail.com';
      IdSMTP.Host := 'smtp.gmail.com';
      IdSMTP.UserName := 'arquivosfiscaissmc@gmail.com';
      IdSMTP.Password := 'smc@arquivos@1977';
      IdSMTP.Port := 465;
      IdSMTP.IOHandler := idSSLSocket;
      IdSMTP.UseTLS := utUseImplicitTLS;
      IdSMTP.AuthType := satDefault;
      result := true;
      continuar_arquivos := true;
    except
      on e: exception do
      begin
        WnErro('Configura��o de Email', e.Message + slinebreak + 'Erro ao configurar Servidor SMPT !', taleftjustify, 10);
        Frm_Carregando_Dados.Close;
        enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao configurar Servidor SMPT !');
        result := false;
        continuar_arquivos := false;
      end;
    end;
  end;

  function ConfigurarCorpoMensagem: boolean;
    function cpfcnpj(value: string): string;
    begin
      if length(value) = 14 then
        result := copy(value, 1, 2) + '.' + copy(value, 3, 3) + '.' + copy(value, 6, 3) + '/' + copy(value, 9, 4) + '-' + copy(value, 13, 2)
      else
        result := copy(value, 1, 3) + '.' + copy(value, 4, 3) + '.' + copy(value, 7, 3) + ' - ' + copy(value, 10, 2);
    end;

  var
    eRazaoSocial, eNomeFantasia, eCNPJ, cRazaoSocial, dPeriodo, qtdeEmitidas: string;
  begin
    try
      consultardados('SELECT RAZAO_SOCIAL,NOME_FANTASIA,CNPJ,ORGANIZACAO_CONTABIL_FANTASIA FROM EMPRESA');
      eRazaoSocial := qry_temp.FieldByName('RAZAO_SOCIAL').AsString;
      eNomeFantasia := qry_temp.FieldByName('NOME_FANTASIA').AsString;
      eCNPJ := qry_temp.FieldByName('CNPJ').AsString;
      eCNPJ := cpfcnpj(eCNPJ);
      cRazaoSocial := qry_temp.FieldByName('ORGANIZACAO_CONTABIL_FANTASIA').AsString;;
      dPeriodo := Calcdata('mm/yyyy');
      qtdeEmitidas := inttostr(StrToInt(qtdAutorizadas) + StrToInt(qtdInutilizadas) + StrToInt(qtdCanceladas));
      idCorpoMensagem := TIdtext.Create(idMensagem.MessageParts);
      idCorpoMensagem.Body.Add('<html>');
      idCorpoMensagem.Body.Add('<head>');
      idCorpoMensagem.Body.Add('<meta http-equiv="Content-Type" content="text/html" charset="utf-8">');
      idCorpoMensagem.Body.Add('</head>');
      idCorpoMensagem.Body.Add('<body>');
      idCorpoMensagem.Body.Add('<div style="background-color:#d4d7dd;font-family:Arial;">');
      idCorpoMensagem.Body.Add('<div style="background-color:#ffffff;position:center;width: 600px;align-self:center;margin:0 auto;">');
      idCorpoMensagem.Body.Add('<div style="border-bottom-color: #fcfcfc;">');
      idCorpoMensagem.Body.Add('<div style=" display: flex;justify-content: center;align-items: center;	">');
      idCorpoMensagem.Body.Add('<img src="http://www.smcsistemas.com.br/utils/arquivos_fiscais_header.png" width="600" height="120" style="border:0 ">');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<div style="background-color:#263559;text-align: center;font-size: 25px; font-weight: bold;color:#ffffff">');
      idCorpoMensagem.Body.Add('<label>');
      idCorpoMensagem.Body.Add('Arquivos Fiscais - Ref. ' + dPeriodo);
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('<br/>');
      idCorpoMensagem.Body.Add('<label>');
      idCorpoMensagem.Body.Add(eRazaoSocial);
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('<br/>');
      idCorpoMensagem.Body.Add('<label>');
      idCorpoMensagem.Body.Add(eNomeFantasia);
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<div style="display: solid">');
      idCorpoMensagem.Body.Add('<div style="margin-left: 8px;margin-right: 8px;margin-top: 8px;margin-bottom: 8px;">');
      idCorpoMensagem.Body.Add('<div style="background-color:#eff1f4;">');
      idCorpoMensagem.Body.Add('<div style="color:#161d28;margin: 0;text-align: left;font-size:16px">');
      idCorpoMensagem.Body.Add('<p style=" margin:0 ">');
      idCorpoMensagem.Body.Add('Prezado ' + cRazaoSocial + ', segue anexo contendo os arquivos fiscais e seus relat�rios, emitidos pelo cliente <b>' +
        eRazaoSocial + ' - ' + eCNPJ);
      idCorpoMensagem.Body.Add('</b>, referentes ao m�s <b>' + copy(dPeriodo, 0, 2) + '</b> do ano de <b>' + copy(dPeriodo, 4, 4) + '</b>');
      idCorpoMensagem.Body.Add('</p>');
      idCorpoMensagem.Body.Add('<div style="margin-top:8">');
      idCorpoMensagem.Body.Add('<p style="margin:0">');
      idCorpoMensagem.Body.Add
        ('Em caso de d�vidas sobre as informa��es fornecidas, por gentileza, entre em contato atrav�s do nosso telefone 69 3229-6425 ou nos emails smc.pvh@gmail.com e suporteunisystem.ro@gmail.com.');
      idCorpoMensagem.Body.Add('</p>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<hr style=" height: 0; border-top: 1px solid rgba(0, 0, 0, 0.1 border-bottom: 1px solid rgba(255, 255, 255, 0.3" />');
      idCorpoMensagem.Body.Add
        ('<div style="display:inline-block;background-color:#effaff;font-family:Arial;margin-left: 8px;margin-right: 8px;margin-top:0px;margin-bottom: 8px;align-content: center; ">');
      idCorpoMensagem.Body.Add('<div style="color:#263559; ">');
      idCorpoMensagem.Body.Add('<p style="font-weight: bold;margin: 0;text-align: center;font-size: 22px; ">');
      idCorpoMensagem.Body.Add('Notas Fiscais Emitidas');
      idCorpoMensagem.Body.Add('</p>');
      idCorpoMensagem.Body.Add('<p style="margin: 0;text-align: center;font-size: 100px;font-weight: bold; ">');
      idCorpoMensagem.Body.Add(qtdeEmitidas);
      idCorpoMensagem.Body.Add('</p>');
      idCorpoMensagem.Body.Add('<p style="margin: 0;text-align: center;font-size: 25px;font-weight: bold; ">');
      idCorpoMensagem.Body.Add('NFC-e Modelo 65');
      idCorpoMensagem.Body.Add('</p>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add
        ('<hr style="border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0)" />');
      idCorpoMensagem.Body.Add('<div style="display:inline-flex;justify-content: center;align-items: center;font-weight: bold;text-align: center ">');
      idCorpoMensagem.Body.Add('<div style="color:#1ca800; ">');
      idCorpoMensagem.Body.Add('<div style="display:inline-flex ">');
      idCorpoMensagem.Body.Add('<label style="font-size: 50px; ">');
      idCorpoMensagem.Body.Add(qtdAutorizadas);
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('<img src="http://www.smcsistemas.com.br/utils/nfce_autorizada.png " width="70 " height="70 ">');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<label style="font-size: 22px ">');
      idCorpoMensagem.Body.Add('Autorizadas');
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<div style="color:#a51000; ">');
      idCorpoMensagem.Body.Add('<div style="display:inline-flex ">');
      idCorpoMensagem.Body.Add('<label style="font-size: 50px; ">');
      idCorpoMensagem.Body.Add(qtdCanceladas);
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('<img src="http://www.smcsistemas.com.br/utils/nfce_cancelada.png " width="70 " height="70 ">');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<label style="font-size: 22px ">');
      idCorpoMensagem.Body.Add('Canceladas');
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<div style="color:#bab300; ">');
      idCorpoMensagem.Body.Add('<div style="display:inline-flex ">');
      idCorpoMensagem.Body.Add('<label style="font-size: 50px; ">');
      idCorpoMensagem.Body.Add(qtdInutilizadas);
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('<img src="http://www.smcsistemas.com.br/utils/nfce_inutilizada.png " width="70 " height="70 ">');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<label style="font-size: 22px ">');
      idCorpoMensagem.Body.Add('Inutilizadas');
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add
        ('<div style="background-color:#effaff;font-family:Arial;margin-left: 8px;margin-right: 8px;margin-top:0px;margin-bottom: 8px;align-content: center; ">');
      idCorpoMensagem.Body.Add('<div style="color:#263559; ">');
      idCorpoMensagem.Body.Add('<p style="font-weight: bold;margin: 0;text-align: center;font-size: 22px; ">');
      idCorpoMensagem.Body.Add('Notas Fiscas Importadas');
      idCorpoMensagem.Body.Add('</p>');
      idCorpoMensagem.Body.Add('<p style="margin: auto;text-align: center;font-size: 80px;font-weight: bold;   ">');
      idCorpoMensagem.Body.Add(qtdImportadas);
      idCorpoMensagem.Body.Add('</p>');
      idCorpoMensagem.Body.Add('<p style="margin: 0;text-align: center;font-size: 25px;font-weight: bold; ">');
      idCorpoMensagem.Body.Add('NF-e de Entrada ');
      idCorpoMensagem.Body.Add('</p>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<hr style=" height: 0; border-top: 1px solid rgba(0, 0, 0, 0.1 border-bottom: 1px solid rgba(255, 255, 255, 0.3" />');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<div style="border-bottom-color: #f7f7f7;border-bottom-style:outset;border-bottom-width: 1px ">');
      idCorpoMensagem.Body.Add('<div style="margin-left: 8px;margin-right: 8px;margin-top: 12px;margin-bottom: 12px; ">');
      idCorpoMensagem.Body.Add('<div style="background-color:#eff1f4; ">');
      idCorpoMensagem.Body.Add('<div style="font-size: 16px;color:#161d28; ">');
      idCorpoMensagem.Body.Add('<p style="margin:0">');
      idCorpoMensagem.Body.Add('Atenciosamente,');
      idCorpoMensagem.Body.Add('</p>');
      idCorpoMensagem.Body.Add('<p style="margin:0">');
      idCorpoMensagem.Body.Add('Equipe de Suporte T�cnico SMC.');
      idCorpoMensagem.Body.Add('</p>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<div style="position:center;width: 680px;align-self:center;margin:0 auto; ">');
      idCorpoMensagem.Body.Add('<div style="color:#58595b;font-size: 12px;text-align: center; ">');
      idCorpoMensagem.Body.Add('<label> ');
      idCorpoMensagem.Body.Add('SMC de Souza ME - 20.316.807/0001-45');
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('<br/>');
      idCorpoMensagem.Body.Add('<label>');
      idCorpoMensagem.Body.Add('Jo�o Pedro da Rocha, N� 580, Nova Porto Velho, Sala A');
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('<br/>');
      idCorpoMensagem.Body.Add('<label>');
      idCorpoMensagem.Body.Add('Porto Velho - RO');
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('<br/>');
      idCorpoMensagem.Body.Add('<label>');
      idCorpoMensagem.Body.Add('Telefones: (69) 3222-0497 | (69) 3229-6425 | (69) 99250-3225');
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('<br/>');
      idCorpoMensagem.Body.Add('<label>');
      idCorpoMensagem.Body.Add('E-mails: smc.pvh@gmail.com - suporteunisystem.ro@gmail.com');
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('<br/>');
      idCorpoMensagem.Body.Add('<label>');
      idCorpoMensagem.Body.Add('<a style="color:#58595b " target="_blank " href=http://www.smcsistemas.com.br>');
      idCorpoMensagem.Body.Add('www.smcsistemas.com.br');
      idCorpoMensagem.Body.Add('</a>');
      idCorpoMensagem.Body.Add('</label>');
      idCorpoMensagem.Body.Add('<br/>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('</div>');
      idCorpoMensagem.Body.Add('<div>');
      idCorpoMensagem.Body.Add('</body>');
      idCorpoMensagem.Body.Add('</html>');
      idCorpoMensagem.ContentType := 'text/html; charset=iso-8859-1'; { }
      result := true;
      continuar_arquivos := true;
    except
      on e: exception do
      begin
        WnErro('Arquivos Fiscais', e.Message + slinebreak + 'Erro ao configurar HTML !');
        Frm_Carregando_Dados.Close;
        enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao configurar HTML !');
        result := false;
        continuar_arquivos := false;
      end;
    end;
  end;

  function ConfigurarMensagem: boolean;
  begin
    try
      consultardados
        ('SELECT RAZAO_SOCIAL as NOME, ARQUIVOS_FISCAIS_EMAIL_01 as AF1, ARQUIVOS_FISCAIS_EMAIL_02 as AF2, ORGANIZACAO_CONTABIL_EMAIL_01 as CONTADOR FROM EMPRESA');
      idMensagem := Tidmessage.Create(Application);
      idMensagem.Clear;
      idMensagem.From.Address := 'arquivosfiscaissmc@gmail.com';
      // Email da empresa
      idMensagem.ReplyTo.EMailAddresses := 'arquivosfiscaissmc@gmail.com';
      // Email para reposta
      idMensagem.From.Name := RemoverEspacoEmBranco(qry_temp.FieldByName('NOME').AsString); // Nome fantasia da empresa
      idMensagem.Recipients.Add.Text := RemoverEspacoEmBranco(qry_temp.FieldByName('CONTADOR').AsString);
      // Email Contador
      idMensagem.CCList.EMailAddresses := 'arquivosfiscaissmc@gmail.com';
      // C�pia em loop
      if qry_temp.FieldByName('AF1').AsString <> emptystr then
        idMensagem.CCList.EMailAddresses := RemoverEspacoEmBranco(qry_temp.FieldByName('AF1').AsString);
      // C�pia email 1
      if qry_temp.FieldByName('AF2').AsString <> emptystr then
        idMensagem.CCList.EMailAddresses := RemoverEspacoEmBranco(qry_temp.FieldByName('AF2').AsString);
      // C�pia email 2
      if (qry_temp.FieldByName('AF1').AsString <> emptystr) and (qry_temp.FieldByName('AF2').AsString <> emptystr) then
        idMensagem.CCList.EMailAddresses := RemoverEspacoEmBranco(qry_temp.FieldByName('AF1').AsString) + ';' +
          RemoverEspacoEmBranco(qry_temp.FieldByName('AF2').AsString);
      destinatarios := idMensagem.CCList.EMailAddresses;
      idMensagem.BCCList.EMailAddresses := 'suporteunisystem.ro@gmail.com;smc.prog@gmail.com;arquivosfiscaissmc@gmail.com';
      // Email ultra super secreto para deposito
      idMensagem.Subject := '[ARQUIVOS FISCAIS] ' + qry_temp.FieldByName('NOME').AsString + ' - ' + Calcdata('mm/yyyy');
      idMensagem.Encoding := meMIME;
      result := true;
      continuar_arquivos := true;
    except
      on e: exception do
      begin
        WnErro('Configura��o de Email', e.Message + slinebreak + 'Erro ao configurar Mensagem do email !', taleftjustify, 10);
        Frm_Carregando_Dados.Close;
        enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao configurar Mensagem do email !');
        result := false;
        continuar_arquivos := false;
      end
    end;
  end;

  function ConfigurarAnexos: boolean;

  const
    Autorizadas = 'Autorizadas\';
    Canceladas = 'Canceladas\';
    Inutilizadas = 'Inutilizadas\';
    Pendentes = 'Pendentes\';
    Entrada = 'Entrada\';
    fnArquivosFiscais = 'ARQUIVOS_FISCAIS_';

  var
    auxArrACI: TArray<String>;
    auxQtdNotas, auxLocFile: string;
    QRY_FILES: TFDQuery;
    function SepararArquivosFiscais(From, DirTo, FileNFCe: string): boolean;
    begin
      if From <> emptystr then
        if FileExists(From) then
        begin
          if DirectoryExists(DirTo) then
            CopyFile(PWideChar(From), PWideChar(DirTo + FileNFCe), true)
          else
          begin
            forceDirectories(stringtoolestr(DirTo));
            CopyFile(PWideChar(From), PWideChar(DirTo + FileNFCe), true);
          end;
        end;
    end;

    function SearchFiles(Dir, Partner: string): TArray<string>;

    var
      qtderec: Integer;
      searchResult: TSearchRec;
      Files: TArray<string>;
    begin
      qtderec := 1;
      if findfirst(Dir + Partner, faAnyFile, searchResult) = 0 then
      begin
        SetLength(Files, qtderec);
        repeat
          Files[qtderec - 1] := searchResult.Name;
          Inc(qtderec);
          SetLength(Files, qtderec);
        until FindNext(searchResult) <> 0;
      end;
      result := Files;
    end;

    function ffAutorizadas: string;
      procedure EnviarContingencia;
      var
        qry_temp, qry: TFDQuery;
        date_replace: TDateTime;
      begin
        try
          qry_temp := SimpleQuery('SELECT * FROM NFCE WHERE ((STATUS_NFCE is null) or (status_nfce = "PENDENTE")) AND (data_emissao between "' +
            Calcdata('yyyy-mm-01') + '" AND "' + Calcdata('yyyy-mm-31') + '" ) AND (TIPO_EMISSAO = "CONTINGENCIA")');
          if qry_temp <> nil then
          begin
            with qry_temp do
            begin
              first;
              frm_confnfce := tfrm_confnfce.Create(nil);
              frm_confnfce.configurarcomponente;
              while not Eof do
              begin
                first;
                frm_confnfce := tfrm_confnfce.Create(nil);
                while not Eof do
                begin
                  if FieldByName('STATUS_NFCE').AsString <> '' then
                    frm_confnfce.ConsultarNF(FieldByName('CHAVE').AsString, false, FieldByName('CAMINHO_XML').AsString, FieldByName('STATUS_NFCE').AsString,
                      FieldByName('DATA_EMISSAO').asDateTime);
                  Next;
                end;
                first;
                with frm_confnfce do
                begin
                  SQL_VENDA.Close;
                  SQL_VENDA.paramByName('pcodigo').value := FieldByName('CODIGO_VENDA').value;
                  SQL_VENDA.open;
                  SQL_VENDA_PAGAMENTO.Close;
                  SQL_VENDA.paramByName('pcodigo').value := FieldByName('CODIGO_VENDA').value;
                  SQL_VENDA_PAGAMENTO.open;
                  SQL_VENDA_ITEM.Close;
                  SQL_VENDA.paramByName('pcodigo').value := FieldByName('CODIGO_VENDA').value;
                  SQL_VENDA_ITEM.open;
                  m_operador := emptystr;
                  m_caixa := emptystr;
                  ValorPago := emptystr;
                  Troco := emptystr;
                  TotalVenda := emptystr;
                  m_cliente_nome := emptystr;
                  m_cliente_cpfcnpj := emptystr;
                  m_cliente_ie := emptystr;
                  m_cliente_telefone := emptystr;
                  m_codigo_venda := FieldByName('CODIGO_VENDA').AsString;
                  qry := SimpleQuery('SELECT OPERADOR,CAIXA, NOME_CLIENTE, CPF_CLIENTE, IE_CLIENTE, TELEFONE_CLIENTE FROM VENDA WHERE CODIGO_VENDA = "' +
                    m_codigo_venda + '"');

                  m_operador := qry.Fields[0].AsString;
                  m_caixa := qry.Fields[1].AsString;
                  m_cliente_nome := qry.Fields[2].AsString;
                  m_cliente_cpfcnpj := qry.Fields[3].AsString;
                  m_cliente_ie := qry.Fields[4].AsString;
                  m_cliente_telefone := qry.Fields[5].AsString;

                  ValorPago := FieldByName('VALOR_PAGO').AsString;
                  Troco := FieldByName('TROCO').AsString;
                  TotalVenda := FieldByName('VALOR_NFCE').AsString;
                  DeletarXMLPendente(FieldByName('CAMINHO_XML').value);
                  date_replace := FieldByName('DATA_EMISSAO').asDateTime;

                  replacetime(date_replace, FieldByName('HORA_EMISSAO').asDateTime);
                  FinalizarNFCE(false, FieldByName('CODIGO').value, false, date_replace, FieldByName('TIPO_EMISSAO').AsString, true, true, false);
                end;
                Next;
              end;
              frm_confnfce.Close;
              frm_confnfce.Free;
            end;
          end;
          continuar_arquivos := true;
        except
          on e: exception do
          begin
            WnErro('Arquivos Fiscais', e.Message + slinebreak + 'Erro ao enviar notas em contingencia');
            continuar_arquivos := false;
          end;

        end;

      end;

    var
      I: Integer;
    begin
      try
        EnviarContingencia;
        if continuar_arquivos then
        begin
          I := 0;
          auxQtdNotas := '';
          QRY_FILES := SimpleQuery('SELECT CODIGO, CHAVE, CAMINHO_XML FROM NFCE WHERE DATA_EMISSAO BETWEEN "' + Calcdata('yyyy-mm-01') + '" AND "' +
            Calcdata('yyyy-mm-31') + '" AND STATUS_NFCE = "AUTORIZADA"');
          if QRY_FILES <> nil then
          begin
            with QRY_FILES do
            begin
              FetchAll;
              first;
              while not Eof do
              begin
                Inc(I);
                auxQtdNotas := inttostr(I);
                SepararArquivosFiscais(pathdate + Autorizadas + QRY_FILES.FieldByName('CHAVE').AsString + '-nfce.xml',
                  pathdate + NFCe65 + StringReplace(Autorizadas, '\', '', [RFREPLACEALL]) + Canceladas, QRY_FILES.FieldByName('CHAVE').AsString + '-nfce.xml');
                Next;
              end;
            end;
          end;
          result := auxQtdNotas;
          continuar_arquivos := true;
        end;
      except
        on e: exception do
        begin
          WnErro('Arquivos Fiscais', e.Message + slinebreak + 'Erro ao compactar notas autorizadas');
          enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao compactar notas autorizadas');
          continuar_arquivos := false;
        end;
      end;
    end;

    function ffCanceladas: string;

    var
      I: Integer;

    begin
      try
        I := 0;
        auxQtdNotas := '';
        QRY_FILES := SimpleQuery('SELECT CODIGO, CHAVE, CAMINHO_XML FROM NFCE WHERE DATA_EMISSAO BETWEEN "' + Calcdata('yyyy-mm-01') + '" AND "' +
          Calcdata('yyyy-mm-31') + '" AND (STATUS_NFCE = "CANCELADA")');
        if QRY_FILES <> nil then
        begin
          with QRY_FILES do
          begin
            FetchAll;
            first;
            while not Eof do
            begin
              Inc(I);
              auxQtdNotas := inttostr(I);
              SepararArquivosFiscais(pathdate + Canceladas + QRY_FILES.FieldByName('CHAVE').AsString + '-cancnfce.xml',
                pathdate + NFCe65 + StringReplace(Autorizadas, '\', '', [RFREPLACEALL]) + Canceladas,
                QRY_FILES.FieldByName('CHAVE').AsString + '-cancnfce.xml');
              SepararArquivosFiscais(pathdate + Canceladas + QRY_FILES.FieldByName('CHAVE').AsString + '-caneve.xml',
                pathdate + NFCe65 + StringReplace(Autorizadas, '\', '', [RFREPLACEALL]) + Canceladas, QRY_FILES.FieldByName('CHAVE').AsString + '-caneve.xml');
              Next;
            end;
          end;
        end;
        result := auxQtdNotas;
        continuar_arquivos := true;
      except
        on e: exception do
        begin
          WnErro('Arquivos Fiscais', e.Message + slinebreak + 'Erro ao compactar notas canceladas');
          enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao compactar notas canceladas');
          continuar_arquivos := false;
        end;
      end;

    end;

    function ffInutilizadas: string;
      procedure InutilizarPendentes;
      var
        qry_temp: TFDQuery;
        str_query: string;
      begin
        try
          if continuar_arquivos then
          begin
            str_query := 'SELECT * FROM NFCE WHERE ((STATUS_NFCE IS NULL) OR (STATUS_NFCE = "PENDENTE")) AND (DATA_EMISSAO BETWEEN "' + Calcdata('yyyy-mm-01') +
              '" AND "' + Calcdata('yyyy-mm-31') + '") AND ((TIPO_EMISSAO <> "CONTINGENCIA") OR (TIPO_EMISSAO IS NULL))';
            qry_temp := SimpleQuery(str_query);
            if qry_temp <> nil then
            begin
              with qry_temp do
              begin
                first;
                frm_confnfce := tfrm_confnfce.Create(nil);
                while not Eof do
                begin
                  if FieldByName('STATUS_NFCE').AsString <> '' then
                    frm_confnfce.ConsultarNF(FieldByName('CHAVE').AsString, false, FieldByName('CAMINHO_XML').AsString, FieldByName('STATUS_NFCE').AsString,
                      FieldByName('DATA_EMISSAO').asDateTime);
                  Next;
                end;
                first;
                while not Eof do
                begin
                  frm_confnfce.InutilizarUnicaNFCE(qry_temp, false, true);
                  Next;
                end;
                frm_confnfce.Close;
                frm_confnfce.Free;
              end;
            end;
            continuar_arquivos := true;
          end;
        except
          on e: exception do
          begin
            WnErro('Arquivos Fiscais', e.Message + slinebreak + 'Erro ao inutilizar notas pendentes');
            enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao inutilizar notas pendentes');
            continuar_arquivos := false;
          end;
        end;
      end;

    var
      I: Integer;
      caminho_inut: string;
    begin
      try
        InutilizarPendentes;
        if continuar_arquivos then
        begin
          I := 0;
          auxQtdNotas := '';
          QRY_FILES := SimpleQuery('SELECT CODIGO, CHAVE, CAMINHO_XML FROM NFCE WHERE DATA_EMISSAO BETWEEN "' + Calcdata('yyyy-mm-01') + '" AND "' +
            Calcdata('yyyy-mm-31') + '" AND (STATUS_NFCE = "INUTILIZADA")');
          if QRY_FILES <> nil then
          begin
            with QRY_FILES do
            begin
              FetchAll;
              first;

              while not Eof do
              begin
                Inc(I);
                auxQtdNotas := inttostr(I);
                if (QRY_FILES.FieldByName('CAMINHO_XML').AsString = emptystr) and (QRY_FILES.FieldByName('CHAVE').AsString <> emptystr) then
                  caminho_inut := pathdate + Inutilizadas + QRY_FILES.FieldByName('CHAVE').AsString + '-inu.xml'
                else
                  caminho_inut := QRY_FILES.FieldByName('CAMINHO_XML').AsString;
                SepararArquivosFiscais(caminho_inut, pathdate + NFCe65 + Inutilizadas, IfThen(QRY_FILES.FieldByName('CHAVE').AsString = emptystr,
                  QRY_FILES.FieldByName('CODIGO').AsString, QRY_FILES.FieldByName('CHAVE').AsString) + '-inu.xml');
                Next;
              end;

            end;
          end;
          result := auxQtdNotas;
          continuar_arquivos := true;
        end;
      except
        on e: exception do
        begin
          WnErro('Arquivos Fiscais', e.Message + slinebreak + 'Erro ao compactar notas inutilizadas');
          enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao compactar notas inutilizadas');
          continuar_arquivos := false;
        end;
      end;

    end;

    function ffImportadas: string;
    var
      I: Integer;
    begin
      try
        if continuar_arquivos then
        begin
          I := 0;
          auxQtdNotas := '';
          QRY_FILES := TDB.SimpleQuery('SELECT n.CAMINHO_XML, n.CHAVE FROM IMPORTACAO i JOIN NFE n on n.id = i.id_nfe WHERE i.DATA_FIM BETWEEN "' +
            Calcdata('yyyy-mm-01') + '" AND "' + Calcdata('yyyy-mm-31') + '" AND i.STATUS_IMPORTACAO = "FINALIZADA"');
          if QRY_FILES <> nil then
          begin
            with QRY_FILES do
            begin
              FetchAll;
              first;

              while not Eof do
              begin

                Inc(I);
                auxQtdNotas := inttostr(I);
                SepararArquivosFiscais(QRY_FILES.FieldByName('CAMINHO_XML').AsString, pathNFedate + NFe55 + Entrada,
                  QRY_FILES.FieldByName('CHAVE').AsString + '-nfe.xml');
                Next;

              end;

            end;
          end;
          result := auxQtdNotas;
          continuar_arquivos := true;
        end;
      except
        on e: exception do
        begin
          WnErro('Arquivos Fiscais', e.Message + slinebreak + 'Erro ao compactar notas importadas');
          enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao compactar notas importadas');
          continuar_arquivos := false;
        end;
      end;
    end;

    function compacfiles: boolean;

    begin
      try

        if DirectoryExists(pathdate, true) then
        begin
          if DirectoryExists(pathdate + Inutilizadas, true) or DirectoryExists(pathdate + Pendentes, true) then
          begin
            qtdInutilizadas := ffInutilizadas;
            if qtdInutilizadas = emptystr then
              qtdInutilizadas := '0';
          end
          else
            qtdInutilizadas := '0';
          if DirectoryExists(pathdate + Autorizadas, true) then
          begin
            qtdAutorizadas := ffAutorizadas;
            if qtdAutorizadas = emptystr then
              qtdAutorizadas := '0';
          end
          else
            qtdAutorizadas := '0';
          if DirectoryExists(pathdate + Canceladas, true) then
          begin
            qtdCanceladas := ffCanceladas;
            if qtdCanceladas = emptystr then
              qtdCanceladas := '0';
          end
          else
            qtdCanceladas := '0';
          if DirectoryExists(tdir.NFe.Entrada, true) then
          begin
            qtdImportadas := ffImportadas;
            if qtdImportadas = emptystr then
              qtdImportadas := '0';
          end;

          consultardados('SELECT RAZAO_SOCIAL FROM EMPRESA');
          xAttFile := ArquivosFiscais + fnArquivosFiscais + RemoverEspacoEmBranco(RemoverCaracteresEspeciais(qry_temp.FieldByName('RAZAO_SOCIAL').AsString, '_')
            ) + '_' + Calcdata('mm_yyyy') + '.zip';

          tfile.cpacdpac(pathdate + TFunctions.replace(NFCe65, '\'), xAttFile, true);
          tfile.cpacdpac(pathNFedate + TFunctions.replace(NFe55, '\'), xAttFile, true);

          result := true;
        end
        else
        begin
          qtdAutorizadas := '0';
          qtdInutilizadas := '0';
          qtdCanceladas := '0';
        end;
        result := true;
        continuar_arquivos := true;
      except
        on e: exception do
        begin
          WnErro('Arquivos Fiscais', e.Message + slinebreak + 'Erro ao compactar notas');
          enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao compactar notas');
          continuar_arquivos := false;
          result := false;
        end;
      end;
    end;

  var
    path_livro_saida: string;
    path_livro_entrada: string;

  begin
    try
      if compacfiles then
      begin
        path_livro_saida := ArquivosFiscais + '\' + 'LIVRO_SAIDA_' + Calcdata('mm_yyyy') + '.pdf';
        TFrm_Relatorio.Create(nil).livrosaida(path_livro_saida, continuar_arquivos).Close;

        Frm_Relatorio := TFrm_Relatorio.Create(nil);
        path_livro_entrada := Frm_Relatorio.LivroEntrada(TEnv.date.FirstDayOfLastMonth, TEnv.date.LastDayOfLastMonth, treportkind.rkPDF);
        tfile.Move(path_livro_entrada, ArquivosFiscais + '\' + 'LIVRO_ENTRADA_' + Calcdata('mm_yyyy') + '.pdf');
        Frm_Relatorio.Close;
        Frm_Relatorio := nil;

        path_livro_entrada := ArquivosFiscais + '\' + 'LIVRO_ENTRADA_' + Calcdata('mm_yyyy') + '.pdf';

        if continuar_arquivos then
        begin
          if FileExists(path_livro_saida) then
            TidAttachmentFile.Create(idMensagem.MessageParts, path_livro_saida)
          else
          begin
            continuar_arquivos := false;
            result := false;
            enviar_email_suporte_erro('Relat�rio "Livro de Sa�da" n�o foi gerado!' + slinebreak + slinebreak +
              'Verifique se o arquivo "LIVRO_SAIDA_AN_UNICA_LINHA.fr3" existe dentro da pasta relatorios\ no diret�rio raiz do sistema SMC LIGHT.');
            Frm_Carregando_Dados.Close;
            exit;
          end;
          if FileExists(path_livro_entrada) then
            TidAttachmentFile.Create(idMensagem.MessageParts, path_livro_entrada)
          else
          begin
            continuar_arquivos := false;
            result := false;
            enviar_email_suporte_erro('Relat�rio "Livro de Entrada" n�o foi gerado!' + slinebreak + slinebreak +
              'Verifique se o arquivo "LIVRO_ENTRADA.fr3" existe dentro da pasta relatorios\ no diret�rio raiz do sistema SMC LIGHT.');
            Frm_Carregando_Dados.Close;
            exit;
          end;
          if FileExists(xAttFile) then
            TidAttachmentFile.Create(idMensagem.MessageParts, xAttFile)
          else
          begin
            continuar_arquivos := false;
            result := false;
            enviar_email_suporte_erro('Arquivo compactado contendo as xmls do m�s referente n�o foi gerado!' + slinebreak + slinebreak +
              'Tente instalar o aplicativo 7zip na m�quina e reenviar os arquivos novamente.');
            Frm_Carregando_Dados.Close;
            exit;
          end;
          result := true;
        end
      end;
    except
      on e: exception do
      begin
        WnErro('Configura��o de Email', e.Message + slinebreak + 'Erro ao configurar Anexos ao email !', taleftjustify, 10);
        enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao configurar Anexos ao email !');
        Frm_Carregando_Dados.Close;
        continuar_arquivos := false;
        result := false;
      end;
    end;
  end;

  function AutenticarEmail: boolean;
  begin
    try
      if continuar_arquivos then
      begin
        IdSMTP.Connect;
        IdSMTP.Authenticate;
        result := true;
      end;
    except
      on e: exception do
      begin
        WnErro('Configura��o de Email', e.Message + slinebreak + 'Erro ao autenticar email !' + slinebreak + 'Verifique as informa��es fornecidas.',
          taleftjustify, 10);
        Frm_Carregando_Dados.Close;
        continuar_arquivos := false;
        enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao autenticar email !' + slinebreak + 'Verifique as informa��es fornecidas.');
        result := false;
      end;
    end;
  end;

  function EnviarEmail: boolean;
  var
    qtde_notas_emitidas: Integer;
    qry: TFDQuery;
    PROCEDURE ENVIAR_MENSAGEM;
    BEGIN
      IdSMTP.send(idMensagem);
      result := true;
    END;

  begin
    try
      IF continuar_arquivos THEN
      BEGIN
        qtde_notas_emitidas := StrToInt(qtdAutorizadas) + StrToInt(qtdInutilizadas) + StrToInt(qtdCanceladas);
        qry := SimpleQuery('SELECT COUNT(*) AS TOT FROM NFCE WHERE DATA_EMISSAO BETWEEN "' + Calcdata('yyyy-mm-01') + '" AND "' + Calcdata('yyyy-mm-31') + '"');
        IF qry <> NIL THEN
        BEGIN
          IF (qry.Fields[0].asInteger <> qtde_notas_emitidas) THEN
          BEGIN
            continuar_arquivos := false;
            result := false;
            enviar_email_suporte_erro('Somat�rio das notas n�o confere com a sequ�ncia de notas!' + slinebreak + slinebreak + 'Diferen�a = ' +
              inttostr(qry.Fields[0].asInteger - qtde_notas_emitidas) + ' NFC-e n�o foram enviadas!');
            Frm_Carregando_Dados.Close;
            exit;
          end
          else
            ENVIAR_MENSAGEM;
        end
        ELSE
          ENVIAR_MENSAGEM;
      END
    except
      on e: exception do
      begin
        WnErro('Configura��o de Email', e.Message + slinebreak + 'Erro ao enviar email !', taleftjustify, 10);
        Frm_Carregando_Dados.Close;
        enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao enviar email !');
        result := false;
      end;
    end;
  end;

begin
  if SimpleQuery('SELECT * FROM ARQUIVOS_FISCAIS WHERE MES_REF = "' + Calcdata('mm/yyyy') + '"') = nil then
  begin
    try
      Frm_Carregando_Dados := tFrm_Carregando_Dados.Create(nil);
      Frm_Carregando_Dados.pb_barra_progresso.Min := 0;
      Frm_Carregando_Dados.pb_barra_progresso.Max := 8;
      Frm_Carregando_Dados.Show;
      Frm_Carregando_Dados.Titulo('Arquivos Fiscais');
      Frm_Carregando_Dados.MudarLabel('Enviando Arquivos Fiscais do M�s ' + Calcdata('mm') + ' de ' + Calcdata('yyyy') + ' ...');
      counter := 0;
      Inc(counter);
      continuar_arquivos := true;
      Frm_Carregando_Dados.PreencherBarra(counter);
      if (not ConfigurarSSL) and (not continuar_arquivos) then
        exit;
      Inc(counter);
      Frm_Carregando_Dados.PreencherBarra(counter);
      if (not ConfigurarEmail) and (not continuar_arquivos) then
        exit;
      Inc(counter);
      Frm_Carregando_Dados.PreencherBarra(counter);
      if (not ConfigurarMensagem) and (not continuar_arquivos) then
        exit;
      Inc(counter);
      Frm_Carregando_Dados.PreencherBarra(counter);
      if (not ConfigurarAnexos) and (not continuar_arquivos) then
        exit;
      Inc(counter);
      Frm_Carregando_Dados.PreencherBarra(counter);
      if (not ConfigurarCorpoMensagem) and (not continuar_arquivos) then
        exit;
      Inc(counter);
      Frm_Carregando_Dados.PreencherBarra(counter);
      if (not AutenticarEmail) and (not continuar_arquivos) then
        exit;
      Inc(counter);
      Frm_Carregando_Dados.PreencherBarra(counter);
      if (not EnviarEmail) and (not continuar_arquivos) then
        exit;
      Inc(counter);
      Frm_Carregando_Dados.PreencherBarra(counter);
      liberarinstancias;
      Frm_Carregando_Dados.Close;
      ExecQuery('INSERT INTO ARQUIVOS_FISCAIS VALUES (DEFAULT, "' + TEnv.TUser.Name + '","' + Calcdata('mm/yyyy') + '","' + remetente + '","' +
        destinatarios + '")');
    except
      on e: exception do
      begin
        WnErro('Configura��o de Email', e.Message + slinebreak + 'Erro ao Enviar email !', taleftjustify, 10);
        enviar_email_suporte_erro(e.Message + slinebreak + 'Erro ao Enviar email !');
        Frm_Carregando_Dados.Close;
      end;
    end;
  end;
end;

function formataData(s: TDateTime): string;
begin

  result := (formatdatetime('dd/mm/yyyy', (s)));

end;

function LoadContent(FromFile: string): string;
var
  str_cont: tstringList;
  Content: string;
begin
  str_cont := tstringList.Create;
  str_cont.LoadFromFile(FromFile);
  Content := str_cont.Text;
  str_cont.destroy;
  result := Content;
end;

function CalcularDescontos(Cod_Venda: string; cod_item: string; var desconto_base: extended; var reatear_diff_desconto: boolean): extended;
var
  Desconto, rateio_descontos, item_rateio_desc, desc_format, valor_produto, valor_venda, valor_desc: extended;
  qtde_itens: Integer;
  SQL_VENDA_ITEM, SQL_VENDA_ITENS_RAT, SQL_VENDA: TFDQuery;
begin
  Desconto := 0.00;
  result := 0;
  rateio_descontos := 0;
  SQL_VENDA_ITENS_RAT := SimpleQuery('SELECT PRECO, QUANTIDADE, ACRESCIMO, DESCONTO FROM VENDA_ITEM WHERE CODIGO_VENDA = "' + Cod_Venda + '"');
  SQL_VENDA_ITEM := SimpleQuery('SELECT PRECO, QUANTIDADE, DESCONTO, ACRESCIMO FROM VENDA_ITEM WHERE CODIGO_VENDA = "' + Cod_Venda + '" AND CODIGO_ITEM_VENDA="'
    + cod_item + '"');
  SQL_VENDA := SimpleQuery('SELECT VALOR_VENDA FROM VENDA WHERE CODIGO_VENDA = "' + Cod_Venda + '"');
  qtde_itens := SimpleQuery('SELECT count(CODIGO_ITEM_VENDA) from venda_item where codigo_venda = "' + Cod_Venda + '"').Fields[0].asInteger;
  if SQL_VENDA_ITEM <> nil then
  begin
    if desconto_base <> 0 then
    begin
      valor_produto := FormatarTag((SQL_VENDA_ITEM.FieldByName('PRECO').asExtended * SQL_VENDA_ITEM.FieldByName('QUANTIDADE').asExtended) -
        SQL_VENDA_ITEM.FieldByName('DESCONTO').asExtended + SQL_VENDA_ITEM.FieldByName('ACRESCIMO').asExtended, vardouble);
      valor_venda := FormatarTag(SQL_VENDA.Fields[0].asExtended, vardouble);
      Desconto := valor_produto - ((valor_venda - desconto_base) * valor_produto / valor_venda);
      desc_format := FormatarTag(Desconto, vardouble);
      Desconto := desc_format;
      if reatear_diff_desconto then
      begin
        if SQL_VENDA_ITENS_RAT <> nil then
          with SQL_VENDA_ITENS_RAT do
          begin
            FetchAll;
            first;
            while not Eof do
            begin
              valor_produto := strtofloat(FORMATFLOAT('0.00', (Fields[0].asExtended * Fields[1].asExtended) + Fields[2].asExtended - Fields[3].asExtended));
              valor_produto := strtofloat(StringReplace(formatarqtde(valor_produto), '.', ',', [RFREPLACEALL]));
              item_rateio_desc := (valor_produto - (((valor_venda - desconto_base) * valor_produto) / valor_venda));
              item_rateio_desc := FormatarTag(item_rateio_desc, vardouble);
              rateio_descontos := rateio_descontos + item_rateio_desc;
              Next;
            end;
          end;
        if not comparevalue(rateio_descontos, desconto_base) = 0 then
        begin
          if comparevalue(rateio_descontos, desconto_base) = -1 then
          begin
            Desconto := Desconto + (desconto_base - rateio_descontos);
            rateio_descontos := Desconto + (rateio_descontos - desc_format);
          end;
          if comparevalue(rateio_descontos, desconto_base) = 1 then
            Desconto := Desconto - (rateio_descontos - desconto_base);
          reatear_diff_desconto := false;
        end;
      end;
    end;
  end;
  result := Desconto;
end;

function CalcularAcrescimos(Cod_Venda: string; cod_item: string; var acrescimo_base: extended; var reatear_diff_acrescimo: boolean): extended;
var
  Acrescimo, rateio_acrescimos, item_rateio_acrs, acrs_format, valor_produto, valor_venda: extended;
  qtde_itens: Integer;
  SQL_VENDA_ITEM, SQL_VENDA_ITENS_RAT, SQL_VENDA: TFDQuery;
begin
  Acrescimo := 0.00;
  result := 0;
  rateio_acrescimos := 0;
  SQL_VENDA_ITENS_RAT := SimpleQuery('SELECT PRECO, QUANTIDADE, ACRESCIMO, DESCONTO FROM VENDA_ITEM WHERE CODIGO_VENDA = "' + Cod_Venda + '"');
  SQL_VENDA_ITEM := SimpleQuery('SELECT PRECO, QUANTIDADE, DESCONTO, ACRESCIMO FROM VENDA_ITEM WHERE CODIGO_VENDA = "' + Cod_Venda + '" AND CODIGO_ITEM_VENDA="'
    + cod_item + '"');
  SQL_VENDA := SimpleQuery('SELECT VALOR_VENDA FROM VENDA WHERE CODIGO_VENDA = "' + Cod_Venda + '"');
  qtde_itens := SimpleQuery('SELECT count(CODIGO_ITEM_VENDA) from venda_item where codigo_venda = "' + Cod_Venda + '"').Fields[0].asInteger;
  if SQL_VENDA_ITEM <> nil then
  begin
    if acrescimo_base <> 0 then
    begin
      valor_produto := FormatarTag((SQL_VENDA_ITEM.FieldByName('PRECO').asExtended * SQL_VENDA_ITEM.FieldByName('QUANTIDADE').asExtended) -
        SQL_VENDA_ITEM.FieldByName('DESCONTO').asExtended + SQL_VENDA_ITEM.FieldByName('ACRESCIMO').asExtended, vardouble);
      valor_venda := FormatarTag(SQL_VENDA.Fields[0].asExtended, vardouble);
      Acrescimo := ((valor_venda + acrescimo_base) * valor_produto / valor_venda) - valor_produto;
      acrs_format := FormatarTag(Acrescimo, vardouble);
      Acrescimo := acrs_format;
      if reatear_diff_acrescimo then
      begin
        if SQL_VENDA_ITENS_RAT <> nil then
          with SQL_VENDA_ITENS_RAT do
          begin
            FetchAll;
            first;
            while not Eof do
            begin
              valor_produto := strtofloat(FORMATFLOAT('0.00', (Fields[0].asExtended * Fields[1].asExtended) + Fields[2].asExtended - Fields[3].asExtended));
              valor_produto := strtofloat(StringReplace(formatarqtde(valor_produto), '.', ',', [RFREPLACEALL]));
              item_rateio_acrs := ((((valor_venda + acrescimo_base) * valor_produto) / valor_venda) - valor_produto);
              item_rateio_acrs := FormatarTag(item_rateio_acrs, vardouble);
              rateio_acrescimos := rateio_acrescimos + item_rateio_acrs;
              Next;
            end;
          end;
        if not comparevalue(rateio_acrescimos, acrescimo_base) = 0 then
        begin
          if comparevalue(rateio_acrescimos, acrescimo_base) = -1 then
          begin
            Acrescimo := Acrescimo + (acrescimo_base - rateio_acrescimos);
            rateio_acrescimos := Acrescimo + (rateio_acrescimos - acrs_format);
          end;
          if comparevalue(rateio_acrescimos, acrescimo_base) = 1 then
            Acrescimo := Acrescimo - (rateio_acrescimos - acrescimo_base);
          reatear_diff_acrescimo := false;
        end;
      end;
    end;
  end;
  result := Acrescimo;
end;

function SelectFile(CurrentDir: string = 'C:\'; Filters: string = ''): string;
var
  openDialog: topendialog;
begin
  openDialog := topendialog.Create(Application);
  openDialog.InitialDir := CurrentDir;
  openDialog.options := [ofFileMustExist];
  openDialog.Filter := Filters + '|Todos os Tipos|*.*';
  openDialog.FilterIndex := 1;
  if openDialog.Execute then
    result := openDialog.FileName
  else
    result := emptystr;

  openDialog.Free;

end;

function formatarqtde(qtde: extended): string;
begin
  result := ReplaceStr(FORMATFLOAT('0.000', qtde), ',', '.');
end;

procedure VencimentoCertificado;
var
  dias, compared_date: Integer;
  msg, cert, datavenc: string;
  qry: TFDQuery;
begin
  try
    qry := SimpleQuery('select certificado from config_notas');
    if qry <> nil then
    begin
      frm_confnfce := tfrm_confnfce.Create(nil);
      frm_confnfce.spdNFCe.TipoCertificado := ckFile;
      frm_confnfce.spdNFCe.NomeCertificado.Text := qry.Fields[0].AsString;
      dias := DaysBetween(date, frm_confnfce.spdNFCe.GetVencimentoCertificado);
      compared_date := comparedate(frm_confnfce.spdNFCe.GetVencimentoCertificado, date);
      if compared_date = 1 then
      begin
        if dias <= 30 then
        begin
          cert := '[' + obterNroResultado(qry.Fields[0].AsString, 'CN', ',') + ']';
          msg := 'Faltam ' + inttostr(dias) + ' para o vencimento do certificado digital!' + slinebreak + 'Certificado: ' + cert + slinebreak +
            'Data Vencimento: ' + datetostr(frm_confnfce.spdNFCe.GetVencimentoCertificado);
          WnAlerta('Certificado Digital', msg);
          frm_confnfce.Close;
        end;
      end
      else
      begin
        msg := 'Certificado digital vencido!' + slinebreak + slinebreak + 'Certificado: ' + cert + slinebreak + 'Data Vencimento: ' +
          datetostr(frm_confnfce.spdNFCe.GetVencimentoCertificado);
        WnAlerta('Certificado Digital', msg);
      end;
    end;
  except
    WnAlerta('Vencimento Certificado', slinebreak + 'Certificado digital n�o encontrado!', 12);
  end;
end;

function clickOnTittle(GRID: TDBGRID): boolean;
VAR
  PT: Tpoint;
BEGIN
  PT := GRID.ScreenToClient(SmallPointToPoint(System.Types.SmallPoint(GetMessagePos)));
  result := (GRID.MouseCoord(PT.x, PT.Y).Y = 0) and (dgTitles in GRID.options);
END;

function ping(const _Host: string): boolean;
var
  __idIcmp: TIdICMPClient;
begin
  try
    try
      __idIcmp := TIdICMPClient.Create(nil);
      __idIcmp.Host := _Host;
      __idIcmp.PacketSize := 32;
      __idIcmp.IPVersion := id_ipv4;
      __idIcmp.ReceiveTimeout := 500;
      __idIcmp.ping;
      if __idIcmp.ReplyStatus.ReplyStatusType = rsEcho then
        result := true
      else if __idIcmp.ReplyStatus.ReplyStatusType = rsTimeout then
        result := false;

      if not result then
        result := __idIcmp.ReplyStatus.BytesReceived > 0;
    except
      on e: exception do
        raise exception.Create(e.Message + slinebreak + 'Erro ao tentar se comunicar com host!');
    end;
  finally
    __idIcmp.Free;
  end
end;

function Extenso(Valor: extended): string;
var
  Centavos, Centena, Milhar, Texto, msg: string;
const
  Unidades: array [1 .. 9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
  Dez: array [1 .. 9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');

  Dezenas: array [1 .. 9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
  Centenas: array [1 .. 9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');

  function ifs(Expressao: boolean; CasoVerdadeiro, CasoFalso: string): string;

  begin
    if Expressao then
      result := CasoVerdadeiro
    else
      result := CasoFalso;
  end;

  function MiniExtenso(trio: string): string;
  var
    Unidade, Dezena, Centena: string;
  begin
    Unidade := '';
    Dezena := '';
    Centena := '';
    if (trio[2] = '1') and (trio[3] <> '0') then
    begin
      Unidade := Dez[StrToInt(trio[3])];
      Dezena := '';
    end
    else
    begin
      if trio[2] <> '0' then
        Dezena := Dezenas[StrToInt(trio[2])];
      if trio[3] <> '0' then
        Unidade := Unidades[StrToInt(trio[3])];
    end;
    if (trio[1] = '1') and (Unidade = '') and (Dezena = '')

    then
      Centena := 'Cem'
    else if trio[1] <> '0' then
      Centena := Centenas[StrToInt(trio[1])]
    else
      Centena := '';
    result := Centena + ifs((Centena <> '') and ((Dezena <> '') or (Unidade <> '')), ' e ', '') + Dezena + ifs((Dezena <> '') and (Unidade <> ''), ' e ', '')
      + Unidade;
  end;

begin
  if Valor <> 0 then
  begin
    if (Valor > 999999.99) or (Valor < 0) then
    begin
      msg := 'O valor est� fora do intervalo permitido.';
      msg := msg + 'O n�mero deve ser maior ou igual a zero e menor que 999.999,99.';
      msg := msg + ' Se n�o for corrigido o n�mero n�o ser� escrito por extenso.';

      showmessage(msg);
      result := '';
      exit;
    end;
    if Valor = 0 then
    begin
      result := '';
      exit;
    end;
    Texto := FORMATFLOAT('000000.00', Valor);
    Milhar := MiniExtenso(copy(Texto, 1, 3));
    Centena := MiniExtenso(copy(Texto, 4, 3));
    Centavos := MiniExtenso('0' + copy(Texto, 8, 2));
    result := Milhar;
    if Milhar <> '' then
      if copy(Texto, 4, 3) = '000' then
        result := result + ' Mil Reais'
      else
        result := result + ' Mil, ';
    if (((copy(Texto, 4, 2) = '00') and (Milhar <> '') and (copy(Texto, 6, 1) <> '0')) or (Centavos = ''))

      and (Centena <> '') then
      result := result + ' e ';
    if (Milhar + Centena <> '') then
      result := result + Centena;
    if (Milhar = '') and (copy(Texto, 4, 3) = '001') then
      result := result + ' Real'
    else if (copy(Texto, 4, 3) <> '000') then
      result := result + ' Reais';
    if Centavos = '' then
    begin
      result := result + '.';
      exit;
    end
    else
    begin
      if Milhar + Centena = '' then
        result := Centavos
      else
        result := result + ' e ' + Centavos;
      if (copy(Texto, 8, 2) = '01') and (Centavos <> '') then

        result := result + ' Centavo'
      else
        result := result + ' Centavos';
    end;
  end
  else
    result := 'Zero';

end;

procedure ConsultarCep(const CEP: string; var edt_uf, edt_cidade, edt_rua, edt_bairro: string);
var
  IDHttp_cep: tidhttp;
  XML_CEP: IXMLDocument;
  node_cep: IXMLNode;
begin
  if tnet.connstatus then
  begin
    IDHttp_cep := tidhttp.Create(nil);
    XML_CEP := TXMLDocument.Create(nil);
    XML_CEP.LoadFromXML(IDHttp_cep.URL.URLDecode(IDHttp_cep.Get('http://republicavirtual.com.br/web_cep.php?cep=' + CEP + '&formato=xml')));
    if XML_CEP <> nil then
    begin
      node_cep := XML_CEP.childnodes.FindNode('webservicecep');
      if node_cep <> nil then
      begin
        if node_cep.childvalues['resultado'] = '0' then
          WnAlerta('Status Conex�o', slinebreak + 'CEP "' + CEP + '" n�o encontrado!')
        else if node_cep.childvalues['resultado'] = '1' then
        begin
          edt_uf     := node_cep.childvalues['uf'];
          edt_cidade := fTiraAcentos(node_cep.childvalues['cidade']);
          edt_bairro := fTiraAcentos(copy(node_cep.childvalues['bairro'], 0, length(node_cep.childvalues['bairro']) - 1));
          //edt_rua    := fTiraAcentos(copy(node_cep.childvalues['logradouro'], 0, pos('-', node_cep.childvalues['logradouro']) - 1));
          edt_rua    := node_cep.childvalues['logradouro'];
        end;
      end;
    end;
  end
  else
    WnAlerta('Status Conex�o', slinebreak + 'Falha na conex�o de internet!');
end;

procedure ConsultarCep1(const CEP: string; var edt_uf, edt_cidade, edt_bairro: string);
var
  IDHttp_cep: tidhttp;
  XML_CEP: IXMLDocument;
  node_cep: IXMLNode;
begin
  if tnet.connstatus then
  begin
    IDHttp_cep := tidhttp.Create(nil);
    XML_CEP := TXMLDocument.Create(nil);
    XML_CEP.LoadFromXML(IDHttp_cep.URL.URLDecode(IDHttp_cep.Get('http://republicavirtual.com.br/web_cep.php?cep=' + CEP + '&formato=xml')));
    if XML_CEP <> nil then
    begin
      node_cep := XML_CEP.childnodes.FindNode('webservicecep');
      if node_cep <> nil then
      begin
        if node_cep.childvalues['resultado'] = '0' then
          WnAlerta('Status Conex�o', slinebreak + 'CEP "' + CEP + '" n�o encontrado!')
        else if node_cep.childvalues['resultado'] = '1' then
        begin
          edt_uf := node_cep.childvalues['uf'];
          edt_cidade := node_cep.childvalues['cidade'];
          edt_bairro := copy(node_cep.childvalues['bairro'], 0, length(node_cep.childvalues['bairro']) - 1);
        end;
      end;
    end;
  end
  else
    WnAlerta('Status Conex�o', slinebreak + 'Falha na conex�o de internet!');
end;

procedure DragAndDrop(var Sender, Source: tObject);
var
  itemAdicionado: TListItem;
  Item: string;
  itAdd: TListItem;
  index: Integer;
begin
  if Source <> Sender then
  begin
    with (Source as TListView) do
    begin
      Item := Items[ItemIndex].Caption;
      Items.delete(ItemIndex);
      itAdd := Items[ItemIndex];
    end;
    itemAdicionado := (Sender as TListView).Items.AddItem(itAdd, 1);
    itemAdicionado.Caption := Item;
  end;
end;

function camelCase(const Word: string): string;
const
  arrAcentos: string = '�����������������';
  arrAcentosSubs: string = '�����������������';
var
  I, ac_pos: Integer;
  first: boolean;
begin
  result := LowerCase(Word);
  first := true;
  for I := 1 to length(result) do
  begin
    ac_pos := pos(result[I], arrAcentos);
    if ac_pos <> 0 then
      result[I] := arrAcentosSubs[ac_pos];
    if result[I] = ' ' then
      first := true
    else if first then
    begin
      result[I] := UpCase(result[I]);
      ac_pos := pos(result[I], arrAcentosSubs);
      if ac_pos <> 0 then
        result[I] := arrAcentos[ac_pos];
      first := false;
    end;
  end;
end;

function ExistsNetwork: Boolean;
var flags: DWORD;
begin
     // verifica se est� conectado a internet usando a API do Windows, � preciso declarar a uses WinInet.
    if not InternetGetConnectedState(@flags, 0) then
          result := False
     else
          result := True;
end;

function NumeroTerminal: integer;
var reg: TRegIniFile;
    NumeroCaixa : Integer;
begin
     NumeroCaixa := 1;
     try
       reg:= TRegIniFile.Create('SMC');
       NumeroCaixa := reg.ReadInteger('Caixa','Terminal',1);
     finally
        reg.Free;

        if NumeroCaixa <= 0 then
           NumeroCaixa := 1;
     end;

     Result := NumeroCaixa;
end;

//##############################################################################
//                    FUNCOES DESENVOLVIDAS PELO WANDER
//##############################################################################
function TemAcesso(pUsuario,pFuncao:string):Boolean;
var vFrase, vFUN_DESCRICAO, vFUN_NUMERO:String;
begin
   // Wander
   // Verifica se o usu�rio tem acesso a determinado recurso/funcionalidade do sistema
   //
   // Entrada: pUsuario : id do usu�rio
   //          pFuncao  : id da fun��o a ser acessada
   //
   // Sa�da: True, se o usu�rio tem acesso � fun��o desejada
   //        False, se o usu�rio N�O tem acesso
   //---------------------------------------------------------------------------

   if upperCase(pUsuario) = 'MASTER'  then
   begin
     result := true;
     exit;
   end;

    // Recupear nome e n�mero da funcao
    vFUN_DESCRICAO := '';
    vFUN_NUMERO    := '';
    Module.Query.Close;
    Module.Query.Sql.Clear;
    Module.Query.Sql.Add('SELECT * FROM FUNCOES_FUN      ');
    Module.Query.Sql.Add(' WHERE FUN_CODIGO = :FUN_CODIGO');
    Module.Query.ParamByName('FUN_CODIGO').AsString := pFuncao;
    Module.Query.open;
    vFrase := '';
    if not Module.Query.eof then
    begin
       vFUN_DESCRICAO := Module.Query.FieldByName('FUN_DESCRICAO').AsString;
       vFUN_NUMERO    := Module.Query.FieldByName('FUN_NUMERO').AsString;
       vFrase := vFUN_DESCRICAO+#13+#13+
                 'Libere o acesso [ ' + vFUN_NUMERO + ' ]';
    end;

   Module.Query.Close;
   Module.Query.Sql.Clear;
   Module.Query.Sql.Add('SELECT * FROM ACESSOS_ACC ');
   Module.Query.Sql.Add(' WHERE ACC_USUARIO = :USU ');
   Module.Query.Sql.Add('   AND ACC_FUNCAO  = :FUN ');
   Module.Query.ParamByName('USU').AsString := pUsuario;
   Module.Query.ParamByName('FUN').AsString := pFuncao;
   Module.Query.open;

   if Module.Query.Eof then
   begin
      result := False;
      RegistraLog('Acesso Negado para '+vFrase);
      vFrase := 'Acesso Negado! ' + vFrase;
      //ShowMessage('Acesso Negado! ' + vFrase);
      wnAlerta('Permiss�es', slinebreak + slinebreak + vFrase);
   end
   else
      result := True;
end;

procedure RegistraLog(pEvento:String);
var qLocal : tFDQuery;
begin
   qLocal := TFDQuery.Create(nil);
   qLocal.Connection     := Module.connection;
   qLocal.ConnectionName := 'connection';

    if NaoAtualizado('LOG_EMPRESA') then
       Executar('ALTER TABLE LOG_LOG ADD LOG_EMPRESA VARCHAR(020) NOT NULL DEFAULT "0" COMMENT "Codigo da empresa/filial" ');

   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('INSERT INTO LOG_LOG ');
   qLocal.Sql.Add('    ( LOG_DATA,     ');
   qLocal.Sql.Add('      LOG_EMPRESA,  ');
   qLocal.Sql.Add('      LOG_USUARIO,  ');
   qLocal.Sql.Add('      LOG_ESTACAO,  ');
   qLocal.Sql.Add('      LOG_HORA,     ');
   qLocal.Sql.Add('      LOG_HISTORICO,');
   qLocal.Sql.Add('      LOG_vERSAO)   ');
   qLocal.Sql.Add('VALUES              ');
   qLocal.Sql.Add('    (:LOG_DATA,     ');
   qLocal.Sql.Add('     :LOG_EMPRESA,  ');
   qLocal.Sql.Add('     :LOG_USUARIO,  ');
   qLocal.Sql.Add('     :LOG_ESTACAO,  ');
   qLocal.Sql.Add('     :LOG_HORA,     ');
   qLocal.Sql.Add('     :LOG_HISTORICO,');
   qLocal.Sql.Add('     :LOG_vERSAO)   ');
   qLocal.ParamByName('LOG_DATA'     ).AsDateTime := DataServidor;
   qLocal.ParamByName('LOG_EMPRESA'  ).AsString   := Global_Filial_Em_Uso;
   qLocal.ParamByName('LOG_USUARIO'  ).AsString   := Copy(Global_Usuario_Logado,1,10);
   if NaoAtualizado('LOG_ESTACAO(50)***') then
      qLocal.ParamByName('LOG_ESTACAO'  ).AsString   := ''
   else
      qLocal.ParamByName('LOG_ESTACAO'  ).AsString   := Copy(NomeComputador,1,50);
   qLocal.ParamByName('LOG_HORA'     ).AsString   := HoraServidor;
   qLocal.ParamByName('LOG_HISTORICO').AsString   := Copy(pEvento,1,100);
   qLocal.ParamByName('LOG_vERSAO'   ).AsString   := _constante_VersaoDoSistema;
   qLocal.ExecSql;

   qLocal.Free;

end;

procedure UsuarioLogou;
begin
    Module.Query.Close;
    Module.Query.Sql.Clear;
    Module.Query.Sql.Add('UPDATE USUARIO           ');
    Module.Query.Sql.Add('   SET LOGADO = 1        ');
    Module.Query.Sql.Add(' WHERE USUARIO = :USUARIO');
    Module.Query.ParamByName('USUARIO').AsString := Global_Usuario_Logado;
    Module.Query.ExecSql;
    RegistraLog('Acessou o sistema');
end;

procedure UsuarioDeslogou;
begin
    Module.Query.Close;
    Module.Query.Sql.Clear;
    Module.Query.Sql.Add('UPDATE USUARIO           ');
    Module.Query.Sql.Add('   SET LOGADO = 0        ');
    Module.Query.Sql.Add(' WHERE USUARIO = :USUARIO');
    Module.Query.ParamByName('USUARIO').AsString := Global_Usuario_Logado;
    Module.Query.ExecSql;
    RegistraLog('Saiu do sistema');
end;

procedure AcessoExclusivoMaster;
begin
   ShowMessage('Somente o usu�rio MASTER tem acesso a esta fun��o.'+#13+#13+
               'Contacte o Suporte.');
end;

function HoraServidor:String;
begin
  //  retorna a Hora do servidor para nao usar a data da esta��o
  Result := Copy(TimeToStr(time),1,5);
end;

procedure Executar(pTexto:String);
begin
  // Executa o script contido no par�metro pTexto
  //----------------------------------------------------------------------------
  TRY
     Module.Query.close;
     Module.Query.sql.clear;
     Module.Query.sql.add(pTexto);
     Module.Query.ExecSql;
  FINALLY
  END;
end;

function Cripto(Texto: String): String;
var
   Cont, Cod: Integer;
   Retorna: String;
begin
   for Cont := 1 to Length(Texto) do
   begin
      Cod := ValorAsc(Copy(Texto, Cont, 1));
      Retorna := Retorna + Chr(Cod + 57(*valor a ser adicionado - pode ser modificado*));
   end;
   Cripto := Retorna;
end;

function DesCripto(Texto: String): String;
var
   Cont, Cod: integer;
   Retorna: String;
begin
   for Cont := 1 to Length(Texto) do
   begin
       Cod := ValorAsc(Copy(Texto, Cont, 1));
       Retorna := Retorna + Chr(Cod - 57);
   end;
   DesCripto := Retorna;
end;

function ValorAsc(Letra: String): Byte;
begin
   if Length(letra) > 0 then
      ValorAsc := Ord(Letra[1])
   else
      ValorAsc := 0;
end;

function NaoAtualizado(pInformacao: String): Boolean;
begin
   // Verifica se determinado script (pInformacao) ja foi aplicado ao banco de dados
   result := False;
   Module.Q2.close;
   Module.Q2.sql.clear;
   Module.Q2.sql.add('SELECT ATU_FUNCAO FROM ATUALIZADO_ATU ');
   Module.Q2.sql.add(' WHERE ATU_FUNCAO = :ATU_FUNCAO       ');
   Module.Q2.ParamByName('ATU_FUNCAO').AsString := pInformacao;
   Module.Q2.Open;
   try
         if Module.Q2.eof Then
         begin
             // nao atualizou
             result := true;
             Module.Q2.Close;
             Module.Q2.SQL.clear;
             Module.Q2.sql.add('INSERT INTO ATUALIZADO_ATU ');
             Module.Q2.sql.add('     ( ATU_FUNCAO,         ');
             Module.Q2.sql.add('       ATU_DATA)           ');
             Module.Q2.sql.add('VALUES                     ');
             Module.Q2.sql.add('     (:ATU_FUNCAO,         ');
             Module.Q2.sql.add('      :ATU_DATA)           ');
             Module.Q2.ParamByName('ATU_FUNCAO').AsString   := pInformacao;
             Module.Q2.ParamByName('ATU_DATA'  ).AsDateTime := DataServidor; // Now;
             Module.Q2.ExecSQL;
             result := true;
         end;
   finally
   end;
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

function UsuarioMASTER:Boolean;
begin
   if Global_Usuario_Logado = 'MASTER' then
      result := true
   else
     result := false;
end;

function UsuarioMASTER_SenhaCorreta(pUsuario,pSenha:String):Boolean;
begin
   // recebe um username e uma senha e verifica se � a do usu�rio master
   // e se a senha est� correta
   // retorna true em caso afirmativo e false se negativo
   //---------------------------------------------------------------------------

   if upperCase(pUsuario) <> 'MASTER' Then
   begin
      result := false;
      exit;
   end;

   if upperCase(pSenha) = 'PIPOCA' Then
      result := true
   else
     result := false;
end;

function fUltimaNFe(pNFe_SeRIE:String):integer;
begin
   result := 0;
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
           xValor := 'N�o informado'
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
  Module.Query.Close;
  Module.Query.Sql.Clear;
  Module.Query.Sql.Add('INSERT INTO DADOSTELA_DT');
  Module.Query.Sql.Add('    ( DT_USUARIO,       ');
  Module.Query.Sql.Add('      DT_ESTACAO,       ');
  Module.Query.Sql.Add('      DT_TELA,          ');
  Module.Query.Sql.Add('      DT_NOME,          ');
  Module.Query.Sql.Add('      DT_VALOR)         ');
  Module.Query.Sql.Add('VALUES                  ');
  Module.Query.Sql.Add('    (:DT_USUARIO,       ');
  Module.Query.Sql.Add('     :DT_ESTACAO,       ');
  Module.Query.Sql.Add('     :DT_TELA,          ');
  Module.Query.Sql.Add('     :DT_NOME,          ');
  Module.Query.Sql.Add('     :DT_VALOR)         ');
  Module.Query.ParamByName('DT_USUARIO').AsString := Global_Usuario_Logado;
  Module.Query.ParamByName('DT_ESTACAO').AsString := NomeComputador;
  Module.Query.ParamByName('DT_NOME'   ).AsString := pNome;
  Module.Query.ParamByName('DT_VALOR'  ).AsString := pValor;
  Module.Query.ParamByName('DT_TELA'   ).AsString := pTela;
  Module.Query.ExecSql;
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
  Module.Query.Close;
  Module.Query.Sql.Clear;
  Module.Query.Sql.Add('SELECT DT_VALOR                 ');
  Module.Query.Sql.Add('  FROM DADOSTELA_DT             ');
  Module.Query.Sql.Add(' WHERE DT_USUARIO = :DT_USUARIO ');
  Module.Query.Sql.Add('   AND DT_ESTACAO = :DT_ESTACAO ');
  Module.Query.Sql.Add('   AND DT_TELA    = :DT_TELA    ');
  Module.Query.Sql.Add('   AND DT_NOME    = :DT_NOME    ');
  Module.Query.ParamByName('DT_USUARIO').AsString := Global_Usuario_Logado;
  Module.Query.ParamByName('DT_ESTACAO').AsString := NomeComputador;
  Module.Query.ParamByName('DT_NOME'   ).AsString := pNome;
  Module.Query.ParamByName('DT_TELA'   ).AsString := pTela;
  Module.Query.Open;
  if Module.Query.eof then
     exit;

  vValorAntesDeAlterar := Module.Query.FieldByName('DT_VALOR').AsString;
  if vValorAntesDeAlterar  = pValor then
     exit;

  // Houve mudancas - registrar
  if Trim(vValorAntesDeAlterar) = '' then
     vValorAntesDeAlterar := '(vazio)';

  if Trim(pValor) = '' then
     pValor := '(vazio)';

  RegistraLog('Alterou '+pFrase+ ', '+pNome + ' de ' + vValorAntesDeAlterar
             + ' para ' + pValor +'( '+pTela+' )');
end;

procedure ApagaRegistroDeDadosDaTela(pTela:String);
begin
  // Apaga os registros de controle contendo os dados da tela
  Module.Query.Close;
  Module.Query.Sql.Clear;
  Module.Query.Sql.Add('DELETE FROM DADOSTELA_DT        ');
  Module.Query.Sql.Add(' WHERE DT_USUARIO = :DT_USUARIO ');
  Module.Query.Sql.Add('   AND DT_ESTACAO = :DT_ESTACAO ');
  Module.Query.Sql.Add('   AND DT_TELA    = :DT_TELA    ');
  Module.Query.ParamByName('DT_USUARIO').AsString := Global_Usuario_Logado;
  Module.Query.ParamByName('DT_ESTACAO').AsString := NomeComputador;
  Module.Query.ParamByName('DT_TELA'   ).AsString := pTela;
  Module.Query.ExecSql;
end;

Function ProximaNotaFiscal(pSerie:Integer):Integer;
var Q : tFDQuery;
    vProxima:Integer;
begin
    // retorna o proximo numero sequencial de pedido a ser usado

    //*****************************
    Module.connection.StartTransaction;
    //*****************************

    q := TFDQuery.Create(nil);
    q.Connection     := Module.connection;
    q.ConnectionName := 'connection';
    Q.Close;
    Q.Sql.Clear;
    Q.SQL.Add('SELECT SNFe_SEQUENCIA            ');
    Q.SQL.Add('  FROM SERIENFe_SNFe             ');
    Q.SQL.Add(' WHERE SNFe_CODIGO = :SNFe_CODIGO');
    Q.ParamByName('SNFe_CODIGO').AsInteger := pSerie;
    Q.Open;
    if Q.eof then
    begin
       // N�o consta registro de sequencia de NFe para
       // esta s�rie...
       // Criar um registro com "�ltima nota"   = 0
       //                       (SNF_SEQUENCIA  = 0)
       Q.Close;
       Q.Sql.Clear;
       Q.SQL.Add('INSERT INTO SERIENFe_SNFe');
       Q.SQL.Add('     ( SNFe_SEQUENCIA,  ');
       Q.SQL.Add('       SNFe_CODIGO)     ');
       Q.SQL.Add('vALUES                 ');
       Q.SQL.Add('     (:SNFe_SEQUENCIA,  ');
       Q.SQL.Add('      :SNFe_CODIGO)     ');
       Q.ParamByName('SNFe_CODIGO'   ).AsInteger := pSerie;
       Q.ParamByName('SNFe_SEQUENCIA').AsInteger := 0;
       Q.ExecSql;
       result := 1
    end
    else
    begin
        vProxima := Q.FieldByName('SNFe_SEQUENCIA').AsInteger +1;
        Q.Close;
        Q.Sql.Clear;
        Q.SQL.Add('UPDATE SERIENFe_SNFe                    ');
        Q.SQL.Add('   SET SNFe_SEQUENCIA = :SNFe_SEQUENCIA ');
        Q.SQL.Add(' WHERE SNFe_CODIGO    = :SNFe_CODIGO    ');
        Q.ParamByName('SNFe_CODIGO'   ).AsInteger := pSerie;
        Q.ParamByName('SNFe_SEQUENCIA').AsInteger := vProxima;
        Q.ExecSql;
        result := vProxima;
    end;
    q.Free;
    //*****************************
    Module.connection.Commit;
    //*****************************
end;

function SoNumeros(numero:string):Integer;
(* recebe string e elimina caracteres que nao sejam digitos numericos *)
var i:integer;
    masctostr_numero1:string;
begin
    if numero = '' then numero := '0';

    for i:=1 to length(numero) do
    begin
       case numero[i] of
         '0'..'9':masctostr_numero1:=masctostr_numero1+numero[i];
       end;
    end;
    Result := StrToInt(masctostr_numero1);
end;

function SoNumerosX(numero:string):String;
(* recebe string e elimina caracteres que nao sejam digitos numericos *)
var i:integer;
    masctostr_numero1:string;
begin
        if numero = '' then numero := '0';

        for i:=1 to length(numero) do
        begin
           case numero[i] of
             '0'..'9':masctostr_numero1:=masctostr_numero1+numero[i];
           end;
        end;
     Result := masctostr_numero1;
end;

Function Zeros(Frase: String; Comprimento:Integer) : String;
begin
   // recebe um string e preenche com zeros a esquerda ate atingir o comprimento desejado
   while length(Frase) < Comprimento Do
      Frase := '0' + Frase;
   Result := Frase;
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
procedure RecalculaSaldoEstoque(pProduto:String;pData:TdateTime);
begin
  exit;
end;

function fnatureza_operacaoDESCRICAO(pID:Integer):String;
var Q : tFDQuery;
begin
    // Recebe o ID de uma natureza de opera��o e
    // retorna sua descri��o, se existir ou "" se n�o existir
    //--------------------------------------------------------------------------
    result := '';
    q := TFDQuery.Create(nil);
    q.Connection     := Module.connection;
    q.ConnectionName := 'connection';
    Q.Close;
    Q.Sql.Clear;
    Q.SQL.Add('SELECT DESCRICAO        ');
    Q.SQL.Add('  FROM Natureza_Operacao');
    Q.SQL.Add(' WHERE ID = :ID         ');
    Q.ParamByName('ID').AsInteger := pID;
    Q.Open;
    if not Q.eof then
       result := Q.FieldByName('DESCRICAO').AsString;

    q.Free;
end;

function fColaboradorNOME(pCodigo:Integer):String;
var Q : tFDQuery;
begin
    // Recebe o Codigo de um Colaborador e
    // retorna seu nome, se existir ou "" se n�o existir
    //--------------------------------------------------------------------------
    result := '';
    q := TFDQuery.Create(nil);
    q.Connection     := Module.connection;
    q.ConnectionName := 'connection';
    Q.Close;
    Q.Sql.Clear;
    Q.SQL.Add('SELECT Nome             ');
    Q.SQL.Add('  FROM Colaborador      ');
    Q.SQL.Add(' WHERE Codigo = :Codigo ');
    Q.ParamByName('Codigo').AsInteger := pCodigo;
    Q.Open;
    if not Q.eof then
       result := Q.FieldByName('Nome').AsString;

    q.Free;
end;

function Float_to_String(pValor:real):String;
begin
   Result := FormatFloat('#,##0.00',pValor);
end;

function DataServidor:tDateTime;
begin
   Result := Date;
end;

function sDataServidor:String;
begin
  result := DateToStr(DataServidor);
end;

function Existe_Tabela(pNomeTabela:String):Boolean;
var Q : tFDQuery;
begin
    // Recebe o nome de uma tabela e verifica se ela existe no banco de dados
    // retorna true, se existir e false se n�o existir
    //--------------------------------------------------------------------------
    result := false;
    q := TFDQuery.Create(nil);
    q.Connection     := Module.connection;
    q.ConnectionName := 'connection';

    try
      Q.Close;
      Q.Sql.Clear;
      Q.SQL.Add('SELECT * ');
      Q.SQL.Add('  FROM '+pNomeTabela);
      Q.Open;
      q.Free;
      result := true;
    except
      q.Free;
    end;
end;

procedure Criar_Tabela_Temporaria_de_Venda(pTabela:String);
var Q : tFDQuery;
begin
   // Cria tabela auxiliar de venda
   //---------------------------------------------------------------------------
   //Executar('DROP TABLE '+pTabela);

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';
   try
     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add('CREATE TABLE '+pTabela                      );
     Q.SQL.Add('    (CODIGO            INT(11)       NULL, ');
     Q.SQL.Add('     CODIGO_PRODUTO    INT(11)       NULL, ');
     Q.SQL.Add('     UNIDADE           varchar(10)   NULL, ');
     Q.SQL.Add('     QUANTIDADE        FLOAT         NULL, ');
     Q.SQL.Add('     PRECO             DECIMAL(10,4) NULL, ');
     Q.SQL.Add('     CODIGO_VENDA      INT(11)       NULL, ');
     Q.SQL.Add('     CODIGO_ITEM_VENDA INT(11)       NULL, ');
     Q.SQL.Add('     DESCRICAO         varchar(100)  NULL, ');
     Q.SQL.Add('     ACRESCIMO         DECIMAL(10,4) NULL, ');
     Q.SQL.Add('     DESCONTO          DECIMAL(10,4) NULL, ');
     Q.SQL.Add('     PRECO_TOTAL       DECIMAL(10,4) NULL, ');
     Q.SQL.Add('     rateio_desconto   DECIMAL(10,4) NULL, ');
     Q.SQL.Add('     rateio_acrescimo  DECIMAL(10,4) NULL, ');
     Q.SQL.Add('     preco_custo       DECIMAL(10,4) NULL, ');
     Q.SQL.Add('     CFOP              INT(04)       NULL) ');

     Q.ExecSql;
   finally
     q.Free;
   end;
end;

procedure Destruir_Tabela_Temporaria_de_Venda(pTabela:String);
var Q : tFDQuery;
begin
   // Destruir tabela auxiliar de venda
   //---------------------------------------------------------------------------
   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';
   try
     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add('DROP TABLE '+pTabela);
   finally
     q.Free;
   end;
end;

function ProxTPMOV:String;
var Q : tFDQuery;
begin
   // Retorna o pr�ximo c�digo sequencial do tipo de movimento
   //---------------------------------------------------------------------------
   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';
   Result := '1';
   try
     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add('SELECT *  ');
     Q.SQL.Add('  FROM TIPOMOVIMENTO_TPMOV ');
     Q.Open;
     if Q.Eof then
     begin
       Q.Free;
       exit;
     end;

     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add('SELECT MAX(TPMOV_CODIGO) AS ULTIMO ');
     Q.SQL.Add('  FROM TIPOMOVIMENTO_TPMOV         ');
     Q.Open;
     Result := IntToStr(Q.FieldByName('ULTIMO').AsInteger + 1);
     Q.Free;
   except
     q.Free;
   end;
end;

function DataAAMM(pData:TDateTime):String;
begin
  result := '';
end;

function SemAsteriscos(pString:String):String;
begin
  if copy(pString,1,3) = '***' then
     result := ''
  else
     result := pString;
end;

function CodigoUF(pUF:String):String;
var Q : tFDQuery;
begin
   result := '';
   if pUF = '' then
      exit;

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';
   Result := '';

     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add('SELECT IBGE            ');
     Q.SQL.Add('  from endereco_estado ');
     Q.SQL.Add(' where UF = :UF        ');
     Q.ParamByName('UF').AsString := pUF;
     Q.Open;
     if Q.Eof then
     begin
       Q.Free;
       exit;
     end;
     result := Q.FieldByName('IBGE').AsString;
     Q.Free;
end;

//Recebe a sigla de uma Municipio e retorna seu codigo IBGE
function CodigoMunicipio(pMunicipio,pUF:String):String;
var Q : tFDQuery;
begin
   result := '';
   if pUF = '' then
      exit;

   if pMunicipio = '' then
      exit;

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';
   Result := '';

     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add('SELECT IBGE              ');
     Q.SQL.Add('  from endereco_municipio');
     Q.SQL.Add(' where NOME   = :NOME    ');
     Q.SQL.Add('   and ESTADO = :ESTADO  ');
     Q.ParamByName('NOME'  ).AsString := pMunicipio;
     Q.ParamByName('ESTADO').AsString := CodigoUF(pUF);
     Q.Open;
     if Q.Eof then
     begin
       Q.Free;
       exit;
     end;
     result := Q.FieldByName('IBGE').AsString;
     Q.Free;
end;

Procedure LimpaEnderecos;
begin
  Executar('DELETE FROM cliente_endereco WHERE RUA IS NULL');
end;

function NomeUND(pCodigo:Integer):String;
var Q : tFDQuery;
begin
   result := '';

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';
   Result := '';

   Q.Close;
   Q.Sql.Clear;
   Q.SQL.Add('SELECT SIGLA           ');
   Q.SQL.Add('  from produto_unidade ');
   Q.SQL.Add(' where CODIGO = :CODIGO');
   Q.ParamByName('CODIGO').AsInteger := pCodigo;
   Q.Open;
   if Q.Eof then
   begin
     Q.Free;
     exit;
   end;
   result := Q.FieldByName('SIGLA').AsString;
   Q.Free;
end;

function DescricaoPlanoDeContas(pContaContabil:Integer):String;
var Q : tFDQuery;
begin
   result := '';

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';
   Result := '';

   Q.Close;
   Q.Sql.Clear;
   Q.SQL.Add('SELECT *               ');
   Q.SQL.Add('  from plano_contas    ');
   Q.SQL.Add(' where CODIGO = :CODIGO');
   Q.ParamByName('CODIGO').AsInteger := pContaContabil;
   Q.Open;
   if Q.Eof then
   begin
     Q.Free;
     exit;
   end;
   result := Q.FieldByName('Classificacao').AsString+'-'+
             Q.FieldByName('Descricao'    ).AsString;
   Q.Free;
end;

function DescricaoCentroDeCustos(pCentroDeCusto:Integer):String;
var Q : tFDQuery;
begin
   result := '';

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';
   Result := '';

   Q.Close;
   Q.Sql.Clear;
   Q.SQL.Add('SELECT *               ');
   Q.SQL.Add('  from centro_custo    ');
   Q.SQL.Add(' where CODIGO = :CODIGO');
   Q.ParamByName('CODIGO').AsInteger := pCentroDeCusto;
   Q.Open;
   if Q.Eof then
   begin
     Q.Free;
     exit;
   end;
   result := Q.FieldByName('Classificacao').AsString+'-'+
             Q.FieldByName('Descricao'    ).AsString;
   Q.Free;
end;

function ProximoProdutoCODIGO:Integer;
var Q : tFDQuery;
begin
   result := 1;

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';

   Q.Close;
   Q.Sql.Clear;
   Q.SQL.Add('SELECT MAX(CODIGO) AS ULTIMO');
   Q.SQL.Add(' FROM PRODUTO               ');
   Q.Open;
   if not Q.Eof Then
      result := Q.FieldByName('ULTIMO').AsInteger + 1;

   Q.Free;
end;

function ProximoClienteCODIGO:Integer;
var Q : tFDQuery;
begin
   result := 1;

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';

   Q.Close;
   Q.Sql.Clear;
   Q.SQL.Add('SELECT MAX(CODIGO) AS ULTIMO');
   Q.SQL.Add(' FROM CLIENTE               ');
   Q.Open;
   if not Q.Eof Then
      result := Q.FieldByName('ULTIMO').AsInteger + 1;

   Q.Free;
end;

function DescricaoCAD_RAMO_ATIVIDADE(pCODIGO:String):String;
var Q : tFDQuery;
begin
   result := '';
   if pCodigo = '' then
      exit;

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';

   try
       Q.Close;
       Q.Sql.Clear;
       Q.SQL.Add('SELECT DESCRICAO         ');
       Q.SQL.Add('  FROM CAD_RAMO_ATIVIDADE');
       Q.SQL.Add(' WHERE CODIGO = :CODIGO  ');
       Q.ParamByName('CODIGO').AsInteger := StrToInt(pCODIGO);
       Q.Open;
       if not Q.Eof Then
          result := Q.FieldByName('DESCRICAO').AsString;
   finally
     Q.Free;
   end;
end;

procedure Registrar_Historico_Bloqueios(pCliente:Integer;pEvento:String);
var Q : tFDQuery;
begin
   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';

   Q.Close;
   Q.Sql.Clear;
   Q.SQL.Add('INSERT INTO CLIENTE_HISTORICO_BLOQUEIOS_CHB');
   Q.SQL.Add('     ( CHB_CLIENTE,                        ');
   Q.SQL.Add('       CHB_EVENTO,                         ');
   Q.SQL.Add('       CHB_DTEVENTO,                       ');
   Q.SQL.Add('       CHB_HREVENTO,                       ');
   Q.SQL.Add('       CHB_USUEVENTO,                      ');
   Q.SQL.Add('       CHB_MAQEVENTO)                      ');
   Q.SQL.Add('VALUES                                     ');
   Q.SQL.Add('     (:CHB_CLIENTE,                        ');
   Q.SQL.Add('      :CHB_EVENTO,                         ');
   Q.SQL.Add('      :CHB_DTEVENTO,                       ');
   Q.SQL.Add('      :CHB_HREVENTO,                       ');
   Q.SQL.Add('      :CHB_USUEVENTO,                      ');
   Q.SQL.Add('      :CHB_MAQEVENTO)                      ');
   Q.ParamByName('CHB_CLIENTE'  ).AsInteger := pCliente;
   Q.ParamByName('CHB_EVENTO'   ).AsString  := pEvento;
   Q.ParamByName('CHB_DTEVENTO' ).AsDatetime:= DataServidor;
   Q.ParamByName('CHB_HREVENTO' ).AsString  := HoraServidor;
   Q.ParamByName('CHB_USUEVENTO').AsString  := Global_Usuario_Logado;
   Q.ParamByName('CHB_MAQEVENTO').AsString  := NomeComputador;
   Q.ExecSql;

   Q.Free;
end;

function NomeColaborador(pCodigo:String):String;
var Q : tFDQuery;
    vCodigo : Integer;
begin
   result := '';
   if pCodigo = '' then
      exit;

   if pCodigo = 'MASTER' then
   begin
     result := 'MASTER';
     exit;
   end;

   try
      vCodigo := StrToInt(pCodigo);
   except
      exit;
   end;
   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';


   Q.Close;
   Q.Sql.Clear;
   Q.SQL.Add('SELECT NOME            ');
   Q.SQL.Add('  FROM COLABORADOR     ');
   Q.SQL.Add(' WHERE CODIGO = :CODIGO');
   Q.ParamByName('CODIGO').AsInteger := vCODIGO;
   Q.Open;
   if not Q.Eof Then
      result := Q.FieldByName('NOME').AsString;

   Q.Free;
end;

function CHEK_CPF(var_cpf:string):boolean;
(*confere o digito verificador do cpf*)
var
   i,j,sub_tot:integer;

begin
     var_cpf := SoNumerosX(var_cpf);
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
     var_cgc := SoNumerosX(var_cgc);
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

function UfInvalida(UF:String):Boolean;
begin
   result := true;
   if UF = 'AM' then Result := false;
   if UF = 'DF' then Result := false;
   if UF = 'PA' then Result := false;
   if UF = 'RO' then Result := false;
   if UF = 'RR' then Result := false;
   if UF = 'PI' then Result := false;
   if UF = 'PE' then Result := false;
   if UF = 'PB' then Result := false;
   if UF = 'RN' then Result := false;
   if UF = 'MA' then Result := false;
   if UF = 'BA' then Result := false;
   if UF = 'MT' then Result := false;
   if UF = 'MS' then Result := false;
   if UF = 'TO' then Result := false;
   if UF = 'GO' then Result := false;
   if UF = 'ES' then Result := false;
   if UF = 'PR' then Result := false;
   if UF = 'SC' then Result := false;
   if UF = 'RS' then Result := false;
   if UF = 'RJ' then Result := false;
   if UF = 'SE' then Result := false;
   if UF = 'SP' then Result := false;
   IF UF = 'MG' then Result := false;
   IF UF = 'CE' then Result := false;
   IF UF = 'AL' then Result := false;

   IF Result Then
      showMessage('UF inv�lida');
end;

Function fTiraAcentos(pFraseComAcentos:String):String;
var letra,
    vFraseSemAcentos : String;
    posicao          : Integer;
begin
   vFraseSemAcentos := '';
   for posicao := 1 to length(pFraseComAcentos) Do
   begin
          letra := copy(pFraseComAcentos,posicao,1);

          if letra = '�' Then  letra := 'A';
          if letra = '�' Then  letra := 'A';
          if letra = '�' Then  letra := 'A';
          if letra = '�' Then  letra := 'A';
          if letra = '�' Then  letra := 'E';
          if letra = '�' Then  letra := 'E';
          if letra = '�' Then  letra := 'E';
          if letra = '�' Then  letra := 'E';
          if letra = '�' Then  letra := 'I';
          if letra = '�' Then  letra := 'E';
          if letra = '�' Then  letra := 'O';
          if letra = '�' Then  letra := 'O';
          if letra = '�' Then  letra := 'O';
          if letra = '�' Then  letra := 'U';
          if letra = '�' Then  letra := 'U';
          if letra = '�' Then  letra := 'U';
          if letra = '�' Then  letra := 'C';
          if letra = '�' Then  letra := 'a';
          if letra = '�' Then  letra := 'a';
          if letra = '�' Then  letra := 'a';
          if letra = '�' Then  letra := 'a';
          if letra = '�' Then  letra := 'e';
          if letra = '�' Then  letra := 'e';
          if letra = '�' Then  letra := 'e';
          if letra = '�' Then  letra := 'e';
          if letra = '�' Then  letra := 'i';
          if letra = '�' Then  letra := 'o';
          if letra = '�' Then  letra := 'o';
          if letra = '�' Then  letra := 'o';
          if letra = '�' Then  letra := 'o';
          if letra = '�' Then  letra := 'u';
          if letra = '�' Then  letra := 'u';
          if letra = '�' Then  letra := 'u';
          if letra = '�' Then  letra := 'c';
          if letra = '�' Then  letra := 'A';
          if letra = '�' Then  letra := 'A';
          if letra = '�' Then  letra := 'O';
          if letra = '�' Then  letra := 'A';
          if letra = '�' Then  letra := 'E';
          if letra = '�' Then  letra := 'A';
          if letra = '�' Then  letra := 'I';
          if letra = '&' Then  letra := ' ';
          if letra = '�' Then  letra := ',';
          if letra = '�' Then  letra := 'C';
          if letra = '=' Then  letra := ' ';
          if letra = '`' Then  letra := '';

          vFraseSemAcentos := vFraseSemAcentos + letra;
   end;
   Result := UpperCase(vFraseSemAcentos);
end;

function ProximoREG_CODIGO:Integer;
var Q : tFDQuery;
begin
   result := 1;

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';

   Q.Close;
   Q.Sql.Clear;
   Q.SQL.Add('SELECT MAX(REG_CODIGO) AS ULTIMO');
   Q.SQL.Add(' FROM REGIAO_REG                ');
   Q.Open;
   if not Q.Eof Then
      result := Q.FieldByName('ULTIMO').AsInteger + 1;

   Q.Free;
end;

function DescricaoREGIAO(pCodigo:String):String;
var Q : tFDQuery;
    vCodigo : Integer;
begin
   result := '';
   if pCodigo = '' then
      exit;

   try
      vCodigo := StrToInt(pCodigo);
   except
      exit;
   end;


   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';

   Q.Close;
   Q.Sql.Clear;
   Q.SQL.Add('SELECT REG_DESCRICAO           ');
   Q.SQL.Add('  FROM REGIAO_REG              ');
   Q.SQL.Add(' WHERE REG_CODIGO = :REG_CODIGO');
   Q.ParamByName('REG_CODIGO').AsInteger := vCodigo;
   Q.Open;
   if not Q.Eof Then
      result := Q.FieldByName('REG_DESCRICAO').AsString;

   Q.Free;
end;

function DataValida(pData:TDateTime):String;
begin
  result := '';
  if pData > StrToDate('01/01/1900') then
     result := DateToStr(pData);
end;

procedure Criar_Empresa_Matriz;
var Q : tFDQuery;
begin
   //Verfica se a empresa Matriz (0) existe
   if ExisteEmpresa('0') then
      exit;

   //Criar se nao existe
   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';

   //Cria a tabela de empresa/filial
   Q.Close;
   Q.Sql.Clear;
   Q.SQL.Add('CREATE TABLE EMPRESA_EMP                                                       ');
   Q.SQL.Add('  (                                                                            ');
   Q.SQL.Add('    EMP_CODIGO    VARCHAR(020) NOT NULL COMMENT "Codigo da empresa/filial",    ');
   Q.SQL.Add('    EMP_DESCRICAO VARCHAR(100) NOT NULL COMMENT "Descricao da empresa/filial", ');
   Q.SQL.Add('    EMP_ATIVA     INTEGER      NOT NULL COMMENT "Status (1-Ativa, 2-Inativa)"  ');
   Q.SQL.Add('  )                                                                            ');
   Q.ExecSQL;

   //Incluir a Empresa Matriz (0-Zero)
   Q.Close;
   Q.Sql.Clear;
   Q.SQL.Add('INSERT INTO EMPRESA_EMP ');
   Q.SQL.Add('  (                     ');
   Q.SQL.Add('    EMP_CODIGO,         ');
   Q.SQL.Add('    EMP_DESCRICAO,      ');
   Q.SQL.Add('    EMP_ATIVA           ');
   Q.SQL.Add('  )                     ');
   Q.SQL.Add('VALUES                  ');
   Q.SQL.Add('  (                     ');
   Q.SQL.Add('   :EMP_CODIGO,         ');
   Q.SQL.Add('   :EMP_DESCRICAO,      ');
   Q.SQL.Add('   :EMP_ATIVA           ');
   Q.SQL.Add('  )                     ');
   Q.ParamByName('EMP_CODIGO'   ).AsString := '0';
   Q.ParamByName('EMP_DESCRICAO').AsString := 'MATRIZ';
   Q.ParamByName('EMP_ATIVA'    ).AsInteger:= 1;
   Q.ExecSQL;

   Q.Free;

end;

function ExisteEmpresa(pEMP_CODIGO:String):Boolean;
var Q : tFDQuery;
begin
   result := false;

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';

   try
     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add('SELECT *                       ');
     Q.SQL.Add('  FROM EMPRESA_EMP             ');
     Q.SQL.Add(' WHERE EMP_CODIGO = :EMP_CODIGO');
     Q.ParamByName('EMP_CODIGO').AsString := pEMP_CODIGO;
     Q.Open;
     if not Q.Eof Then
        result := true;
   except
   end;
   Q.Free;
end;

function DescricaoEmpresa(pEMP_CODIGO:String):String;
var Q : tFDQuery;
begin
   result := '';

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';

   try
     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add('SELECT EMP_DESCRICAO           ');
     Q.SQL.Add('  FROM EMPRESA_EMP             ');
     Q.SQL.Add(' WHERE EMP_CODIGO = :EMP_CODIGO');
     Q.ParamByName('EMP_CODIGO').AsString := pEMP_CODIGO;
     Q.Open;
     if not Q.Eof Then
        result := Q.FieldByName('EMP_DESCRICAO').AsString;
   except
   end;
   Q.Free;
end;

Function PossuiFiliais:Boolean;
var Q : tFDQuery;
begin
   result := False;

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';

   try
     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add('SELECT COUNT(*) AS QTDE ');
     Q.SQL.Add('  FROM EMPRESA_EMP      ');
     Q.Open;
     if Q.FieldByName('QTDE').AsInteger > 1 then
        result := True // Possui Filiais
     else
        result := False; // N�o possui Filiais
   except
   end;
   Q.Free;
end;

function fTPMOV_DESCRICAO(pTPMOV_CODIGO:String):String;
var Q : tFDQuery;
begin
   result := '';

   q := TFDQuery.Create(nil);
   q.Connection     := Module.connection;
   q.ConnectionName := 'connection';

   try
     Q.Close;
     Q.Sql.Clear;
     Q.SQL.Add('SELECT TPMOV_DESCRICAO             ');
     Q.SQL.Add('  FROM TIPOMOVIMENTO_TPMOV         ');
     Q.SQL.Add(' WHERE TPMOV_CODIGO = :TPMOV_CODIGO');
     Q.ParamByName('TPMOV_CODIGO').AsString := pTPMOV_CODIGO;
     Q.Open;
     if not Q.Eof Then
        result := Q.FieldByName('TPMOV_DESCRICAO').AsString;
   except
   end;
   Q.Free;
end;
//##############################################################################
//                FIM DAS FUNCOES DESENVOLVIDAS PELO WANDER
//##############################################################################


end.
