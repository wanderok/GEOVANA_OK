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

procedure TAcesso.AtualizaBaseDeDados;
begin
   if globalFuncoes_Atualizado = 'S' then
      EXIT;

   //Aumenta o tamanho da coluna ATU_FUNCAO de 100 para 255 caracteres
   {
   Executar_Script('ALTER TABLE ATUALIZADO_ATU ADD ATU_FUNCAOOLD VARCHAR(100) NULL');
   Executar_Script('UPDATE ATUALIZADO_ATU SET ATU_FUNCAOOLD = ATU_FUNCAO');
   Executar_Script('ALTER TABLE ATUALIZADO_ATU DROP COLUMN ATU_FUNCAO');
   Executar_Script('ALTER TABLE ATUALIZADO_ATU ADD ATU_FUNCAO  VARCHAR(255) NULL');
   Executar_Script('UPDATE ATUALIZADO_ATU SET ATU_FUNCAO = ATU_FUNCAOOLD');
   Executar_Script('ALTER TABLE ATUALIZADO_ATU DROP COLUMN ATU_FUNCAOOLD');
   }
   // Outras Atualizações
   Executar_Script('ALTER TABLE EMPRESA_EMP ADD EMP_CODIGO_UNISYSTEM VARCHAR(10) NULL');
   Executar_Script('TRUNCATE TABLE CORPOEMAIL_CEMAIL');
   Executar_Script('TRUNCATE TABLE EMAIL_EMAIL      ');
   Executar_Script('TRUNCATE TABLE FUSADA_FUS       ');
   Executar_Script('TRUNCATE TABLE FUNCOES_FUN      ');
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

