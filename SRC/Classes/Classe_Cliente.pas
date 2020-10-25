unit Classe_Cliente;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,

     TiposDeDados;

type
  tDetalhes_Cliente = class
  private
    FCodigo            : String;   // CLID_CODIGO

end;


  TCliente = class
  private
    FExiste            : Boolean;
    FCodigo            : String;   // CLI_CODIGO
    FNomeFantasia      : String;   // CLI_NOME_FANTASIA
    FRazaoSocial       : String;   // CLI_RAZAO_SOCIAL
	  FStatus            : Integer;  // CLI_STATUS INTEGER NOT NULL (0-ATIVO, 1-ATIVO BLOQUEADO, 2-INATIVO)
    FDetalhes          : tDetalhes_Cliente;
    function getFStatus: TStatusCadastral;
    procedure setFStatus(const Value: TStatusCadastral);
    function getFCodigo: String;
    function getFNomeFantasia: String;
    function getRazaoSocial: String;
    procedure setFCodigo(const Value: String);
    procedure setFNomeFantasia(const Value: String);
    procedure setRazaoSocial(const Value: String);
    function proximoCodigo:String;
    function getFExiste: Boolean;
    procedure LimparCampos;
    function getDetalhes: tDetalhes_Cliente;
    procedure setDetalhes(const Value: tDetalhes_Cliente);
    function Insert:Boolean;
    function Update:Boolean;
    function DadosCorretos:Boolean;
    procedure Preencher_Parametros_Cliente(pQuery:TFDQuery);
  public
    constructor Create;
    destructor Destroy; override;
    property Existe        : Boolean           read getFExiste;
    Property Codigo        : String            read getFCodigo       write setFCodigo;
    Property NomeFantasia  : String            read getFNomeFantasia write setFNomeFantasia;
    Property RazaoSocial   : String            read getRazaoSocial   write setRazaoSocial;
    Property Status        : TStatusCadastral  read getFStatus       write setFStatus;
    Property Detalhes      : tDetalhes_Cliente read getDetalhes      write setDetalhes;
    procedure Abrir;
    Function Gravar:Boolean;
end;

implementation

uses Funcoes;

var qCliente: TFDQuery;

{ TCliente }

procedure TCliente.Abrir;
var qLocal: TFDQuery;
begin
    LimparCampos;

    qLocal := TFDQuery.Create(nil);
    qLocal.ConnectionName :='X';
    qLocal.Close;
    qLocal.SQL.Clear;
    qLocal.SQL.Add('SELECT * FROM CLIENTE_CLI      ');
    qLocal.SQL.Add(' WHERE CLI_CODIGO = :CLI_CODIGO');
    qLocal.ParamByName('CLI_CODIGO').AsString := FCodigo;
    qLocal.Open;
    if qLocal.eof then
    begin
       FExiste:=False;
       qLocal.Free;
       exit;
    end;
    FExiste                      := True;
    FCodigo                      := qLocal.FieldByName('CLI_CODIGO'                 ).AsString;
    FNomeFantasia                := qLocal.FieldByName('CLI_NOME_FANTASIA'          ).AsString;
    FRazaoSocial                 := qLocal.FieldByName('CLI_RAZAO_SOCIAL'           ).AsString;
    Qlocal.Free;
end;


constructor TCliente.Create;
begin
   FDetalhes := tDetalhes_Cliente.Create;
end;

function TCliente.DadosCorretos: Boolean;
begin
    Result := False;
    // ...criticas...
    Result := True;
end;

destructor TCliente.Destroy;
begin
  FDetalhes.Free;
  inherited;
end;

function TCliente.getDetalhes: tDetalhes_Cliente;
begin
   result := FDetalhes;
end;

function TCliente.getFCodigo: String;
begin
   result := FCodigo;
end;

function TCliente.getFExiste: Boolean;
begin
   Result := FExiste;
end;

function TCliente.getFNomeFantasia: String;
begin
   result := FNomeFantasia;
end;

function TCliente.getFStatus: TStatusCadastral;
begin
   Result := IntToStatusCadastral(FStatus);
end;

function TCliente.getRazaoSocial: String;
begin
   result := FRazaoSocial;
end;

function TCliente.Gravar: Boolean;
begin
   result := False;
   if not DadosCorretos then
      exit;

   if not Existe then
   begin
      if not Insert then
         exit;
   end
   else
   begin
      if not Update then
         exit;
   end;
   Result := True;
end;

function TCliente.Insert: Boolean;
var qLocal:TFDQuery;
begin
    result := False;
    try
        qLocal := TFDQuery.Create(nil);
        qLocal.ConnectionName :='X';
        qLocal.Close;
        qLocal.SQL.Clear;
        qLocal.SQL.Add('INSERT INTO CLIENTE_CLI   ');
        qLocal.SQL.Add('     (                    ');
        qLocal.SQL.Add('       CLI_CODIGO,        ');
        qLocal.SQL.Add('       CLI_NOME_FANTASIA, ');
        qLocal.SQL.Add('       CLI_RAZAO_SOCIAL   ');
        qLocal.SQL.Add('     )                    ');
        qLocal.SQL.Add('VALUES                    ');
        qLocal.SQL.Add('     (                    ');
        qLocal.SQL.Add('      :CLI_CODIGO,        ');
        qLocal.SQL.Add('      :CLI_NOME_FANTASIA, ');
        qLocal.SQL.Add('      :CLI_RAZAO_SOCIAL   ');
        qLocal.SQL.Add('     )                    ');

        //passo 11
        Preencher_Parametros_Cliente(qLocal);
        //qLocal.ParamByName('EMP_DT').AsDateTime := DataServidor;

        qLocal.ExecSql;
        qLocal.Free;
        Log('Incluiu cliente ' + FNomeFantasia);
        Result := True;
    except
       qLocal.Free;
       ShowMessage('Erro ao incluir Cliente ' + FNomeFantasia);
       LOGErros('Erro ao incluir Cliente ' + FNomeFantasia);
    end;
end;

procedure TCliente.LimparCampos;
begin
    FNomeFantasia      := '';
    FRazaoSocial       := '';
	  FStatus            := -1;
end;

procedure TCliente.Preencher_Parametros_Cliente(pQuery: TFDQuery);
begin
   pQuery.ParamByName('CLI_CODIGO'       ).AsString := FCodigo;
   pQuery.ParamByName('CLI_NOME_FANTASIA').AsString := FNomeFantasia;
   pQuery.ParamByName('CLI_RAZAO_SOCIAL' ).AsString := FRazaoSocial;
end;

function TCliente.proximoCodigo: String;
var qLocal: TFDQuery;
    vCodigoCandidato:Integer;
    sCodigoCandidato:String;
begin
    vCodigoCandidato := 1;
    sCodigoCandidato := FormatFloat('0000000000',vCodigoCandidato);
    qLocal := TFDQuery.Create(nil);
    qLocal.ConnectionName :='X';
    qLocal.Close;
    qLocal.SQL.Clear;
    qLocal.SQL.Add('SELECT MAX(CLI_CODIGO) AS MAIOR');
    qLocal.SQL.Add('  FROM CLIENTE_CLI             ');
    qLocal.Open;
    if qLocal.eof then
    begin
      qLocal.Free;
      result := sCodigoCandidato;
      exit;
    end;
    try
      vCodigoCandidato := StrToInt(qLocal.FieldByName('MAIOR').AsString)+1;
      qLocal.Free;
      vCodigoCandidato := vCodigoCandidato + 1;
      sCodigoCandidato := FormatFloat('0000000000',vCodigoCandidato);
      result := sCodigoCandidato;
      exit;
    except
       vCodigoCandidato := 1;
       sCodigoCandidato := FormatFloat('0000000000',vCodigoCandidato);

       qLocal.Close;
       qLocal.SQL.Clear;
       qLocal.SQL.Add('SELECT 1                       ');
       qLocal.SQL.Add('  FROM CLIENTE_CLI             ');
       qLocal.SQL.Add(' WHERE CLI_CODIGO = :CLI_CODIGO');
       qLocal.ParamByName('CLI_CODIGO').AsString := sCodigoCandidato;
       qLocal.Open;
       while not qLocal.Eof do
       begin
          inc(vCodigoCandidato);
          sCodigoCandidato := FormatFloat('0000000000',vCodigoCandidato);
          qLocal.ParamByName('CLI_CODIGO').AsString := sCodigoCandidato;
          qLocal.Open;
       end;
       qLocal.Free;
       result := FormatFloat('0000000000',vCodigoCandidato);
       exit;
    end;
end;

procedure TCliente.setDetalhes(const Value: tDetalhes_Cliente);
begin
   FDetalhes := Value;
end;

procedure TCliente.setFCodigo(const Value: String);
begin
   if Value = '' then
      FCodigo := proximoCodigo
   else
      FCodigo := Copy(Value,1,10);
end;

procedure TCliente.setFNomeFantasia(const Value: String);
begin
   FNomeFantasia := UpperCase(Copy(Value,1,50));
end;

procedure TCliente.setFStatus(const Value: TStatusCadastral);
begin
   FStatus := StatusCadastralToInt(Value);
end;

procedure TCliente.setRazaoSocial(const Value: String);
begin
   FRazaoSocial := UpperCase(Copy(value,1,50));
end;

function TCliente.Update: Boolean;
var qLocal: TFDQuery;
begin
    try
        qLocal := TFDQuery.Create(nil);
        qLocal.ConnectionName :='X';
        qLocal.Close;
        qLocal.SQL.Clear;
        qLocal.SQL.Add('UPDATE CLIENTE_CLI                                             ');
        qLocal.SQL.Add('   SET CLI_NOME_FANTASIA           = :CLI_NOME_FANTASIA,       ');
        qLocal.SQL.Add('       CLI_RAZAO_SOCIAL            = :CLI_RAZAO_SOCIAL         ');
        qLocal.SQL.Add(' WHERE CLI_CODIGO                  = :CLI_CODIGO               ');
        //--------------------------------------------------------------------------------
        //qLocal.SQL.Add('       EMP_DT                      = :EMP_DT,                    ');
        //qLocal.SQL.Add('       EMP_CODIGO_UNISYSTEM        = :EMP_CODIGO_UNISYSTEM       ');

        //passo11
        Preencher_Parametros_Cliente(qLocal);
        //qLocal.ParamByName('EMP_DT').AsDateTime := FDataCadastro;
        qLocal.ExecSql;
        qLocal.Free;
        Log('Alterou Cliente '+ FNomeFantasia);
        Result := True;
    except
       qLocal.Free;
       ShowMessage('Erro ao alterar Cliente '+ FNomeFantasia);
       LogErros('Erro ao alterar Cliente '+ FNomeFantasia);
    end;
end;

end.
{
CREATE TABLE CLIENTE_CLI(
	CLI_CODIGO varchar(10) NULL,
	CLI_CDIDENTIFICACAO varchar(2) NULL,
	CLI_NOME_FANTASIA varchar(50) NULL,
	CLI_RAZAO_SOCIAL varchar(50) NULL,
	CLI_FATURA_ENDERECO varchar(40) NULL,
	CLI_FATURA_CEP varchar(9) NULL,
	CLI_FATURA_CIDADE varchar(20) NULL,
	CLI_FATURA_BAIRRO varchar(20) NULL,
	CLI_FATURA_UF varchar(2) NULL,
	CLI_FATURA_TELEFONE varchar(20) NULL,
	CLI_FATURA_CONTATO varchar(40) NULL,
	CLI_CNPJ_CPF varchar(18) NULL,
	CLI_INSCRICAO_ESTADUAL varchar(22) NULL,
	CLI_INSCRICAO_MUNICIPAL varchar(22) NULL,
	CLI_ENTREGA_ENDERECO varchar(44) NULL,
	CLI_ENTREGA_CEP varchar(9) NULL,
	CLI_ENTREGA_CIDADE varchar(20) NULL,
	CLI_ENTREGA_BAIRRO varchar(20) NULL,
	CLI_ENTREGA_UF varchar(2) NULL,
	CLI_ENTREGA_TELEFONE varchar(20) NULL,
	CLI_ENTREGA_CONTATO varchar(40) NULL,
	CLI_COBRANCA_ENDERECO varchar(44) NULL,
	CLI_COBRANCA_CEP varchar(9) NULL,
	CLI_COBRANCA_CIDADE varchar(20) NULL,
	CLI_COBRANCA_BAIRRO varchar(20) NULL,
	CLI_COBRANCA_UF varchar(2) NULL,
	CLI_COBRANCA_TELEFONE varchar(20) NULL,
	CLI_COBRANCA_CONTATO varchar(40) NULL,
	CLI_TELEFONE_GERAL varchar(36) NULL,
	CLI_FAX_GERAL varchar(12) NULL,
	CLI_CONTATO_GERAL varchar(40) NULL,
	CLI_EMAIL_GERAL varchar(40) NULL,
	CLI_SITE varchar(40) NULL,
	CLI_FATURAR_SIMNAO varchar(1) NULL,
	CLI_ATIVO_SIMNAO varchar(1) NULL,
	CLI_CDVENDEDOR varchar(10) NULL,
	CLI_OBSERVACAO varchar(40) NULL,
	CLI_LIMITE_CREDITO float NULL,
	CLI_RG varchar(20) NULL,
	CLI_DTNASC datetime NULL,
	CLI_SEXO varchar(1) NULL,
	CLI_TPPESSOAJF varchar(1) NULL,
	CLI_FORMAPG varchar(10) NULL,
	CLI_CDSUBTABELA_PRECOS varchar(10) NULL,
	CLI_OBSNOTA1 varchar(50) NULL,
	CLI_OBSNOTA2 varchar(50) NULL,
	CLI_OBSNOTA3 varchar(50) NULL,
	CLI_OBSNOTA4 varchar(50) NULL,
	CLI_NR_PED_NF varchar(1) NULL,
	CLI_CONTACONTABIL varchar(20) NULL,
	CLI_IMPDADOSDPNF varchar(1) NULL,
	CLI_CDPRODUTO_PROPRIO varchar(1) NULL,
	CLI_CONSTARELVENDA varchar(1) NULL,
	CLI_RECADASTRADO varchar(1) NULL,
	CLI_ATACADOVAREJO varchar(1) NULL,
	CLI_DTCADASTRO datetime NULL,
	CLI_CDROTA varchar(10) NULL,
	CLI_ROTAPOSICAO varchar(10) NULL,
	CLI_SITUACAOCREDITO varchar(1) NULL,
	CLI_CDRAMOATIVIDADE varchar(10) NULL,
	CLI_MULTADIARIA float NULL,
	CLI_GRUPO varchar(10) NULL,
	CLI_DESCONTO float NULL,
	CLI_TRIBUTACAO_ICMS varchar(1) NULL,
	CLI_SALDO float NULL,
	CLI_MOSTRAOBS varchar(1) NULL,
	CLI_NOTA_FISCAL varchar(1) NULL,
	CLI_DTBLOQUEIO datetime NULL,
	CLI_USUBLOQUEIO varchar(10) NULL,
	CLI_TPVEICULO varchar(10) NULL,
	CLI_REGIAO varchar(10) NULL,
	CLI_CDTABELA_PRECOS varchar(10) NULL,
	CLI_USU varchar(10) NULL,
	CLI_DT datetime NULL,
	CLI_HR varchar(5) NULL,
	CLI_CDINTERFACE varchar(10) NULL,
	CLI_CONTRIBUINTE_ICMS varchar(3) NULL,
	CLI_CRITICA_PEDIDO_DOBRADO varchar(1) NULL,
	CLI_DTLIBERACAO datetime NULL,
	CLI_USULIBERACAO varchar(10) NULL,
	CLI_HRLIBERACAO varchar(5) NULL,
	CLI_HRBLOQUEIO varchar(5) NULL,
	CLI_RESOLUCAODESCONTOICMS varchar(1) NULL,
	CLI_NOMEFINANCEIRO varchar(40) NULL,
	CLI_FONEFINANCEIRO varchar(40) NULL,
	CLI_FAXFINANCEIRO varchar(40) NULL,
	CLI_EMAILFINANCEIRO varchar(40) NULL,
	CLI_PERCDESCONTO numeric(12, 2) NULL,
	CLI_TPCOBRANCA varchar(1) NULL,
	CLI_AVISTA varchar(1) NULL,
	CLI_FRETEVP varchar(1) NULL,
	CLI_SERIENF varchar(5) NULL,
	CLI_CALCULANDO varchar(1) NULL,
	CLI_PREFIXOFAT varchar(20) NULL,
	CLI_DOCUMENTOCOBRANCA varchar(10) NULL,
	CLI_CLICOBRANCA varchar(20) NULL,
	CLI_DIAVENCEFATURA int NULL,
	CLI_RESOLUCAODESCONTOICMSVALOR varchar(1) NULL,
	CLI_IMPORTARVENDASIAC varchar(10) NULL,
	CLI_AVISAVENDASETEMDEBITO varchar(1) NULL,
	CLI_SALDODEVEDOR numeric(12, 2) NULL,
	CLI_COMISSAOVENDEDOR numeric(12, 4) NULL,
	CLI_ENTREGA_OBSERVACAO1 varchar(100) NULL,
	CLI_COBRANCA_OBSERVACAO varchar(100) NULL,
	CLI_FATURA_OBSERVACAO varchar(100) NULL,
	CLI_RESTRICAOFINANCEIRA varchar(100) NULL,
	CLI_ENTREGA_OBSERVACAO2 varchar(100) NULL,
	CLI_ENTREGA_OBSERVACAO3 varchar(100) NULL,
	CLI_ENTREGA_CONTATO_FONE varchar(20) NULL,
	CLI_CLIENTEBANCARIODESDE varchar(2) NULL,
	CLI_FATURA_BAIRRO40 varchar(40) NULL,
	CLI_ENTREGA_BAIRRO40 varchar(40) NULL,
	CLI_COBRANCA_BAIRRO40 varchar(40) NULL,
	CLI_ANIVERSARIODDMM varchar(5) NULL,
	CLI_DTVENCE datetime NULL,
	CLI_SIGLA varchar(20) NULL,
	CLI_ENDERECO_NUMERO varchar(10) NULL,
	CLI_IBGECIDADE varchar(10) NULL,
	CLI_IBGEUF varchar(2) NULL,
	CLI_PRAZO_DE_ATRASO int NULL,
	CLI_TPPRECO int NULL,
	CLI_EXPORTADOBANCO varchar(1) NULL,
	CLI_ADERJ int NULL,
	CLI_USUARIO varchar(1) NULL,
	CLI_LOGMEIN_USUARIO varchar(40) NULL,
	CLI_LOGMEIN_SENHA varchar(40) NULL,
	CLI_ACEITAPRAZOMENOR varchar(1) NULL,
	CLI_EMAILXMLNFE varchar(50) NULL,
	CLI_FATURA_NUMERO varchar(10) NULL,
	CLI_COBRANCA_NUMERO varchar(10) NULL,
	CLI_MOTIVOINATIVO varchar(10) NULL,
	CLI_MODELOBOLETO varchar(10) NULL,
	CLI_CALCULOU varchar(1) NULL,
	CLI_CONSTARPESO varchar(1) NULL,
	CLI_DTULTIMACOMPRA datetime NULL,
	CLI_DIASSEMCOMPRAR int NULL,
	CLI_PRAZO int NULL,
	CLI_LIGARCOMFREQUENCIA int NULL,
	CLI_NOTADEACOMPANHAMENTO int NULL,
	CLI_CONTATO_DIAANIVERARIO int NULL,
	CLI_CONTATO_MESANIVERARIO int NULL,
	CLI_CONTATO_SEXO int NULL,
	CLI_EXPORTAR int NULL,
	CLI_REACAOAOTELEMARKETING int NULL,
	CLI_EXIGENOTAFISCAL int NULL,
	CLI_CDPROMOTOR varchar(10) NULL,
	CLI_NEXTEL varchar(12) NULL,
	CLI_NEXTEL_ID varchar(20) NULL,
	CLI_ACEITAPROMOTOR int NULL,
	CLI_PAGAMENSALIDADES int NULL,
	CLI_FREQUENCIACOBRANCA int NULL,
	CLI_INDICACAO_IE int NULL,
	CLI_SKYPE varchar(40) NULL,
	CLI_SKYPEBRENA varchar(40) NULL,
	CLI_SKYPESENHA varchar(40) NULL,
	CLI_SKYPEEMAIL varchar(40) NULL,
	CLI_SKYPEEMAILSENHA varchar(40) NULL,
	CLI_INSTAGRAM varchar(40) NULL,
	CLI_FACEBOOK varchar(40) NULL,
	CLI_BLOG varchar(40) NULL,
	CLI_TWITTER varchar(40) NULL,
	CLI_LINKEDIN varchar(40) NULL,
	CLI_EMAILNAVENDA int NULL,
	CLI_MOSTRARDEBITOS int NULL,
	CLI_COMOCONHECEU varchar(10) NULL,
	CLI_MIGRADOEM varchar(8) NULL,
	CLI_FALTOU varchar(1) NULL,
	CLI_WHATSAPP int NULL,
	CLI_REDESOCIAL varchar(40) NULL,
	CLI_FOTO1 varchar(100) NULL,
	CLI_FOTO2 varchar(100) NULL,
	CLI_FLAG int NULL,
	CLI_CORRIGIU int NULL,
	CLI_EXPIRAEM datetime NULL,
	CLI_ATUALIZADO_NA_NUVEM int NOT NULL,
	CLI_ATUALIZADO_NA_NUVEMW int NOT NULL,
	CLI_DTNUVEM datetime NULL,
	CLI_HRNUVEM varchar(5) NULL,
	CLI_SMC int NULL,
	CLI_ATIVO int NULL,
	CLI_IM varchar(20) NULL,
	CLI_CPAIS int NULL,
	CLI_SUFRAMA varchar(9) NULL

GO



}
