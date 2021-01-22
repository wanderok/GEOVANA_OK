unit Classe_Consultor;

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
       FCPF                  : String;
       FDataNascimento       : TDateTime;
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
       FCNPJ                 : String;
       FIE                   : String;
    function getFCNPJ: String;
    function getFIE: String;
    procedure setFCNPJ(const Value: String);
    procedure setFIE(const Value: String);
    public
       property CNPJ             : String     read getFCNPJ                 write setFCNPJ;
       property IE               : String     read getFIE                   write setFIE;
  end;

  tBanco = class
    private
      FBanco,
      FAgencia,
      FAgencia_Digito,
      FOperacao,
      FConta,
      FConta_Digito      : String;
      FStatus            : TStatusCadastralAI;
    function getFAgencia: String;
    function getFAgencia_Digito: String;
    function getFBanco: String;
    function getFConta: String;
    function getFConta_Digito: String;
    function getFOperacao: String;
    procedure SetFAgencia(const Value: String);
    procedure SetFAgencia_Digito(const Value: String);
    procedure SetFBanco(const Value: String);
    procedure SetFConta(const Value: String);
    procedure SetFConta_Digito(const Value: String);
    procedure SetFOperacao(const Value: String);
    function getFStatus: TStatusCadastralAI;
    procedure SetFStatus(const Value: TStatusCadastralAI);
    public
      property Banco             : String             read getFBanco              write SetFBanco;
      property Agencia           : String             read getFAgencia            write SetFAgencia;
      property Agencia_Digito    : String             read getFAgencia_Digito     write SetFAgencia_Digito;
      property Operacao          : String             read getFOperacao           write SetFOperacao;
      property Conta             : String             read getFConta              write SetFConta;
      property Conta_Digito      : String             read getFConta_Digito       write SetFConta_Digito;
      property Status            : TStatusCadastralAI read getFStatus             write SetFStatus;
  end;

  tDetalhes_Consultor = class
    private
      FDataCadastro      : TDateTime;
      FTipoPessoa	       : String;
      FPessoaFisica      : tPessoa_Fisica;
      FPessoaJuridica    : tPessoa_Juridica;
      FRamoAtividade     : String;
      FRegiao            : String;
      FZona              : String;
      FEndereco          : TEndereco;
      FContato           : TContato;
      FBanco             : TBanco;
      FComissao          : Real;
      //
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
      function getFComissao: Real;
      procedure SetFComissao(const Value: Real);

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
      property Banco             : TBanco           read FBanco                 write FBanco;
      property Comissao          : Real             read getFComissao           write SetFComissao;

end;

  TConsultorAlteracao = class(TAlteracao);

  TConsultor = class
  private
    FExiste            : Boolean;
    FCodigo            : String;
    FNomeFantasia      : String;
    FRazaoSocial       : String;
	  FStatus            : Integer;
    FDetalhes          : tDetalhes_Consultor;
    FAlteracao         : TConsultorAlteracao;
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
    function  getDetalhes: tDetalhes_Consultor;
    procedure setDetalhes(const Value: tDetalhes_Consultor);
    function  Insert:Boolean;
    function  Update:Boolean;
    function  DadosCorretos:Boolean;
    procedure Preencher_Parametros_CONSULTOR_CON(pQuery:TFDQuery);
    procedure Preencher_Parametros_CONSULTOR_CONTATO_CONC(pQuery:TFDQuery);
    procedure Pegar_Dados_Basicos;
    procedure Pegar_Detalhes;
    procedure Pegar_Endereco;
    procedure Pegar_Contato;
    procedure Pegar_Alteracoes;
    procedure Pegar_Comissoes;

    procedure Pegar_Observacoes;
    procedure Gravar_Observacoes;
    //
    function Inserir_CONSULTOR_CON                  : Boolean;
    function Inserir_CONSULTOR_DETALHE_COND         : Boolean;
    function Inserir_CONSULTOR_ENDERECO_CONE        : Boolean;
    function Inserir_CONSULTOR_CONTATO_CONC         : Boolean;
    function Inserir_CONSULTOR_BANCO_COMISSAO_CONBC : Boolean;
    function Existe_CONSULTOR_BANCO_COMISSAO_CONBC : Boolean;
    function Alterar_CONSULTOR_BANCO_COMISSAO_CONBC : Boolean;
    //
    function Update_CONSULTOR_CON:Boolean;

    function Update_CONSULTOR_DETALHE_COND:Boolean;
    function existe_CONSULTOR_DETALHE_COND:Boolean;
    function alterar_CONSULTOR_DETALHE_COND:Boolean;

    function Update_CONSULTOR_ENDERECO_CONE:Boolean;
    function existe_CONSULTOR_ENDERECO_CONE: Boolean;
    function alterar_CONSULTOR_ENDERECO_CONE:BooleAn;

    function Update_CONSULTOR_CONTATO_CONC:Boolean;
    function existe_CONSULTOR_CONTATO_CONC: Boolean;
    function alterar_CONSULTOR_CONTATO_CONC: Boolean;

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
    property Existe        : Boolean             read getFExiste;
    Property Codigo        : String              read getFCodigo       write setFCodigo;
    Property NomeFantasia  : String              read getFNomeFantasia write setFNomeFantasia;
    Property RazaoSocial   : String              read getRazaoSocial   write setRazaoSocial;
    Property Status        : TStatusCadastral    read getFStatus       write setFStatus;
    Property Detalhes      : tDetalhes_Consultor read getDetalhes      write setDetalhes;
    property Alteracao     : TConsultorAlteracao read FAlteracao       write FAlteracao;
    property Observacao    : TStringList         read getFObservacao   write setFObservacao;
    procedure Abrir;
    Function Gravar:Boolean;
    function GravarBancoComissao:Boolean;
end;

implementation

uses FuncoesSMC,
     Classe_Nuvem;

var qConsultor, qLocal: TFDQuery;

{ TConsultor }

procedure TConsultor.Abrir;
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


constructor TConsultor.Create;
begin
   FDetalhes   := tDetalhes_Consultor.Create;
   FAlteracao  := TConsultorAlteracao.Create;
   FObservacao := TStringList.Create;
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName :='X';
end;

function TConsultor.DadosCorretos: Boolean;
begin
    Result := False;
    // ...criticas...
    Result := True;
end;

destructor TConsultor.Destroy;
begin
  FDetalhes.Free;
  FAlteracao.Free;
  FObservacao.Free;
  qLocal.Free;
  inherited;
end;

function TConsultor.Existe_CONSULTOR_BANCO_COMISSAO_CONBC: Boolean;
begin
    qConsultor.Close;
    qConsultor.SQL.Clear;
    qConsultor.SQL.Add('SELECT CONBC_CODIGO                          ');
    qConsultor.SQL.Add('  FROM CONSULTOR_BANCO_COMISSAO_CONBC        ');
    qConsultor.SQL.Add(' WHERE CONBC_CODIGO      = :CONBC_CODIGO     ');
    qConsultor.SQL.Add('   AND CONBC_BANCO       = :CONBC_BANCO      ');
    qConsultor.SQL.Add('   AND CONBC_AGENCIA     = :CONBC_AGENCIA    ');
    qConsultor.SQL.Add('   AND CONBC_AGENCIA_DIG = :CONBC_AGENCIA_DIG');
    qConsultor.SQL.Add('   AND CONBC_OPERACAO    = :CONBC_OPERACAO   ');
    qConsultor.SQL.Add('   AND CONBC_CONTA       = :CONBC_CONTA      ');
    qConsultor.SQL.Add('   AND CONBC_CONTA_DIG   = :CONBC_CONTA_DIG  ');
    qConsultor.ParamByName('CONBC_CODIGO'     ).AsString  := FCodigo;
    qConsultor.ParamByName('CONBC_BANCO'      ).AsString  := FDetalhes.FBanco.FBanco;
    qConsultor.ParamByName('CONBC_AGENCIA'    ).AsString  := FDetalhes.FBanco.FAgencia;
    qConsultor.ParamByName('CONBC_AGENCIA_DIG').AsString  := FDetalhes.FBanco.FAgencia_Digito;
    qConsultor.ParamByName('CONBC_OPERACAO'   ).AsString  := FDetalhes.FBanco.FOperacao;
    qConsultor.ParamByName('CONBC_CONTA'      ).AsString  := FDetalhes.FBanco.FConta;
    qConsultor.ParamByName('CONBC_CONTA_DIG'  ).AsString  := FDetalhes.FBanco.FConta_Digito;
    qConsultor.Open;
    Result := not qConsultor.Eof;
end;

function TConsultor.existe_CONSULTOR_DETALHE_COND: Boolean;
begin
    qConsultor.Close;
    qConsultor.SQL.Clear;
    qConsultor.SQL.Add('SELECT COND_CODIGO               ');
    qConsultor.SQL.Add('  FROM CONSULTOR_DETALHE_COND      ');
    qConsultor.SQL.Add(' WHERE COND_CODIGO = :COND_CODIGO');
    qConsultor.ParamByName('COND_CODIGO').AsString   := FCodigo;
    qConsultor.Open;
    result := not qConsultor.Eof;
end;

function TConsultor.existe_CONSULTOR_ENDERECO_CONE: Boolean;
begin
    qConsultor.Close;
    qConsultor.SQL.Clear;
    qConsultor.SQL.Add('SELECT CONE_CODIGO               ');
    qConsultor.SQL.Add('  FROM CONSULTOR_ENDERECO_CONE      ');
    qConsultor.SQL.Add(' WHERE CONE_CODIGO = :CONE_CODIGO');
    qConsultor.ParamByName('CONE_CODIGO').AsString   := FCodigo;
    qConsultor.Open;
    result := not qConsultor.Eof;
end;

function TConsultor.existe_CONSULTOR_CONTATO_CONC: Boolean;
begin
    qConsultor.Close;
    qConsultor.SQL.Clear;
    qConsultor.SQL.Add('SELECT CONC_CODIGO               ');
    qConsultor.SQL.Add('  FROM CONSULTOR_CONTATO_CONC      ');
    qConsultor.SQL.Add(' WHERE CONC_CODIGO = :CONC_CODIGO');
    qConsultor.ParamByName('CONC_CODIGO').AsString   := FCodigo;
    qConsultor.Open;
    result := not qConsultor.Eof;
end;

function TConsultor.getDetalhes: tDetalhes_Consultor;
begin
   result := FDetalhes;
end;

function TConsultor.getFCodigo: String;
begin
   result := FCodigo;
end;

function TConsultor.getFExiste: Boolean;
begin
   Result := FExiste;
end;

function TConsultor.getFNomeFantasia: String;
begin
   result := FNomeFantasia;
end;

function TConsultor.getFObservacao: TStringList;
begin
   result := FObservacao;
end;

function TConsultor.getFStatus: TStatusCadastral;
begin
   Result := IntToStatusCadastral(FStatus);
end;

function TConsultor.getRazaoSocial: String;
begin
   result := FRazaoSocial;
end;

function TConsultor.Gravar: Boolean;
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

function TConsultor.GravarBancoComissao: Boolean;
begin
   if not Existe_CONSULTOR_BANCO_COMISSAO_CONBC then
      result := Inserir_CONSULTOR_BANCO_COMISSAO_CONBC
   else
      result := Alterar_CONSULTOR_BANCO_COMISSAO_CONBC;
end;

procedure TConsultor.Gravar_Observacoes;
var i : Integer;
begin
   qConsultor.Close;
   qConsultor.Sql.Clear;
   qConsultor.Sql.Add('DELETE FROM CONSULTOR_OBS_CONOBS ');
   qConsultor.Sql.Add(' WHERE CONOBS_CODIGO = :COD    ');
   qConsultor.ParamByName('COD').AsString := FCodigo;
   qConsultor.ExecSql;

   for i := 0 to FObservacao.count-1 do
   begin
      qConsultor.close;
      qConsultor.sql.Clear;
      qConsultor.sql.Add('INSERT INTO CONSULTOR_OBS_CONOBS   ');
      qConsultor.sql.Add('     ( CONOBS_CODIGO,            ');
	    qConsultor.sql.Add('       CONOBS_LINHA,             ');
      qConsultor.sql.Add('       CONOBS_TEXTO)             ');
      qConsultor.sql.Add('VALUES                           ');
      qConsultor.sql.Add('     (:CONOBS_CODIGO,            ');
	    qConsultor.sql.Add('      :CONOBS_LINHA,             ');
      qConsultor.sql.Add('      :CONOBS_TEXTO)             ');
      qConsultor.ParamByName('CONOBS_CODIGO').AsString := FCodigo;
	    qConsultor.ParamByName('CONOBS_LINHA' ).AsInteger:= i;
      qConsultor.ParamByName('CONOBS_TEXTO' ).AsString := FObservacao[i];
      qConsultor.ExecSql;
   end;
end;

function TConsultor.Insert: Boolean;
begin
    result := False;
    if not Inserir_CONSULTOR_CON                  then exit;
    if not Inserir_CONSULTOR_DETALHE_COND         then exit;
    if not Inserir_CONSULTOR_ENDERECO_CONE        then exit;
    if not Inserir_CONSULTOR_CONTATO_CONC         then exit;
    //if not Inserir_CONSULTOR_BANCO_COMISSAO_CONBC then exit;

    Gravar_Observacoes;
    Result := True;
    Log('Classe_Consultor','Cadastrou consultor ' + FCodigo + '-' + FNomeFantasia);
end;

function TConsultor.Inserir_CONSULTOR_BANCO_COMISSAO_CONBC: Boolean;
begin
    result := False;
    try
        qConsultor.Close;
        qConsultor.SQL.Clear;
        qConsultor.SQL.Add('INSERT INTO CONSULTOR_BANCO_COMISSAO_CONBC');
        qConsultor.SQL.Add('     (                      ');
        qConsultor.SQL.Add('       CONBC_CODIGO,        ');
        qConsultor.SQL.Add('       CONBC_BANCO,         ');
        qConsultor.SQL.Add('       CONBC_AGENCIA,       ');
        qConsultor.SQL.Add('       CONBC_AGENCIA_DIG,   ');
        qConsultor.SQL.Add('       CONBC_OPERACAO,      ');
        qConsultor.SQL.Add('       CONBC_CONTA,         ');
        qConsultor.SQL.Add('       CONBC_CONTA_DIG,     ');
        qConsultor.SQL.Add('       CONBC_STATUS,        ');
        qConsultor.SQL.Add('       CONBC_ESTACAO,       ');
        qConsultor.SQL.Add('       CONBC_USU,           ');
        qConsultor.SQL.Add('       CONBC_DT,            ');
        qConsultor.SQL.Add('       CONBC_HR             ');
        qConsultor.SQL.Add('     )                      ');
        qConsultor.SQL.Add('VALUES                      ');
        qConsultor.SQL.Add('     (                      ');
        qConsultor.SQL.Add('      :CONBC_CODIGO,        ');
        qConsultor.SQL.Add('      :CONBC_BANCO,         ');
        qConsultor.SQL.Add('      :CONBC_AGENCIA,       ');
        qConsultor.SQL.Add('      :CONBC_AGENCIA_DIG,   ');
        qConsultor.SQL.Add('      :CONBC_OPERACAO,      ');
        qConsultor.SQL.Add('      :CONBC_CONTA,         ');
        qConsultor.SQL.Add('      :CONBC_CONTA_DIG,     ');
        qConsultor.SQL.Add('      :CONBC_STATUS,        ');
        qConsultor.SQL.Add('      :CONBC_ESTACAO,       ');
        qConsultor.SQL.Add('      :CONBC_USU,           ');
        qConsultor.SQL.Add('      :CONBC_DT,            ');
        qConsultor.SQL.Add('      :CONBC_HR             ');
        qConsultor.SQL.Add('     )                      ');
        qConsultor.ParamByName('CONBC_CODIGO'     ).AsString  := FCodigo;
        qConsultor.ParamByName('CONBC_BANCO'      ).AsString  := FDetalhes.FBanco.FBanco;
        qConsultor.ParamByName('CONBC_AGENCIA'    ).AsString  := FDetalhes.FBanco.FAgencia;
        qConsultor.ParamByName('CONBC_AGENCIA_DIG').AsString  := FDetalhes.FBanco.FAgencia_Digito;
        qConsultor.ParamByName('CONBC_OPERACAO'   ).AsString  := FDetalhes.FBanco.FOperacao;
        qConsultor.ParamByName('CONBC_CONTA'      ).AsString  := FDetalhes.FBanco.FConta;
        qConsultor.ParamByName('CONBC_CONTA_DIG'  ).AsString  := FDetalhes.FBanco.FConta_Digito;
        qConsultor.ParamByName('CONBC_STATUS'     ).AsInteger := 1; // StatusCadastralAIToInt(FDetalhes.FBanco.FStatus);
        qConsultor.ParamByName('CONBC_ESTACAO'    ).AsString  := NomeComputador;
        qConsultor.ParamByName('CONBC_USU'        ).AsString  := Usuario.Codigo;
        qConsultor.ParamByName('CONBC_DT'         ).AsDateTime:= DataServidor;
        qConsultor.ParamByName('CONBC_HR'         ).AsString  := HoraServidor;
        qConsultor.ExecSql;
        result := true
    except
       Avisos.Avisar('Erro ao incluir consultor ' + FNomeFantasia);
       LOGErros('Classe_Consultor','Erro ao incluir Consultor ' + FNomeFantasia);
    end;
end;

function TConsultor.Inserir_CONSULTOR_CON: Boolean;
begin
    result := False;
    try
        qConsultor.Close;
        qConsultor.SQL.Clear;
        qConsultor.SQL.Add('INSERT INTO CONSULTOR_CON ');
        qConsultor.SQL.Add('     (                    ');
        qConsultor.SQL.Add('       CON_CODIGO,        ');
        qConsultor.SQL.Add('       CON_NOME_FANTASIA, ');
        qConsultor.SQL.Add('       CON_RAZAO_SOCIAL,  ');
        qConsultor.SQL.Add('       CON_STATUS         ');
        qConsultor.SQL.Add('     )                    ');
        qConsultor.SQL.Add('VALUES                    ');
        qConsultor.SQL.Add('     (                    ');
        qConsultor.SQL.Add('      :CON_CODIGO,        ');
        qConsultor.SQL.Add('      :CON_NOME_FANTASIA, ');
        qConsultor.SQL.Add('      :CON_RAZAO_SOCIAL,  ');
        qConsultor.SQL.Add('      :CON_STATUS         ');
        qConsultor.SQL.Add('     )                    ');
        Preencher_Parametros_CONSULTOR_CON(qConsultor);
        qConsultor.ParamByname('CON_STATUS').AsInteger := 0;
        qConsultor.ExecSql;
        result := true
    except
       Avisos.Avisar('Erro ao incluir consultor ' + FNomeFantasia);
       LOGErros('Classe_Consultor','Erro ao incluir Consultor ' + FNomeFantasia);
    end;
end;

function TConsultor.Inserir_CONSULTOR_CONTATO_CONC: Boolean;
begin
    result := False;
    try
        qConsultor.Close;
        qConsultor.SQL.Clear;
        qConsultor.SQL.Add('INSERT INTO CONSULTOR_CONTATO_CONC');
        qConsultor.SQL.Add('           (CONC_CODIGO,        ');
        qConsultor.SQL.Add('            CONC_NOME,          ');
        qConsultor.SQL.Add('            CONC_FONE1,         ');
        qConsultor.SQL.Add('            CONC_FONE2,         ');
        qConsultor.SQL.Add('            CONC_CEL1,          ');
        qConsultor.SQL.Add('            CONC_WHATSAPP,      ');
        qConsultor.SQL.Add('            CONC_EMAIL1,        ');
        qConsultor.SQL.Add('            CONC_EMAIL2)        ');
        qConsultor.SQL.Add('     VALUES                     ');
        qConsultor.SQL.Add('          (:CONC_CODIGO,        ');
        qConsultor.SQL.Add('           :CONC_NOME,          ');
        qConsultor.SQL.Add('           :CONC_FONE1,         ');
        qConsultor.SQL.Add('           :CONC_FONE2,         ');
        qConsultor.SQL.Add('           :CONC_CEL1,          ');
        qConsultor.SQL.Add('           :CONC_WHATSAPP,      ');
        qConsultor.SQL.Add('           :CONC_EMAIL1,        ');
        qConsultor.SQL.Add('           :CONC_EMAIL2)        ');
        Preencher_Parametros_CONSULTOR_CONTATO_CONC(qConsultor);
        qConsultor.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir consultor ' + FNomeFantasia);
       LOGErros('Classe_Consultor','Erro ao incluir Consultor ' + FNomeFantasia);
    end;
end;

procedure TConsultor.Preencher_Parametros_CONSULTOR_CONTATO_CONC(pQuery:TFDQuery);
begin
   qConsultor.ParamByName('CONC_CODIGO'  ).AsString := self.FCodigo;
   qConsultor.ParamByName('CONC_NOME'    ).AsString := self.FDetalhes.FContato.Nome;
   qConsultor.ParamByName('CONC_FONE1'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone1);
   qConsultor.ParamByName('CONC_FONE2'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone2);
   qConsultor.ParamByName('CONC_CEL1'    ).AsString := SoNumeros(self.FDetalhes.FContato.Cel);
   qConsultor.ParamByName('CONC_WHATSAPP').AsString := SoNumeros(self.FDetalhes.FContato.WhatsApp);
   qConsultor.ParamByName('CONC_EMAIL1'  ).AsString := self.FDetalhes.FContato.Email1;
   qConsultor.ParamByName('CONC_EMAIL2'  ).AsString := self.FDetalhes.FContato.Email2;
end;

function TConsultor.Inserir_CONSULTOR_DETALHE_COND: Boolean;
begin
    result := False;
    try
        qConsultor.Close;
        qConsultor.SQL.Clear;
        qConsultor.SQL.Add('INSERT INTO CONSULTOR_DETALHE_COND ');
        qConsultor.SQL.Add('     (                           ');
        qConsultor.SQL.Add('       COND_CODIGO,              ');
        qConsultor.SQL.Add('       COND_PESSOA_FJ,           ');
        qConsultor.SQL.Add('       COND_NUVEM_ATUALIZADO,    ');
        qConsultor.SQL.Add('       COND_CPF,                 ');
        qConsultor.SQL.Add('       COND_CNPJ,                ');
        qConsultor.SQL.Add('       COND_IE,                  ');
        qConsultor.SQL.Add('       COND_RG,                  ');
        qConsultor.SQL.Add('       COND_RG_EMISSOR,          ');
        qConsultor.SQL.Add('       COND_RG_DTEMISSAO,        ');
        qConsultor.SQL.Add('       COND_DTNASC,              ');
        qConsultor.SQL.Add('       COND_SEXO,                ');
        qConsultor.SQL.Add('       COND_ALT_USU,             ');
        qConsultor.SQL.Add('       COND_ALT_DT,              ');
        qConsultor.SQL.Add('       COND_ALT_HR,              ');
        qConsultor.SQL.Add('       COND_ALT_ESTACAO,         ');
        qConsultor.SQL.Add('       COND_ALT_DTBLOQUEADO,     ');
        qConsultor.SQL.Add('       COND_ALT_DTLIBERADO,      ');
        qConsultor.SQL.Add('       COND_ALT_DTINATIVO,       ');
        qConsultor.SQL.Add('       COND_CDRAMO,              ');
        qConsultor.SQL.Add('       COND_CDREGIAO,            ');
        qConsultor.SQL.Add('       COND_CDZONA,              ');
        qConsultor.SQL.Add('       COND_COMISSAO,            ');
        qConsultor.SQL.Add('       COND_DT                   ');
        qConsultor.SQL.Add('     )                           ');
        qConsultor.SQL.Add('VALUES                           ');
        qConsultor.SQL.Add('     (                           ');
        qConsultor.SQL.Add('      :COND_CODIGO,              ');
        qConsultor.SQL.Add('      :COND_PESSOA_FJ,           ');
        qConsultor.SQL.Add('      :COND_NUVEM_ATUALIZADO,    ');
        qConsultor.SQL.Add('      :COND_CPF,                 ');
        qConsultor.SQL.Add('      :COND_CNPJ,                ');
        qConsultor.SQL.Add('      :COND_IE,                  ');
        qConsultor.SQL.Add('      :COND_RG,                  ');
        qConsultor.SQL.Add('      :COND_RG_EMISSOR,          ');
        qConsultor.SQL.Add('      :COND_RG_DTEMISSAO,        ');
        qConsultor.SQL.Add('      :COND_DTNASC,              ');
        qConsultor.SQL.Add('      :COND_SEXO,                ');
        qConsultor.SQL.Add('      :COND_ALT_USU,             ');
        qConsultor.SQL.Add('      :COND_ALT_DT,              ');
        qConsultor.SQL.Add('      :COND_ALT_HR,              ');
        qConsultor.SQL.Add('      :COND_ALT_ESTACAO,         ');
        qConsultor.SQL.Add('      :COND_ALT_DTBLOQUEADO,     ');
        qConsultor.SQL.Add('      :COND_ALT_DTLIBERADO,      ');
        qConsultor.SQL.Add('      :COND_ALT_DTINATIVO,       ');
        qConsultor.SQL.Add('      :COND_CDRAMO,              ');
        qConsultor.SQL.Add('      :COND_CDREGIAO,            ');
        qConsultor.SQL.Add('      :COND_CDZONA,              ');
        qConsultor.SQL.Add('      :COND_COMISSAO,            ');
        qConsultor.SQL.Add('      :COND_DT                   ');
        qConsultor.SQL.Add('     )                           ');
        qConsultor.ParamByName('COND_CODIGO'             ).AsString   := FCodigo;
        qConsultor.ParamByName('COND_NUVEM_ATUALIZADO'   ).AsInteger  := 0;
        qConsultor.ParamByName('COND_PESSOA_FJ'          ).AsString   := FDetalhes.FTipoPessoa;
        qConsultor.ParamByName('COND_CPF'                ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qConsultor.ParamByName('COND_CNPJ'               ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qConsultor.ParamByName('COND_IE'                 ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qConsultor.ParamByName('COND_RG'                 ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qConsultor.ParamByName('COND_RG_EMISSOR'         ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qConsultor.ParamByName('COND_RG_DTEMISSAO'       ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qConsultor.ParamByName('COND_DTNASC'             ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qConsultor.ParamByName('COND_SEXO'               ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qConsultor.ParamByName('COND_ALT_USU'            ).AsString   := Usuario.Codigo;
        qConsultor.ParamByName('COND_ALT_DT'             ).AsDateTime := DataServidor;
        qConsultor.ParamByName('COND_ALT_HR'             ).AsString   := HoraServidor;
        qConsultor.ParamByName('COND_ALT_ESTACAO'        ).AsString   := NomeComputador;
        qConsultor.ParamByName('COND_ALT_DTBLOQUEADO'    ).AsDateTime := 0;
        qConsultor.ParamByName('COND_ALT_DTLIBERADO'     ).AsDateTime := 0;
        qConsultor.ParamByName('COND_ALT_DTINATIVO'      ).AsDateTime := 0;
        qConsultor.ParamByName('COND_CDRAMO'             ).AsString   := FDetalhes.FRamoAtividade;
        qConsultor.ParamByName('COND_CDREGIAO'           ).AsString   := FDetalhes.FRegiao;
        qConsultor.ParamByName('COND_CDZONA'             ).AsString   := FDetalhes.FZona;
        qConsultor.ParamByName('COND_COMISSAO'           ).AsFloat    := FDetalhes.FComissao;
        qConsultor.ParamByName('COND_DT'                 ).AsDateTime := DataServidor;
        qConsultor.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Consultor ' + FNomeFantasia);
       LOGErros('Classe_Consultor','Erro ao incluir Consultor ' + FNomeFantasia);
    end;
end;

function TConsultor.Inserir_CONSULTOR_ENDERECO_CONE: Boolean;
begin
    result := False;
    try
        qConsultor.Close;
        qConsultor.SQL.Clear;
        qConsultor.SQL.Add('INSERT INTO CONSULTOR_ENDERECO_CONE');
        qConsultor.SQL.Add('     (                           ');
        qConsultor.SQL.Add('       CONE_CODIGO,              ');
        qConsultor.SQL.Add('       CONE_RUA,                 ');
        qConsultor.SQL.Add('       CONE_NUMERO,              ');
        qConsultor.SQL.Add('       CONE_COMPLEMENTO,         ');
        qConsultor.SQL.Add('       CONE_CDCIDADE,            ');
        qConsultor.SQL.Add('       CONE_BAIRRO,              ');
        qConsultor.SQL.Add('       CONE_CEP                  ');
        qConsultor.SQL.Add('     )                           ');
        qConsultor.SQL.Add('VALUES                           ');
        qConsultor.SQL.Add('     (                           ');
        qConsultor.SQL.Add('      :CONE_CODIGO,              ');
        qConsultor.SQL.Add('      :CONE_RUA,                 ');
        qConsultor.SQL.Add('      :CONE_NUMERO,              ');
        qConsultor.SQL.Add('      :CONE_COMPLEMENTO,         ');
        qConsultor.SQL.Add('      :CONE_CDCIDADE,            ');
        qConsultor.SQL.Add('      :CONE_BAIRRO,              ');
        qConsultor.SQL.Add('      :CONE_CEP                  ');
        qConsultor.SQL.Add('     )                           ');
        qConsultor.ParamByName('CONE_CODIGO'     ).AsString   := FCodigo;
        qConsultor.ParamByName('CONE_RUA'        ).AsString   := FDetalhes.FEndereco.Rua;
        qConsultor.ParamByName('CONE_NUMERO'     ).AsString   := FDetalhes.FEndereco.Numero;
        qConsultor.ParamByName('CONE_COMPLEMENTO').AsString   := FDetalhes.FEndereco.Complemento;
        qConsultor.ParamByName('CONE_CDCIDADE'   ).AsString   := FDetalhes.FEndereco.Cidade;
        qConsultor.ParamByName('CONE_BAIRRO'     ).AsString   := FDetalhes.FEndereco.Bairro;
        qConsultor.ParamByName('CONE_CEP'        ).AsString   := FDetalhes.FEndereco.CEP;
        qConsultor.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Consultor ' + FNomeFantasia);
       LOGErros('Classe_Consultor','Erro ao incluir Consultor ' + FNomeFantasia);
    end;
end;


procedure TConsultor.LimparCampos;
begin
    FNomeFantasia      := '';
    FRazaoSocial       := '';
	  FStatus            := -1;
end;

procedure TConsultor.Pegar_Alteracoes;
begin
    with FAlteracao do
    begin
       Usuario       := qConsultor.FieldByName('COND_ALT_USU'        ).AsString;
       Data          := qConsultor.FieldByName('COND_ALT_DT'         ).AsString;
       Hora          := qConsultor.FieldByName('COND_ALT_HR'         ).AsString;
       Estacao       := qConsultor.FieldByName('COND_ALT_ESTACAO'    ).AsString;
       DataBloqueio  := qConsultor.FieldByName('COND_ALT_DTBLOQUEADO').AsString;
       DataLiberacao := qConsultor.FieldByName('COND_ALT_DTLIBERADO' ).AsString;
       DataInativo   := qConsultor.FieldByName('COND_ALT_DTINATIVO'  ).AsString;
    end;
end;

procedure TConsultor.Pegar_Comissoes;
begin
    qConsultor.Close;
    qConsultor.SQL.Clear;
    qConsultor.SQL.Add('SELECT *                             ');
    qConsultor.SQL.Add('  FROM CONSULTOR_BANCO_COMISSAO_CONBC');
    qConsultor.SQL.Add(' WHERE CONBC_CODIGO = :CONBC_CODIGO  ');
    qConsultor.ParamByName('CONBC_CODIGO').AsString := FCodigo;
    qConsultor.Open;
    if qConsultor.eof then
       exit;

    FDetalhes.FBanco.FBanco          := qConsultor.FieldByName('CONBC_BANCO'      ).AsString;
    FDetalhes.FBanco.FAgencia        := qConsultor.FieldByName('CONBC_AGENCIA'    ).AsString;
    FDetalhes.FBanco.FAgencia_Digito := qConsultor.FieldByName('CONBC_AGENCIA_DIG').AsString;
    FDetalhes.FBanco.FOperacao       := qConsultor.FieldByName('CONBC_OPERACAO'   ).AsString;
    FDetalhes.FBanco.FConta          := qConsultor.FieldByName('CONBC_CONTA'      ).AsString;
    FDetalhes.FBanco.FConta_Digito   := qConsultor.FieldByName('CONBC_CONTA_DIG'  ).AsString;
end;

procedure TConsultor.Pegar_Contato;
begin
    qConsultor.Close;
    qConsultor.SQL.Clear;
    qConsultor.SQL.Add('SELECT * FROM CONSULTOR_CONTATO_CONC');
    qConsultor.SQL.Add(' WHERE CONC_CODIGO = :CONC_CODIGO ');
    qConsultor.ParamByName('CONC_CODIGO').AsString := FCodigo;
    qConsultor.Open;
    if qConsultor.eof then
    begin
       Inserir_CONSULTOR_CONTATO_CONC;
       exit;
    end;
   Detalhes.FContato.Nome     := qConsultor.FieldByName('CONC_NOME'    ).AsString;
   Detalhes.FContato.Fone1    := qConsultor.FieldByName('CONC_FONE1'   ).AsString;
   Detalhes.FContato.Fone2    := qConsultor.FieldByName('CONC_FONE2'   ).AsString;
   Detalhes.FContato.Cel      := qConsultor.FieldByName('CONC_CEL1'    ).AsString;
   Detalhes.FContato.WhatsApp := qConsultor.FieldByName('CONC_WHATSAPP').AsString;
   Detalhes.FContato.Email1   := qConsultor.FieldByName('CONC_EMAIL1'  ).AsString;
   Detalhes.FContato.Email2   := qConsultor.FieldByName('CONC_EMAIL2'  ).AsString;
end;

procedure TConsultor.Pegar_Dados_Basicos;
begin
    qConsultor.Close;
    qConsultor.SQL.Clear;
    qConsultor.SQL.Add('SELECT * FROM CONSULTOR_CON      ');
    qConsultor.SQL.Add(' WHERE CON_CODIGO = :CON_CODIGO');
    qConsultor.ParamByName('CON_CODIGO').AsString := FCodigo;
    qConsultor.Open;
    if qConsultor.eof then
    begin
       FExiste:=False;
       exit;
    end;
    FExiste                      := True;
    FCodigo                      := qConsultor.FieldByName('CON_CODIGO'                 ).AsString;
    FNomeFantasia                := qConsultor.FieldByName('CON_NOME_FANTASIA'          ).AsString;
    FRazaoSocial                 := qConsultor.FieldByName('CON_RAZAO_SOCIAL'           ).AsString;
    FStatus                      := qConsultor.FieldByName('CON_STATUS'                 ).AsInteger;
end;

procedure TConsultor.Pegar_Detalhes;
begin
    qConsultor.Close;
    qConsultor.SQL.Clear;
    qConsultor.SQL.Add('SELECT * FROM CONSULTOR_DETALHE_COND');
    qConsultor.SQL.Add(' WHERE COND_CODIGO = :COND_CODIGO ');
    qConsultor.ParamByName('COND_CODIGO').AsString := FCodigo;
    qConsultor.Open;
    if qConsultor.eof then
    begin
       exit;
    end;

    Detalhes.FTipoPessoa         := qConsultor.FieldByName('COND_PESSOA_FJ'          ).AsString;
    with Detalhes.FPessoaFisica do
    begin
       FCPF                      := qConsultor.FieldByName('COND_CPF'                ).AsString;
       FRG                       := qConsultor.FieldByName('COND_RG'                 ).AsString;
       FRG_OrgaoEmissor          := qConsultor.FieldByName('COND_RG_EMISSOR'         ).AsString;
       FRG_DataEmissao           := qConsultor.FieldByName('COND_RG_DTEMISSAO'       ).AsDateTime;
       FRG_DataEmissaoString     := BarrasSeDataNula(qConsultor.FieldByName('COND_RG_DTEMISSAO').AsString);
       FDataNascimento           := qConsultor.FieldByName('COND_DTNASC'             ).AsDateTime;
       FSexo                     := qConsultor.FieldByName('COND_SEXO'               ).AsString;
       FDataNascimentoString     := BarrasSeDataNula(qConsultor.FieldByName('COND_DTNASC' ).AsString);
    end;
    with Detalhes.FPessoaJuridica do
    begin
       FCNPJ                     := qConsultor.FieldByName('COND_CNPJ'               ).AsString;
       FIE                       := qConsultor.FieldByName('COND_IE'                 ).AsString;
    end;
    FDetalhes.RamoAtividade      := qConsultor.FieldByName('COND_CDRAMO'             ).AsString;
    FDetalhes.Regiao             := qConsultor.FieldByName('COND_CDREGIAO'           ).AsString;
    FDetalhes.Zona               := qConsultor.FieldByName('COND_CDZONA'             ).AsString;
    FDetalhes.Comissao           := qConsultor.FieldByName('COND_COMISSAO'           ).AsFloat;
    FDetalhes.FDataCadastro      := qConsultor.FieldByName('COND_DT'                 ).AsDateTime;
    Pegar_Alteracoes;
    Pegar_Comissoes;
end;

procedure TConsultor.Pegar_Endereco;
begin
    qConsultor.Close;
    qConsultor.SQL.Clear;
    qConsultor.SQL.Add('SELECT * FROM CONSULTOR_ENDERECO_CONE');
    qConsultor.SQL.Add(' WHERE CONE_CODIGO = :CONE_CODIGO  ');
    qConsultor.ParamByName('CONE_CODIGO').AsString := FCodigo;
    qConsultor.Open;
    if qConsultor.eof then
    begin
       exit;
    end;
    FDetalhes.Endereco.Rua         := qConsultor.FieldByName('CONE_RUA'        ).AsString;
    FDetalhes.Endereco.Numero      := qConsultor.FieldByName('CONE_NUMERO'     ).AsString;
    FDetalhes.Endereco.Complemento := qConsultor.FieldByName('CONE_COMPLEMENTO').AsString;
    FDetalhes.Endereco.Bairro      := qConsultor.FieldByName('CONE_BAIRRO'     ).AsString;
    FDetalhes.Endereco.Cidade      := qConsultor.FieldByName('CONE_CDCIDADE'   ).AsString;
    FDetalhes.Endereco.CEP         := qConsultor.FieldByName('CONE_CEP'        ).AsString;
end;

procedure TConsultor.Pegar_Observacoes;
begin
   FObservacao.Clear;
   qConsultor.Close;
   qConsultor.Sql.Clear;
   qConsultor.Sql.Add('SELECT CONOBS_TEXTO          ');
   qConsultor.Sql.Add('  FROM CONSULTOR_OBS_CONOBS  ');
   qConsultor.Sql.Add(' WHERE CONOBS_CODIGO = :COD  ');
   qConsultor.Sql.Add(' ORDER BY CONOBS_LINHA       ');
   qConsultor.ParamByName('COD').AsString := FCodigo;
   qConsultor.Open;
   while not qConsultor.eof do
   begin
     FObservacao.add(qConsultor.fieldbyname('CONOBS_TEXTO').AsString);
     qConsultor.Next;
   end;
end;

procedure TConsultor.Preencher_Parametros_CONSULTOR_CON(pQuery: TFDQuery);
begin
   pQuery.ParamByName('CON_CODIGO'       ).AsString   := FCodigo;
   pQuery.ParamByName('CON_NOME_FANTASIA').AsString   := FNomeFantasia;
   pQuery.ParamByName('CON_RAZAO_SOCIAL' ).AsString   := FRazaoSocial;
   pQuery.ParamByName('CON_STATUS'       ).AsInteger  := FStatus;
end;

function TConsultor.proximoCodigo: String;
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
    qProximo.SQL.Add('SELECT MAX(CON_CODIGO) AS MAIOR');
    qProximo.SQL.Add('  FROM CONSULTOR_CON             ');
    qProximo.Open;
    if qProximo.eof then
    begin
      qProximo.Free;
      result := sCodigoCandidato;
      exit;
    end;
    try
      vCodigoCandidato := StrToInt(qProximo.FieldByName('MAIOR').AsString);
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
       qProximo.SQL.Add('SELECT CON_CODIGO              ');
       qProximo.SQL.Add('  FROM CONSULTOR_CON             ');
       qProximo.SQL.Add(' WHERE CON_CODIGO = :CON_CODIGO');
       qProximo.ParamByName('CON_CODIGO').AsString := sCodigoCandidato;
       qProximo.Open;
       while not qProximo.Eof do
       begin
          qProximo.Close;
          inc(vCodigoCandidato);
          sCodigoCandidato := FormatFloat('#',vCodigoCandidato);
          qProximo.ParamByName('CON_CODIGO').AsString := sCodigoCandidato;
          qProximo.Open;
       end;
       qProximo.Free;
       result := sCodigoCandidato;
       exit;
    end;
end;

procedure TConsultor.RegistrarHistorico(pEvento,pLog: String);
begin
   //Histórico de bloqueios e desbloqueios do consultor
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('INSERT INTO CONSULTOR_HISTORICO_BLOQUEIOS_CHB ');
   qLocal.Sql.Add('     ( CHB_CONSULTOR,                         ');
   qLocal.Sql.Add('       CHB_EVENTO,                          ');
   qLocal.Sql.Add('       CHB_DTEVENTO,                        ');
   qLocal.Sql.Add('       CHB_HREVENTO,                        ');
   qLocal.Sql.Add('       CHB_USUEVENTO,                       ');
   qLocal.Sql.Add('       CHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                      ');
   qLocal.Sql.Add('VALUES                                      ');
   qLocal.Sql.Add('     (:CHB_CONSULTOR,                         ');
   qLocal.Sql.Add('      :CHB_EVENTO,                          ');
   qLocal.Sql.Add('      :CHB_DTEVENTO,                        ');
   qLocal.Sql.Add('      :CHB_HREVENTO,                        ');
   qLocal.Sql.Add('      :CHB_USUEVENTO,                       ');
   qLocal.Sql.Add('      :CHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                                                                                           ');
   qLocal.ParamByName('CHB_CONSULTOR'  ).AsString   := FCodigo;
   qLocal.ParamByName('CHB_EVENTO'   ).AsString   := pEvento;
   qLocal.ParamByName('CHB_DTEVENTO' ).AsDateTime := DataServidor;
   qLocal.ParamByName('CHB_HREVENTO' ).AsString   := HoraServidor;
   qLocal.ParamByName('CHB_USUEVENTO').AsString   := Usuario.Codigo;
   qLocal.ParamByName('CHB_MAQEVENTO').AsString   := NomeComputador;
   qLocal.ExecSql;

   Log('Classe_Consultor',pLog+' consultor '+FCodigo+' - '+FNomeFantasia);
end;

procedure TConsultor.RegistrarHistoricoDeAtivacao;
begin
   RegistrarHistorico('Ativado','Ativou');
end;

procedure TConsultor.RegistrarHistoricoDeBloqueio;
begin
   RegistrarHistorico('Bloqueado','Bloqueou');
end;

procedure TConsultor.RegistrarHistoricoDeDesBloqueio;
begin
   RegistrarHistorico('Desbloqueado','Desbloqueou');
end;

procedure TConsultor.RegistrarHistoricoDeInativacao;
begin
   RegistrarHistorico('Inativado','Inativou');
end;

procedure TConsultor.setDetalhes(const Value: tDetalhes_Consultor);
begin
   FDetalhes := Value;
end;

procedure TConsultor.setFCodigo(const Value: String);
begin
   if Value = '' then
      FCodigo := Copy(proximoCodigo,1,10)
   else
      FCodigo := Copy(Value,1,10);
end;

procedure TConsultor.setFNomeFantasia(const Value: String);
begin
   FNomeFantasia := UpperCase(Copy(Value,1,50));
end;

procedure TConsultor.setFObservacao(const Value: TStringList);
begin
   FObservacao := Value;
end;

procedure TConsultor.setFStatus(const Value: TStatusCadastral);
begin
   if FExiste then
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
   end;

   FStatus := StatusCadastralToInt(Value);
end;

procedure TConsultor.setRazaoSocial(const Value: String);
begin
   FRazaoSocial := UpperCase(Copy(value,1,50));
end;

function TConsultor.Update: Boolean;
begin
    result := false;
    if not Update_CONSULTOR_CON                   then exit;
    if not Update_CONSULTOR_DETALHE_COND          then exit;
    if not Update_CONSULTOR_ENDERECO_CONE         then exit;
    if not Update_CONSULTOR_CONTATO_CONC          then exit;
    //if not Inserir_CONSULTOR_BANCO_COMISSAO_CONBC then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Consultor','Alterou consultor '+ FCodigo + ' - ' + FNomeFantasia);
end;

function TConsultor.Update_CONSULTOR_CON:Boolean;
begin
    try
        qConsultor.Close;
        qConsultor.SQL.Clear;
        qConsultor.SQL.Add('UPDATE CONSULTOR_CON                                             ');
        qConsultor.SQL.Add('   SET CON_NOME_FANTASIA           = :CON_NOME_FANTASIA,       ');
        qConsultor.SQL.Add('       CON_RAZAO_SOCIAL            = :CON_RAZAO_SOCIAL,        ');
        qConsultor.SQL.Add('       CON_STATUS                  = :CON_STATUS               ');
        qConsultor.SQL.Add(' WHERE CON_CODIGO                  = :CON_CODIGO               ');
        Preencher_Parametros_CONSULTOR_CON(qConsultor);
        qConsultor.ExecSql;
        Log('Classe_Consultor','Alterou Consultor '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Consultor '+ FNomeFantasia);
       LogErros('Classe_Consultor','Erro ao alterar Consultor '+ FNomeFantasia);
    end;
end;

function TConsultor.Update_CONSULTOR_CONTATO_CONC: Boolean;
begin
    if existe_CONSULTOR_CONTATO_CONC then
       result := alterar_CONSULTOR_CONTATO_CONC
    else
       result := inserir_CONSULTOR_CONTATO_CONC;
end;

function TConsultor.Alterar_CONSULTOR_BANCO_COMISSAO_CONBC: Boolean;
begin
    qConsultor.Close;
    qConsultor.SQL.Clear;
    qConsultor.SQL.Add('UPDATE CONSULTOR_BANCO_COMISSAO_CONBC        ');
    qConsultor.SQL.Add('   SET CONBC_STATUS      = :CONBC_STATUS,    ');
    qConsultor.SQL.Add('       CONBC_ESTACAO     = :CONBC_ESTACAO,   ');
    qConsultor.SQL.Add('       CONBC_USU         = :CONBC_USU,       ');
    qConsultor.SQL.Add('       CONBC_DT          = :CONBC_DT,        ');
    qConsultor.SQL.Add('       CONBC_HR          = :CONBC_HR         ');
    qConsultor.SQL.Add(' WHERE CONBC_CODIGO      = :CONBC_CODIGO     ');
    qConsultor.SQL.Add('   AND CONBC_BANCO       = :CONBC_BANCO      ');
    qConsultor.SQL.Add('   AND CONBC_AGENCIA     = :CONBC_AGENCIA    ');
    qConsultor.SQL.Add('   AND CONBC_AGENCIA_DIG = :CONBC_AGENCIA_DIG');
    qConsultor.SQL.Add('   AND CONBC_OPERACAO    = :CONBC_OPERACAO   ');
    qConsultor.SQL.Add('   AND CONBC_CONTA       = :CONBC_CONTA      ');
    qConsultor.SQL.Add('   AND CONBC_CONTA_DIG   = :CONBC_CONTA_DIG  ');
    qConsultor.ParamByName('CONBC_CODIGO'     ).AsString  := FCodigo;
    qConsultor.ParamByName('CONBC_BANCO'      ).AsString  := FDetalhes.FBanco.FBanco;
    qConsultor.ParamByName('CONBC_AGENCIA'    ).AsString  := FDetalhes.FBanco.FAgencia;
    qConsultor.ParamByName('CONBC_AGENCIA_DIG').AsString  := FDetalhes.FBanco.FAgencia_Digito;
    qConsultor.ParamByName('CONBC_OPERACAO'   ).AsString  := FDetalhes.FBanco.FOperacao;
    qConsultor.ParamByName('CONBC_CONTA'      ).AsString  := FDetalhes.FBanco.FConta;
    qConsultor.ParamByName('CONBC_CONTA_DIG'  ).AsString  := FDetalhes.FBanco.FConta_Digito;
    qConsultor.ParamByName('CONBC_STATUS'     ).AsInteger := StatusCadastralAIToInt(FDetalhes.FBanco.FStatus);
    qConsultor.ParamByName('CONBC_ESTACAO'    ).AsString  := NomeComputador;
    qConsultor.ParamByName('CONBC_USU'        ).AsString  := Usuario.Codigo;
    qConsultor.ParamByName('CONBC_DT'         ).AsDateTime:= DataServidor;
    qConsultor.ParamByName('CONBC_HR'         ).AsString  := HoraServidor;
    qConsultor.ExecSql;
end;

function TConsultor.alterar_CONSULTOR_CONTATO_CONC: Boolean;
begin
    result := False;
    try
        qConsultor.Close;
        qConsultor.SQL.Clear;
        qConsultor.SQL.Add('UPDATE CONSULTOR_CONTATO_CONC            ');
        qConsultor.SQL.Add('   SET CONC_NOME     = :CONC_NOME,     ');
        qConsultor.SQL.Add('       CONC_FONE1    = :CONC_FONE1,    ');
        qConsultor.SQL.Add('       CONC_FONE2    = :CONC_FONE2,    ');
        qConsultor.SQL.Add('       CONC_CEL1     = :CONC_CEL1,     ');
        qConsultor.SQL.Add('       CONC_WHATSAPP = :CONC_WHATSAPP, ');
        qConsultor.SQL.Add('       CONC_EMAIL1   = :CONC_EMAIL1,   ');
        qConsultor.SQL.Add('       CONC_EMAIL2   = :CONC_EMAIL2    ');
        qConsultor.SQL.Add(' WHERE CONC_CODIGO   = :CONC_CODIGO    ');
        Preencher_Parametros_CONSULTOR_CONTATO_CONC(qConsultor);
        qConsultor.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao alterar Contatos do Consultor ' + FNomeFantasia);
       LOGErros('Classe_Consultor','Erro ao Alterar Contatos do Consultor ' + FNomeFantasia);
    end;
end;

function TConsultor.Update_CONSULTOR_DETALHE_COND:Boolean;
begin
    if existe_CONSULTOR_DETALHE_COND then
       result := alterar_CONSULTOR_DETALHE_COND
    else
       result := inserir_CONSULTOR_DETALHE_COND;
end;

function TConsultor.alterar_CONSULTOR_DETALHE_COND:Boolean;
begin
    result := false;
    try
        qConsultor.Close;
        qConsultor.SQL.Clear;
        qConsultor.SQL.Add('UPDATE CONSULTOR_DETALHE_COND                                  ');
        qConsultor.SQL.Add('   SET COND_PESSOA_FJ           = :COND_PESSOA_FJ,           ');
        qConsultor.SQL.Add('       COND_NUVEM_ATUALIZADO    = :COND_NUVEM_ATUALIZADO,    ');
        qConsultor.SQL.Add('       COND_CPF                 = :COND_CPF,                 ');
        qConsultor.SQL.Add('       COND_CNPJ                = :COND_CNPJ,                ');
        qConsultor.SQL.Add('       COND_IE                  = :COND_IE,                  ');
        qConsultor.SQL.Add('       COND_RG                  = :COND_RG,                  ');
        qConsultor.SQL.Add('       COND_RG_EMISSOR          = :COND_RG_EMISSOR,          ');
        qConsultor.SQL.Add('       COND_RG_DTEMISSAO        = :COND_RG_DTEMISSAO,        ');
        qConsultor.SQL.Add('       COND_DTNASC              = :COND_DTNASC,              ');
        qConsultor.SQL.Add('       COND_SEXO                = :COND_SEXO,                ');
        qConsultor.SQL.Add('       COND_ALT_USU             = :COND_ALT_USU,             ');
        qConsultor.SQL.Add('       COND_ALT_DT              = :COND_ALT_DT,              ');
        qConsultor.SQL.Add('       COND_ALT_HR              = :COND_ALT_HR,              ');
        qConsultor.SQL.Add('       COND_ALT_ESTACAO         = :COND_ALT_ESTACAO,         ');
        qConsultor.SQL.Add('       COND_ALT_DTBLOQUEADO     = :COND_ALT_DTBLOQUEADO,     ');
        qConsultor.SQL.Add('       COND_ALT_DTLIBERADO      = :COND_ALT_DTLIBERADO,      ');
        qConsultor.SQL.Add('       COND_ALT_DTINATIVO       = :COND_ALT_DTINATIVO,       ');
        qConsultor.SQL.Add('       COND_CDRAMO              = :COND_CDRAMO,              ');
        qConsultor.SQL.Add('       COND_CDREGIAO            = :COND_CDREGIAO,            ');
        qConsultor.SQL.Add('       COND_CDZONA              = :COND_CDZONA,              ');
        qConsultor.SQL.Add('       COND_COMISSAO            = :COND_COMISSAO             ');
        qConsultor.SQL.Add(' WHERE COND_CODIGO              = :COND_CODIGO              ');
        qConsultor.ParamByName('COND_CODIGO'          ).AsString   := FCodigo;
        qConsultor.ParamByName('COND_NUVEM_ATUALIZADO').AsInteger  := 0;
        qConsultor.ParamByName('COND_PESSOA_FJ'       ).AsString   := FDetalhes.FTipoPessoa;
        qConsultor.ParamByName('COND_CPF'             ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qConsultor.ParamByName('COND_CNPJ'            ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qConsultor.ParamByName('COND_IE'              ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qConsultor.ParamByName('COND_RG'              ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qConsultor.ParamByName('COND_RG_EMISSOR'      ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qConsultor.ParamByName('COND_RG_DTEMISSAO'    ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qConsultor.ParamByName('COND_DTNASC'          ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qConsultor.ParamByName('COND_SEXO'            ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qConsultor.ParamByName('COND_ALT_USU'         ).AsString   := Usuario.Codigo;
        qConsultor.ParamByName('COND_ALT_DT'          ).AsDateTime := DataServidor;
        qConsultor.ParamByName('COND_ALT_HR'          ).AsString   := HoraServidor;
        qConsultor.ParamByName('COND_ALT_ESTACAO'     ).AsString   := NomeComputador;
        qConsultor.ParamByName('COND_ALT_DTBLOQUEADO' ).AsDateTime := ZeroSeDataNula(FAlteracao.DataBloqueio);
        qConsultor.ParamByName('COND_ALT_DTLIBERADO'  ).AsDateTime := ZeroSeDataNula(FAlteracao.DataLiberacao);
        qConsultor.ParamByName('COND_ALT_DTINATIVO'   ).AsDateTime := ZeroSeDataNula(FAlteracao.DataInativo);
        qConsultor.ParamByName('COND_CDRAMO'          ).AsString   := FDetalhes.FRamoAtividade;
        qConsultor.ParamByName('COND_CDREGIAO'        ).AsString   := FDetalhes.FRegiao;
        qConsultor.ParamByName('COND_CDZONA'          ).AsString   := FDetalhes.FZona;
        qConsultor.ParamByName('COND_COMISSAO'        ).AsFloat    := FDetalhes.FComissao;
        qConsultor.ExecSql;

        Log('Classe_Consultor','Alterou Consultor '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Detalhes do Consultor '+ FNomeFantasia);
       LogErros('Classe_Consultor','Erro ao alterar Detalhes do Consultor '+ FNomeFantasia);
    end;
end;

function TConsultor.Update_CONSULTOR_ENDERECO_CONE:Boolean;
begin
    if existe_CONSULTOR_ENDERECO_CONE then
       result := alterar_CONSULTOR_ENDERECO_CONE
    else
       result := inserir_CONSULTOR_ENDERECO_CONE;
end;

function TConsultor.alterar_CONSULTOR_ENDERECO_CONE:Boolean;
begin
   try
        qConsultor.Close;
        qConsultor.SQL.Clear;
        qConsultor.SQL.Add('UPDATE CONSULTOR_ENDERECO_CONE                                 ');
        qConsultor.SQL.Add('   SET CONE_RUA                 = :CONE_RUA,                 ');
        qConsultor.SQL.Add('       CONE_NUMERO              = :CONE_NUMERO,              ');
        qConsultor.SQL.Add('       CONE_COMPLEMENTO         = :CONE_COMPLEMENTO,         ');
        qConsultor.SQL.Add('       CONE_BAIRRO              = :CONE_BAIRRO,              ');
        qConsultor.SQL.Add('       CONE_CDCIDADE            = :CONE_CDCIDADE,            ');
        qConsultor.SQL.Add('       CONE_CEP                 = :CONE_CEP                  ');
        qConsultor.SQL.Add(' WHERE CONE_CODIGO              = :CONE_CODIGO               ');
        qConsultor.ParamByName('CONE_CODIGO'          ).AsString   := FCodigo;
        qConsultor.ParamByName('CONE_RUA'             ).AsString   := FDetalhes.FEndereco.Rua;
        qConsultor.ParamByName('CONE_NUMERO'          ).AsString   := FDetalhes.FEndereco.Numero;
        qConsultor.ParamByName('CONE_COMPLEMENTO'     ).AsString   := FDetalhes.FEndereco.Complemento;
        qConsultor.ParamByName('CONE_BAIRRO'          ).AsString   := FDetalhes.FEndereco.Bairro;
        qConsultor.ParamByName('CONE_CDCIDADE'        ).AsString   := FDetalhes.FEndereco.Cidade;
        qConsultor.ParamByName('CONE_CEP'             ).AsString   := FDetalhes.FEndereco.CEP;
        qConsultor.ExecSql;

        Log('Classe_Consultor','Alterou Consultor '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Endereço do Consultor '+ FNomeFantasia);
       LogErros('Classe_Consultor','Erro ao alterar Endereço do Consultor '+ FNomeFantasia);
    end;
end;

{ tDetalhes_Consultor }

constructor tDetalhes_Consultor.Create;
begin
  qConsultor := TFDQuery.Create(nil);
  qConsultor.ConnectionName :='X';
  FPessoaFisica  := tPessoa_Fisica.Create;
  FPessoaJuridica:= tPessoa_Juridica.Create;
  FEndereco      := TEndereco.Create;
  FContato       := TContato.Create;
  FBanco         := TBanco.Create;
end;

destructor tDetalhes_Consultor.Destroy;
begin
  qConsultor.Free;
  FPessoaFisica.Free;
  FPessoaJuridica.Free;
  FEndereco.Free;
  FContato.Free;
  FBanco.Free;
  inherited;
end;

function tDetalhes_Consultor.getDataCadastroString: String;
begin
   result := DateToStr(FDataCadastro);
end;

{function tDetalhes_Consultor.getFCodigoMunicipio: String;
begin
   result := FCodigoMunicipio;
end;
}
function tBanco.getFAgencia: String;
begin
   Result := self.FAgencia;
end;

function tBanco.getFAgencia_Digito: String;
begin
   Result := self.FAgencia_Digito;
end;

function tBanco.getFBanco: String;
begin
   Result := self.FBanco;
end;

function tDetalhes_Consultor.getFComissao: Real;
begin
   Result := self.FComissao;
end;

function tBanco.getFConta: String;
begin
   Result := self.FConta;
end;

function tBanco.getFConta_Digito: String;
begin
   Result := self.FConta_Digito;
end;

function tDetalhes_Consultor.getFDataCadastro: TDateTime;
begin
   result := FDataCadastro;
end;

function tBanco.getFOperacao: String;
begin
   Result := self.FOperacao;
end;

function tBanco.getFStatus: TStatusCadastralAI;
begin
   result := self.FStatus;
end;

function tDetalhes_Consultor.getFRamoAtividade: String;
begin
   result := FRamoAtividade;
end;

function tDetalhes_Consultor.getFRegiao: String;
begin
   Result := FRegiao;
end;

function tDetalhes_Consultor.getFTipoPessoa: TTipoPessoa;
begin
   Result := StringToTipoPessoa(FTipoPessoa);
end;

function tDetalhes_Consultor.getFZona: String;
begin
   Result := FZona;
end;

procedure tBanco.SetFAgencia(const Value: String);
begin
   self.FAgencia := Copy(Value,1,10);
end;

procedure tBanco.SetFAgencia_Digito(const Value: String);
begin
   self.FAgencia_Digito := Copy(Value,1,1);
end;

procedure tBanco.SetFBanco(const Value: String);
begin
   self.FBanco := Copy(Value,1,30);
end;

procedure tDetalhes_Consultor.SetFComissao(const Value: Real);
begin
   self.FComissao := Value;
end;

procedure tBanco.SetFConta(const Value: String);
begin
   self.FConta := Copy(Value,1,10);
end;

procedure tBanco.SetFConta_Digito(const Value: String);
begin
   self.FConta_Digito := Copy(Value,1,1);
end;

{
procedure tDetalhes_Consultor.setFCodigoMunicipio(const Value: String);
begin
   FCodigoMunicipio := Value;
end;
}
procedure tDetalhes_Consultor.setFDataCadastro(const Value: TDateTime);
begin
   FDataCadastro := Value;
end;

procedure tBanco.SetFOperacao(const Value: String);
begin
   self.FOperacao := Copy(Value,1,3);
end;

procedure tBanco.SetFStatus(const Value: TStatusCadastralAI);
begin
   self.FStatus := Value;
end;

procedure tDetalhes_Consultor.setFRamoAtividade(const Value: String);
begin
   FRamoAtividade := Copy(Value,1,10);
end;

procedure tDetalhes_Consultor.setFRegiao(const Value: String);
begin
   FRegiao := Copy(Value,1,10);
end;

procedure tDetalhes_Consultor.setFTipoPessoa(const Value: TTipoPessoa);
begin
   FTipoPessoa := TipoPessoaToString(Value);
end;

procedure tDetalhes_Consultor.setFZona(const Value: String);
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

