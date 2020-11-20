unit Classe_Acesso;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,

     Classe_empresa;

type
   TAcesso = class
  private
      FNomeDaConexao,
      vNomeDoArquivoINI: String;
      FConectado       : Boolean;
      function conexaoExiste:Boolean;
      function carregarConfiguracaoDeAcesso:Boolean;
      function acessarBaseDeDados:Boolean;
      function getNomeDaConexao: String;
      procedure setNomeDaConexao(const Value: String);
      procedure AtualizaBaseDeDados;
      procedure AtualizaBaseDeDadosNuvem;
      procedure Alteracoes_Gerais;
      procedure Alteracoes_Cad_Empresa;
      procedure Alteracoes_Cad_Cliente;
      procedure Alteracoes_Cad_Fornecedor;
      procedure Alteracoes_Cad_Colaborador;
      procedure Tratar_Cad_Bairro;
      procedure Alteracoes_Cad_Consultor;
      procedure Alteracoes_Cad_Vendedor;
      procedure Alteracoes_Cad_Motorista;
      procedure Alteracoes_Cad_Transportadora;
      procedure Alteracoes_Cad_Contador;
      procedure Comissoes_colaboradores;
      procedure Comissoes_consultor;

   public
      procedure Conectar;
      procedure Desconectar;
      function Conectado:Boolean;
      property nomeDaConexao: String read  getNomeDaConexao
                                     write setNomeDaConexao;
   end;

implementation

{ TAcesso }

uses Dados, DadosNuvem, Funcoes;

function TAcesso.acessarBaseDeDados: Boolean;
begin
   result := false;
   if not conexaoExiste                then exit;
   if not carregarConfiguracaoDeAcesso then exit;

   AtualizaBaseDeDados;

   Cria_Objetos_das_Classes;

   Empresa := TEmpresa.Create;
   Empresa.Abrir;
   result := true;
end;

procedure TAcesso.Alteracoes_Cad_Cliente;
begin
   Executar_Script('SELECT * INTO CLIENTE_CLI_OLD FROM CLIENTE_CLI');
   Executar_Script('DROP TABLE CLIENTE_CLI');
   Executar_Script('SELECT CLI_CODIGO, CLI_NOME_FANTASIA, CLI_RAZAO_SOCIAL INTO CLIENTE_CLI FROM CLIENTE_CLI_OLD');
   Executar_Script('ALTER TABLE CLIENTE_CLI ADD CLI_STATUS INTEGER NOT NULL DEFAULT 0');

   if not Ja_Executou_Script('Criar_CLIENTE_DETALHE_CLID..') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('SELECT CLI_CODIGO               AS CLID_CODIGO,           ');
      dm.Query1.sql.Add('       CLI_CNPJ_CPF             AS CLID_CNPJ_CPF,         ');
	    dm.Query1.sql.Add('       CLI_INSCRICAO_ESTADUAL   AS CLID_IE,               ');
	    dm.Query1.sql.Add('       CLI_INSCRICAO_MUNICIPAL  AS CLID_IM,               ');
	    dm.Query1.sql.Add('       CLI_TELEFONE_GERAL       AS CLID_TELEFONE,         ');
	    dm.Query1.sql.Add('       CLI_EMAIL_GERAL          AS CLID_EMAIL,            ');
	    dm.Query1.sql.Add('       CLI_CDVENDEDOR           AS CLID_CDVENDEDOR,       ');
	    dm.Query1.sql.Add('       CLI_OBSERVACAO           AS CLID_OBS,              ');
	    dm.Query1.sql.Add('       CLI_LIMITE_CREDITO       AS CLID_LIMITE_CREDITO,   ');
	    dm.Query1.sql.Add('       CLI_RG                   AS CLID_RG,               ');
	    dm.Query1.sql.Add('       CLI_DTNASC               AS CLID_DTNASC,           ');
	    dm.Query1.sql.Add('       CLI_SEXO                 AS CLID_SEXO,             ');
	    dm.Query1.sql.Add('       CLI_TPPESSOAJF           AS CLID_PESSOA_FJ,        ');
	    dm.Query1.sql.Add('       CLI_FORMAPG              AS CLID_FORMAPG,          ');
	    dm.Query1.sql.Add('       CLI_DT                   AS CLID_DT,               ');
	    dm.Query1.sql.Add('       CLI_USU                  AS CLID_USU,              ');
	    dm.Query1.sql.Add('       CLI_HR                   AS CLID_HR,               ');
	    dm.Query1.sql.Add('       CLI_CDRAMOATIVIDADE      AS CLID_CDRAMO,           ');
	    dm.Query1.sql.Add('       CLI_GRUPO                AS CLID_CDGRUPO,          ');
      dm.Query1.sql.Add('       CLI_TRIBUTACAO_ICMS      AS CLID_TRIBUTACAO_ICMS,  ');
	    dm.Query1.sql.Add('       CLI_SALDO                AS CLID_SALDO,            ');
	    dm.Query1.sql.Add('       CLI_REGIAO               AS CLID_CDREGIAO,         ');
	    dm.Query1.sql.Add('       CLI_CONTRIBUINTE_ICMS    AS CLID_CONTRIBUINTE_ICMS,');
	    dm.Query1.sql.Add('       CLI_EMAILXMLNFE          AS CLID_EMAIL_XML,        ');
	    dm.Query1.sql.Add('       CLI_INDICACAO_IE         AS CLID_INDICACAO_IE,     ');
	    dm.Query1.sql.Add('       CLI_WHATSAPP             AS CLID_WHATSAPP,         ');
	    dm.Query1.sql.Add('       CLI_ATUALIZADO_NA_NUVEM  AS CLID_NUVEM_ATUALIZADO, ');
	    dm.Query1.sql.Add('       CLI_DTNUVEM              AS CLID_NUVEM_DT,         ');
	    dm.Query1.sql.Add('       CLI_HRNUVEM              AS CLID_NUVEM_HR,         ');
	    dm.Query1.sql.Add('       CLI_SUFRAMA              AS CLID_SUFRAMA           ');
      dm.Query1.sql.Add('  INTO CLIENTE_DETALHE_CLID FROM CLIENTE_CLI_OLD          ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('Criar_CLIENTE_ENDERECO_CLIE.') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('SELECT 1                       AS CLIE_ID,           ');
      dm.Query1.sql.Add('       CLI_CODIGO              AS CLIE_CODIGO,       ');
      dm.Query1.sql.Add('       0                       AS CLIE_TIPO_ENDERECO,');
      dm.Query1.sql.Add('       CLI_ENTREGA_ENDERECO    AS CLIE_RUA,          ');
	    dm.Query1.sql.Add('       CLI_ENDERECO_NUMERO     AS CLIE_NUMERO,       ');
	    dm.Query1.sql.Add('       CLI_ENTREGA_CEP         AS CLIE_CEP,          ');
	    dm.Query1.sql.Add('       CLI_ENTREGA_CIDADE      AS CLIE_CIDADE,       ');
	    dm.Query1.sql.Add('       CLI_IBGECIDADE          AS CLIE_CIDADE_IBGE,  ');
	    dm.Query1.sql.Add('       CLI_ENTREGA_BAIRRO      AS CLIE_BAIRRO,       ');
	    dm.Query1.sql.Add('       CLI_ENTREGA_UF          AS CLIE_UF,           ');
	    dm.Query1.sql.Add('       CLI_IBGEUF              AS CLIE_UF_IBGE,      ');
	    dm.Query1.sql.Add('       CLI_ENTREGA_TELEFONE    AS CLIE_TELEFONE,     ');
	    dm.Query1.sql.Add('       CLI_ENTREGA_OBSERVACAO2 AS CLIE_OBS1,         ');
	    dm.Query1.sql.Add('       CLI_ENTREGA_OBSERVACAO3 AS CLIE_OBS2,         ');
	    dm.Query1.sql.Add('       CLI_CPAIS               AS CLIE_CPAIS         ');
      dm.Query1.sql.Add('  INTO CLIENTE_ENDERECO_CLIE FROM CLIENTE_CLI_OLD    ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('Criar_CLIENTE_CONTATO_CLIC') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('SELECT 1                        AS CLIC_ID,         ');
      dm.Query1.sql.Add('       CLI_CODIGO               AS CLIE_CODIGO,     ');
	    dm.Query1.sql.Add('       CLI_ENTREGA_CONTATO      AS CLIC_CONTATO,    ');
      dm.Query1.sql.Add('       CLI_ENTREGA_CONTATO_FONE AS CLIC_TELEFONE    ');
      dm.Query1.sql.Add('  INTO CLIENTE_CONTATO_CLIC FROM CLIENTE_CLI_OLD    ');
      dm.Query1.ExecSql;
   end;
   if not Ja_Executou_Script('Criar_CLIENTE_BLOQUEIOS_CLIB') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('SELECT 1                     AS CLIB_ID,           ');
      dm.Query1.sql.Add('       CLI_CODIGO            AS CLIB_CODIGO,       ');
	    dm.Query1.sql.Add('       CLI_USUBLOQUEIO       AS CLIB_USU,          ');
	    dm.Query1.sql.Add('       CLI_DTBLOQUEIO        AS CLIB_DT,           ');
	    dm.Query1.sql.Add('       CLI_HRBLOQUEIO        AS CLIB_HR,           ');
	    dm.Query1.sql.Add('       CLI_USULIBERACAO      AS CLIB_USULIBEROU,   ');
	    dm.Query1.sql.Add('       CLI_DTLIBERACAO       AS CLIB_DTLIBERAOU,   ');
	    dm.Query1.sql.Add('       CLI_HRLIBERACAO       AS CLIB_HRLIBEROU     ');
      dm.Query1.sql.Add('  INTO CLIENTE_BLOQUEIOS_CLIB FROM CLIENTE_CLI_OLD ');
      dm.Query1.ExecSql;
   end;

   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_CPF  VARCHAR(11) NULL');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_CNPJ VARCHAR(14) NULL');
   if not Ja_Executou_Script('Preencher_CLID_CPF_e_CLID_CNPJ....') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('SELECT CLID_CODIGO,         ');
      dm.Query1.sql.Add('       CLID_CNPJ_CPF,       ');
	    dm.Query1.sql.Add('       CLID_PESSOA_FJ       ');
      dm.Query1.sql.Add('  FROM CLIENTE_DETALHE_CLID ');
      dm.Query1.Open;
      while not dm.Query1.eof do
      begin
         if dm.Query1.FieldByName('CLID_PESSOA_FJ').AsString = 'F' then
         begin
             dm.Query2.close;
             dm.Query2.sql.Clear;
             dm.Query2.sql.Add('UPDATE CLIENTE_DETALHE_CLID      ');
             dm.Query2.sql.Add('   SET CLID_CPF    = :CLID_CPF   ');
             dm.Query2.sql.Add(' WHERE CLID_CODIGO = :CLID_CODIGO');
             dm.Query2.ParamByName('CLID_CPF'   ).AsString := COPY(TRIM(SoNumeros(dm.Query1.FieldByName('CLID_CNPJ_CPF').AsString)),1,11);
             dm.Query2.ParamByName('CLID_CODIGO').AsString := dm.Query1.FieldByName('CLID_CODIGO').AsString;
             dm.Query2.ExecSql;
         end
         else
         begin
             dm.Query2.close;
             dm.Query2.sql.Clear;
             dm.Query2.sql.Add('UPDATE CLIENTE_DETALHE_CLID      ');
             dm.Query2.sql.Add('   SET CLID_CNPJ   = :CLID_CNPJ  ');
             dm.Query2.sql.Add(' WHERE CLID_CODIGO = :CLID_CODIGO');
             dm.Query2.ParamByName('CLID_CNPJ'  ).AsString := COPY(TRIM(SoNumeros(dm.Query1.FieldByName('CLID_CNPJ_CPF').AsString)),1,14);
             dm.Query2.ParamByName('CLID_CODIGO').AsString := dm.Query1.FieldByName('CLID_CODIGO').AsString;
             dm.Query2.ExecSql;
         end;
         dm.Query1.Next;
      end;
      Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID DROP COLUMN CLID_CNPJ_CPF');
   end;

   Executar_Script('ALTER TABLE CLIENTE_CLI ALTER COLUMN CLI_CODIGO VARCHAR(10) NOT NULL');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ALTER COLUMN CLID_CODIGO VARCHAR(10) NOT NULL');

   Executar_Script('ALTER TABLE CLIENTE_CLI ADD CONSTRAINT PK_CLIENTE_CLI PRIMARY KEY  (CLI_CODIGO)');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CONSTRAINT PK_CLIENTE_DETALHE_CLID PRIMARY KEY (CLID_CODIGO)');
   Executar_Script('CREATE CLUSTERED INDEX IDXCLI_CODIGO ON CLIENTE_CLI (CLI_CODIGO ASC)');// INCLUDE(CEP)
   Executar_Script('CREATE NONCLUSTERED INDEX IDXCLI_RAZAO_SOCIAL ON CLIENTE_CLI (CLI_RAZAO_SOCIAL ASC)');
   Executar_Script('CREATE NONCLUSTERED INDEX IDXCLI_NOME_FANTASIA ON CLIENTE_CLI (CLI_NOME_FANTASIA ASC)');
   //Executar_Script('CREATE NONCLUSTERED INDEX IDX_UF ON clientes (UF ASC) INCLUDE(CEP)

   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_RG_EMISSOR VARCHAR(10) NULL');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_RG_DTEMISSAO DATETIME NULL');

   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_ALT_USU VARCHAR(10) NULL');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_ALT_DT  DATETIME    NULL');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_ALT_HR  VARCHAR(05) NULL');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_ALT_ESTACAO VARCHAR(20) NULL');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_ALT_DTBLOQUEADO DATETIME NULL');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_ALT_DTLIBERADO  DATETIME NULL');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_CDCIDADE VARCHAR(10) NULL');
   Executar_Script('ALTER TABLE CLIENTE_ENDERECO_CLIE ALTER COLUMN CLIE_RUA VARCHAR(50) NULL');
   Executar_Script('ALTER TABLE CLIENTE_ENDERECO_CLIE ADD CLIE_COMPLEMENTO VARCHAR(50) NULL');
   Executar_Script('ALTER TABLE CLIENTE_ENDERECO_CLIE DROP COLUMN CLIE_CIDADE');
   Executar_Script('ALTER TABLE CLIENTE_ENDERECO_CLIE DROP COLUMN CLIE_CIDADE_IBGE');
   Executar_Script('ALTER TABLE CIDADE_CID ADD CONSTRAINT PK_CID_CODIGO PRIMARY KEY (CID_CODIGO)');
   Executar_Script('ALTER TABLE CLIENTE_ENDERECO_CLIE DROP COLUMN CLIE_CDCIDADE');
   Executar_Script('ALTER TABLE CLIENTE_ENDERECO_CLIE ADD CLIE_CDCIDADE VARCHAR(10) NULL FOREIGN KEY REFERENCES CIDADE_CID (CID_CODIGO)');
   Executar_Script('ALTER TABLE CLIENTE_ENDERECO_CLIE DROP COLUMN CLIE_ID');

   Executar_Script('TRUNCATE TABLE CLIENTE_CONTATO_CLIC');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC DROP COLUMN CLIC_ID');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC DROP COLUMN CLIC_CODIGO');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ADD CLIC_CODIGO VARCHAR(10) NOT NULL  PRIMARY KEY ');
   Executar_Script('UPDATE CLIENTE_CONTATO_CLIC SET CLIC_CODIGO = CLIE_CODIGO');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC DROP COLUMN CLIE_CODIGO');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ADD FOREIGN KEY FK_CLIC_CODIGO REFERENCES CLIENTE_CLI (CLI_CODIGO)');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ADD CLIC_NOME VARCHAR(50) NULL');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ADD CLIC_FONE1 VARCHAR(08) NULL');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ADD CLIC_FONE2 VARCHAR(08) NULL');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ADD CLIC_CEL1 VARCHAR(09) NULL');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ADD CLIC_WHATSAPP VARCHAR(09) NULL');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ADD CLIC_EMAIL1 VARCHAR(30) NULL');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ADD CLIC_EMAIL2 VARCHAR(30) NULL');
   Executar_Script('UPDATE CLIENTE_CONTATO_CLIC SET CLIC_NOME  = CLIC_CONTATO');
   Executar_Script('UPDATE CLIENTE_CONTATO_CLIC SET CLIC_FONE1 = CLIC_TELEFONE');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC DROP COLUMN CLIC_CONTATO');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC DROP COLUMN CLIC_TELEFONE');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_CDZONA VARCHAR(10) NULL FOREIGN KEY REFERENCES ZONA_ZON(ZON_CODIGO)');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ALTER COLUMN CLIC_FONE1 VARCHAR(10) NULL');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ALTER COLUMN CLIC_FONE2 VARCHAR(10) NULL');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ALTER COLUMN CLIC_CEL1 VARCHAR(11) NULL');
   Executar_Script('ALTER TABLE CLIENTE_CONTATO_CLIC ALTER COLUMN CLIC_WHATSAPP VARCHAR(11) NULL');
   Executar_Script('ALTER TABLE CLIENTE_ENDERECO_CLIE DROP COLUMN CLIE_TIPO_ENDERECO');

   Executar_Script('ALTER TABLE CLIENTE_BLOQUEIOS_CLIB ADD CLIB_DTINATIVO TDATETIME NULL');
   Executar_Script('ALTER TABLE CLIENTE_DETALHE_CLID ADD CLID_ALT_DTINATIVO DATETIME NULL');

   if not Ja_Executou_Script('CLIENTE_OBS_CLIOBS.') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CLIENTE_OBS_CLIOBS                        ');
      dm.Query1.sql.Add('     ( CLIOBS_CODIGO VARCHAR(20)  NOT NULL,            ');
	    dm.Query1.sql.Add('       CLIOBS_LINHA  INTEGER      NOT NULL,            ');
      dm.Query1.sql.Add('       CLIOBS_TEXTO  VARCHAR(255)     NULL,            ');
      dm.Query1.sql.Add('       CONSTRAINT PK_CLIOBS PRIMARY KEY (CLIOBS_CODIGO)');
      dm.Query1.sql.Add('     )                                                 ');
      dm.Query1.ExecSql;
   end;

{CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);
}

end;

procedure TAcesso.Alteracoes_Cad_Colaborador;
begin
   if not Ja_Executou_Script('Criar_COLABORADOR_DETALHE_CLID...') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE COLABORADOR_BLOQUEIOS_COLB (    ');
      dm.Query1.sql.Add('       COLB_CODIGO         varchar(10) NULL, ');
      dm.Query1.sql.Add('       COLB_USU            varchar(10) NULL, ');
      dm.Query1.sql.Add('       COLB_DT             datetime    NULL, ');
      dm.Query1.sql.Add('       COLB_HR             varchar(5)  NULL, ');
      dm.Query1.sql.Add('       COLB_USULIBEROU     varchar(10) NULL, ');
      dm.Query1.sql.Add('       COLB_DTLIBERAOU     datetime    NULL, ');
      dm.Query1.sql.Add('       COLB_HRLIBEROU      varchar(5)  NULL  ');
      dm.Query1.sql.Add(' )                                           ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE COLABORADOR_COL..') then
   begin
     dm.Query1.close;
     dm.Query1.sql.Clear;
     dm.Query1.sql.Add('CREATE TABLE COLABORADOR_COL (                               ');
     dm.Query1.sql.Add('       COL_CODIGO          varchar(10) NOT NULL,             ');
     dm.Query1.sql.Add('       COL_NOME_FANTASIA   varchar(50) NULL,                 ');
	   dm.Query1.sql.Add('       COL_RAZAO_SOCIAL    varchar(50) NULL,                 ');
	   dm.Query1.sql.Add('       COL_STATUS          int         NOT NULL,             ');
     dm.Query1.sql.Add('       CONSTRAINT PK_COLABORADOR_COL PRIMARY KEY (COL_CODIGO)');
     dm.Query1.sql.Add(' )                                                           ');
     dm.Query1.ExecSql;

     Executar_Script('ALTER TABLE COLABORADOR_COL ADD  DEFAULT ((0)) FOR COL_STATUS');
   end;

   if not Ja_Executou_Script('CREATE TABLE COLABORADOR_CONTATO_COLC.') then
   begin
     Executar_Script('DROP TABLE COLABORADOR_CONTATO_COLC');
     dm.Query1.close;
     dm.Query1.sql.Clear;
     dm.Query1.sql.Add('CREATE TABLE COLABORADOR_CONTATO_COLC (      ');
     dm.Query1.sql.Add('       COLC_CODIGO      varchar(10) NOT NULL,');
     dm.Query1.sql.Add('       COLC_NOME        varchar(50) NULL,    ');
     dm.Query1.sql.Add('       COLC_FONE1       varchar(10) NULL,    ');
	   dm.Query1.sql.Add('       COLC_FONE2       varchar(10) NULL,    ');
	   dm.Query1.sql.Add('       COLC_CEL1        varchar(11) NULL,    ');
   	 dm.Query1.sql.Add('       COLC_WHATSAPP    varchar(11) NULL,    ');
	   dm.Query1.sql.Add('       COLC_EMAIL1      varchar(30) NULL,    ');
	   dm.Query1.sql.Add('       COLC_EMAIL2      varchar(30) NULL     ');
     dm.Query1.sql.Add(' )                                           ');
     dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE COLABORADOR_DETALHE_COLD ') then
   begin
     dm.Query1.close;
     dm.Query1.sql.Clear;
     dm.Query1.sql.Add('CREATE TABLE COLABORADOR_DETALHE_COLD (               ');
	   dm.Query1.sql.Add('       COLD_CODIGO               varchar(10) NOT NULL,');
	   dm.Query1.sql.Add('       COLD_CNPJ_CPF             varchar(18) NULL,    ');
     dm.Query1.sql.Add('	     COLD_IE                   varchar(22) NULL,    ');
	   dm.Query1.sql.Add('       COLD_IM                   varchar(22) NULL,    ');
	   dm.Query1.sql.Add('       COLD_TELEFONE             varchar(36) NULL,    ');
     dm.Query1.sql.Add('	     COLD_EMAIL                varchar(40) NULL,    ');
	   dm.Query1.sql.Add('       COLD_CDVENDEDOR           varchar(10) NULL,    ');
	   dm.Query1.sql.Add('       COLD_OBS                  varchar(40) NULL,    ');
	   dm.Query1.sql.Add('       COLD_LIMITE_CREDITO       float       NULL,    ');
	   dm.Query1.sql.Add('       COLD_RG                   varchar(20) NULL,    ');
	   dm.Query1.sql.Add('       COLD_DTNASC               datetime    NULL,    ');
	   dm.Query1.sql.Add('       COLD_SEXO                 varchar(1)  NULL,    ');
	   dm.Query1.sql.Add('       COLD_PESSOA_FJ            varchar(1)  NULL,    ');
	   dm.Query1.sql.Add('       COLD_FORMAPG              varchar(10) NULL,    ');
     dm.Query1.sql.Add('	     COLD_DT                   datetime    NULL,    ');
     dm.Query1.sql.Add('	     COLD_USU                  varchar(10) NULL,    ');
     dm.Query1.sql.Add('	     COLD_HR                   varchar(5)  NULL,    ');
     dm.Query1.sql.Add('	     COLD_CDRAMO               varchar(10) NULL,    ');
     dm.Query1.sql.Add('	     COLD_CDGRUPO              varchar(10) NULL,    ');
     dm.Query1.sql.Add('	     COLD_TRIBUTACAO_ICMS      varchar(1)  NULL,    ');
     dm.Query1.sql.Add('	     COLD_SALDO                float       NULL,    ');
     dm.Query1.sql.Add('	     COLD_CDREGIAO             varchar(10) NULL,    ');
     dm.Query1.sql.Add('	     COLD_CONTRIBUINTE_ICMS    varchar(3)  NULL,    ');
     dm.Query1.sql.Add('	     COLD_EMAIL_XML            varchar(50) NULL,    ');
     dm.Query1.sql.Add('	     COLD_INDICACAO_IE         int         NULL,    ');
     dm.Query1.sql.Add('	     COLD_WHATSAPP             int         NULL,    ');
     dm.Query1.sql.Add('	     COLD_NUVEM_ATUALIZADO     int         NOT NULL,');
     dm.Query1.sql.Add('	     COLD_NUVEM_DT             datetime    NULL,    ');
     dm.Query1.sql.Add('	     COLD_NUVEM_HR             varchar(5)  NULL,    ');
     dm.Query1.sql.Add('	     COLD_SUFRAMA              varchar(9)  NULL,    ');
     dm.Query1.sql.Add('	     COLD_CPF                  varchar(11) NULL,    ');
     dm.Query1.sql.Add('	     COLD_CNPJ                 varchar(14) NULL,    ');
     dm.Query1.sql.Add('	     COLD_RG_EMISSOR           varchar(10) NULL,    ');
     dm.Query1.sql.Add('	     COLD_RG_DTEMISSAO         datetime    NULL,    ');
     dm.Query1.sql.Add('	     COLD_ALT_USU              varchar(10) NULL,    ');
     dm.Query1.sql.Add('	     COLD_ALT_DT               datetime    NULL,    ');
     dm.Query1.sql.Add('	     COLD_ALT_HR               varchar(5)  NULL,    ');
     dm.Query1.sql.Add('	     COLD_ALT_ESTACAO          varchar(20) NULL,    ');
     dm.Query1.sql.Add('	     COLD_ALT_DTBLOQUEADO      datetime    NULL,    ');
     dm.Query1.sql.Add('	     COLD_ALT_DTLIBERADO       datetime    NULL,    ');
     dm.Query1.sql.Add('	     COLD_CDCIDADE             varchar(10) NULL,    ');
     dm.Query1.sql.Add('	     COLD_CDZONA               varchar(10) NULL,    ');
     dm.Query1.sql.Add('	     COLD_ALT_DTINATIVO        datetime    NULL     ');
     dm.Query1.sql.Add(' )                                                    ');
     dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE COLABORADOR_ENDERECO_COLE ') then
   begin
     dm.Query1.close;
     dm.Query1.sql.Clear;
     dm.Query1.sql.Add('CREATE TABLE COLABORADOR_ENDERECO_COLE (    ');
     dm.Query1.sql.Add('       COLE_CODIGO      varchar(10)  NULL,  ');
	   dm.Query1.sql.Add('       COLE_RUA         varchar(50)  NULL,  ');
     dm.Query1.sql.Add('       COLE_NUMERO      varchar(10)  NULL,  ');
   	 dm.Query1.sql.Add('       COLE_CEP         varchar(9)   NULL,  ');
     dm.Query1.sql.Add('       COLE_BAIRRO      varchar(20)  NULL,  ');
	   dm.Query1.sql.Add('       COLE_UF          varchar(2)   NULL,  ');
	   dm.Query1.sql.Add('       COLE_UF_IBGE     varchar(2)   NULL,  ');
	   dm.Query1.sql.Add('       COLE_TELEFONE    varchar(20)  NULL,  ');
	   dm.Query1.sql.Add('       COLE_OBS1        varchar(100) NULL,  ');
	   dm.Query1.sql.Add('       COLE_OBS2        varchar(100) NULL,  ');
	   dm.Query1.sql.Add('       COLE_CPAIS       int          NULL,  ');
	   dm.Query1.sql.Add('       COLE_COMPLEMENTO varchar(50)  NULL,  ');
	   dm.Query1.sql.Add('       COLE_CDCIDADE    varchar(10)  NULL   ');
     dm.Query1.sql.Add(' )                                          ');
     dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE COLABORADOR_HISTORICO_BLOQUEIOS_COLHB.') then
   begin
     Executar_Script('DROP TABLE COLABORADOR_HISTORICO_BLOQUEIOS_COLHB');
     dm.Query1.close;
     dm.Query1.sql.Clear;
     dm.Query1.sql.Add('CREATE TABLE COLABORADOR_HISTORICO_BLOQUEIOS_COLHB ( ');
	   dm.Query1.sql.Add('       COLHB_COLABORADOR varchar(20) NOT NULL,       ');
	   dm.Query1.sql.Add('       COLHB_DTEVENTO    date        NOT NULL,       ');
	   dm.Query1.sql.Add('       COLHB_HREVENTO    varchar(5)  NOT NULL,       ');
	   dm.Query1.sql.Add('       COLHB_USUEVENTO   varchar(20) NOT NULL,       ');
	   dm.Query1.sql.Add('       COLHB_MAQEVENTO   varchar(50) NOT NULL,       ');
	   dm.Query1.sql.Add('       COLHB_EVENTO      varchar(20) NULL            ');
     dm.Query1.sql.Add(' )                                                   ');
     dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE COLABORADOR_OBS_COLOBS ') then
   begin
     dm.Query1.close;
     dm.Query1.sql.Clear;
     dm.Query1.sql.Add('CREATE TABLE COLABORADOR_OBS_COLOBS (          ');
     dm.Query1.sql.Add('       COLOBS_CODIGO   varchar(20)   NOT NULL, ');
	   dm.Query1.sql.Add('       COLOBS_LINHA    int           NOT NULL, ');
	   dm.Query1.sql.Add('       COLOBS_TEXTO    varchar(255)  NULL      ');
     dm.Query1.sql.Add(' )                                             ');
     dm.Query1.ExecSql;
   end;
end;

procedure TAcesso.Alteracoes_Cad_Consultor;
begin
   if not Ja_Executou_Script('Criar_CONSULTOR') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONSULTOR_BLOQUEIOS_CONB ( ');
      dm.Query1.sql.Add('       CONB_CODIGO     varchar(10) NULL,');
      dm.Query1.sql.Add('       CONB_USU        varchar(10) NULL,');
      dm.Query1.sql.Add('       CONB_DT         datetime    NULL,');
      dm.Query1.sql.Add('       CONB_HR         varchar(5)  NULL,');
      dm.Query1.sql.Add('       CONB_USULIBEROU varchar(10) NULL,');
      dm.Query1.sql.Add('       CONB_DTLIBERAOU datetime    NULL,');
      dm.Query1.sql.Add('       CONB_HRLIBEROU  varchar(5)  NULL ');
      dm.Query1.sql.Add('       )                                ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE CONSULTOR_CONB.') then
   begin
     dm.Query1.close;
     dm.Query1.sql.Clear;
     dm.Query1.sql.Add('CREATE TABLE CONSULTOR_CON (                        ');
     dm.Query1.sql.Add('       CON_CODIGO        varchar(10) NOT NULL,      ');
     dm.Query1.sql.Add('       CON_NOME_FANTASIA varchar(50) NULL,          ');
     dm.Query1.sql.Add('       CON_RAZAO_SOCIAL  varchar(50) NULL,          ');
     dm.Query1.sql.Add('       CON_STATUS        int         NOT NULL,      ');
     dm.Query1.sql.Add('CONSTRAINT PK_CONSULTOR_CON PRIMARY KEY (CON_CODIGO)');
     dm.Query1.sql.Add('    )                                               ');
     dm.Query1.ExecSql;

     Executar_Script('ALTER TABLE CONSULTOR_CON ADD  DEFAULT ((0)) FOR CON_STATUS');
   end;

   if not Ja_Executou_Script('CREATE TABLE CONSULTOR_CONTATO_CONC.') then
   begin
      Executar_Script('DROP TABLE CONSULTOR_CONTATO_CONC');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONSULTOR_CONTATO_CONC (     ');
      dm.Query1.sql.Add('       CONC_CODIGO   varchar(10) NOT NULL,');
      dm.Query1.sql.Add('       CONC_NOME     varchar(50) NULL,    ');
      dm.Query1.sql.Add('       CONC_FONE1    varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONC_FONE2    varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONC_CEL1     varchar(11) NULL,    ');
      dm.Query1.sql.Add('       CONC_WHATSAPP varchar(11) NULL,    ');
      dm.Query1.sql.Add('       CONC_EMAIL1   varchar(30) NULL,    ');
      dm.Query1.sql.Add('       CONC_EMAIL2   varchar(30) NULL     ');
      dm.Query1.sql.Add('       )                                  ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE CONSULTOR_DETALHE_COND.') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONSULTOR_DETALHE_COND (              ');
      dm.Query1.sql.Add('       COND_CODIGO   varchar(10)          NOT NULL,');
      dm.Query1.sql.Add('       COND_CNPJ_CPF varchar(18)          NULL,    ');
      dm.Query1.sql.Add('       COND_IE       varchar(22)          NULL,    ');
      dm.Query1.sql.Add('       COND_IM       varchar(22)          NULL,    ');
      dm.Query1.sql.Add('       COND_TELEFONE varchar(36)          NULL,    ');
      dm.Query1.sql.Add('       COND_EMAIL    varchar(40)          NULL,    ');
      dm.Query1.sql.Add('       COND_CDVENDEDOR varchar(10)        NULL,    ');
      dm.Query1.sql.Add('       COND_OBS        varchar(40)        NULL,    ');
      dm.Query1.sql.Add('       COND_LIMITE_CREDITO float          NULL,    ');
      dm.Query1.sql.Add('       COND_RG                varchar(20) NULL,    ');
      dm.Query1.sql.Add('       COND_DTNASC            datetime    NULL,    ');
      dm.Query1.sql.Add('       COND_SEXO              varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       COND_PESSOA_FJ         varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       COND_FORMAPG           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       COND_DT                datetime    NULL,    ');
      dm.Query1.sql.Add('       COND_USU               varchar(10) NULL,    ');
      dm.Query1.sql.Add('       COND_HR                varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       COND_CDRAMO            varchar(10) NULL,    ');
      dm.Query1.sql.Add('       COND_CDGRUPO           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       COND_TRIBUTACAO_ICMS   varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       COND_SALDO             float       NULL,    ');
      dm.Query1.sql.Add('       COND_CDREGIAO          varchar(10) NULL,    ');
      dm.Query1.sql.Add('       COND_CONTRIBUINTE_ICMS varchar(3)  NULL,    ');
      dm.Query1.sql.Add('       COND_EMAIL_XML         varchar(50) NULL,    ');
      dm.Query1.sql.Add('       COND_INDICACAO_IE      int         NULL,    ');
      dm.Query1.sql.Add('       COND_WHATSAPP          int         NULL,    ');
      dm.Query1.sql.Add('       COND_NUVEM_ATUALIZADO  int         NOT NULL,');
      dm.Query1.sql.Add('       COND_NUVEM_DT          datetime    NULL,    ');
      dm.Query1.sql.Add('       COND_NUVEM_HR          varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       COND_SUFRAMA           varchar(9)  NULL,    ');
      dm.Query1.sql.Add('       COND_CPF               varchar(11) NULL,    ');
      dm.Query1.sql.Add('       COND_CNPJ              varchar(14) NULL,    ');
      dm.Query1.sql.Add('       COND_RG_EMISSOR        varchar(10) NULL,    ');
      dm.Query1.sql.Add('       COND_RG_DTEMISSAO      datetime    NULL,    ');
      dm.Query1.sql.Add('       COND_ALT_USU           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       COND_ALT_DT            datetime    NULL,    ');
      dm.Query1.sql.Add('       COND_ALT_HR            varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       COND_ALT_ESTACAO       varchar(20) NULL,    ');
      dm.Query1.sql.Add('       COND_ALT_DTBLOQUEADO   datetime    NULL,    ');
      dm.Query1.sql.Add('       COND_ALT_DTLIBERADO    datetime    NULL,    ');
      dm.Query1.sql.Add('       COND_CDCIDADE          varchar(10) NULL,    ');
      dm.Query1.sql.Add('       COND_CDZONA            varchar(10) NULL,    ');
      dm.Query1.sql.Add('       COND_ALT_DTINATIVO     datetime    NULL,    ');
      dm.Query1.sql.Add('       )                                           ');
      dm.Query1.ExecSql;
   end;
   Executar_Script('ALTER TABLE CONSULTOR_DETALHE_COND ADD COND_COMISSAO FLOAT NOT NULL DEFAULT 0');

   if not Ja_Executou_Script('CREATE TABLE CONSULTOR_ENDERECO_CONE..') then
   begin
      Executar_Script('DROP TABLE CONSULTOR_ENDERECO_CONE');

      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONSULTOR_ENDERECO_CONE (   ');
      dm.Query1.sql.Add('       CONE_CODIGO      varchar(10) NULL,');
      dm.Query1.sql.Add('       CONE_RUA         varchar(50) NULL,');
      dm.Query1.sql.Add('       CONE_NUMERO      varchar(10) NULL,');
      dm.Query1.sql.Add('       CONE_CEP         varchar(9)  NULL,');
      dm.Query1.sql.Add('       CONE_BAIRRO      varchar(20) NULL,');
      dm.Query1.sql.Add('       CONE_UF          varchar(2)  NULL,');
      dm.Query1.sql.Add('       CONE_UF_IBGE     varchar(2)  NULL,');
      dm.Query1.sql.Add('       CONE_TELEFONE    varchar(20) NULL,');
      dm.Query1.sql.Add('       CONE_OBS1        varchar(100)NULL,');
      dm.Query1.sql.Add('       CONE_OBS2        varchar(100)NULL,');
      dm.Query1.sql.Add('       CONE_CPAIS       int         NULL,');
      dm.Query1.sql.Add('       CONE_COMPLEMENTO varchar(50) NULL,');
      dm.Query1.sql.Add('       CONE_CDCIDADE    varchar(10) NULL ');
      dm.Query1.sql.Add('       )                                 ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE CONSULTOR_HISTORICO_BLOQUEIOS_CHB') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONSULTOR_HISTORICO_BLOQUEIOS_CHB (');
      dm.Query1.sql.Add('       CHB_CONSULTOR varchar(20) NOT NULL,      ');
      dm.Query1.sql.Add('       CHB_DTEVENTO  date        NOT NULL,      ');
      dm.Query1.sql.Add('       CHB_HREVENTO  varchar(5)  NOT NULL,      ');
      dm.Query1.sql.Add('       CHB_USUEVENTO varchar(20) NOT NULL,      ');
      dm.Query1.sql.Add('       CHB_MAQEVENTO varchar(50) NOT NULL,      ');
      dm.Query1.sql.Add('       CHB_EVENTO    varchar(20) NULL           ');
      dm.Query1.sql.Add('       )                                        ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE CONSULTOR_OBS_CONOBS.') then
   begin
      Executar_Script('DROP TABLE CONSULTOR_OBS_CONOBS');

      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONSULTOR_OBS_CONOBS(         ');
      dm.Query1.sql.Add('       CONOBS_CODIGO varchar(20)  NOT NULL,');
      dm.Query1.sql.Add('       CONOBS_LINHA  int NOT      NULL,    ');
      dm.Query1.sql.Add('       CONOBS_TEXTO  varchar(255) NULL     ');
      dm.Query1.sql.Add('       )                                   ');
      dm.Query1.ExecSql;
   end;

end;

procedure TAcesso.Alteracoes_Cad_Contador;
begin
   if not Ja_Executou_Script('Criar_CONTADOR') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONTADOR_BLOQUEIOS_CONTB (  ');
      dm.Query1.sql.Add('       CONTB_CODIGO     varchar(10) NULL,');
      dm.Query1.sql.Add('       CONTB_USU        varchar(10) NULL,');
      dm.Query1.sql.Add('       CONTB_DT         datetime    NULL,');
      dm.Query1.sql.Add('       CONTB_HR         varchar(5)  NULL,');
      dm.Query1.sql.Add('       CONTB_USULIBEROU varchar(10) NULL,');
      dm.Query1.sql.Add('       CONTB_DTLIBERAOU datetime    NULL,');
      dm.Query1.sql.Add('       CONTB_HRLIBEROU  varchar(5)  NULL ');
      dm.Query1.sql.Add('       )                                 ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE CONTADOR_CONT') then
   begin
     Executar_Script('DROP TABLE CONTADOR_CONTB');
     dm.Query1.close;
     dm.Query1.sql.Clear;
     dm.Query1.sql.Add('CREATE TABLE CONTADOR_CONT (                   ');
     dm.Query1.sql.Add('       CONT_CODIGO        varchar(10) NOT NULL,');
     dm.Query1.sql.Add('       CONT_NOME_FANTASIA varchar(50) NULL,    ');
     dm.Query1.sql.Add('       CONT_RAZAO_SOCIAL  varchar(50) NULL,    ');
     dm.Query1.sql.Add('       CONT_STATUS        int         NOT NULL ');
     dm.Query1.sql.Add('    )                                          ');
     dm.Query1.ExecSql;

     Executar_Script('ALTER TABLE CONTADOR_CONT ADD  DEFAULT ((0)) FOR CONT_STATUS');
   end;

   if not Ja_Executou_Script('CREATE TABLE CONTADOR_CONTATO_CONTC.') then
   begin
      Executar_Script('DROP TABLE CONTADOR_CONTATO_CONTC');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONTADOR_CONTATO_CONTC (      ');
      dm.Query1.sql.Add('       CONTC_CODIGO   varchar(10) NOT NULL,');
      dm.Query1.sql.Add('       CONTC_NOME     varchar(50) NULL,    ');
      dm.Query1.sql.Add('       CONTC_FONE1    varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONTC_FONE2    varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONTC_CEL1     varchar(11) NULL,    ');
      dm.Query1.sql.Add('       CONTC_WHATSAPP varchar(11) NULL,    ');
      dm.Query1.sql.Add('       CONTC_EMAIL1   varchar(30) NULL,    ');
      dm.Query1.sql.Add('       CONTC_EMAIL2   varchar(30) NULL     ');
      dm.Query1.sql.Add('       )                                   ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE CONTADOR_DETALHE_CONTD') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONTADOR_DETALHE_CONTD (               ');
      dm.Query1.sql.Add('       CONTD_CODIGO   varchar(10)          NOT NULL,');
      dm.Query1.sql.Add('       CONTD_CNPJ_CPF varchar(18)          NULL,    ');
      dm.Query1.sql.Add('       CONTD_IE       varchar(22)          NULL,    ');
      dm.Query1.sql.Add('       CONTD_IM       varchar(22)          NULL,    ');
      dm.Query1.sql.Add('       CONTD_TELEFONE varchar(36)          NULL,    ');
      dm.Query1.sql.Add('       CONTD_EMAIL    varchar(40)          NULL,    ');
      dm.Query1.sql.Add('       CONTD_CDVENDEDOR varchar(10)        NULL,    ');
      dm.Query1.sql.Add('       CONTD_OBS        varchar(40)        NULL,    ');
      dm.Query1.sql.Add('       CONTD_LIMITE_CREDITO float          NULL,    ');
      dm.Query1.sql.Add('       CONTD_RG                varchar(20) NULL,    ');
      dm.Query1.sql.Add('       CONTD_DTNASC            datetime    NULL,    ');
      dm.Query1.sql.Add('       CONTD_SEXO              varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       CONTD_PESSOA_FJ         varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       CONTD_FORMAPG           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONTD_DT                datetime    NULL,    ');
      dm.Query1.sql.Add('       CONTD_USU               varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONTD_HR                varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       CONTD_CDRAMO            varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONTD_CDGRUPO           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONTD_TRIBUTACAO_ICMS   varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       CONTD_SALDO             float       NULL,    ');
      dm.Query1.sql.Add('       CONTD_CDREGIAO          varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONTD_CONTRIBUINTE_ICMS varchar(3)  NULL,    ');
      dm.Query1.sql.Add('       CONTD_EMAIL_XML         varchar(50) NULL,    ');
      dm.Query1.sql.Add('       CONTD_INDICACAO_IE      int         NULL,    ');
      dm.Query1.sql.Add('       CONTD_WHATSAPP          int         NULL,    ');
      dm.Query1.sql.Add('       CONTD_NUVEM_ATUALIZADO  int         NOT NULL,');
      dm.Query1.sql.Add('       CONTD_NUVEM_DT          datetime    NULL,    ');
      dm.Query1.sql.Add('       CONTD_NUVEM_HR          varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       CONTD_SUFRAMA           varchar(9)  NULL,    ');
      dm.Query1.sql.Add('       CONTD_CPF               varchar(11) NULL,    ');
      dm.Query1.sql.Add('       CONTD_CNPJ              varchar(14) NULL,    ');
      dm.Query1.sql.Add('       CONTD_RG_EMISSOR        varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONTD_RG_DTEMISSAO      datetime    NULL,    ');
      dm.Query1.sql.Add('       CONTD_ALT_USU           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONTD_ALT_DT            datetime    NULL,    ');
      dm.Query1.sql.Add('       CONTD_ALT_HR            varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       CONTD_ALT_ESTACAO       varchar(20) NULL,    ');
      dm.Query1.sql.Add('       CONTD_ALT_DTBLOQUEADO   datetime    NULL,    ');
      dm.Query1.sql.Add('       CONTD_ALT_DTLIBERADO    datetime    NULL,    ');
      dm.Query1.sql.Add('       CONTD_CDCIDADE          varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONTD_CDZONA            varchar(10) NULL,    ');
      dm.Query1.sql.Add('       CONTD_ALT_DTINATIVO     datetime    NULL     ');
      dm.Query1.sql.Add('       )                                            ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE CONTADOR_ENDERECO_CONTE') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONTADOR_ENDERECO_CONTE (    ');
      dm.Query1.sql.Add('       CONTE_CODIGO      varchar(10) NULL,');
      dm.Query1.sql.Add('       CONTE_RUA         varchar(50) NULL,');
      dm.Query1.sql.Add('       CONTE_NUMERO      varchar(10) NULL,');
      dm.Query1.sql.Add('       CONTE_CEP         varchar(9)  NULL,');
      dm.Query1.sql.Add('       CONTE_BAIRRO      varchar(20) NULL,');
      dm.Query1.sql.Add('       CONTE_UF          varchar(2)  NULL,');
      dm.Query1.sql.Add('       CONTE_UF_IBGE     varchar(2)  NULL,');
      dm.Query1.sql.Add('       CONTE_TELEFONE    varchar(20) NULL,');
      dm.Query1.sql.Add('       CONTE_OBS1        varchar(100)NULL,');
      dm.Query1.sql.Add('       CONTE_OBS2        varchar(100)NULL,');
      dm.Query1.sql.Add('       CONTE_CPAIS       int         NULL,');
      dm.Query1.sql.Add('       CONTE_COMPLEMENTO varchar(50) NULL,');
      dm.Query1.sql.Add('       CONTE_CDCIDADE    varchar(10) NULL ');
      dm.Query1.sql.Add('       )                                  ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE CONTADOR_HISTORICO_BLOQUEIOS_CONTHB..') then
   begin
      Executar_Script('DROP TABLE  CONTADOR_HISTORICO_BLOQUEIOS_CONTHB');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONTADOR_HISTORICO_BLOQUEIOS_CONTHB (');
      dm.Query1.sql.Add('       CONTHB_CONTADOR  varchar(20) NOT NULL,     ');
      dm.Query1.sql.Add('       CONTHB_DTEVENTO  date        NOT NULL,     ');
      dm.Query1.sql.Add('       CONTHB_HREVENTO  varchar(5)  NOT NULL,     ');
      dm.Query1.sql.Add('       CONTHB_USUEVENTO varchar(20) NOT NULL,     ');
      dm.Query1.sql.Add('       CONTHB_MAQEVENTO varchar(50) NOT NULL,     ');
      dm.Query1.sql.Add('       CONTHB_EVENTO    varchar(20) NULL          ');
      dm.Query1.sql.Add('       )                                          ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE CONTADOR_OBS_CONTOBS') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONTADOR_OBS_CONTOBS(          ');
      dm.Query1.sql.Add('       CONTOBS_CODIGO varchar(20)  NOT NULL,');
      dm.Query1.sql.Add('       CONTOBS_LINHA  int NOT      NULL,    ');
      dm.Query1.sql.Add('       CONTOBS_TEXTO  varchar(255) NULL     ');
      dm.Query1.sql.Add('       )                                    ');
      dm.Query1.ExecSql;
   end;

end;

procedure TAcesso.Alteracoes_Cad_Empresa;
begin
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN CLID_ALT_USU VARCHAR(10) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN CLID_ALT_DT  DATETIME    NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN CLID_ALT_HR  VARCHAR(05) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN CLID_ALT_ESTACAO VARCHAR(20) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN CLID_ALT_DTBLOQUEADO DATETIME NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN CLID_ALT_DTLIBERADO  DATETIME NULL');

   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CODIGO_UNISYSTEM VARCHAR(10) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_DESCRICAO');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_INICIOATIVIDADES    DATETIME    NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_SUFRAMA             VARCHAR(10) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_INSCRICAO_ESTADUAL  VARCHAR(20) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_INSCRICAO_MUNICIPAL VARCHAR(20) NULL');
   Executar_Script('UPDATE EMPRESA_EMP SET EMP_INSCRICAO_ESTADUAL  = EMP_IE');
   Executar_Script('UPDATE EMPRESA_EMP SET EMP_INSCRICAO_MUNICIPAL = EMP_INSCRICAOMUNICIPAL');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_IE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_INSCRICAOMUNICIPAL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_NIRE VARCHAR(11) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_INSCRICAO_ESTADUAL_ST varchar(20) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CONTRIBUINTE_IPI INTEGER NULL DEFAULT 0');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_APURACAO_MENSAL INTEGER NULL DEFAULT 0');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CELULAR VARCHAR(40) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_WHATSAPP VARCHAR(40) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_RESPONSAVEL_NOME     varchar(40) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_RESPONSAVEL_TELEFONE varchar(40) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_RESPONSAVEL_CELULAR  varchar(40) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_RESPONSAVEL_EMAIL    varchar(40) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CONTADOR_EMPRESA     VARCHAR(40) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CONTADOR_RESPONSAVEL VARCHAR(40) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CONTADOR_CNPJ        VARCHAR(14) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CONTADOR_CPF         VARCHAR(11) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CONTADOR_TEL1        VARCHAR(20) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CONTADOR_TEL2        VARCHAR(20) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CONTADOR_CRC         VARCHAR(20) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CONTADOR_CEL1        VARCHAR(20) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CONTADOR_CEL2        VARCHAR(20) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CONTADOR_EMAIL       VARCHAR(40) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_DT                   DATETIME    NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_CNPJCPF');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_CORTELA');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_CORLETRA');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_DISCIPLINAS');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_QTDMESAS');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_FONTEMAPAMESAS');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_CODIGOINTERFACE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_FAX');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_GERENTE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_FONESGERENTE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_FAXGERENTE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_EMAILGERENTE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_ALMOXARIFADOPARADIESEL');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_CIDADENOME');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_EMPRESA_SIMPLES_NACIONAL');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_CERTIFICADOVENCE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_BOLETO');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_BANCO');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_CDBANCO');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_NMBANCO');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_CDCEDENTE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_DGCEDENTE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_CARTEIRA');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_AGENCIA');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_DGAGENCIA');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_CONTACORRENTE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_DIGITOCC');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_ESPECIE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_MULTAATRASO');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_JUROSDIA');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_ACRESCIMOBOLETO');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_PRINTER_COMANDA');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_PRINTER_COZINHA');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_PRINTER_NFCE');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_LINHASAPOSCUPOM');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_TEMPOSEMCOMANDARMESA');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_MSGRODAPECOMANDA');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_MSGRODAPERECIBO');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_TAXAGARCOM');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_COUVERT');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_PIS_CUMULATIVO INTEGER NULL DEFAULT 0');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_PIS_ALIQUOTA NUMERIC(12,2) NULL DEFAULT 0');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_COFINS_CUMULATIVO INTEGER NULL DEFAULT 0');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_COFINS_ALIQUOTA NUMERIC(12,2) NULL DEFAULT 0');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_LOGO VARCHAR(255) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_ASSINATURA VARCHAR(255) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_TRATAR_ICMS_DIFERIMENTO INTEGER NULL DEFAULT 0');
   Executar_Script('ALTER TABLE EMPRESA_EMP ALTER COLUMN EMP_RAZAOSOCIAL VARCHAR(50) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_RAZAOSOCIAL VARCHAR(50) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_RESPONSAVEL_WHATSAPP varchar(40) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP DROP COLUMN EMP_RESPONSAVEL_TELEFONE');

   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_ALT_USU VARCHAR(10) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_ALT_DT  DATETIME    NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_ALT_HR  VARCHAR(05) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_ALT_ESTACAO VARCHAR(20) NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_ALT_DTBLOQUEADO_SIM DATETIME NULL');
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_ALT_DTBLOQUEADO_NAO DATETIME NULL');

end;

procedure TAcesso.Alteracoes_Cad_Fornecedor;
begin
   if not Ja_Executou_Script('Criar_FORNECEDOR_FOR...') then
   begin
      Executar_Script('DROP TABLE FORNECEDOR_BLOQUEIOS_FORB');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.add('CREATE TABLE FORNECEDOR_BLOQUEIOS_FORB ( ');
      dm.Query1.sql.add('       FORB_CODIGO     varchar(10) NULL, ');
      dm.Query1.sql.add('       FORB_USU        varchar(10) NULL, ');
      dm.Query1.sql.add('       FORB_DT         datetime    NULL, ');
      dm.Query1.sql.add('       FORB_HR         varchar(5)  NULL, ');
      dm.Query1.sql.add('       FORB_USULIBEROU varchar(10) NULL, ');
      dm.Query1.sql.add('       FORB_DTLIBERAOU datetime    NULL, ');
      dm.Query1.sql.add('       FORB_HRLIBEROU  varchar(5)  NULL  ');
      dm.Query1.sql.add('       )                                 ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE FORNECEDOR_FOR...') then
   begin
      Executar_Script('DROP TABLE  FORNECEDOR_FOR');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.add('CREATE TABLE FORNECEDOR_FOR(                                ');
      dm.Query1.sql.add('       FOR_CODIGO        varchar(10) NOT NULL,              ');
      dm.Query1.sql.add('       FOR_NOME_FANTASIA varchar(50) NULL,                  ');
      dm.Query1.sql.add('       FOR_RAZAO_SOCIAL  varchar(50) NULL,                  ');
      dm.Query1.sql.add('       FOR_STATUS        int         NOT NULL,              ');
      dm.Query1.sql.add('       CONSTRAINT PK_FORNEDEDOR_FOR PRIMARY KEY (FOR_CODIGO)');
      dm.Query1.sql.add('       )                                            ');
      dm.Query1.ExecSql;

      Executar_Script('ALTER TABLE FORNECEDOR_FOR ADD DEFAULT ((0)) FOR FOR_STATUS');
   end;

   if not Ja_Executou_Script('CREATE TABLE FORNECEDOR_CONTATO_FORC..') then
   begin
       Executar_Script('DROP TABLE  FORNECEDOR_CONTATO_FORC');

      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.add('CREATE TABLE FORNECEDOR_CONTATO_FORC (    ');
      dm.Query1.sql.add('	      FORC_CODIGO   varchar(10) NOT NULL,');
      dm.Query1.sql.add('	      FORC_NOME     varchar(50) NULL,    ');
      dm.Query1.sql.add('	      FORC_FONE1    varchar(10) NULL,    ');
      dm.Query1.sql.add('	      FORC_FONE2    varchar(10) NULL,    ');
      dm.Query1.sql.add('	      FORC_CEL1     varchar(11) NULL,    ');
      dm.Query1.sql.add('	      FORC_WHATSAPP varchar(11) NULL,    ');
      dm.Query1.sql.add('	      FORC_EMAIL1   varchar(30) NULL,    ');
      dm.Query1.sql.add('	      FORC_EMAIL2   varchar(30) NULL     ');
      dm.Query1.sql.add(' )                                        ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE FORNECEDOR_DETALHE_FORD.') then
   begin
      Executar_Script('DROP TABLE FORNECEDOR_DETALHE_FORD');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.add('CREATE TABLE FORNECEDOR_DETALHE_FORD (              ');
      dm.Query1.sql.add('       FORD_CODIGO            varchar(10) NOT NULL, ');
      dm.Query1.sql.add('       FORD_CNPJ_CPF          varchar(18) NULL,     ');
      dm.Query1.sql.add('       FORD_IE                varchar(22) NULL,     ');
      dm.Query1.sql.add('       FORD_IM                varchar(22) NULL,     ');
      dm.Query1.sql.add('       FORD_TELEFONE          varchar(36) NULL,     ');
      dm.Query1.sql.add('       FORD_EMAIL             varchar(40) NULL,     ');
      dm.Query1.sql.add('       FORD_CDVENDEDOR        varchar(10) NULL,     ');
      dm.Query1.sql.add('       FORD_OBS               varchar(40) NULL,     ');
      dm.Query1.sql.add('       FORD_LIMITE_CREDITO    float       NULL,     ');
      dm.Query1.sql.add('       FORD_RG                varchar(20) NULL,     ');
      dm.Query1.sql.add('       FORD_DTNASC            datetime    NULL,     ');
      dm.Query1.sql.add('       FORD_SEXO              varchar(1)  NULL,     ');
      dm.Query1.sql.add('       FORD_PESSOA_FJ         varchar(1)  NULL,     ');
      dm.Query1.sql.add('       FORD_FORMAPG           varchar(10) NULL,     ');
      dm.Query1.sql.add('       FORD_DT                datetime    NULL,     ');
      dm.Query1.sql.add('       FORD_USU               varchar(10) NULL,     ');
      dm.Query1.sql.add('       FORD_HR                varchar(5)  NULL,     ');
      dm.Query1.sql.add('       FORD_CDRAMO            varchar(10) NULL,     ');
      dm.Query1.sql.add('       FORD_CDGRUPO           varchar(10) NULL,     ');
      dm.Query1.sql.add('       FORD_TRIBUTACAO_ICMS   varchar(1)  NULL,     ');
      dm.Query1.sql.add('       FORD_SALDO             float       NULL,     ');
      dm.Query1.sql.add('       FORD_CDREGIAO          varchar(10) NULL,     ');
      dm.Query1.sql.add('       FORD_CONTRIBUINTE_ICMS varchar(3)  NULL,     ');
      dm.Query1.sql.add('       FORD_EMAIL_XML         varchar(50) NULL,     ');
      dm.Query1.sql.add('       FORD_INDICACAO_IE      int         NULL,     ');
      dm.Query1.sql.add('       FORD_WHATSAPP          int         NULL,     ');
      dm.Query1.sql.add('       FORD_NUVEM_ATUALIZADO  int         NOT NULL, ');
      dm.Query1.sql.add('       FORD_NUVEM_DT          datetime    NULL,     ');
      dm.Query1.sql.add('       FORD_NUVEM_HR          varchar(5)  NULL,     ');
      dm.Query1.sql.add('       FORD_SUFRAMA           varchar(9)  NULL,     ');
      dm.Query1.sql.add('       FORD_CPF               varchar(11) NULL,     ');
      dm.Query1.sql.add('       FORD_CNPJ              varchar(14) NULL,     ');
      dm.Query1.sql.add('       FORD_RG_EMISSOR        varchar(10) NULL,     ');
      dm.Query1.sql.add('       FORD_RG_DTEMISSAO      datetime    NULL,     ');
      dm.Query1.sql.add('       FORD_ALT_USU           varchar(10) NULL,     ');
      dm.Query1.sql.add('       FORD_ALT_DT            datetime    NULL,     ');
      dm.Query1.sql.add('       FORD_ALT_HR            varchar(5)  NULL,     ');
      dm.Query1.sql.add('       FORD_ALT_ESTACAO       varchar(20) NULL,     ');
      dm.Query1.sql.add('       FORD_ALT_DTBLOQUEADO   datetime    NULL,     ');
      dm.Query1.sql.add('       FORD_ALT_DTLIBERADO    datetime    NULL,     ');
      dm.Query1.sql.add('       FORD_CDCIDADE          varchar(10) NULL,     ');
      dm.Query1.sql.add('       FORD_CDZONA            varchar(10) NULL,     ');
      dm.Query1.sql.add('       FORD_ALT_DTINATIVO     datetime    NULL      ');
      dm.Query1.sql.add(' )                                                  ');
      dm.Query1.ExecSql;
   end;

   Executar_Script('ALTER TABLE FORNECEDOR_DETALHE_FORD ADD FORD_PRODUTOR_RURAL INTEGER NOT NULL DEFAULT 0');

   if not Ja_Executou_Script('CREATE TABLE FORNECEDOR_ENDERECO_FORE..') then
   begin
      Executar_Script('DROP TABLE FORNECEDOR_ENDERECO_FORE');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.add('CREATE TABLE FORNECEDOR_ENDERECO_FORE (    ');
	    dm.Query1.sql.add('       FORE_CODIGO      varchar(10)  NULL, ');
	    dm.Query1.sql.add('       FORE_RUA         varchar(50)  NULL, ');
	    dm.Query1.sql.add('       FORE_NUMERO      varchar(10)  NULL, ');
	    dm.Query1.sql.add('       FORE_CEP         varchar(9)   NULL, ');
	    dm.Query1.sql.add('       FORE_BAIRRO      varchar(20)  NULL, ');
	    dm.Query1.sql.add('       FORE_UF          varchar(2)   NULL, ');
	    dm.Query1.sql.add('       FORE_UF_IBGE     varchar(2)   NULL, ');
	    dm.Query1.sql.add('       FORE_TELEFONE    varchar(20)  NULL, ');
	    dm.Query1.sql.add('       FORE_OBS1        varchar(100) NULL, ');
	    dm.Query1.sql.add('       FORE_OBS2        varchar(100) NULL, ');
	    dm.Query1.sql.add('       FORE_CPAIS       int          NULL, ');
	    dm.Query1.sql.add('       FORE_COMPLEMENTO varchar(50)  NULL, ');
	    dm.Query1.sql.add('       FORE_CDCIDADE    varchar(10)  NULL  ');
	    dm.Query1.sql.add(' )                                         ');
      dm.Query1.ExecSql;
   end;


   if not Ja_Executou_Script('CREATE TABLE FORNECEDOR_HISTORICO_BLOQUEIOS_FHB') then
   begin
      Executar_Script('DROP TABLE FORNECEDOR_HISTORICO_BLOQUEIOS_FHB');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.add('CREATE TABLE FORNECEDOR_HISTORICO_BLOQUEIOS_FHB ( ');
	    dm.Query1.sql.add('       FHB_FORNECEDOR varchar(20) NOT NULL,       ');
	    dm.Query1.sql.add('       FHB_DTEVENTO   date        NOT NULL,       ');
	    dm.Query1.sql.add('       FHB_HREVENTO   varchar(5)  NOT NULL,       ');
	    dm.Query1.sql.add('       FHB_USUEVENTO  varchar(20) NOT NULL,       ');
	    dm.Query1.sql.add('       FHB_MAQEVENTO  varchar(50) NOT NULL,       ');
	    dm.Query1.sql.add('       FHB_EVENTO     varchar(20) NULL            ');
	    dm.Query1.sql.add(' )                                                ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE FORNECEDOR_OBS_FOROBS') then
   begin
      Executar_Script('DROP TABLE FORNECEDOR_OBS_FOROBS');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.add('CREATE TABLE FORNECEDOR_OBS_FOROBS (        ');
	    dm.Query1.sql.add('       FOROBS_CODIGO varchar(20)  NOT NULL, ');
	    dm.Query1.sql.add('       FOROBS_LINHA  int          NOT NULL, ');
	    dm.Query1.sql.add('       FOROBS_TEXTO  varchar(255) NULL      ');
	    dm.Query1.sql.add(' )                                          ');
      dm.Query1.ExecSql;
   end;

end;

procedure TAcesso.Alteracoes_Cad_Motorista;
begin
   if not Ja_Executou_Script('Criar_MOTORISTA') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE MOTORISTA_BLOQUEIOS_MOTB ( ');
      dm.Query1.sql.Add('       MOTB_CODIGO     varchar(10) NULL,');
      dm.Query1.sql.Add('       MOTB_USU        varchar(10) NULL,');
      dm.Query1.sql.Add('       MOTB_DT         datetime    NULL,');
      dm.Query1.sql.Add('       MOTB_HR         varchar(5)  NULL,');
      dm.Query1.sql.Add('       MOTB_USULIBEROU varchar(10) NULL,');
      dm.Query1.sql.Add('       MOTB_DTLIBERAOU datetime    NULL,');
      dm.Query1.sql.Add('       MOTB_HRLIBEROU  varchar(5)  NULL ');
      dm.Query1.sql.Add('       )                                ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE MOTORISTA_MOT.') then
   begin
     Executar_Script('DROP TABLE MOTORISTA_MOTB');
     dm.Query1.close;
     dm.Query1.sql.Clear;
     dm.Query1.sql.Add('CREATE TABLE MOTORISTA_MOT (                        ');
     dm.Query1.sql.Add('       MOT_CODIGO        varchar(10) NOT NULL,      ');
     dm.Query1.sql.Add('       MOT_NOME_FANTASIA varchar(50) NULL,          ');
     dm.Query1.sql.Add('       MOT_RAZAO_SOCIAL  varchar(50) NULL,          ');
     dm.Query1.sql.Add('       MOT_STATUS        int         NOT NULL,      ');
     dm.Query1.sql.Add('    )                                                ');
     dm.Query1.ExecSql;

     Executar_Script('ALTER TABLE MOTORISTA_MOT ADD  DEFAULT ((0)) FOR MOT_STATUS');
   end;

   if not Ja_Executou_Script('CREATE TABLE MOTORISTA_CONTATO_MOTC.') then
   begin
      Executar_Script('DROP TABLE MOTORISTA_CONTATO_MOTC');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE MOTORISTA_CONTATO_MOTC (     ');
      dm.Query1.sql.Add('       MOTC_CODIGO   varchar(10) NOT NULL,');
      dm.Query1.sql.Add('       MOTC_NOME     varchar(50) NULL,    ');
      dm.Query1.sql.Add('       MOTC_FONE1    varchar(10) NULL,    ');
      dm.Query1.sql.Add('       MOTC_FONE2    varchar(10) NULL,    ');
      dm.Query1.sql.Add('       MOTC_CEL1     varchar(11) NULL,    ');
      dm.Query1.sql.Add('       MOTC_WHATSAPP varchar(11) NULL,    ');
      dm.Query1.sql.Add('       MOTC_EMAIL1   varchar(30) NULL,    ');
      dm.Query1.sql.Add('       MOTC_EMAIL2   varchar(30) NULL     ');
      dm.Query1.sql.Add('       )                                  ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE MOTORISTA_DETALHE_MOTD') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE MOTORISTA_DETALHE_MOTD (              ');
      dm.Query1.sql.Add('       MOTD_CODIGO   varchar(10)          NOT NULL,');
      dm.Query1.sql.Add('       MOTD_CNPJ_CPF varchar(18)          NULL,    ');
      dm.Query1.sql.Add('       MOTD_IE       varchar(22)          NULL,    ');
      dm.Query1.sql.Add('       MOTD_IM       varchar(22)          NULL,    ');
      dm.Query1.sql.Add('       MOTD_TELEFONE varchar(36)          NULL,    ');
      dm.Query1.sql.Add('       MOTD_EMAIL    varchar(40)          NULL,    ');
      dm.Query1.sql.Add('       MOTD_CDVENDEDOR varchar(10)        NULL,    ');
      dm.Query1.sql.Add('       MOTD_OBS        varchar(40)        NULL,    ');
      dm.Query1.sql.Add('       MOTD_LIMITE_CREDITO float          NULL,    ');
      dm.Query1.sql.Add('       MOTD_RG                varchar(20) NULL,    ');
      dm.Query1.sql.Add('       MOTD_DTNASC            datetime    NULL,    ');
      dm.Query1.sql.Add('       MOTD_SEXO              varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       MOTD_PESSOA_FJ         varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       MOTD_FORMAPG           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       MOTD_DT                datetime    NULL,    ');
      dm.Query1.sql.Add('       MOTD_USU               varchar(10) NULL,    ');
      dm.Query1.sql.Add('       MOTD_HR                varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       MOTD_CDRAMO            varchar(10) NULL,    ');
      dm.Query1.sql.Add('       MOTD_CDGRUPO           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       MOTD_TRIBUTACAO_ICMS   varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       MOTD_SALDO             float       NULL,    ');
      dm.Query1.sql.Add('       MOTD_CDREGIAO          varchar(10) NULL,    ');
      dm.Query1.sql.Add('       MOTD_CONTRIBUINTE_ICMS varchar(3)  NULL,    ');
      dm.Query1.sql.Add('       MOTD_EMAIL_XML         varchar(50) NULL,    ');
      dm.Query1.sql.Add('       MOTD_INDICACAO_IE      int         NULL,    ');
      dm.Query1.sql.Add('       MOTD_WHATSAPP          int         NULL,    ');
      dm.Query1.sql.Add('       MOTD_NUVEM_ATUALIZADO  int         NOT NULL,');
      dm.Query1.sql.Add('       MOTD_NUVEM_DT          datetime    NULL,    ');
      dm.Query1.sql.Add('       MOTD_NUVEM_HR          varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       MOTD_SUFRAMA           varchar(9)  NULL,    ');
      dm.Query1.sql.Add('       MOTD_CPF               varchar(11) NULL,    ');
      dm.Query1.sql.Add('       MOTD_CNPJ              varchar(14) NULL,    ');
      dm.Query1.sql.Add('       MOTD_RG_EMISSOR        varchar(10) NULL,    ');
      dm.Query1.sql.Add('       MOTD_RG_DTEMISSAO      datetime    NULL,    ');
      dm.Query1.sql.Add('       MOTD_ALT_USU           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       MOTD_ALT_DT            datetime    NULL,    ');
      dm.Query1.sql.Add('       MOTD_ALT_HR            varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       MOTD_ALT_ESTACAO       varchar(20) NULL,    ');
      dm.Query1.sql.Add('       MOTD_ALT_DTBLOQUEADO   datetime    NULL,    ');
      dm.Query1.sql.Add('       MOTD_ALT_DTLIBERADO    datetime    NULL,    ');
      dm.Query1.sql.Add('       MOTD_CDCIDADE          varchar(10) NULL,    ');
      dm.Query1.sql.Add('       MOTD_CDZONA            varchar(10) NULL,    ');
      dm.Query1.sql.Add('       MOTD_ALT_DTINATIVO     datetime    NULL,    ');
      dm.Query1.sql.Add('       )                                           ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE MOTORISTA_ENDERECO_MOTE') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE MOTORISTA_ENDERECO_MOTE (   ');
      dm.Query1.sql.Add('       MOTE_CODIGO      varchar(10) NULL,');
      dm.Query1.sql.Add('       MOTE_RUA         varchar(50) NULL,');
      dm.Query1.sql.Add('       MOTE_NUMERO      varchar(10) NULL,');
      dm.Query1.sql.Add('       MOTE_CEP         varchar(9)  NULL,');
      dm.Query1.sql.Add('       MOTE_BAIRRO      varchar(20) NULL,');
      dm.Query1.sql.Add('       MOTE_UF          varchar(2)  NULL,');
      dm.Query1.sql.Add('       MOTE_UF_IBGE     varchar(2)  NULL,');
      dm.Query1.sql.Add('       MOTE_TELEFONE    varchar(20) NULL,');
      dm.Query1.sql.Add('       MOTE_OBS1        varchar(100)NULL,');
      dm.Query1.sql.Add('       MOTE_OBS2        varchar(100)NULL,');
      dm.Query1.sql.Add('       MOTE_CPAIS       int         NULL,');
      dm.Query1.sql.Add('       MOTE_COMPLEMENTO varchar(50) NULL,');
      dm.Query1.sql.Add('       MOTE_CDCIDADE    varchar(10) NULL ');
      dm.Query1.sql.Add('       )                                 ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE MOTORISTA_HISTORICO_BLOQUEIOS_MOTHB.') then
   begin
      Executar_Script('DROP  TABLE MOTORISTA_HISTORICO_BLOQUEIOS_MOTB');

      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE MOTORISTA_HISTORICO_BLOQUEIOS_MOTHB (');
      dm.Query1.sql.Add('       MOTHB_MOTORISTA varchar(20) NOT NULL,      ');
      dm.Query1.sql.Add('       MOTHB_DTEVENTO  date        NOT NULL,      ');
      dm.Query1.sql.Add('       MOTHB_HREVENTO  varchar(5)  NOT NULL,      ');
      dm.Query1.sql.Add('       MOTHB_USUEVENTO varchar(20) NOT NULL,      ');
      dm.Query1.sql.Add('       MOTHB_MAQEVENTO varchar(50) NOT NULL,      ');
      dm.Query1.sql.Add('       MOTHB_EVENTO    varchar(20) NULL           ');
      dm.Query1.sql.Add('       )                                         ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE MOTORISTA_OBS_MOTOBS') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE MOTORISTA_OBS_MOTOBS(         ');
      dm.Query1.sql.Add('       MOTOBS_CODIGO varchar(20)  NOT NULL,');
      dm.Query1.sql.Add('       MOTOBS_LINHA  int NOT      NULL,    ');
      dm.Query1.sql.Add('       MOTOBS_TEXTO  varchar(255) NULL     ');
      dm.Query1.sql.Add('       )                                   ');
      dm.Query1.ExecSql;
   end;

end;

procedure TAcesso.Alteracoes_Cad_Transportadora;
begin
   if not Ja_Executou_Script('Criar_TRANSPORTADORA') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE TRANSPORTADORA_BLOQUEIOS_TRAB ( ');
      dm.Query1.sql.Add('       TRAB_CODIGO     varchar(10) NULL,     ');
      dm.Query1.sql.Add('       TRAB_USU        varchar(10) NULL,     ');
      dm.Query1.sql.Add('       TRAB_DT         datetime    NULL,     ');
      dm.Query1.sql.Add('       TRAB_HR         varchar(5)  NULL,     ');
      dm.Query1.sql.Add('       TRAB_USULIBEROU varchar(10) NULL,     ');
      dm.Query1.sql.Add('       TRAB_DTLIBERAOU datetime    NULL,     ');
      dm.Query1.sql.Add('       TRAB_HRLIBEROU  varchar(5)  NULL      ');
      dm.Query1.sql.Add('       )                                     ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE TRANSPORTADORA_TRA') then
   begin
     Executar_Script('DROP TABLE TRANSPORTADORA_TRAB');

     dm.Query1.close;
     dm.Query1.sql.Clear;
     dm.Query1.sql.Add('CREATE TABLE TRANSPORTADORA_TRA (                            ');
     dm.Query1.sql.Add('       TRA_CODIGO        varchar(10) NOT NULL,               ');
     dm.Query1.sql.Add('       TRA_NOME_FANTASIA varchar(50) NULL,                   ');
     dm.Query1.sql.Add('       TRA_RAZAO_SOCIAL  varchar(50) NULL,                   ');
     dm.Query1.sql.Add('       TRA_STATUS        int         NOT NULL                ');
     dm.Query1.sql.Add('    )                                                        ');
     dm.Query1.ExecSql;

     Executar_Script('ALTER TABLE TRANSPORTADORA_TRA ADD  DEFAULT ((0)) FOR TRA_STATUS');
   end;

   if not Ja_Executou_Script('CREATE TABLE TRANSPORTADORA_CONTATO_TRAC.') then
   begin
      Executar_Script('DROP TABLE TRANSPORTADORA_CONTATO_TRAC');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE TRANSPORTADORA_CONTATO_TRAC (     ');
      dm.Query1.sql.Add('       TRAC_CODIGO   varchar(10) NOT NULL,     ');
      dm.Query1.sql.Add('       TRAC_NOME     varchar(50) NULL,         ');
      dm.Query1.sql.Add('       TRAC_FONE1    varchar(10) NULL,         ');
      dm.Query1.sql.Add('       TRAC_FONE2    varchar(10) NULL,         ');
      dm.Query1.sql.Add('       TRAC_CEL1     varchar(11) NULL,         ');
      dm.Query1.sql.Add('       TRAC_WHATSAPP varchar(11) NULL,         ');
      dm.Query1.sql.Add('       TRAC_EMAIL1   varchar(30) NULL,         ');
      dm.Query1.sql.Add('       TRAC_EMAIL2   varchar(30) NULL          ');
      dm.Query1.sql.Add('       )                                       ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE TRANSPORTADORA_DETALHE_TRAD') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE TRANSPORTADORA_DETALHE_TRAD (              ');
      dm.Query1.sql.Add('       TRAD_CODIGO   varchar(10)          NOT NULL,     ');
      dm.Query1.sql.Add('       TRAD_CNPJ_CPF varchar(18)          NULL,         ');
      dm.Query1.sql.Add('       TRAD_IE       varchar(22)          NULL,         ');
      dm.Query1.sql.Add('       TRAD_IM       varchar(22)          NULL,         ');
      dm.Query1.sql.Add('       TRAD_TELEFONE varchar(36)          NULL,         ');
      dm.Query1.sql.Add('       TRAD_EMAIL    varchar(40)          NULL,         ');
      dm.Query1.sql.Add('       TRAD_CDVENDEDOR varchar(10)        NULL,         ');
      dm.Query1.sql.Add('       TRAD_OBS        varchar(40)        NULL,         ');
      dm.Query1.sql.Add('       TRAD_LIMITE_CREDITO float          NULL,         ');
      dm.Query1.sql.Add('       TRAD_RG                varchar(20) NULL,         ');
      dm.Query1.sql.Add('       TRAD_DTNASC            datetime    NULL,         ');
      dm.Query1.sql.Add('       TRAD_SEXO              varchar(1)  NULL,         ');
      dm.Query1.sql.Add('       TRAD_PESSOA_FJ         varchar(1)  NULL,         ');
      dm.Query1.sql.Add('       TRAD_FORMAPG           varchar(10) NULL,         ');
      dm.Query1.sql.Add('       TRAD_DT                datetime    NULL,         ');
      dm.Query1.sql.Add('       TRAD_USU               varchar(10) NULL,         ');
      dm.Query1.sql.Add('       TRAD_HR                varchar(5)  NULL,         ');
      dm.Query1.sql.Add('       TRAD_CDRAMO            varchar(10) NULL,         ');
      dm.Query1.sql.Add('       TRAD_CDGRUPO           varchar(10) NULL,         ');
      dm.Query1.sql.Add('       TRAD_TRIBUTACAO_ICMS   varchar(1)  NULL,         ');
      dm.Query1.sql.Add('       TRAD_SALDO             float       NULL,         ');
      dm.Query1.sql.Add('       TRAD_CDREGIAO          varchar(10) NULL,         ');
      dm.Query1.sql.Add('       TRAD_CONTRIBUINTE_ICMS varchar(3)  NULL,         ');
      dm.Query1.sql.Add('       TRAD_EMAIL_XML         varchar(50) NULL,         ');
      dm.Query1.sql.Add('       TRAD_INDICACAO_IE      int         NULL,         ');
      dm.Query1.sql.Add('       TRAD_WHATSAPP          int         NULL,         ');
      dm.Query1.sql.Add('       TRAD_NUVEM_ATUALIZADO  int         NOT NULL,     ');
      dm.Query1.sql.Add('       TRAD_NUVEM_DT          datetime    NULL,         ');
      dm.Query1.sql.Add('       TRAD_NUVEM_HR          varchar(5)  NULL,         ');
      dm.Query1.sql.Add('       TRAD_SUFRAMA           varchar(9)  NULL,         ');
      dm.Query1.sql.Add('       TRAD_CPF               varchar(11) NULL,         ');
      dm.Query1.sql.Add('       TRAD_CNPJ              varchar(14) NULL,         ');
      dm.Query1.sql.Add('       TRAD_RG_EMISSOR        varchar(10) NULL,         ');
      dm.Query1.sql.Add('       TRAD_RG_DTEMISSAO      datetime    NULL,         ');
      dm.Query1.sql.Add('       TRAD_ALT_USU           varchar(10) NULL,         ');
      dm.Query1.sql.Add('       TRAD_ALT_DT            datetime    NULL,         ');
      dm.Query1.sql.Add('       TRAD_ALT_HR            varchar(5)  NULL,         ');
      dm.Query1.sql.Add('       TRAD_ALT_ESTACAO       varchar(20) NULL,         ');
      dm.Query1.sql.Add('       TRAD_ALT_DTBLOQUEADO   datetime    NULL,         ');
      dm.Query1.sql.Add('       TRAD_ALT_DTLIBERADO    datetime    NULL,         ');
      dm.Query1.sql.Add('       TRAD_CDCIDADE          varchar(10) NULL,         ');
      dm.Query1.sql.Add('       TRAD_CDZONA            varchar(10) NULL,         ');
      dm.Query1.sql.Add('       TRAD_ALT_DTINATIVO     datetime    NULL,         ');
      dm.Query1.sql.Add('       )                                                ');
      dm.Query1.ExecSql;
   end;

   Executar_Script('ALTER TABLE TRANSPORTADORA_DETALHE_TRAD ADD TRAD_RNTC VARCHAR(20) NULL');

   if not Ja_Executou_Script('CREATE TABLE TRANSPORTADORA_ENDERECO_TRAE') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE TRANSPORTADORA_ENDERECO_TRAE (   ');
      dm.Query1.sql.Add('       TRAE_CODIGO      varchar(10) NULL,     ');
      dm.Query1.sql.Add('       TRAE_RUA         varchar(50) NULL,     ');
      dm.Query1.sql.Add('       TRAE_NUMERO      varchar(10) NULL,     ');
      dm.Query1.sql.Add('       TRAE_CEP         varchar(9)  NULL,     ');
      dm.Query1.sql.Add('       TRAE_BAIRRO      varchar(20) NULL,     ');
      dm.Query1.sql.Add('       TRAE_UF          varchar(2)  NULL,     ');
      dm.Query1.sql.Add('       TRAE_UF_IBGE     varchar(2)  NULL,     ');
      dm.Query1.sql.Add('       TRAE_TELEFONE    varchar(20) NULL,     ');
      dm.Query1.sql.Add('       TRAE_OBS1        varchar(100)NULL,     ');
      dm.Query1.sql.Add('       TRAE_OBS2        varchar(100)NULL,     ');
      dm.Query1.sql.Add('       TRAE_CPAIS       int         NULL,     ');
      dm.Query1.sql.Add('       TRAE_COMPLEMENTO varchar(50) NULL,     ');
      dm.Query1.sql.Add('       TRAE_CDCIDADE    varchar(10) NULL      ');
      dm.Query1.sql.Add('       )                                      ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB') then
   begin
      Executar_Script('DROP TABLE TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAB');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB (');
      dm.Query1.sql.Add('       TRAHB_TRANSPORTADORA varchar(20) NOT NULL,      ');
      dm.Query1.sql.Add('       TRAHB_DTEVENTO       date        NOT NULL,      ');
      dm.Query1.sql.Add('       TRAHB_HREVENTO       varchar(5)  NOT NULL,      ');
      dm.Query1.sql.Add('       TRAHB_USUEVENTO      varchar(20) NOT NULL,      ');
      dm.Query1.sql.Add('       TRAHB_MAQEVENTO      varchar(50) NOT NULL,      ');
      dm.Query1.sql.Add('       TRAHB_EVENTO         varchar(20) NULL           ');
      dm.Query1.sql.Add('       )                                               ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE TRANSPORTADORA_OBS_TRAOBS') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE TRANSPORTADORA_OBS_TRAOBS(          ');
      dm.Query1.sql.Add('       TRAOBS_CODIGO varchar(20)  NOT NULL,      ');
      dm.Query1.sql.Add('       TRAOBS_LINHA  int NOT      NULL,          ');
      dm.Query1.sql.Add('       TRAOBS_TEXTO  varchar(255) NULL           ');
      dm.Query1.sql.Add('       )                                         ');
      dm.Query1.ExecSql;
   end;

end;

procedure TAcesso.Alteracoes_Cad_Vendedor;
begin
    if not Ja_Executou_Script('Criar_VENDEDOR_BLOQUEIOS_VENDB..') then
    begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE VENDEDOR_BLOQUEIOS_VENDB ( ');
      dm.Query1.sql.Add('       VENDB_CODIGO     varchar(10) NULL,');
      dm.Query1.sql.Add('       VENDB_USU        varchar(10) NULL,');
      dm.Query1.sql.Add('       VENDB_DT         datetime    NULL,');
      dm.Query1.sql.Add('       VENDB_HR         varchar(5)  NULL,');
      dm.Query1.sql.Add('       VENDB_USULIBEROU varchar(10) NULL,');
      dm.Query1.sql.Add('       VENDB_DTLIBERAOU datetime    NULL,');
      dm.Query1.sql.Add('       VENDB_HRLIBEROU  varchar(5)  NULL ');
      dm.Query1.sql.Add('       )                                 ');
      dm.Query1.ExecSql;
    end;

    if not Ja_Executou_Script('CREATE TABLE VENDEDOR_VENDB..') then
   begin
     dm.Query1.close;
     dm.Query1.sql.Clear;
     dm.Query1.sql.Add('CREATE TABLE VENDEDOR_VEND (                         ');
     dm.Query1.sql.Add('       VEND_CODIGO        varchar(10) NOT NULL,      ');
     dm.Query1.sql.Add('       VEND_NOME_FANTASIA varchar(50) NULL,          ');
     dm.Query1.sql.Add('       VEND_RAZAO_SOCIAL  varchar(50) NULL,          ');
     dm.Query1.sql.Add('       VEND_STATUS        int         NOT NULL,      ');
     dm.Query1.sql.Add('    )                                                ');
     dm.Query1.ExecSql;

     Executar_Script('ALTER TABLE VENDEDOR_VEND ADD  DEFAULT ((0)) FOR VEND_STATUS');
   end;

   if not Ja_Executou_Script('CREATE TABLE VENDEDOR_CONTATO_VENDC') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE VENDEDOR_CONTATO_VENDC (      ');
      dm.Query1.sql.Add('       VENDC_CODIGO   varchar(10) NOT NULL,');
      dm.Query1.sql.Add('       VENDC_FONE1    varchar(10) NULL,    ');
      dm.Query1.sql.Add('       VENDC_FONE2    varchar(10) NULL,    ');
      dm.Query1.sql.Add('       VENDC_CEL1     varchar(11) NULL,    ');
      dm.Query1.sql.Add('       VENDC_WHATSAPP varchar(11) NULL,    ');
      dm.Query1.sql.Add('       VENDC_EMAIL1   varchar(30) NULL,    ');
      dm.Query1.sql.Add('       VENDC_EMAIL2   varchar(30) NULL     ');
      dm.Query1.sql.Add('       )                                   ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE VENDEDOR_DETALHE_VENDD.') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE VENDEDOR_DETALHE_VENDD (               ');
      dm.Query1.sql.Add('       VENDD_CODIGO   varchar(10)          NOT NULL,');
      dm.Query1.sql.Add('       VENDD_CNPJ_CPF varchar(18)          NULL,    ');
      dm.Query1.sql.Add('       VENDD_IE       varchar(22)          NULL,    ');
      dm.Query1.sql.Add('       VENDD_IM       varchar(22)          NULL,    ');
      dm.Query1.sql.Add('       VENDD_TELEFONE varchar(36)          NULL,    ');
      dm.Query1.sql.Add('       VENDD_EMAIL    varchar(40)          NULL,    ');
      dm.Query1.sql.Add('       VENDD_CDVENDEDOR varchar(10)        NULL,    ');
      dm.Query1.sql.Add('       VENDD_OBS        varchar(40)        NULL,    ');
      dm.Query1.sql.Add('       VENDD_LIMITE_CREDITO float          NULL,    ');
      dm.Query1.sql.Add('       VENDD_RG                varchar(20) NULL,    ');
      dm.Query1.sql.Add('       VENDD_DTNASC            datetime    NULL,    ');
      dm.Query1.sql.Add('       VENDD_SEXO              varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       VENDD_PESSOA_FJ         varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       VENDD_FORMAPG           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       VENDD_DT                datetime    NULL,    ');
      dm.Query1.sql.Add('       VENDD_USU               varchar(10) NULL,    ');
      dm.Query1.sql.Add('       VENDD_HR                varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       VENDD_CDRAMO            varchar(10) NULL,    ');
      dm.Query1.sql.Add('       VENDD_CDGRUPO           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       VENDD_TRIBUTACAO_ICMS   varchar(1)  NULL,    ');
      dm.Query1.sql.Add('       VENDD_SALDO             float       NULL,    ');
      dm.Query1.sql.Add('       VENDD_CDREGIAO          varchar(10) NULL,    ');
      dm.Query1.sql.Add('       VENDD_CONTRIBUINTE_ICMS varchar(3)  NULL,    ');
      dm.Query1.sql.Add('       VENDD_EMAIL_XML         varchar(50) NULL,    ');
      dm.Query1.sql.Add('       VENDD_INDICACAO_IE      int         NULL,    ');
      dm.Query1.sql.Add('       VENDD_WHATSAPP          int         NULL,    ');
      dm.Query1.sql.Add('       VENDD_NUVEM_ATUALIZADO  int         NOT NULL,');
      dm.Query1.sql.Add('       VENDD_NUVEM_DT          datetime    NULL,    ');
      dm.Query1.sql.Add('       VENDD_NUVEM_HR          varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       VENDD_SUFRAMA           varchar(9)  NULL,    ');
      dm.Query1.sql.Add('       VENDD_CPF               varchar(11) NULL,    ');
      dm.Query1.sql.Add('       VENDD_CNPJ              varchar(14) NULL,    ');
      dm.Query1.sql.Add('       VENDD_RG_EMISSOR        varchar(10) NULL,    ');
      dm.Query1.sql.Add('       VENDD_RG_DTEMISSAO      datetime    NULL,    ');
      dm.Query1.sql.Add('       VENDD_ALT_USU           varchar(10) NULL,    ');
      dm.Query1.sql.Add('       VENDD_ALT_DT            datetime    NULL,    ');
      dm.Query1.sql.Add('       VENDD_ALT_HR            varchar(5)  NULL,    ');
      dm.Query1.sql.Add('       VENDD_ALT_ESTACAO       varchar(20) NULL,    ');
      dm.Query1.sql.Add('       VENDD_ALT_DTBLOQUEADO   datetime    NULL,    ');
      dm.Query1.sql.Add('       VENDD_ALT_DTLIBERADO    datetime    NULL,    ');
      dm.Query1.sql.Add('       VENDD_CDCIDADE          varchar(10) NULL,    ');
      dm.Query1.sql.Add('       VENDD_CDZONA            varchar(10) NULL,    ');
      dm.Query1.sql.Add('       VENDD_ALT_DTINATIVO     datetime    NULL,    ');
      dm.Query1.sql.Add('       )                                            ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE VENDEDOR_ENDERECO_VENDE..') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE VENDEDOR_ENDERECO_VENDE (    ');
      dm.Query1.sql.Add('       VENDE_CODIGO      varchar(10) NULL,');
      dm.Query1.sql.Add('       VENDE_RUA         varchar(50) NULL,');
      dm.Query1.sql.Add('       VENDE_NUMERO      varchar(10) NULL,');
      dm.Query1.sql.Add('       VENDE_CEP         varchar(9)  NULL,');
      dm.Query1.sql.Add('       VENDE_BAIRRO      varchar(20) NULL,');
      dm.Query1.sql.Add('       VENDE_UF          varchar(2)  NULL,');
      dm.Query1.sql.Add('       VENDE_UF_IBGE     varchar(2)  NULL,');
      dm.Query1.sql.Add('       VENDE_TELEFONE    varchar(20) NULL,');
      dm.Query1.sql.Add('       VENDE_OBS1        varchar(100)NULL,');
      dm.Query1.sql.Add('       VENDE_OBS2        varchar(100)NULL,');
      dm.Query1.sql.Add('       VENDE_CPAIS       int         NULL,');
      dm.Query1.sql.Add('       VENDE_COMPLEMENTO varchar(50) NULL,');
      dm.Query1.sql.Add('       VENDE_CDCIDADE    varchar(10) NULL ');
      dm.Query1.sql.Add('       )                                  ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE VENDEDOR_HISTORICO_BLOQUEIOS_VENDB..') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE VENDEDOR_HISTORICO_BLOQUEIOS_VENDB (');
      dm.Query1.sql.Add('       VENDB_CONSULTOR varchar(20) NOT NULL,     ');
      dm.Query1.sql.Add('       VENDB_DTEVENTO  date        NOT NULL,     ');
      dm.Query1.sql.Add('       VENDB_HREVENTO  varchar(5)  NOT NULL,     ');
      dm.Query1.sql.Add('       VENDB_USUEVENTO varchar(20) NOT NULL,     ');
      dm.Query1.sql.Add('       VENDB_MAQEVENTO varchar(50) NOT NULL,     ');
      dm.Query1.sql.Add('       VENDB_EVENTO    varchar(20) NULL          ');
      dm.Query1.sql.Add('       )                                         ');
      dm.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CREATE TABLE VENDEDOR_OBS_VENDOBS') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE VENDEDOR_OBS_VENDOBS(          ');
      dm.Query1.sql.Add('       VENDOBS_CODIGO varchar(20)  NOT NULL,');
      dm.Query1.sql.Add('       VENDOBS_LINHA  int NOT      NULL,    ');
      dm.Query1.sql.Add('       VENDOBS_TEXTO  varchar(255) NULL     ');
      dm.Query1.sql.Add('       )                                    ');
      dm.Query1.ExecSql;
   end;

end;

procedure TAcesso.Alteracoes_Gerais;
begin
   //Aumenta o tamanho da coluna ATU_FUNCAO de 100 para 255 caracteres
   {
   Executar_Script('ALTER TABLE ATUALIZADO_ATU ADD ATU_FUNCAOOLD VARCHAR(100) NULL');
   Executar_Script('UPDATE ATUALIZADO_ATU SET ATU_FUNCAOOLD = ATU_FUNCAO');
   Executar_Script('ALTER TABLE ATUALIZADO_ATU DROP COLUMN ATU_FUNCAO');
   Executar_Script('ALTER TABLE ATUALIZADO_ATU ADD ATU_FUNCAO  VARCHAR(255) NULL');
   Executar_Script('UPDATE ATUALIZADO_ATU SET ATU_FUNCAO = ATU_FUNCAOOLD');
   Executar_Script('ALTER TABLE ATUALIZADO_ATU DROP COLUMN ATU_FUNCAOOLD');
   }
   Executar_Script('TRUNCATE TABLE CORPOEMAIL_CEMAIL');
   Executar_Script('TRUNCATE TABLE EMAIL_EMAIL      ');
   Executar_Script('TRUNCATE TABLE FUSADA_FUS       ');
   Executar_Script('TRUNCATE TABLE FUNCOES_FUN      ');

   Executar_Script('ALTER TABLE LOG_LOG ADD LOG_TELA VARCHAR(6) NULL');
   Executar_Script('ALTER TABLE LOG_LOG ALTER COLUMN LOG_TELA VARCHAR(30) NULL');

   Executar_Script('ALTER TABLE REGIAO_REG DROP COLUMN REG_TPACRESCIMODIARIA');
   Executar_Script('ALTER TABLE REGIAO_REG DROP COLUMN REG_ACRESCIMODIARIA');
   Executar_Script('ALTER TABLE REGIAO_REG DROP COLUMN REG_POSICAO');
   Executar_Script('ALTER TABLE REGIAO_REG DROP COLUMN REG_DISTANCIA');

   Executar_Script('CREATE TABLE ZONA_ZON (ZON_CODIGO VARCHAR(10) NOT NULL PRIMARY KEY)');
   Executar_Script('ALTER TABLE ZONA_ZON ADD ZON_DESCRICAO VARCHAR(40) NOT NULL');

   if not Ja_Executou_Script('Histórico de bloqueios ...') then
   begin
       //Histórico de bloqueios e desbloqueios do cliente
       DM.Query1.Close;
       DM.Query1.Sql.Clear;
       DM.Query1.Sql.Add('CREATE TABLE CLIENTE_HISTORICO_BLOQUEIOS_CHB                        ');
       DM.Query1.Sql.Add('     ( CHB_CLIENTE   VARCHAR(20)                          NOT NULL, ');
       DM.Query1.Sql.Add('       CHB_EVENTO    VARCHAR(20)                          NOT NULL, '); //0=Bloqueio 1=Desbloqueio
       DM.Query1.Sql.Add('       CHB_DTEVENTO  DATE                                 NOT NULL, ');
       DM.Query1.Sql.Add('       CHB_HREVENTO  VARCHAR(05)                          NOT NULL, ');
       DM.Query1.Sql.Add('       CHB_USUEVENTO VARCHAR(20)                          NOT NULL, ');
       DM.Query1.Sql.Add('       CHB_MAQEVENTO VARCHAR(50)                          NOT NULL  ');
       DM.Query1.Sql.Add('     )                                                                                                           ');
       DM.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CONFIG_CFG') then
   begin
       DM.Query1.Close;
       DM.Query1.Sql.Clear;
       DM.Query1.Sql.Add('CREATE TABLE CONFIG_CFG                           ');
       DM.Query1.Sql.Add('     ( CFG_TRATA_NUVEM INTEGER NOT NULL DEFAULT 1)');
       DM.Query1.ExecSql;
       DM.Query1.Close;
       DM.Query1.Sql.Clear;
       DM.Query1.Sql.Add('INSERT INTO CONFIG_CFG   ');
       DM.Query1.Sql.Add('     ( CFG_TRATA_NUVEM ) ');
       DM.Query1.Sql.Add('VALUES                   ');
       DM.Query1.Sql.Add('     (1)                 ');
       DM.Query1.ExecSql;
   end;

   if not Ja_Executou_Script('CONFIG_NUVEM_CFGN') then
   begin
       DM.Query1.Close;
       DM.Query1.Sql.Clear;
       DM.Query1.Sql.Add('CREATE TABLE CONFIG_NUVEM_CFGN                 ');
       DM.Query1.Sql.Add('     ( CFGN_SERVIDOR     VARCHAR(30) NOT NULL, ');
       DM.Query1.Sql.Add('       CFGN_BANCODEDADOS VARCHAR(30) NOT NULL, ');
       DM.Query1.Sql.Add('       CFGN_PORTA        INTEGER     NOT NULL, ');
       DM.Query1.Sql.Add('       CFGN_USUARIO      VARCHAR(30) NOT NULL, ');
       DM.Query1.Sql.Add('       CFGN_SENHA        VARCHAR(30) NOT NULL) ');
       DM.Query1.ExecSql;

       DM.Query1.ExecSql;
       DM.Query1.Close;
       DM.Query1.Sql.Clear;
       DM.Query1.Sql.Add('INSERT INTO CONFIG_NUVEM_CFGN   ');
       DM.Query1.Sql.Add('     ( CFGN_SERVIDOR,           ');
       DM.Query1.Sql.Add('       CFGN_BANCODEDADOS,       ');
       DM.Query1.Sql.Add('       CFGN_PORTA,              ');
       DM.Query1.Sql.Add('       CFGN_USUARIO,            ');
       DM.Query1.Sql.Add('       CFGN_SENHA)              ');
       DM.Query1.Sql.Add('VALUES                   ');
       DM.Query1.Sql.Add('     (:CFGN_SERVIDOR,           ');
       DM.Query1.Sql.Add('      :CFGN_BANCODEDADOS,       ');
       DM.Query1.Sql.Add('      :CFGN_PORTA,              ');
       DM.Query1.Sql.Add('      :CFGN_USUARIO,            ');
       DM.Query1.Sql.Add('      :CFGN_SENHA)              ');
       DM.Query1.ParamByName('CFGN_SERVIDOR'    ).AsString := Criptografar('45.34.12.247');
       DM.Query1.ParamByName('CFGN_BANCODEDADOS').AsString := Criptografar('wander');
       DM.Query1.ParamByName('CFGN_PORTA'       ).AsInteger:= 3306;
       DM.Query1.ParamByName('CFGN_USUARIO'     ).AsString := Criptografar('sa');
       DM.Query1.ParamByName('CFGN_SENHA'       ).AsString := Criptografar('93VYetFayUu_?gC*');
       DM.Query1.ExecSql;
   end;
end;

procedure TAcesso.AtualizaBaseDeDadosNuvem;
begin
   Executar_Script_Na_Nuvem('TRUNCATE TABLE CLIENTE_CLI');
   Executar_Script_Na_Nuvem('ALTER TABLE CLIENTE_CLI ADD CLI_STATUS INTEGER NOT NULL DEFAULT 0');
   Executar_Script_Na_Nuvem('ALTER TABLE CLIENTE_CLI ADD CLI_CELULAR VARCHAR(20) NULL');
end;

procedure TAcesso.AtualizaBaseDeDados;
begin
   if globalFuncoes_Atualizado = 'S' then
      EXIT;

   Alteracoes_Gerais;
   Alteracoes_Cad_Empresa;
   Alteracoes_Cad_Cliente;
   Alteracoes_Cad_Fornecedor;
   Alteracoes_Cad_Colaborador;
   Alteracoes_Cad_Consultor;
   Alteracoes_Cad_Vendedor;
   Alteracoes_Cad_Motorista;
   Alteracoes_Cad_Transportadora;
   Alteracoes_Cad_Contador;
   Comissoes_colaboradores;
   Comissoes_consultor;

   Tratar_Cad_Bairro;

   AtualizaBaseDeDadosNuvem;

   globalFuncoes_Atualizado:='S';
end;

function TAcesso.carregarConfiguracaoDeAcesso: Boolean;
var ArquivoIni: TIniFile;
    CONEXAO,
    HOSTNAME,
    USERNAME,
    PASSWORD,
    PORTA,
    BANCO,
    DRIVER  : String;
begin
   result := false;
   ArquivoIni := TIniFile.Create(vNomeDoArquivoINI);

   HOSTNAME := Descriptografar(ArquivoIni.ReadString('CONEXAO','SERVER'  ,''));
   PORTA    := Descriptografar(ArquivoIni.ReadString('CONEXAO','PORT'    ,''));
   BANCO    := Descriptografar(ArquivoIni.ReadString('CONEXAO','DATABASE',''));
   USERNAME := Descriptografar(ArquivoIni.ReadString('CONEXAO','USERNAME',''));
   PASSWORD := Descriptografar(ArquivoIni.ReadString('CONEXAO','PASSWORD',''));
   ArquivoIni.Free;

   try
        with dm.DataBase1 do
        begin
           Connected := False;
           Params.Clear;
           Params.Values['DriverID']  := 'MSSQL';
           Params.Values['Server']    := HOSTNAME;
           Params.Values['Database']  := BANCO;
           Params.Values['User_name'] := USERNAME;
           Params.Values['Password']  := password;
           Connected := True;

           with FormatOptions do
           begin
              OwnMapRules := True;
              with MapRules.Add do
              begin
                 ScaleMin := 4;
                 ScaleMax := 4;
                 PrecMin := 18;
                 PrecMax := 18;
                 SourceDataType := dtBcd;
                 TargetDataType := dtDouble;
              end;
              with MapRules.Add do
              begin
                 ScaleMin := 4;
                 ScaleMax := 4;
                 PrecMin := 18;
                 PrecMax := 18;
                 SourceDataType := dtDateTimeStamp;
                 TargetDataType := dtDateTime;
              end;
           end;
        end;
        FConectado:=True;
        Result := True;
     except
        FConectado:=False;
        exit;
     end;
end;

procedure TAcesso.Comissoes_colaboradores;
begin
   if not Ja_Executou_Script('Criar_COLABORADOR_COMISSAO_COLCOM') then
   begin
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE COLABORADOR_COMISSAO_COLCOM (      ');
      dm.Query1.sql.Add('       COLCOM_CODIGO      varchar(10) NOT NULL, ');
      dm.Query1.sql.Add('       COLCOM_SERVICOS    FLOAT       NULL,     ');
      dm.Query1.sql.Add('       COLCOM_HORATECNICA FLOAT       NULL,     ');
      dm.Query1.sql.Add('       COLCOM_BALCAO      FLOAT       NULL,     ');
      dm.Query1.sql.Add('       COLCOM_EXTERNA     FLOAT       NULL,     ');
      dm.Query1.sql.Add('       COLCOM_USU         varchar(10) NULL,     ');
      dm.Query1.sql.Add('       COLCOM_DT          datetime    NULL,     ');
      dm.Query1.sql.Add('       COLCOM_HR          varchar(5)  NULL      ');
      dm.Query1.sql.Add('       )                                        ');
      dm.Query1.ExecSql;
   end;
end;

procedure TAcesso.Comissoes_consultor;
begin
   if not Ja_Executou_Script('Criar_CONSULTOR_BANCO_COMISSAO_CONBC') then
   begin
      Executar_Script('DROP TABLE CONSULTOR_COMISSAO_CONCOM');
      dm.Query1.close;
      dm.Query1.sql.Clear;
      dm.Query1.sql.Add('CREATE TABLE CONSULTOR_BANCO_COMISSAO_CONBC (           ');
      dm.Query1.sql.Add('       CONBC_CODIGO      varchar(10) NOT NULL,          ');
      dm.Query1.sql.Add('       CONBC_BANCO       VARCHAR(40) NULL,              ');
      dm.Query1.sql.Add('       CONBC_AGENCIA     VARCHAR(10) NULL,              ');
      dm.Query1.sql.Add('       CONBC_AGENCIA_DIG VARCHAR(1)  NULL,              ');
      dm.Query1.sql.Add('       CONBC_OPERACAO    varchar(3)  NULL,              ');
      dm.Query1.sql.Add('       CONBC_CONTA       varchar(20) NULL,              ');
      dm.Query1.sql.Add('       CONBC_CONTA_DIG   varchar(1)  NULL,              ');
      dm.Query1.sql.Add('       CONBC_COMISSAO    FLOAT       NULL,              ');
      // STATUS --------------------------------------------------------------------
      dm.Query1.sql.Add('       CONBC_STATUS      INTEGER     NOT NULL DEFAULT 1,');
      // CONTROLE ------------------------------------------------------------------
      dm.Query1.sql.Add('       CONBC_ESTACAO     varchar(40) NULL,              ');
      dm.Query1.sql.Add('       CONBC_USU         varchar(3)  NULL,              ');
      dm.Query1.sql.Add('       CONBC_DT          datetime    NULL,              ');
      dm.Query1.sql.Add('       CONBC_HR          varchar(5)  NULL               ');
      dm.Query1.sql.Add('       )                                                ');
      dm.Query1.ExecSql;
   end;
   Executar_Script('ALTER TABLE CONSULTOR_COMISSAO_CONCOM DROP COLUMN CONBC_COMISSAO');
end;

function TAcesso.Conectado: Boolean;
begin
    Result := FConectado;
end;

procedure TAcesso.Conectar;
begin
   FConectado := AcessarBaseDeDados;
end;

function TAcesso.conexaoExiste: Boolean;
begin
   result := false;
   if FNomeDaConexao = '' then
   begin
     Avisos.Avisar('Informe a Empresa (Banco de Dados) desejado.');
     exit;
   end;

   vNomeDoArquivoINI := 'Arquivos\Conexoes\'+FNomeDaConexao+'.INI';
   if not FileExists(vNomeDoArquivoINI) then
   begin
      Avisos.Avisar('Execute o aplicativo ConfiguraBases para '+FNomedaConexao);
      exit;
   end;

   result := true;
end;

procedure TAcesso.Desconectar;
begin
  dm.Database1.Close;
end;

function TAcesso.getNomeDaConexao: String;
begin
   result := self.FNomeDaConexao;
end;

procedure TAcesso.setNomeDaConexao(const Value: String);
begin
   self.FNomeDaConexao := Value;
end;

procedure TAcesso.Tratar_Cad_Bairro;
begin
   Executar_Script('CREATE TABLE BAIRRO_BAI (BAI_CODIGO VARCHAR(10) NOT NULL UNIQUE, '+
                                            'BAI_DESCRICAO VARCHAR(50) NOT NULL)');
end;

end.








