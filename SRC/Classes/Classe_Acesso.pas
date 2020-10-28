unit Classe_Acesso;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,
     Classe_Empresa;

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
      procedure Alteracoes_Gerais;
      procedure Alteracoes_Cad_Empresa;
      procedure Alteracoes_Cad_Cliente;
      procedure Tratar_Cad_Bairro;

   public
      procedure Conectar;
      procedure Desconectar;
      function Conectado:Boolean;
      property nomeDaConexao: String read  getNomeDaConexao
                                     write setNomeDaConexao;
   end;

implementation

{ TAcesso }

uses Dados, Funcoes;

function TAcesso.acessarBaseDeDados: Boolean;
begin
   result := false;
   if not conexaoExiste                then exit;
   if not carregarConfiguracaoDeAcesso then exit;

   AtualizaBaseDeDados;

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

{CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);
}

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

end;

procedure TAcesso.AtualizaBaseDeDados;
begin
   if globalFuncoes_Atualizado = 'S' then
      EXIT;

   Alteracoes_Gerais;
   Alteracoes_Cad_Empresa;
   Alteracoes_Cad_Cliente;
   Tratar_Cad_Bairro;

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
     ShowMessage('Informe a Empresa (Banco de Dados) desejado.');
     exit;
   end;

   vNomeDoArquivoINI := 'Arquivos\Conexoes\'+FNomeDaConexao+'.INI';
   if not FileExists(vNomeDoArquivoINI) then
   begin
      ShowMessage('Execute o aplicativo ConfiguraBases para '+FNomedaConexao);
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


UPDATE EMPRESA_EMP SET EMP_INICIOATIVIDADES    = '01/10/2019'
UPDATE EMPRESA_EMP SET EMP_SUFRAMA             = 'EXSUFRAMA'
UPDATE EMPRESA_EMP SET EMP_INSCRICAO_ESTADUAL  = 'EX IE'
UPDATE EMPRESA_EMP SET EMP_INSCRICAO_MUNICIPAL = 'EX IM'
UPDATE EMPRESA_EMP SET EMP_NIRE                = 'EX NIRE'
UPDATE EMPRESA_EMP SET EMP_INSCRICAO_ESTADUAL_ST = 'EX IEST'
UPDATE EMPRESA_EMP SET EMP_CONTRIBUINTE_IPI      = 1
UPDATE EMPRESA_EMP SET EMP_CELULAR               = 'EX CEL'
UPDATE EMPRESA_EMP SET EMP_WHATSAPP              = 'EX WHATS UP'
UPDATE EMPRESA_EMP SET EMP_RESPONSAVEL_NOME      = 'EX RESP NOME'
UPDATE EMPRESA_EMP SET EMP_RESPONSAVEL_TELEFONE  = 'EX RESP TEL'
UPDATE EMPRESA_EMP SET EMP_RESPONSAVEL_CELULAR   = 'EX RESP CEL'
UPDATE EMPRESA_EMP SET EMP_RESPONSAVEL_EMAIL     = 'EX RESP EMAIL'
UPDATE EMPRESA_EMP SET EMP_CONTADOR_EMPRESA      = 'EX EMPRESA'
UPDATE EMPRESA_EMP SET EMP_CONTADOR_RESPONSAVEL  = 'EX CONT RESP'
UPDATE EMPRESA_EMP SET EMP_CONTADOR_CNPJ         = 'EX CONT CNPJ'
UPDATE EMPRESA_EMP SET EMP_CONTADOR_CPF          = 'EX CONT CPF'
UPDATE EMPRESA_EMP SET EMP_CONTADOR_TEL1         = 'EX CONT TEL1'
UPDATE EMPRESA_EMP SET EMP_CONTADOR_TEL2         = 'EX CONT TEL2'
UPDATE EMPRESA_EMP SET EMP_CONTADOR_CRC          = 'EX CONT CRC'
UPDATE EMPRESA_EMP SET EMP_CONTADOR_CEL1         = 'EX CONT CEL1'
UPDATE EMPRESA_EMP SET EMP_CONTADOR_CEL2         = 'EX CONT CEL2'
UPDATE EMPRESA_EMP SET EMP_CONTADOR_EMAIL        = 'EX CONT EMAIL'
UPDATE EMPRESA_EMP SET EMP_DT                    = '20/10/2020'
UPDATE EMPRESA_EMP SET EMP_CONTRIBUINTE_IPI = 1
UPDATE EMPRESA_EMP SET EMP_CELULAR = 'CEL TEST'
UPDATE EMPRESA_EMP SET EMP_WHATSAPP = 'ZAP TEST'
UPDATE EMPRESA_EMP SET EMP_PIS_ALIQUOTA = 1.65




