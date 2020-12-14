unit Classe_Cliente;

interface

uses Classes, Dialogs, SysUtils, IniFiles, vcl.stdctrls,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,

     TiposDeDados,
     validadorDeDocumentos,
     Classe_Alteracao,
     Classe_Contato,
     Classe_Endereco;

type
  tPessoa_Fisica = class
    private
       FCPF                  : String;         // CLI_CPF VARCHAR(11)
       FDataNascimento       : TDateTime;      // CLID_DTNASC
       FDataNascimentoString,
       FRG,
       FRG_OrgaoEmissor      : String;
       FRG_DataEmissao       : TDateTime;
       FRG_DataEmissaoString,
       FSexo                 : String;
       //
       function  getFCPF:String;
       procedure setFCPF(const Value:String);
       function  getDataNascimentoString: String;
       procedure setDataNascimentoString(const Value: String);
       function  getFRG: String;
       function  getFRG_OrgaoEmissor: String;
       procedure setFRG(const Value: String);
       procedure setFRG_OrgaoEmissor(const Value: String);
       function  getFSexo: Integer;
       procedure setFSexo(const Value: Integer);
       function  getFRG_DataEmissaoString: String;
       procedure setFRG_DataEmissaoString(const Value: String);
    public
       property CPF              : String     read getFCPF                  write setFCPF;
       property DataNascimento   : String     read getDataNascimentoString  write setDataNascimentoString;
       property RG               : String     read getFRG                   write setFRG;
       property RG_OrgaoEmissor  : String     read getFRG_OrgaoEmissor      write setFRG_OrgaoEmissor;
       property RG_DataEmissao   : String     read getFRG_DataEmissaoString write setFRG_DataEmissaoString;
       property Sexo             : Integer    read getFSexo                 write setFSexo;
  end;

  tPessoa_Juridica = class
    private
       FCNPJ                 : String;      // CLI_CPF VARCHAR(11)
       FIE                   : String;      // CLID_DTNASC
    function getFCNPJ: String;
    function getFIE: String;
    procedure setFCNPJ(const Value: String);
    procedure setFIE(const Value: String);
    public
       property CNPJ             : String     read getFCNPJ                 write setFCNPJ;
       property IE               : String     read getFIE                   write setFIE;
  end;

  tDetalhes_Cliente = class
    private
      FDataCadastro      : TDateTime;        // CLI_DT         DATETIME
      FTipoPessoa	       : String;           // CLID_PESSOA_FJ VARCHAR(1)
      FPessoaFisica      : tPessoa_Fisica;
      FPessoaJuridica    : tPessoa_Juridica;
      FRamoAtividade     : String;          //CLI_CDRAMO
      FRegiao            : String;
      FZona              : String;
      FEndereco          : TEndereco;
      FContato           : TContato;
      FContador          : String;
      FConsultor         : String;
      FUsa_SMC           : Integer;
      FUsa_SMCPLUS       : Integer;
      FUsa_MERCHANT      : Integer;
      FUsa_MDE           : Integer;
      FUsa_GETRANSPORTE  : Integer;
      fUsa_A1A3          : Integer;
      function  getFDataCadastro: TDateTime;
      procedure setFDataCadastro(const Value: TDateTime);
      function  getDataCadastroString: String;
      function  getFTipoPessoa: TTipoPessoa;
      procedure setFTipoPessoa(const Value: TTipoPessoa);
      function getFRamoAtividade: String;
      procedure setFRamoAtividade(const Value: String);
      function getFRegiao: String;
      procedure setFRegiao(const Value: String);
      function getFZona: String;
      procedure setFZona(const Value: String);
      function getFConsultor: String;
      function getFContador: String;
      procedure setFConsultor(const Value: String);
      procedure setFContador(const Value: String);
    function getFUsa_GETRANSPORTE: Integer;
    function getFUsa_MDE: Integer;
    function getFUsa_SMC: Integer;
    function getFUsa_SMCPLUS: Integer;
    procedure setFUsa_GETRANSPORTE(const Value: Integer);
    procedure setFUsa_MDE(const Value: Integer);
    procedure setFUsa_SMC(const Value: Integer);
    procedure setFUsa_SMCPLUS(const Value: Integer);
    function getFUsa_MERCHANT: Integer;
    procedure setFUsa_MERCHANT(const Value: Integer);
    function getFUsa_A1A3: Integer;
    procedure setFUsa_A1A3(const Value: Integer);
      //function getFCodigoMunicipio: String;
      //procedure setFCodigoMunicipio(const Value: String); // CLID_DT

    public
      constructor Create;
      destructor Destroy; override;
      property DataCadastro      : TDateTime        read getFDataCadastro       write setFDataCadastro;
      property DataCadastroString: String           read getDataCadastroString;
      property TipoPessoa        : TTipoPessoa      read getFTipoPessoa         write setFTipoPessoa;
      property PessoaFisica      : tPessoa_Fisica   read FPessoaFisica          write FPessoaFisica;
      property PessoaJuridica    : tPessoa_Juridica read FPessoaJuridica        write FPessoaJuridica;
      property RamoAtividade     : String           read getFRamoAtividade      write setFRamoAtividade;
      property Regiao            : String           read getFRegiao             write setFRegiao;
      property Zona              : String           read getFZona               write setFZona;
      property Endereco          : TEndereco        read FEndereco              write FEndereco;
      property Contato           : TContato         read FContato               write FContato;
      property Contador          : String           read getFContador           write setFContador;
      property Consultor         : String           read getFConsultor          write setFConsultor;
      property Usa_SMC           : Integer          read getFUsa_SMC            write setFUsa_SMC;
      property Usa_SMCPLUS       : Integer          read getFUsa_SMCPLUS        write setFUsa_SMCPLUS;
      property Usa_MDE           : Integer          read getFUsa_MDE            write setFUsa_MDE;
      property Usa_GETRANSPORTE  : Integer          read getFUsa_GETRANSPORTE   write setFUsa_GETRANSPORTE;
      property Usa_MERCHANT      : Integer          read getFUsa_MERCHANT       write setFUsa_MERCHANT;
      property Usa_A1A3          : Integer          read getFUsa_A1A3           write setFUsa_A1A3;
end;

  TClienteAlteracao = class(TAlteracao);

  TCliente = class
  private
    FExiste            : Boolean;
    FCodigo            : String;   // CLI_CODIGO
    FNomeFantasia      : String;   // CLI_NOME_FANTASIA
    FRazaoSocial       : String;   // CLI_RAZAO_SOCIAL
	  FStatus            : Integer;  // CLI_STATUS INTEGER NOT NULL (0-ATIVO, 1-ATIVO BLOQUEADO, 2-INATIVO)
    FDetalhes          : tDetalhes_Cliente;
    FAlteracao         : TClienteAlteracao;
    FObservacao        : TStringList;
    function getFStatus: TStatusCadastral;
    procedure setFStatus(const Value: TStatusCadastral);
    function  getFCodigo: String;
    function  getFNomeFantasia: String;
    function  getRazaoSocial: String;
    procedure setFCodigo(const Value: String);
    procedure setFNomeFantasia(const Value: String);
    procedure setRazaoSocial(const Value: String);
    function  proximoCodigo:String;
    function  getFExiste: Boolean;
    procedure LimparCampos;
    function  getDetalhes: tDetalhes_Cliente;
    procedure setDetalhes(const Value: tDetalhes_Cliente);
    function  Insert:Boolean;
    function  Update:Boolean;
    function  DadosCorretos:Boolean;
    procedure Preencher_Parametros_CLIENTE_CLI(pQuery:TFDQuery);
    procedure Preencher_Parametros_CLIENTE_CONTATO_CLIC(pQuery:TFDQuery);
    procedure Pegar_Dados_Basicos;
    procedure Pegar_Detalhes;
    procedure Pegar_Endereco;
    procedure Pegar_Contato;
    procedure Pegar_Alteracoes;

    procedure Pegar_Observacoes;
    procedure Gravar_Observacoes;
    //
    function Inserir_CLIENTE_CLI           :Boolean;
    function Inserir_CLIENTE_DETALHE_CLID  :Boolean;
    function Inserir_CLIENTE_ENDERECO_CLIE :Boolean;
    function Inserir_CLIENTE_CONTATO_CLIC  :Boolean;
    //
    function Update_CLIENTE_CLI:Boolean;

    function Update_CLIENTE_DETALHE_CLID:Boolean;
    function existe_CLIENTE_DETALHE_CLID:Boolean;
    function alterar_CLIENTE_DETALHE_CLID:Boolean;

    function Update_CLIENTE_ENDERECO_CLIE:Boolean;
    function existe_CLIENTE_ENDERECO_CLIE: Boolean;
    function alterar_CLIENTE_ENDERECO_CLIE:BooleAn;

    function Update_CLIENTE_CONTATO_CLIC:Boolean;
    function existe_CLIENTE_CONTATO_CLIC: Boolean;
    function alterar_CLIENTE_CONTATO_CLIC: Boolean;

    procedure RegistrarHistoricoDeAtivacao;
    procedure RegistrarHistoricoDeBloqueio;
    procedure RegistrarHistoricoDeDesBloqueio;
    procedure RegistrarHistoricoDeInativacao;
    procedure RegistrarHistorico(pEvento,pLog:String);
    function getFObservacao: TStringList;
    procedure setFObservacao(const Value: TStringList);

  public
    constructor Create;
    destructor Destroy; override;
    property Existe        : Boolean           read getFExiste;
    Property Codigo        : String            read getFCodigo       write setFCodigo;
    Property NomeFantasia  : String            read getFNomeFantasia write setFNomeFantasia;
    Property RazaoSocial   : String            read getRazaoSocial   write setRazaoSocial;
    Property Status        : TStatusCadastral  read getFStatus       write setFStatus;
    Property Detalhes      : tDetalhes_Cliente read getDetalhes      write setDetalhes;
    property Alteracao     : TClienteAlteracao read FAlteracao       write FAlteracao;
    property Observacao    : TStringList       read getFObservacao   write setFObservacao;
    procedure Abrir;
    Function Gravar:Boolean;
end;

implementation

uses Funcoes,
     Classe_Nuvem;

var qCliente, qLocal: TFDQuery;

{ TCliente }

procedure TCliente.Abrir;
begin
    LimparCampos;

    Pegar_Dados_Basicos;
    if not Existe then
       exit;

    Pegar_Detalhes;
    Pegar_Endereco;
    Pegar_Contato;
    Pegar_Observacoes;
end;


constructor TCliente.Create;
begin
   FDetalhes   := tDetalhes_Cliente.Create;
   FAlteracao  := TClienteAlteracao.Create;
   FObservacao := TStringList.Create;
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName :='X';
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
  FAlteracao.Free;
  FObservacao.Free;
  qLocal.Free;
  inherited;
end;

function TCliente.existe_CLIENTE_DETALHE_CLID: Boolean;
begin
    qCliente.Close;
    qCliente.SQL.Clear;
    qCliente.SQL.Add('SELECT CLID_CODIGO               ');
    qCliente.SQL.Add('  FROM CLIENTE_DETALHE_CLID      ');
    qCliente.SQL.Add(' WHERE CLID_CODIGO = :CLID_CODIGO');
    qCliente.ParamByName('CLID_CODIGO').AsString   := FCodigo;
    qCliente.Open;
    result := not qCliente.Eof;
end;

function TCliente.existe_CLIENTE_ENDERECO_CLIE: Boolean;
begin
    qCliente.Close;
    qCliente.SQL.Clear;
    qCliente.SQL.Add('SELECT CLIE_CODIGO               ');
    qCliente.SQL.Add('  FROM CLIENTE_ENDERECO_CLIE      ');
    qCliente.SQL.Add(' WHERE CLIE_CODIGO = :CLIE_CODIGO');
    qCliente.ParamByName('CLIE_CODIGO').AsString   := FCodigo;
    qCliente.Open;
    result := not qCliente.Eof;
end;

function TCliente.existe_CLIENTE_CONTATO_CLIC: Boolean;
begin
    qCliente.Close;
    qCliente.SQL.Clear;
    qCliente.SQL.Add('SELECT CLIC_CODIGO               ');
    qCliente.SQL.Add('  FROM CLIENTE_CONTATO_CLIC      ');
    qCliente.SQL.Add(' WHERE CLIC_CODIGO = :CLIC_CODIGO');
    qCliente.ParamByName('CLIC_CODIGO').AsString   := FCodigo;
    qCliente.Open;
    result := not qCliente.Eof;
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

function TCliente.getFObservacao: TStringList;
begin
   result := FObservacao;
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

procedure TCliente.Gravar_Observacoes;
var i : Integer;
begin
   qCliente.Close;
   qCliente.Sql.Clear;
   qCliente.Sql.Add('DELETE FROM CLIENTE_OBS_CLIOBS ');
   qCliente.Sql.Add(' WHERE CLIOBS_CODIGO = :COD    ');
   qCliente.ParamByName('COD').AsString := FCodigo;
   qCliente.ExecSql;

   for i := 0 to FObservacao.count-1 do
   begin
      qCliente.close;
      qCliente.sql.Clear;
      qCliente.sql.Add('INSERT INTO CLIENTE_OBS_CLIOBS   ');
      qCliente.sql.Add('     ( CLIOBS_CODIGO,            ');
	    qCliente.sql.Add('       CLIOBS_LINHA,             ');
      qCliente.sql.Add('       CLIOBS_TEXTO)             ');
      qCliente.sql.Add('VALUES                           ');
      qCliente.sql.Add('     (:CLIOBS_CODIGO,            ');
	    qCliente.sql.Add('      :CLIOBS_LINHA,             ');
      qCliente.sql.Add('      :CLIOBS_TEXTO)             ');
      qCliente.ParamByName('CLIOBS_CODIGO').AsString := FCodigo;
	    qCliente.ParamByName('CLIOBS_LINHA' ).AsInteger:= i;
      qCliente.ParamByName('CLIOBS_TEXTO' ).AsString := FObservacao[i];
      qCliente.ExecSql;
   end;
end;

function TCliente.Insert: Boolean;
begin
    result := False;
    if not Inserir_CLIENTE_CLI           then exit;
    if not Inserir_CLIENTE_DETALHE_CLID  then exit;
    if not Inserir_CLIENTE_ENDERECO_CLIE then exit;
    if not Inserir_CLIENTE_CONTATO_CLIC  then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Cliente','Cadastrou cliente ' + FCodigo + '-' + FNomeFantasia);
end;

function TCliente.Inserir_CLIENTE_CLI: Boolean;
begin
    result := False;
    try
        qCliente.Close;
        qCliente.SQL.Clear;
        qCliente.SQL.Add('INSERT INTO CLIENTE_CLI   ');
        qCliente.SQL.Add('     (                    ');
        qCliente.SQL.Add('       CLI_CODIGO,        ');
        qCliente.SQL.Add('       CLI_NOME_FANTASIA, ');
        qCliente.SQL.Add('       CLI_RAZAO_SOCIAL,  ');
        qCliente.SQL.Add('       CLI_STATUS         ');
        qCliente.SQL.Add('     )                    ');
        qCliente.SQL.Add('VALUES                    ');
        qCliente.SQL.Add('     (                    ');
        qCliente.SQL.Add('      :CLI_CODIGO,        ');
        qCliente.SQL.Add('      :CLI_NOME_FANTASIA, ');
        qCliente.SQL.Add('      :CLI_RAZAO_SOCIAL,  ');
        qCliente.SQL.Add('      :CLI_STATUS         ');
        qCliente.SQL.Add('     )                    ');
        Preencher_Parametros_CLIENTE_CLI(qCliente);
        qCliente.ParamByname('CLI_STATUS').AsInteger := 0;
        qCliente.ExecSql;
        result := true
    except
       Avisos.Avisar('Erro ao incluir Cliente ' + FNomeFantasia);
       LOGErros('Classe_Cliente','Erro ao incluir Cliente ' + FNomeFantasia);
    end;
end;

function TCliente.Inserir_CLIENTE_CONTATO_CLIC: Boolean;
begin
    result := False;
    try
        qCliente.Close;
        qCliente.SQL.Clear;
        qCliente.SQL.Add('INSERT INTO CLIENTE_CONTATO_CLIC');
        qCliente.SQL.Add('           (CLIC_CODIGO,        ');
        qCliente.SQL.Add('            CLIC_NOME,          ');
        qCliente.SQL.Add('            CLIC_FONE1,         ');
        qCliente.SQL.Add('            CLIC_FONE2,         ');
        qCliente.SQL.Add('            CLIC_CEL1,          ');
        qCliente.SQL.Add('            CLIC_WHATSAPP,      ');
        qCliente.SQL.Add('            CLIC_EMAIL1,        ');
        qCliente.SQL.Add('            CLIC_EMAIL2)        ');
        qCliente.SQL.Add('     VALUES                     ');
        qCliente.SQL.Add('          (:CLIC_CODIGO,        ');
        qCliente.SQL.Add('           :CLIC_NOME,          ');
        qCliente.SQL.Add('           :CLIC_FONE1,         ');
        qCliente.SQL.Add('           :CLIC_FONE2,         ');
        qCliente.SQL.Add('           :CLIC_CEL1,          ');
        qCliente.SQL.Add('           :CLIC_WHATSAPP,      ');
        qCliente.SQL.Add('           :CLIC_EMAIL1,        ');
        qCliente.SQL.Add('           :CLIC_EMAIL2)        ');
        Preencher_Parametros_CLIENTE_CONTATO_CLIC(qCliente);
        qCliente.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Cliente ' + FNomeFantasia);
       LOGErros('Classe_Cliente','Erro ao incluir Cliente ' + FNomeFantasia);
    end;
end;

procedure TCliente.Preencher_Parametros_CLIENTE_CONTATO_CLIC(pQuery:TFDQuery);
begin
   qCliente.ParamByName('CLIC_CODIGO'  ).AsString := self.FCodigo;
   qCliente.ParamByName('CLIC_NOME'    ).AsString := self.FDetalhes.FContato.Nome;
   qCliente.ParamByName('CLIC_FONE1'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone1);
   qCliente.ParamByName('CLIC_FONE2'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone2);
   qCliente.ParamByName('CLIC_CEL1'    ).AsString := SoNumeros(self.FDetalhes.FContato.Cel);
   qCliente.ParamByName('CLIC_WHATSAPP').AsString := SoNumeros(self.FDetalhes.FContato.WhatsApp);
   qCliente.ParamByName('CLIC_EMAIL1'  ).AsString := self.FDetalhes.FContato.Email1;
   qCliente.ParamByName('CLIC_EMAIL2'  ).AsString := self.FDetalhes.FContato.Email2;
end;

function TCliente.Inserir_CLIENTE_DETALHE_CLID: Boolean;
begin
    result := False;
    try
        qCliente.Close;
        qCliente.SQL.Clear;
        qCliente.SQL.Add('INSERT INTO CLIENTE_DETALHE_CLID ');
        qCliente.SQL.Add('     (                           ');
        qCliente.SQL.Add('       CLID_CODIGO,              ');
        qCliente.SQL.Add('       CLID_PESSOA_FJ,           ');
        qCliente.SQL.Add('       CLID_NUVEM_ATUALIZADO,    ');
        qCliente.SQL.Add('       CLID_CPF,                 ');
        qCliente.SQL.Add('       CLID_CNPJ,                ');
        qCliente.SQL.Add('       CLID_IE,                  ');
        qCliente.SQL.Add('       CLID_RG,                  ');
        qCliente.SQL.Add('       CLID_RG_EMISSOR,          ');
        qCliente.SQL.Add('       CLID_RG_DTEMISSAO,        ');
        qCliente.SQL.Add('       CLID_DTNASC,              ');
        qCliente.SQL.Add('       CLID_SEXO,                ');
        qCliente.SQL.Add('       CLID_ALT_USU,             ');
        qCliente.SQL.Add('       CLID_ALT_DT,              ');
        qCliente.SQL.Add('       CLID_ALT_HR,              ');
        qCliente.SQL.Add('       CLID_ALT_ESTACAO,         ');
        qCliente.SQL.Add('       CLID_ALT_DTBLOQUEADO,     ');
        qCliente.SQL.Add('       CLID_ALT_DTLIBERADO,      ');
        qCliente.SQL.Add('       CLID_ALT_DTINATIVO,       ');
        qCliente.SQL.Add('       CLID_CDRAMO,              ');
        qCliente.SQL.Add('       CLID_CDREGIAO,            ');
        qCliente.SQL.Add('       CLID_CDZONA,              ');
        qCliente.SQL.Add('       CLID_CDCONTADOR,          ');
        qCliente.SQL.Add('       CLID_CDCONSULTOR,         ');
        qCliente.SQL.Add('       CLID_SMC,                 ');
        qCliente.SQL.Add('       CLID_SMCPLUS,             ');
        qCliente.SQL.Add('       CLID_MDE,                 ');
        qCliente.SQL.Add('       CLID_MERCHANT,            ');
        qCliente.SQL.Add('       CLID_GETRANSPORTE,        ');
        qCliente.SQL.Add('       CLID_CERTIFICADOA1A3,     ');
        qCliente.SQL.Add('       CLID_DT                   ');
        qCliente.SQL.Add('     )                           ');
        qCliente.SQL.Add('VALUES                           ');
        qCliente.SQL.Add('     (                           ');
        qCliente.SQL.Add('      :CLID_CODIGO,              ');
        qCliente.SQL.Add('      :CLID_PESSOA_FJ,           ');
        qCliente.SQL.Add('      :CLID_NUVEM_ATUALIZADO,    ');
        qCliente.SQL.Add('      :CLID_CPF,                 ');
        qCliente.SQL.Add('      :CLID_CNPJ,                ');
        qCliente.SQL.Add('      :CLID_IE,                  ');
        qCliente.SQL.Add('      :CLID_RG,                  ');
        qCliente.SQL.Add('      :CLID_RG_EMISSOR,          ');
        qCliente.SQL.Add('      :CLID_RG_DTEMISSAO,        ');
        qCliente.SQL.Add('      :CLID_DTNASC,              ');
        qCliente.SQL.Add('      :CLID_SEXO,                ');
        qCliente.SQL.Add('      :CLID_ALT_USU,             ');
        qCliente.SQL.Add('      :CLID_ALT_DT,              ');
        qCliente.SQL.Add('      :CLID_ALT_HR,              ');
        qCliente.SQL.Add('      :CLID_ALT_ESTACAO,         ');
        qCliente.SQL.Add('      :CLID_ALT_DTBLOQUEADO,     ');
        qCliente.SQL.Add('      :CLID_ALT_DTLIBERADO,      ');
        qCliente.SQL.Add('      :CLID_ALT_DTINATIVO,       ');
        qCliente.SQL.Add('      :CLID_CDRAMO,              ');
        qCliente.SQL.Add('      :CLID_CDREGIAO,            ');
        qCliente.SQL.Add('      :CLID_CDZONA,              ');
        qCliente.SQL.Add('      :CLID_CDCONTADOR,          ');
        qCliente.SQL.Add('      :CLID_CDCONSULTOR,         ');
        qCliente.SQL.Add('      :CLID_SMC,                 ');
        qCliente.SQL.Add('      :CLID_SMCPLUS,             ');
        qCliente.SQL.Add('      :CLID_MDE,                 ');
        qCliente.SQL.Add('      :CLID_MERCHANT,            ');
        qCliente.SQL.Add('      :CLID_GETRANSPORTE,        ');
        qCliente.SQL.Add('      :CLID_CERTIFICADOA1A3,     ');
        qCliente.SQL.Add('      :CLID_DT                   ');
        qCliente.SQL.Add('     )                           ');
        qCliente.ParamByName('CLID_CODIGO'             ).AsString   := FCodigo;
        qCliente.ParamByName('CLID_NUVEM_ATUALIZADO'   ).AsInteger  := 0;
        qCliente.ParamByName('CLID_PESSOA_FJ'          ).AsString   := FDetalhes.FTipoPessoa;
        qCliente.ParamByName('CLID_CPF'                ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qCliente.ParamByName('CLID_CNPJ'               ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qCliente.ParamByName('CLID_IE'                 ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qCliente.ParamByName('CLID_RG'                 ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qCliente.ParamByName('CLID_RG_EMISSOR'         ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qCliente.ParamByName('CLID_RG_DTEMISSAO'       ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qCliente.ParamByName('CLID_DTNASC'             ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qCliente.ParamByName('CLID_SEXO'               ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qCliente.ParamByName('CLID_ALT_USU'            ).AsString   := Usuario.Codigo;
        qCliente.ParamByName('CLID_ALT_DT'             ).AsDateTime := DataServidor;
        qCliente.ParamByName('CLID_ALT_HR'             ).AsString   := HoraServidor;
        qCliente.ParamByName('CLID_ALT_ESTACAO'        ).AsString   := NomeComputador;
        qCliente.ParamByName('CLID_ALT_DTBLOQUEADO'    ).AsDateTime := 0;
        qCliente.ParamByName('CLID_ALT_DTLIBERADO'     ).AsDateTime := 0;
        qCliente.ParamByName('CLID_ALT_DTINATIVO'      ).AsDateTime := 0;
        qCliente.ParamByName('CLID_CDRAMO'             ).AsString   := FDetalhes.FRamoAtividade;
        qCliente.ParamByName('CLID_CDREGIAO'           ).AsString   := FDetalhes.FRegiao;
        qCliente.ParamByName('CLID_CDZONA'             ).AsString   := FDetalhes.FZona;
        qCliente.ParamByName('CLID_CDCONTADOR'         ).AsString   := FDetalhes.FContador;
        qCliente.ParamByName('CLID_CDCONSULTOR'        ).AsString   := FDetalhes.FConsultor;
        qCliente.ParamByName('CLID_SMC'                ).AsInteger  := FDetalhes.FUsa_SMC;
        qCliente.ParamByName('CLID_SMCPLUS'            ).AsInteger  := FDetalhes.FUsa_SMCPLUS;
        qCliente.ParamByName('CLID_MDE'                ).AsInteger  := FDetalhes.FUsa_MDE;
        qCliente.ParamByName('CLID_MERCHANT'           ).AsInteger  := FDetalhes.FUsa_MERCHANT;
        qCliente.ParamByName('CLID_GETRANSPORTE'       ).AsInteger  := FDetalhes.FUsa_GETRANSPORTE;
        qCliente.ParamByName('CLID_CERTIFICADOA1A3'    ).AsInteger  := FDetalhes.fUsa_A1A3;
        qCliente.ParamByName('CLID_DT'                 ).AsDateTime := DataServidor;
        qCliente.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Cliente ' + FNomeFantasia);
       LOGErros('Classe_Cliente','Erro ao incluir Cliente ' + FNomeFantasia);
    end;
end;

function TCliente.Inserir_CLIENTE_ENDERECO_CLIE: Boolean;
begin
    result := False;
    try
        qCliente.Close;
        qCliente.SQL.Clear;
        qCliente.SQL.Add('INSERT INTO CLIENTE_ENDERECO_CLIE');
        qCliente.SQL.Add('     (                           ');
        qCliente.SQL.Add('       CLIE_CODIGO,              ');
        qCliente.SQL.Add('       CLIE_RUA,                 ');
        qCliente.SQL.Add('       CLIE_NUMERO,              ');
        qCliente.SQL.Add('       CLIE_COMPLEMENTO,         ');
        qCliente.SQL.Add('       CLIE_CDCIDADE,            ');
        qCliente.SQL.Add('       CLIE_BAIRRO,              ');
        qCliente.SQL.Add('       CLIE_CEP                  ');
        qCliente.SQL.Add('     )                           ');
        qCliente.SQL.Add('VALUES                           ');
        qCliente.SQL.Add('     (                           ');
        qCliente.SQL.Add('      :CLIE_CODIGO,              ');
        qCliente.SQL.Add('      :CLIE_RUA,                 ');
        qCliente.SQL.Add('      :CLIE_NUMERO,              ');
        qCliente.SQL.Add('      :CLIE_COMPLEMENTO,         ');
        qCliente.SQL.Add('      :CLIE_CDCIDADE,            ');
        qCliente.SQL.Add('      :CLIE_BAIRRO,              ');
        qCliente.SQL.Add('      :CLIE_CEP                  ');
        qCliente.SQL.Add('     )                           ');
        qCliente.ParamByName('CLIE_CODIGO'     ).AsString   := FCodigo;
        qCliente.ParamByName('CLIE_RUA'        ).AsString   := FDetalhes.FEndereco.Rua;
        qCliente.ParamByName('CLIE_NUMERO'     ).AsString   := FDetalhes.FEndereco.Numero;
        qCliente.ParamByName('CLIE_COMPLEMENTO').AsString   := FDetalhes.FEndereco.Complemento;
        qCliente.ParamByName('CLIE_CDCIDADE'   ).AsString   := FDetalhes.FEndereco.Cidade;
        qCliente.ParamByName('CLIE_BAIRRO'     ).AsString   := FDetalhes.FEndereco.Bairro;
        qCliente.ParamByName('CLIE_CEP'        ).AsString   := FDetalhes.FEndereco.CEP;
        qCliente.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Cliente ' + FNomeFantasia);
       LOGErros('Classe_Cliente','Erro ao incluir Cliente ' + FNomeFantasia);
    end;
end;


procedure TCliente.LimparCampos;
begin
    FNomeFantasia      := '';
    FRazaoSocial       := '';
	  FStatus            := -1;
end;

procedure TCliente.Pegar_Alteracoes;
begin
    with FAlteracao do
    begin
       Usuario       := qCliente.FieldByName('CLID_ALT_USU'        ).AsString;
       Data          := qCliente.FieldByName('CLID_ALT_DT'         ).AsString;
       Hora          := qCliente.FieldByName('CLID_ALT_HR'         ).AsString;
       Estacao       := qCliente.FieldByName('CLID_ALT_ESTACAO'    ).AsString;
       DataBloqueio  := qCliente.FieldByName('CLID_ALT_DTBLOQUEADO').AsString;
       DataLiberacao := qCliente.FieldByName('CLID_ALT_DTLIBERADO' ).AsString;
       DataInativo   := qCliente.FieldByName('CLID_ALT_DTINATIVO'  ).AsString;
    end;
end;

procedure TCliente.Pegar_Contato;
begin
    qCliente.Close;
    qCliente.SQL.Clear;
    qCliente.SQL.Add('SELECT * FROM CLIENTE_CONTATO_CLIC');
    qCliente.SQL.Add(' WHERE CLIC_CODIGO = :CLIC_CODIGO ');
    qCliente.ParamByName('CLIC_CODIGO').AsString := FCodigo;
    qCliente.Open;
    if qCliente.eof then
    begin
       Inserir_CLIENTE_CONTATO_CLIC;
       exit;
    end;
   Detalhes.FContato.Nome     := qCliente.FieldByName('CLIC_NOME'    ).AsString;
   Detalhes.FContato.Fone1    := qCliente.FieldByName('CLIC_FONE1'   ).AsString;
   Detalhes.FContato.Fone2    := qCliente.FieldByName('CLIC_FONE2'   ).AsString;
   Detalhes.FContato.Cel      := qCliente.FieldByName('CLIC_CEL1'    ).AsString;
   Detalhes.FContato.WhatsApp := qCliente.FieldByName('CLIC_WHATSAPP').AsString;
   Detalhes.FContato.Email1   := qCliente.FieldByName('CLIC_EMAIL1'  ).AsString;
   Detalhes.FContato.Email2   := qCliente.FieldByName('CLIC_EMAIL2'  ).AsString;
end;

procedure TCliente.Pegar_Dados_Basicos;
begin
    qCliente.Close;
    qCliente.SQL.Clear;
    qCliente.SQL.Add('SELECT * FROM CLIENTE_CLI      ');
    qCliente.SQL.Add(' WHERE CLI_CODIGO = :CLI_CODIGO');
    qCliente.ParamByName('CLI_CODIGO').AsString := FCodigo;
    qCliente.Open;
    if qCliente.eof then
    begin
       FExiste:=False;
       exit;
    end;
    FExiste                      := True;
    FCodigo                      := qCliente.FieldByName('CLI_CODIGO'                 ).AsString;
    FNomeFantasia                := qCliente.FieldByName('CLI_NOME_FANTASIA'          ).AsString;
    FRazaoSocial                 := qCliente.FieldByName('CLI_RAZAO_SOCIAL'           ).AsString;
    FStatus                      := qCliente.FieldByName('CLI_STATUS'                 ).AsInteger;
end;

procedure TCliente.Pegar_Detalhes;
begin
    qCliente.Close;
    qCliente.SQL.Clear;
    qCliente.SQL.Add('SELECT * FROM CLIENTE_DETALHE_CLID');
    qCliente.SQL.Add(' WHERE CLID_CODIGO = :CLID_CODIGO ');
    qCliente.ParamByName('CLID_CODIGO').AsString := FCodigo;
    qCliente.Open;
    if qCliente.eof then
    begin
       exit;
    end;

    Detalhes.FTipoPessoa         := qCliente.FieldByName('CLID_PESSOA_FJ'          ).AsString;
    with Detalhes.FPessoaFisica do
    begin
       FCPF                      := qCliente.FieldByName('CLID_CPF'                ).AsString;
       FRG                       := qCliente.FieldByName('CLID_RG'                 ).AsString;
       FRG_OrgaoEmissor          := qCliente.FieldByName('CLID_RG_EMISSOR'         ).AsString;
       FRG_DataEmissao           := qCliente.FieldByName('CLID_RG_DTEMISSAO'       ).AsDateTime;
       FRG_DataEmissaoString     := BarrasSeDataNula(qCliente.FieldByName('CLID_RG_DTEMISSAO').AsString);
       FDataNascimento           := qCliente.FieldByName('CLID_DTNASC'             ).AsDateTime;
       FSexo                     := qCliente.FieldByName('CLID_SEXO'               ).AsString;
       FDataNascimentoString     := BarrasSeDataNula(qCliente.FieldByName('CLID_DTNASC' ).AsString);
    end;
    with Detalhes.FPessoaJuridica do
    begin
       FCNPJ                     := qCliente.FieldByName('CLID_CNPJ'               ).AsString;
       FIE                       := qCliente.FieldByName('CLID_IE'                 ).AsString;
    end;
    FDetalhes.FRamoAtividade     := qCliente.FieldByName('CLID_CDRAMO'             ).AsString;
    FDetalhes.FRegiao            := qCliente.FieldByName('CLID_CDREGIAO'           ).AsString;
    FDetalhes.FZona              := qCliente.FieldByName('CLID_CDZONA'             ).AsString;
    FDetalhes.FContador          := qCliente.FieldByName('CLID_CDCONTADOR'         ).AsString;
    FDetalhes.FConsultor         := qCliente.FieldByName('CLID_CDCONSULTOR'        ).AsString;
    FDetalhes.FDataCadastro      := qCliente.FieldByName('CLID_DT'                 ).AsDateTime;
    FDetalhes.FUsa_SMC           := qCliente.FieldByName('CLID_SMC'                ).AsInteger;
    FDetalhes.FUsa_SMCPLUS       := qCliente.FieldByName('CLID_SMCPLUS'            ).AsInteger;
    FDetalhes.FUsa_MDE           := qCliente.FieldByName('CLID_MDE'                ).AsInteger;
    FDetalhes.FUsa_MERCHANT      := qCliente.FieldByName('CLID_MERCHANT'           ).AsInteger;
    FDetalhes.FUsa_GETRANSPORTE  := qCliente.FieldByName('CLID_GETRANSPORTE'       ).AsInteger;
    FDetalhes.fUsa_A1A3          := qCliente.FieldByName('CLID_CERTIFICADOA1A3'    ).AsInteger;
    Pegar_Alteracoes;
end;

procedure TCliente.Pegar_Endereco;
begin
    qCliente.Close;
    qCliente.SQL.Clear;
    qCliente.SQL.Add('SELECT * FROM CLIENTE_ENDERECO_CLIE');
    qCliente.SQL.Add(' WHERE CLIE_CODIGO = :CLIE_CODIGO  ');
    qCliente.ParamByName('CLIE_CODIGO').AsString := FCodigo;
    qCliente.Open;
    if qCliente.eof then
    begin
       exit;
    end;
    FDetalhes.Endereco.Rua         := qCliente.FieldByName('CLIE_RUA'        ).AsString;
    FDetalhes.Endereco.Numero      := qCliente.FieldByName('CLIE_NUMERO'     ).AsString;
    FDetalhes.Endereco.Complemento := qCliente.FieldByName('CLIE_COMPLEMENTO').AsString;
    FDetalhes.Endereco.Bairro      := qCliente.FieldByName('CLIE_BAIRRO'     ).AsString;
    FDetalhes.Endereco.Cidade      := qCliente.FieldByName('CLIE_CDCIDADE'   ).AsString;
    FDetalhes.Endereco.CEP         := qCliente.FieldByName('CLIE_CEP'        ).AsString;
end;

procedure TCliente.Pegar_Observacoes;
begin
   FObservacao.Clear;
   qCliente.Close;
   qCliente.Sql.Clear;
   qCliente.Sql.Add('SELECT CLIOBS_TEXTO          ');
   qCliente.Sql.Add('  FROM CLIENTE_OBS_CLIOBS    ');
   qCliente.Sql.Add(' WHERE CLIOBS_CODIGO = :COD  ');
   qCliente.Sql.Add(' ORDER BY CLIOBS_LINHA       ');
   qCliente.ParamByName('COD').AsString := FCodigo;
   qCliente.Open;
   while not qCliente.eof do
   begin
     FObservacao.add(qCliente.fieldbyname('CLIOBS_TEXTO').AsString);
     qCliente.Next;
   end;
end;

procedure TCliente.Preencher_Parametros_CLIENTE_CLI(pQuery: TFDQuery);
begin
   pQuery.ParamByName('CLI_CODIGO'       ).AsString   := FCodigo;
   pQuery.ParamByName('CLI_NOME_FANTASIA').AsString   := FNomeFantasia;
   pQuery.ParamByName('CLI_RAZAO_SOCIAL' ).AsString   := FRazaoSocial;
   pQuery.ParamByName('CLI_STATUS'       ).AsInteger  := FStatus;
end;

function TCliente.proximoCodigo: String;
var qProximo: TFDQuery;
    vCodigoCandidato:Integer;
    sCodigoCandidato:String;
begin
    vCodigoCandidato := 1;
    sCodigoCandidato := '1';
    qProximo := TFDQuery.Create(nil);
    qProximo.ConnectionName :='X';
    qProximo.Close;
    qProximo.SQL.Clear;
    qProximo.SQL.Add('SELECT MAX(CLI_CODIGO) AS MAIOR');
    qProximo.SQL.Add('  FROM CLIENTE_CLI             ');
    qProximo.Open;
    if qProximo.eof then
    begin
      qProximo.Free;
      result := sCodigoCandidato;
      exit;
    end;
    try
      vCodigoCandidato := StrToInt(qProximo.FieldByName('MAIOR').AsString)+1;
      vCodigoCandidato := vCodigoCandidato + 1;
      sCodigoCandidato := FormatFloat('#',vCodigoCandidato);
      result := sCodigoCandidato;
      qProximo.Free;
      exit;
    except
       vCodigoCandidato := 1;
       sCodigoCandidato := '1';
       qProximo.Close;
       qProximo.SQL.Clear;
       qProximo.SQL.Add('SELECT CLI_CODIGO              ');
       qProximo.SQL.Add('  FROM CLIENTE_CLI             ');
       qProximo.SQL.Add(' WHERE CLI_CODIGO = :CLI_CODIGO');
       qProximo.ParamByName('CLI_CODIGO').AsString := sCodigoCandidato;
       qProximo.Open;
       while not qProximo.Eof do
       begin
          qProximo.Close;
          inc(vCodigoCandidato);
          sCodigoCandidato := FormatFloat('#',vCodigoCandidato);
          qProximo.ParamByName('CLI_CODIGO').AsString := sCodigoCandidato;
          qProximo.Open;
       end;
       qProximo.Free;
       result := sCodigoCandidato;
       exit;
    end;
end;

procedure TCliente.RegistrarHistorico(pEvento,pLog: String);
begin
   //Histórico de bloqueios e desbloqueios do cliente
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('INSERT INTO CLIENTE_HISTORICO_BLOQUEIOS_CHB ');
   qLocal.Sql.Add('     ( CHB_CLIENTE,                         ');
   qLocal.Sql.Add('       CHB_EVENTO,                          ');
   qLocal.Sql.Add('       CHB_DTEVENTO,                        ');
   qLocal.Sql.Add('       CHB_HREVENTO,                        ');
   qLocal.Sql.Add('       CHB_USUEVENTO,                       ');
   qLocal.Sql.Add('       CHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                      ');
   qLocal.Sql.Add('VALUES                                      ');
   qLocal.Sql.Add('     (:CHB_CLIENTE,                         ');
   qLocal.Sql.Add('      :CHB_EVENTO,                          ');
   qLocal.Sql.Add('      :CHB_DTEVENTO,                        ');
   qLocal.Sql.Add('      :CHB_HREVENTO,                        ');
   qLocal.Sql.Add('      :CHB_USUEVENTO,                       ');
   qLocal.Sql.Add('      :CHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                                                                                           ');
   qLocal.ParamByName('CHB_CLIENTE'  ).AsString   := FCodigo;
   qLocal.ParamByName('CHB_EVENTO'   ).AsString   := pEvento;
   qLocal.ParamByName('CHB_DTEVENTO' ).AsDateTime := DataServidor;
   qLocal.ParamByName('CHB_HREVENTO' ).AsString   := HoraServidor;
   qLocal.ParamByName('CHB_USUEVENTO').AsString   := Usuario.Codigo;
   qLocal.ParamByName('CHB_MAQEVENTO').AsString   := NomeComputador;
   qLocal.ExecSql;

   Log('Classe_Cliente',pLog+' cliente '+FCodigo+' - '+FNomeFantasia);
end;

procedure TCliente.RegistrarHistoricoDeAtivacao;
begin
   RegistrarHistorico('Ativado','Ativou');
end;

procedure TCliente.RegistrarHistoricoDeBloqueio;
begin
   RegistrarHistorico('Bloqueado','Bloqueou');
end;

procedure TCliente.RegistrarHistoricoDeDesBloqueio;
begin
   RegistrarHistorico('Desbloqueado','Desbloqueou');
end;

procedure TCliente.RegistrarHistoricoDeInativacao;
begin
   RegistrarHistorico('Inativado','Inativou');
end;

procedure TCliente.setDetalhes(const Value: tDetalhes_Cliente);
begin
   FDetalhes := Value;
end;

procedure TCliente.setFCodigo(const Value: String);
begin
   if Value = '' then
      FCodigo := Copy(proximoCodigo,1,10)
   else
      FCodigo := Copy(Value,1,10);
end;

procedure TCliente.setFNomeFantasia(const Value: String);
begin
   FNomeFantasia := UpperCase(Copy(Value,1,50));
end;

procedure TCliente.setFObservacao(const Value: TStringList);
begin
   FObservacao := Value;
end;

procedure TCliente.setFStatus(const Value: TStatusCadastral);
begin
   Case value of
      sAtivo : begin
             if FStatus <> 0 then
             begin
                FAlteracao.DataLiberacao := sDataServidor;
                RegistrarHistoricoDeAtivacao;
             end;
             if FStatus = 1 then
             begin
               RegistrarHistoricoDeDesBloqueio;
             end;
          end;
      sAtivoBloqueado : begin
            if FStatus <> 1 then
            begin
               FAlteracao.DataBloqueio := sDataServidor;
               RegistrarHistoricoDeBloqueio;
            end;
          end;
      sInativo : begin
            if FStatus <> 2 then
            begin
               FAlteracao.DataInativo := sDataServidor;
               RegistrarHistoricoDeInativacao;
            end;
            if FStatus = 1 then
            begin
              RegistrarHistoricoDeDesBloqueio;
            end;
          end;
   End;

   FStatus := StatusCadastralToInt(Value);
end;

procedure TCliente.setRazaoSocial(const Value: String);
begin
   FRazaoSocial := UpperCase(Copy(value,1,50));
end;

function TCliente.Update: Boolean;
begin
    result := false;
    if not Update_CLIENTE_CLI           then exit;
    if not Update_CLIENTE_DETALHE_CLID  then exit;
    if not Update_CLIENTE_ENDERECO_CLIE then exit;
    if not Update_CLIENTE_CONTATO_CLIC  then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Cliente','Alterou cliente '+ FCodigo + ' - ' + FNomeFantasia);
end;

function TCliente.Update_CLIENTE_CLI:Boolean;
begin
    try
        qCliente.Close;
        qCliente.SQL.Clear;
        qCliente.SQL.Add('UPDATE CLIENTE_CLI                                             ');
        qCliente.SQL.Add('   SET CLI_NOME_FANTASIA           = :CLI_NOME_FANTASIA,       ');
        qCliente.SQL.Add('       CLI_RAZAO_SOCIAL            = :CLI_RAZAO_SOCIAL,        ');
        qCliente.SQL.Add('       CLI_STATUS                  = :CLI_STATUS               ');
        qCliente.SQL.Add(' WHERE CLI_CODIGO                  = :CLI_CODIGO               ');
        Preencher_Parametros_CLIENTE_CLI(qCliente);
        qCliente.ExecSql;
        Log('Classe_Cliente','Alterou Cliente '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Cliente '+ FNomeFantasia);
       LogErros('Classe_Cliente','Erro ao alterar Cliente '+ FNomeFantasia);
    end;
end;

function TCliente.Update_CLIENTE_CONTATO_CLIC: Boolean;
begin
    if existe_CLIENTE_CONTATO_CLIC then
       result := alterar_CLIENTE_CONTATO_CLIC
    else
       result := inserir_CLIENTE_CONTATO_CLIC;
end;

function TCliente.alterar_CLIENTE_CONTATO_CLIC: Boolean;
begin
    result := False;
    try
        qCliente.Close;
        qCliente.SQL.Clear;
        qCliente.SQL.Add('UPDATE CLIENTE_CONTATO_CLIC            ');
        qCliente.SQL.Add('   SET CLIC_NOME     = :CLIC_NOME,     ');
        qCliente.SQL.Add('       CLIC_FONE1    = :CLIC_FONE1,    ');
        qCliente.SQL.Add('       CLIC_FONE2    = :CLIC_FONE2,    ');
        qCliente.SQL.Add('       CLIC_CEL1     = :CLIC_CEL1,     ');
        qCliente.SQL.Add('       CLIC_WHATSAPP = :CLIC_WHATSAPP, ');
        qCliente.SQL.Add('       CLIC_EMAIL1   = :CLIC_EMAIL1,   ');
        qCliente.SQL.Add('       CLIC_EMAIL2   = :CLIC_EMAIL2    ');
        qCliente.SQL.Add(' WHERE CLIC_CODIGO   = :CLIC_CODIGO    ');
        Preencher_Parametros_CLIENTE_CONTATO_CLIC(qCliente);
        qCliente.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao alterar Contatos do Cliente ' + FNomeFantasia);
       LOGErros('Classe_Cliente','Erro ao Alterar Contatos do Cliente ' + FNomeFantasia);
    end;
end;

function TCliente.Update_CLIENTE_DETALHE_CLID:Boolean;
begin
    if existe_CLIENTE_DETALHE_CLID then
       result := alterar_CLIENTE_DETALHE_CLID
    else
       result := inserir_CLIENTE_DETALHE_CLID;
end;

function TCliente.alterar_CLIENTE_DETALHE_CLID:Boolean;
begin
    result := false;
    try
        qCliente.Close;
        qCliente.SQL.Clear;
        qCliente.SQL.Add('UPDATE CLIENTE_DETALHE_CLID                                  ');
        qCliente.SQL.Add('   SET CLID_PESSOA_FJ           = :CLID_PESSOA_FJ,           ');
        qCliente.SQL.Add('       CLID_NUVEM_ATUALIZADO    = :CLID_NUVEM_ATUALIZADO,    ');
        qCliente.SQL.Add('       CLID_CPF                 = :CLID_CPF,                 ');
        qCliente.SQL.Add('       CLID_CNPJ                = :CLID_CNPJ,                ');
        qCliente.SQL.Add('       CLID_IE                  = :CLID_IE,                  ');
        qCliente.SQL.Add('       CLID_RG                  = :CLID_RG,                  ');
        qCliente.SQL.Add('       CLID_RG_EMISSOR          = :CLID_RG_EMISSOR,          ');
        qCliente.SQL.Add('       CLID_RG_DTEMISSAO        = :CLID_RG_DTEMISSAO,        ');
        qCliente.SQL.Add('       CLID_DTNASC              = :CLID_DTNASC,              ');
        qCliente.SQL.Add('       CLID_SEXO                = :CLID_SEXO,                ');
        qCliente.SQL.Add('       CLID_ALT_USU             = :CLID_ALT_USU,             ');
        qCliente.SQL.Add('       CLID_ALT_DT              = :CLID_ALT_DT,              ');
        qCliente.SQL.Add('       CLID_ALT_HR              = :CLID_ALT_HR,              ');
        qCliente.SQL.Add('       CLID_ALT_ESTACAO         = :CLID_ALT_ESTACAO,         ');
        qCliente.SQL.Add('       CLID_ALT_DTBLOQUEADO     = :CLID_ALT_DTBLOQUEADO,     ');
        qCliente.SQL.Add('       CLID_ALT_DTLIBERADO      = :CLID_ALT_DTLIBERADO,      ');
        qCliente.SQL.Add('       CLID_ALT_DTINATIVO       = :CLID_ALT_DTINATIVO,       ');
        qCliente.SQL.Add('       CLID_CDRAMO              = :CLID_CDRAMO,              ');
        qCliente.SQL.Add('       CLID_CDREGIAO            = :CLID_CDREGIAO,            ');
        qCliente.SQL.Add('       CLID_CDZONA              = :CLID_CDZONA,              ');
        qCliente.SQL.Add('       CLID_CDCONTADOR          = :CLID_CDCONTADOR,          ');
        qCliente.SQL.Add('       CLID_CDCONSULTOR         = :CLID_CDCONSULTOR,         ');
        qCliente.SQL.Add('       CLID_SMC                 = :CLID_SMC,                 ');
        qCliente.SQL.Add('       CLID_SMCPLUS             = :CLID_SMCPLUS,             ');
        qCliente.SQL.Add('       CLID_MDE                 = :CLID_MDE,                 ');
        qCliente.SQL.Add('       CLID_MERCHANT            = :CLID_MERCHANT,            ');
        qCliente.SQL.Add('       CLID_GETRANSPORTE        = :CLID_GETRANSPORTE,        ');
        qCliente.SQL.Add('       CLID_CERTIFICADOA1A3     = :CLID_CERTIFICADOA1A3      ');
        qCliente.SQL.Add(' WHERE CLID_CODIGO              = :CLID_CODIGO               ');
        qCliente.ParamByName('CLID_CODIGO'          ).AsString   := FCodigo;
        qCliente.ParamByName('CLID_NUVEM_ATUALIZADO').AsInteger  := 0;
        qCliente.ParamByName('CLID_PESSOA_FJ'       ).AsString   := FDetalhes.FTipoPessoa;
        qCliente.ParamByName('CLID_CPF'             ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qCliente.ParamByName('CLID_CNPJ'            ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qCliente.ParamByName('CLID_IE'              ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qCliente.ParamByName('CLID_RG'              ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qCliente.ParamByName('CLID_RG_EMISSOR'      ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qCliente.ParamByName('CLID_RG_DTEMISSAO'    ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qCliente.ParamByName('CLID_DTNASC'          ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qCliente.ParamByName('CLID_SEXO'            ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qCliente.ParamByName('CLID_ALT_USU'         ).AsString   := Usuario.Codigo;
        qCliente.ParamByName('CLID_ALT_DT'          ).AsDateTime := DataServidor;
        qCliente.ParamByName('CLID_ALT_HR'          ).AsString   := HoraServidor;
        qCliente.ParamByName('CLID_ALT_ESTACAO'     ).AsString   := NomeComputador;
        qCliente.ParamByName('CLID_ALT_DTBLOQUEADO' ).AsDateTime := ZeroSeDataNula(FAlteracao.DataBloqueio);
        qCliente.ParamByName('CLID_ALT_DTLIBERADO'  ).AsDateTime := ZeroSeDataNula(FAlteracao.DataLiberacao);
        qCliente.ParamByName('CLID_ALT_DTINATIVO'   ).AsDateTime := ZeroSeDataNula(FAlteracao.DataInativo);
        qCliente.ParamByName('CLID_CDRAMO'          ).AsString   := FDetalhes.FRamoAtividade;
        qCliente.ParamByName('CLID_CDREGIAO'        ).AsString   := FDetalhes.FRegiao;
        qCliente.ParamByName('CLID_CDZONA'          ).AsString   := FDetalhes.FZona;
        qCliente.ParamByName('CLID_CDCONTADOR'      ).AsString   := FDetalhes.FContador;
        qCliente.ParamByName('CLID_CDCONSULTOR'     ).AsString   := FDetalhes.FConsultor;
        qCliente.ParamByName('CLID_SMC'             ).AsInteger  := FDetalhes.FUsa_SMC;
        qCliente.ParamByName('CLID_SMCPLUS'         ).AsInteger  := FDetalhes.FUsa_SMCPLUS;
        qCliente.ParamByName('CLID_MDE'             ).AsInteger  := FDetalhes.FUsa_MDE;
        qCliente.ParamByName('CLID_MERCHANT'        ).AsInteger  := FDetalhes.FUsa_MERCHANT;
        qCliente.ParamByName('CLID_GETRANSPORTE'    ).AsInteger  := FDetalhes.FUsa_GETRANSPORTE;
        qCliente.ParamByName('CLID_CERTIFICADOA1A3' ).AsInteger  := FDetalhes.fUsa_A1A3;

        qCliente.ExecSql;

        Log('Classe_Cliente','Alterou Cliente '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Detalhes do Cliente '+ FNomeFantasia);
       LogErros('Classe_Cliente','Erro ao alterar Detalhes do Cliente '+ FNomeFantasia);
    end;
end;

function TCliente.Update_CLIENTE_ENDERECO_CLIE:Boolean;
begin
    if existe_CLIENTE_ENDERECO_CLIE then
       result := alterar_CLIENTE_ENDERECO_CLIE
    else
       result := inserir_CLIENTE_ENDERECO_CLIE;
end;

function TCliente.alterar_CLIENTE_ENDERECO_CLIE:Boolean;
begin
   try
        qCliente.Close;
        qCliente.SQL.Clear;
        qCliente.SQL.Add('UPDATE CLIENTE_ENDERECO_CLIE                                 ');
        qCliente.SQL.Add('   SET CLIE_RUA                 = :CLIE_RUA,                 ');
        qCliente.SQL.Add('       CLIE_NUMERO              = :CLIE_NUMERO,              ');
        qCliente.SQL.Add('       CLIE_COMPLEMENTO         = :CLIE_COMPLEMENTO,         ');
        qCliente.SQL.Add('       CLIE_BAIRRO              = :CLIE_BAIRRO,              ');
        qCliente.SQL.Add('       CLIE_CDCIDADE            = :CLIE_CDCIDADE,            ');
        qCliente.SQL.Add('       CLIE_CEP                 = :CLIE_CEP                  ');
        qCliente.SQL.Add(' WHERE CLIE_CODIGO              = :CLIE_CODIGO               ');
        qCliente.ParamByName('CLIE_CODIGO'          ).AsString   := FCodigo;
        qCliente.ParamByName('CLIE_RUA'             ).AsString   := FDetalhes.FEndereco.Rua;
        qCliente.ParamByName('CLIE_NUMERO'          ).AsString   := FDetalhes.FEndereco.Numero;
        qCliente.ParamByName('CLIE_COMPLEMENTO'     ).AsString   := FDetalhes.FEndereco.Complemento;
        qCliente.ParamByName('CLIE_BAIRRO'          ).AsString   := FDetalhes.FEndereco.Bairro;
        qCliente.ParamByName('CLIE_CDCIDADE'        ).AsString   := FDetalhes.FEndereco.Cidade;
        qCliente.ParamByName('CLIE_CEP'             ).AsString   := FDetalhes.FEndereco.CEP;
        qCliente.ExecSql;

        Log('Classe_Cliente','Alterou Cliente '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Endereço do Cliente '+ FNomeFantasia);
       LogErros('Classe_Cliente','Erro ao alterar Endereço do Cliente '+ FNomeFantasia);
    end;
end;

{ tDetalhes_Cliente }

constructor tDetalhes_Cliente.Create;
begin
  qCliente := TFDQuery.Create(nil);
  qCliente.ConnectionName :='X';
  FPessoaFisica  := tPessoa_Fisica.Create;
  FPessoaJuridica:= tPessoa_Juridica.Create;
  FEndereco      := TEndereco.Create;
  FContato       := TContato.Create;
end;

destructor tDetalhes_Cliente.Destroy;
begin
  qCliente.Free;
  FPessoaFisica.Free;
  FPessoaJuridica.Free;
  FEndereco.Free;
  FContato.Free;
  inherited;
end;

function tDetalhes_Cliente.getDataCadastroString: String;
begin
   result := DateToStr(FDataCadastro);
end;

{function tDetalhes_Cliente.getFCodigoMunicipio: String;
begin
   result := FCodigoMunicipio;
end;
}
function tDetalhes_Cliente.getFConsultor: String;
begin
  Result := FConsultor;
end;

function tDetalhes_Cliente.getFContador: String;
begin
  Result := FContador;
end;

function tDetalhes_Cliente.getFDataCadastro: TDateTime;
begin
   result := FDataCadastro;
end;

function tDetalhes_Cliente.getFRamoAtividade: String;
begin
   result := FRamoAtividade;
end;

function tDetalhes_Cliente.getFRegiao: String;
begin
   Result := FRegiao;
end;

function tDetalhes_Cliente.getFTipoPessoa: TTipoPessoa;
begin
   Result := StringToTipoPessoa(FTipoPessoa);
end;

function tDetalhes_Cliente.getFUsa_A1A3: Integer;
begin
   result := FUsa_A1A3;
end;

function tDetalhes_Cliente.getFUsa_GETRANSPORTE: Integer;
begin
   Result := FUsa_GETRANSPORTE;
end;

function tDetalhes_Cliente.getFUsa_MDE: Integer;
begin
   Result := FUsa_MDE;
end;

function tDetalhes_Cliente.getFUsa_MERCHANT: Integer;
begin
   Result := FUsa_MERCHANT;
end;

function tDetalhes_Cliente.getFUsa_SMC: Integer;
begin
   Result := FUsa_SMC;
end;

function tDetalhes_Cliente.getFUsa_SMCPLUS: Integer;
begin
   Result := FUsa_SMCPLUS;
end;

function tDetalhes_Cliente.getFZona: String;
begin
   Result := FZona;
end;

{
procedure tDetalhes_Cliente.setFCodigoMunicipio(const Value: String);
begin
   FCodigoMunicipio := Value;
end;
}
procedure tDetalhes_Cliente.setFConsultor(const Value: String);
begin
   FConsultor := Copy(Value,1,10);
end;

procedure tDetalhes_Cliente.setFContador(const Value: String);
begin
   FContador := Copy(Value,1,10);
end;

procedure tDetalhes_Cliente.setFDataCadastro(const Value: TDateTime);
begin
   FDataCadastro := Value;
end;

procedure tDetalhes_Cliente.setFRamoAtividade(const Value: String);
begin
   FRamoAtividade := Copy(Value,1,10);
end;

procedure tDetalhes_Cliente.setFRegiao(const Value: String);
begin
   FRegiao := Copy(Value,1,10);
end;

procedure tDetalhes_Cliente.setFTipoPessoa(const Value: TTipoPessoa);
begin
   FTipoPessoa := TipoPessoaToString(Value);
end;

procedure tDetalhes_Cliente.setFUsa_A1A3(const Value: Integer);
begin
   FUsa_A1A3 := Value;
end;

procedure tDetalhes_Cliente.setFUsa_GETRANSPORTE(const Value: Integer);
begin
   FUsa_GETRANSPORTE := Value;
end;

procedure tDetalhes_Cliente.setFUsa_MDE(const Value: Integer);
begin
   FUsa_MDE := Value;
end;

procedure tDetalhes_Cliente.setFUsa_MERCHANT(const Value: Integer);
begin
   FUsa_MERCHANT := Value;
end;

procedure tDetalhes_Cliente.setFUsa_SMC(const Value: Integer);
begin
   FUsa_SMC := Value;
end;

procedure tDetalhes_Cliente.setFUsa_SMCPLUS(const Value: Integer);
begin
   FUsa_SMCPLUS := Value;
end;

procedure tDetalhes_Cliente.setFZona(const Value: String);
begin
   FZona := Copy(Value,1,10);
end;

{ tPessoaFisica }

function tPessoa_Fisica.getFCPF: String;
begin
   if self.FCPF = '' then
   begin
     result := self.FCPF;
     exit;
   end;
   self.FCPF :=Trim(self.FCPF);
   if frmValidadorDeDocumentos.CPF_Valido(self.FCPF) then
      result := vVDD_DocumentoFormatado;
end;

function tPessoa_Fisica.getFRG: String;
begin
   Result := FRG;
end;

function tPessoa_Fisica.getFRG_DataEmissaoString: String;
begin
   result := self.FRG_DataEmissaoString;
end;

function tPessoa_Fisica.getFRG_OrgaoEmissor: String;
begin
   Result := FRG_OrgaoEmissor;
end;

function tPessoa_Fisica.getFSexo: Integer;
begin
   if      FSexo = 'M' then result := 0
   else if FSexo = 'F' then result := 1
   else                     result := -1;
end;

procedure tPessoa_Fisica.setDataNascimentoString(const Value: String);
begin
   if Value = '  /  /  ' then
      FDataNascimento := 0
   else
      FDataNascimento := StrToDate(Value);
   FDataNascimentoString := Value;
end;

procedure tPessoa_Fisica.setFCPF(const Value: String);
begin
  FCPF  := Copy(SoNumeros(Value),1,11);
end;

procedure tPessoa_Fisica.setFRG(const Value: String);
begin
   FRG := SoNumerosOuISENTO(Value);
end;

procedure tPessoa_Fisica.setFRG_DataEmissaoString(const Value: String);
begin
   if Value = '  /  /  ' then
      FRG_DataEmissao := 0
   else
      FRG_DataEmissao := StrToDate(Value);
   FRG_DataEmissaoString := Value;
end;

procedure tPessoa_Fisica.setFRG_OrgaoEmissor(const Value: String);
begin
   FRG_OrgaoEmissor := Value;
end;

procedure tPessoa_Fisica.setFSexo(const Value: Integer);
begin
   case Value of
      0 : FSexo := 'M';
      1 : FSexo := 'F';
   else
      FSexo := '';
   end;
end;

function tPessoa_Fisica.getDataNascimentoString: String;
begin
   result := self.FDataNascimentoString;
end;

{ tPessoa_Juridica }

function tPessoa_Juridica.getFCNPJ: String;
begin
   if self.FCNPJ = '' then
   begin
     result := self.FCNPJ;
     exit;
   end;
   self.FCNPJ :=Trim(self.FCNPJ);
   if frmValidadorDeDocumentos.CNPJ_Valido(self.FCNPJ) then
      result := vVDD_DocumentoFormatado;
end;

function tPessoa_Juridica.getFIE: String;
begin
  result := FIE;
end;

procedure tPessoa_Juridica.setFCNPJ(const Value: String);
begin
  FCNPJ  := Copy(SoNumeros(Value),1,14);
end;

procedure tPessoa_Juridica.setFIE(const Value: String);
begin
   FIE := SoNumerosOuISENTO(Value);
end;

end.
{
CREATE TABLE CLIENTE_CLI(
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
ALTER TABLE CLIENTE_DETALHE_CLID ADD	CLI_ATUALIZADO_NA_NUVEM int NOT NULL
ALTER TABLE CLIENTE_DETALHE_CLID ADD		CLI_DTNUVEM datetime NULL
ALTER TABLE CLIENTE_DETALHE_CLID ADD		CLI_HRNUVEM varchar(5) NULL
ALTER TABLE CLIENTE_DETALHE_CLID ADD		CLI_SMC int NULL
ALTER TABLE CLIENTE_DETALHE_CLID ADD		CLI_ATIVO int NULL
ALTER TABLE CLIENTE_DETALHE_CLID ADD		CLI_IM varchar(20) NULL
ALTER TABLE CLIENTE_DETALHE_CLID ADD		CLI_CPAIS int NULL
ALTER TABLE CLIENTE_DETALHE_CLID ADD		CLI_SUFRAMA varchar(9) NULL




