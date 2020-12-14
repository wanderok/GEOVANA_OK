unit Classe_Contador;

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

  tDetalhes_Contador = class
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
end;

  TContadorAlteracao = class(TAlteracao);

  TContador = class
  private
    FExiste            : Boolean;
    FCodigo            : String;
    FNomeFantasia      : String;
    FRazaoSocial       : String;
	  FStatus            : Integer;
    FDetalhes          : tDetalhes_Contador;
    FAlteracao         : TContadorAlteracao;
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
    function  getDetalhes: tDetalhes_Contador;
    procedure setDetalhes(const Value: tDetalhes_Contador);
    function  Insert:Boolean;
    function  Update:Boolean;
    function  DadosCorretos:Boolean;
    procedure Preencher_Parametros_CONTADOR_CONT(pQuery:TFDQuery);
    procedure Preencher_Parametros_CONTADOR_CONTATO_CONTC(pQuery:TFDQuery);
    procedure Pegar_Dados_Basicos;
    procedure Pegar_Detalhes;
    procedure Pegar_Endereco;
    procedure Pegar_Contato;
    procedure Pegar_Alteracoes;

    procedure Pegar_Observacoes;
    procedure Gravar_Observacoes;
    //
    function Inserir_CONTADOR_CONT           :Boolean;
    function Inserir_CONTADOR_DETALHE_CONTD :Boolean;
    function Inserir_CONTADOR_ENDERECO_CONTE :Boolean;
    function Inserir_CONTADOR_CONTATO_CONTC :Boolean;
    //
    function Update_CONTADOR_CONT:Boolean;

    function Update_CONTADOR_DETALHE_CONTD:Boolean;
    function existe_CONTADOR_DETALHE_CONTD:Boolean;
    function alterar_CONTADOR_DETALHE_CONTD:Boolean;

    function Update_CONTADOR_ENDERECO_CONTE:Boolean;
    function existe_CONTADOR_ENDERECO_CONTE: Boolean;
    function alterar_CONTADOR_ENDERECO_CONTE:BooleAn;

    function Update_CONTADOR_CONTATO_CONTC :Boolean;
    function existe_CONTADOR_CONTATO_CONTC : Boolean;
    function alterar_CONTADOR_CONTATO_CONTC: Boolean;

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
    Property Detalhes      : tDetalhes_Contador read getDetalhes      write setDetalhes;
    property Alteracao     : TContadorAlteracao read FAlteracao       write FAlteracao;
    property Observacao    : TStringList       read getFObservacao   write setFObservacao;
    procedure Abrir;
    Function Gravar:Boolean;
end;

implementation

uses Funcoes,
     Classe_Nuvem;

var qContador, qLocal: TFDQuery;

{ TContador }

procedure TContador.Abrir;
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


constructor TContador.Create;
begin
   FDetalhes   := tDetalhes_Contador.Create;
   FAlteracao  := TContadorAlteracao.Create;
   FObservacao := TStringList.Create;
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName :='X';
end;

function TContador.DadosCorretos: Boolean;
begin
    Result := False;
    // ...criticas...
    Result := True;
end;

destructor TContador.Destroy;
begin
  FDetalhes.Free;
  FAlteracao.Free;
  FObservacao.Free;
  qLocal.Free;
  inherited;
end;

function TContador.existe_CONTADOR_DETALHE_CONTD: Boolean;
begin
    qContador.Close;
    qContador.SQL.Clear;
    qContador.SQL.Add('SELECT CONTD_CODIGO               ');
    qContador.SQL.Add('  FROM CONTADOR_DETALHE_CONTD      ');
    qContador.SQL.Add(' WHERE CONTD_CODIGO = :CONTD_CODIGO');
    qContador.ParamByName('CONTD_CODIGO').AsString   := FCodigo;
    qContador.Open;
    result := not qContador.Eof;
end;

function TContador.existe_CONTADOR_ENDERECO_CONTE: Boolean;
begin
    qContador.Close;
    qContador.SQL.Clear;
    qContador.SQL.Add('SELECT CONTE_CODIGO               ');
    qContador.SQL.Add('  FROM CONTADOR_ENDERECO_CONTE      ');
    qContador.SQL.Add(' WHERE CONTE_CODIGO = :CONTE_CODIGO');
    qContador.ParamByName('CONTE_CODIGO').AsString   := FCodigo;
    qContador.Open;
    result := not qContador.Eof;
end;

function TContador.existe_CONTADOR_CONTATO_CONTC: Boolean;
begin
    qContador.Close;
    qContador.SQL.Clear;
    qContador.SQL.Add('SELECT CONTC_CODIGO               ');
    qContador.SQL.Add('  FROM CONTADOR_CONTATO_CONTC   ');
    qContador.SQL.Add(' WHERE CONTC_CODIGO = :CONTC_CODIGO');
    qContador.ParamByName('CONTC_CODIGO').AsString   := FCodigo;
    qContador.Open;
    result := not qContador.Eof;
end;

function TContador.getDetalhes: tDetalhes_Contador;
begin
   result := FDetalhes;
end;

function TContador.getFCodigo: String;
begin
   result := FCodigo;
end;

function TContador.getFExiste: Boolean;
begin
   Result := FExiste;
end;

function TContador.getFNomeFantasia: String;
begin
   result := FNomeFantasia;
end;

function TContador.getFObservacao: TStringList;
begin
   result := FObservacao;
end;

function TContador.getFStatus: TStatusCadastral;
begin
   Result := IntToStatusCadastral(FStatus);
end;

function TContador.getRazaoSocial: String;
begin
   result := FRazaoSocial;
end;

function TContador.Gravar: Boolean;
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

procedure TContador.Gravar_Observacoes;
var i : Integer;
begin
   qContador.Close;
   qContador.Sql.Clear;
   qContador.Sql.Add('DELETE FROM CONTADOR_OBS_CONTOBS ');
   qContador.Sql.Add(' WHERE CONTOBS_CODIGO = :COD    ');
   qContador.ParamByName('COD').AsString := FCodigo;
   qContador.ExecSql;

   for i := 0 to FObservacao.count-1 do
   begin
      qContador.close;
      qContador.sql.Clear;
      qContador.sql.Add('INSERT INTO CONTADOR_OBS_CONTOBS   ');
      qContador.sql.Add('     ( CONTOBS_CODIGO,            ');
	    qContador.sql.Add('       CONTOBS_LINHA,             ');
      qContador.sql.Add('       CONTOBS_TEXTO)             ');
      qContador.sql.Add('VALUES                           ');
      qContador.sql.Add('     (:CONTOBS_CODIGO,            ');
	    qContador.sql.Add('      :CONTOBS_LINHA,             ');
      qContador.sql.Add('      :CONTOBS_TEXTO)             ');
      qContador.ParamByName('CONTOBS_CODIGO').AsString := FCodigo;
	    qContador.ParamByName('CONTOBS_LINHA' ).AsInteger:= i;
      qContador.ParamByName('CONTOBS_TEXTO' ).AsString := FObservacao[i];
      qContador.ExecSql;
   end;
end;

function TContador.Insert: Boolean;
begin
    result := False;
    if not Inserir_CONTADOR_CONT           then exit;
    if not Inserir_CONTADOR_DETALHE_CONTD  then exit;
    if not Inserir_CONTADOR_ENDERECO_CONTE then exit;
    if not Inserir_CONTADOR_CONTATO_CONTC then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Contador','Cadastrou contador ' + FCodigo + '-' + FNomeFantasia);
end;

function TContador.Inserir_CONTADOR_CONT: Boolean;
begin
    result := False;
    try
        qContador.Close;
        qContador.SQL.Clear;
        qContador.SQL.Add('INSERT INTO CONTADOR_CONT  ');
        qContador.SQL.Add('     (                     ');
        qContador.SQL.Add('       CONT_CODIGO,        ');
        qContador.SQL.Add('       CONT_NOME_FANTASIA, ');
        qContador.SQL.Add('       CONT_RAZAO_SOCIAL,  ');
        qContador.SQL.Add('       CONT_STATUS         ');
        qContador.SQL.Add('     )                     ');
        qContador.SQL.Add('VALUES                     ');
        qContador.SQL.Add('     (                     ');
        qContador.SQL.Add('      :CONT_CODIGO,        ');
        qContador.SQL.Add('      :CONT_NOME_FANTASIA, ');
        qContador.SQL.Add('      :CONT_RAZAO_SOCIAL,  ');
        qContador.SQL.Add('      :CONT_STATUS         ');
        qContador.SQL.Add('     )                     ');
        Preencher_Parametros_CONTADOR_CONT(qContador);
        qContador.ParamByname('CONT_STATUS').AsInteger := 0;
        qContador.ExecSql;
        result := true
    except
       Avisos.Avisar('Erro ao incluir Contador ' + FNomeFantasia);
       LOGErros('Classe_Contador','Erro ao incluir Contador ' + FNomeFantasia);
    end;
end;

function TContador.Inserir_CONTADOR_CONTATO_CONTC: Boolean;
begin
    result := False;
    try
        qContador.Close;
        qContador.SQL.Clear;
        qContador.SQL.Add('INSERT INTO CONTADOR_CONTATO_CONTC');
        qContador.SQL.Add('           (CONTC_CODIGO,        ');
        qContador.SQL.Add('            CONTC_NOME,          ');
        qContador.SQL.Add('            CONTC_FONE1,         ');
        qContador.SQL.Add('            CONTC_FONE2,         ');
        qContador.SQL.Add('            CONTC_CEL1,          ');
        qContador.SQL.Add('            CONTC_WHATSAPP,      ');
        qContador.SQL.Add('            CONTC_EMAIL1,        ');
        qContador.SQL.Add('            CONTC_EMAIL2)        ');
        qContador.SQL.Add('     VALUES                     ');
        qContador.SQL.Add('          (:CONTC_CODIGO,        ');
        qContador.SQL.Add('           :CONTC_NOME,          ');
        qContador.SQL.Add('           :CONTC_FONE1,         ');
        qContador.SQL.Add('           :CONTC_FONE2,         ');
        qContador.SQL.Add('           :CONTC_CEL1,          ');
        qContador.SQL.Add('           :CONTC_WHATSAPP,      ');
        qContador.SQL.Add('           :CONTC_EMAIL1,        ');
        qContador.SQL.Add('           :CONTC_EMAIL2)        ');
        Preencher_Parametros_CONTADOR_CONTATO_CONTC(qContador);
        qContador.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Contador ' + FNomeFantasia);
       LOGErros('Classe_Contador','Erro ao incluir Contador ' + FNomeFantasia);
    end;
end;

procedure TContador.Preencher_Parametros_CONTADOR_CONTATO_CONTC(pQuery:TFDQuery);
begin
   qContador.ParamByName('CONTC_CODIGO'  ).AsString := self.FCodigo;
   qContador.ParamByName('CONTC_NOME'    ).AsString := self.FDetalhes.FContato.Nome;
   qContador.ParamByName('CONTC_FONE1'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone1);
   qContador.ParamByName('CONTC_FONE2'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone2);
   qContador.ParamByName('CONTC_CEL1'    ).AsString := SoNumeros(self.FDetalhes.FContato.Cel);
   qContador.ParamByName('CONTC_WHATSAPP').AsString := SoNumeros(self.FDetalhes.FContato.WhatsApp);
   qContador.ParamByName('CONTC_EMAIL1'  ).AsString := self.FDetalhes.FContato.Email1;
   qContador.ParamByName('CONTC_EMAIL2'  ).AsString := self.FDetalhes.FContato.Email2;
end;

function TContador.Inserir_CONTADOR_DETALHE_CONTD: Boolean;
begin
    result := False;
    try
        qContador.Close;
        qContador.SQL.Clear;
        qContador.SQL.Add('INSERT INTO CONTADOR_DETALHE_CONTD ');
        qContador.SQL.Add('     (                           ');
        qContador.SQL.Add('       CONTD_CODIGO,              ');
        qContador.SQL.Add('       CONTD_PESSOA_FJ,           ');
        qContador.SQL.Add('       CONTD_NUVEM_ATUALIZADO,    ');
        qContador.SQL.Add('       CONTD_CPF,                 ');
        qContador.SQL.Add('       CONTD_CNPJ,                ');
        qContador.SQL.Add('       CONTD_IE,                  ');
        qContador.SQL.Add('       CONTD_RG,                  ');
        qContador.SQL.Add('       CONTD_RG_EMISSOR,          ');
        qContador.SQL.Add('       CONTD_RG_DTEMISSAO,        ');
        qContador.SQL.Add('       CONTD_DTNASC,              ');
        qContador.SQL.Add('       CONTD_SEXO,                ');
        qContador.SQL.Add('       CONTD_ALT_USU,             ');
        qContador.SQL.Add('       CONTD_ALT_DT,              ');
        qContador.SQL.Add('       CONTD_ALT_HR,              ');
        qContador.SQL.Add('       CONTD_ALT_ESTACAO,         ');
        qContador.SQL.Add('       CONTD_ALT_DTBLOQUEADO,     ');
        qContador.SQL.Add('       CONTD_ALT_DTLIBERADO,      ');
        qContador.SQL.Add('       CONTD_ALT_DTINATIVO,       ');
        qContador.SQL.Add('       CONTD_CDRAMO,              ');
        qContador.SQL.Add('       CONTD_CDREGIAO,            ');
        qContador.SQL.Add('       CONTD_CDZONA,              ');
        qContador.SQL.Add('       CONTD_DT                   ');
        qContador.SQL.Add('     )                           ');
        qContador.SQL.Add('VALUES                           ');
        qContador.SQL.Add('     (                           ');
        qContador.SQL.Add('      :CONTD_CODIGO,              ');
        qContador.SQL.Add('      :CONTD_PESSOA_FJ,           ');
        qContador.SQL.Add('      :CONTD_NUVEM_ATUALIZADO,    ');
        qContador.SQL.Add('      :CONTD_CPF,                 ');
        qContador.SQL.Add('      :CONTD_CNPJ,                ');
        qContador.SQL.Add('      :CONTD_IE,                  ');
        qContador.SQL.Add('      :CONTD_RG,                  ');
        qContador.SQL.Add('      :CONTD_RG_EMISSOR,          ');
        qContador.SQL.Add('      :CONTD_RG_DTEMISSAO,        ');
        qContador.SQL.Add('      :CONTD_DTNASC,              ');
        qContador.SQL.Add('      :CONTD_SEXO,                ');
        qContador.SQL.Add('      :CONTD_ALT_USU,             ');
        qContador.SQL.Add('      :CONTD_ALT_DT,              ');
        qContador.SQL.Add('      :CONTD_ALT_HR,              ');
        qContador.SQL.Add('      :CONTD_ALT_ESTACAO,         ');
        qContador.SQL.Add('      :CONTD_ALT_DTBLOQUEADO,     ');
        qContador.SQL.Add('      :CONTD_ALT_DTLIBERADO,      ');
        qContador.SQL.Add('      :CONTD_ALT_DTINATIVO,       ');
        qContador.SQL.Add('      :CONTD_CDRAMO,              ');
        qContador.SQL.Add('      :CONTD_CDREGIAO,            ');
        qContador.SQL.Add('      :CONTD_CDZONA,              ');
        qContador.SQL.Add('      :CONTD_DT                   ');
        qContador.SQL.Add('     )                           ');
        qContador.ParamByName('CONTD_CODIGO'             ).AsString   := FCodigo;
        qContador.ParamByName('CONTD_NUVEM_ATUALIZADO'   ).AsInteger  := 0;
        qContador.ParamByName('CONTD_PESSOA_FJ'          ).AsString   := FDetalhes.FTipoPessoa;
        qContador.ParamByName('CONTD_CPF'                ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qContador.ParamByName('CONTD_CNPJ'               ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qContador.ParamByName('CONTD_IE'                 ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qContador.ParamByName('CONTD_RG'                 ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qContador.ParamByName('CONTD_RG_EMISSOR'         ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qContador.ParamByName('CONTD_RG_DTEMISSAO'       ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qContador.ParamByName('CONTD_DTNASC'             ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qContador.ParamByName('CONTD_SEXO'               ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qContador.ParamByName('CONTD_ALT_USU'            ).AsString   := Usuario.Codigo;
        qContador.ParamByName('CONTD_ALT_DT'             ).AsDateTime := DataServidor;
        qContador.ParamByName('CONTD_ALT_HR'             ).AsString   := HoraServidor;
        qContador.ParamByName('CONTD_ALT_ESTACAO'        ).AsString   := NomeComputador;
        qContador.ParamByName('CONTD_ALT_DTBLOQUEADO'    ).AsDateTime := 0;
        qContador.ParamByName('CONTD_ALT_DTLIBERADO'     ).AsDateTime := 0;
        qContador.ParamByName('CONTD_ALT_DTINATIVO'      ).AsDateTime := 0;
        qContador.ParamByName('CONTD_CDRAMO'           ).AsString   := FDetalhes.FRamoAtividade;
        qContador.ParamByName('CONTD_CDREGIAO'         ).AsString   := FDetalhes.FRegiao;
        qContador.ParamByName('CONTD_CDZONA'           ).AsString   := FDetalhes.FZona;
        qContador.ParamByName('CONTD_DT'               ).AsDateTime := DataServidor;
        qContador.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Contador ' + FNomeFantasia);
       LOGErros('Classe_Contador','Erro ao incluir Contador ' + FNomeFantasia);
    end;
end;

function TContador.Inserir_CONTADOR_ENDERECO_CONTE: Boolean;
begin
    result := False;
    try
        qContador.Close;
        qContador.SQL.Clear;
        qContador.SQL.Add('INSERT INTO CONTADOR_ENDERECO_CONTE');
        qContador.SQL.Add('     (                           ');
        qContador.SQL.Add('       CONTE_CODIGO,              ');
        qContador.SQL.Add('       CONTE_RUA,                 ');
        qContador.SQL.Add('       CONTE_NUMERO,              ');
        qContador.SQL.Add('       CONTE_COMPLEMENTO,         ');
        qContador.SQL.Add('       CONTE_CDCIDADE,            ');
        qContador.SQL.Add('       CONTE_BAIRRO,              ');
        qContador.SQL.Add('       CONTE_CEP                  ');
        qContador.SQL.Add('     )                           ');
        qContador.SQL.Add('VALUES                           ');
        qContador.SQL.Add('     (                           ');
        qContador.SQL.Add('      :CONTE_CODIGO,              ');
        qContador.SQL.Add('      :CONTE_RUA,                 ');
        qContador.SQL.Add('      :CONTE_NUMERO,              ');
        qContador.SQL.Add('      :CONTE_COMPLEMENTO,         ');
        qContador.SQL.Add('      :CONTE_CDCIDADE,            ');
        qContador.SQL.Add('      :CONTE_BAIRRO,              ');
        qContador.SQL.Add('      :CONTE_CEP                  ');
        qContador.SQL.Add('     )                           ');
        qContador.ParamByName('CONTE_CODIGO'     ).AsString   := FCodigo;
        qContador.ParamByName('CONTE_RUA'        ).AsString   := FDetalhes.FEndereco.Rua;
        qContador.ParamByName('CONTE_NUMERO'     ).AsString   := FDetalhes.FEndereco.Numero;
        qContador.ParamByName('CONTE_COMPLEMENTO').AsString   := FDetalhes.FEndereco.Complemento;
        qContador.ParamByName('CONTE_CDCIDADE'   ).AsString   := FDetalhes.FEndereco.Cidade;
        qContador.ParamByName('CONTE_BAIRRO'     ).AsString   := FDetalhes.FEndereco.Bairro;
        qContador.ParamByName('CONTE_CEP'        ).AsString   := FDetalhes.FEndereco.CEP;
        qContador.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Contador ' + FNomeFantasia);
       LOGErros('Classe_Contador','Erro ao incluir Contador ' + FNomeFantasia);
    end;
end;


procedure TContador.LimparCampos;
begin
    FNomeFantasia      := '';
    FRazaoSocial       := '';
	  FStatus            := -1;
end;

procedure TContador.Pegar_Alteracoes;
begin
    with FAlteracao do
    begin
       Usuario       := qContador.FieldByName('CONTD_ALT_USU'        ).AsString;
       Data          := qContador.FieldByName('CONTD_ALT_DT'         ).AsString;
       Hora          := qContador.FieldByName('CONTD_ALT_HR'         ).AsString;
       Estacao       := qContador.FieldByName('CONTD_ALT_ESTACAO'    ).AsString;
       DataBloqueio  := qContador.FieldByName('CONTD_ALT_DTBLOQUEADO').AsString;
       DataLiberacao := qContador.FieldByName('CONTD_ALT_DTLIBERADO' ).AsString;
       DataInativo   := qContador.FieldByName('CONTD_ALT_DTINATIVO'  ).AsString;
    end;
end;

procedure TContador.Pegar_Contato;
begin
    qContador.Close;
    qContador.SQL.Clear;
    qContador.SQL.Add('SELECT * FROM CONTADOR_CONTATO_CONTC');
    qContador.SQL.Add(' WHERE CONTC_CODIGO = :CONTC_CODIGO ');
    qContador.ParamByName('CONTC_CODIGO').AsString := FCodigo;
    qContador.Open;
    if qContador.eof then
    begin
       Inserir_CONTADOR_CONTATO_CONTC;
       exit;
    end;
   Detalhes.FContato.Nome     := qContador.FieldByName('CONTC_NOME'    ).AsString;
   Detalhes.FContato.Fone1    := qContador.FieldByName('CONTC_FONE1'   ).AsString;
   Detalhes.FContato.Fone2    := qContador.FieldByName('CONTC_FONE2'   ).AsString;
   Detalhes.FContato.Cel      := qContador.FieldByName('CONTC_CEL1'    ).AsString;
   Detalhes.FContato.WhatsApp := qContador.FieldByName('CONTC_WHATSAPP').AsString;
   Detalhes.FContato.Email1   := qContador.FieldByName('CONTC_EMAIL1'  ).AsString;
   Detalhes.FContato.Email2   := qContador.FieldByName('CONTC_EMAIL2'  ).AsString;
end;

procedure TContador.Pegar_Dados_Basicos;
begin
    qContador.Close;
    qContador.SQL.Clear;
    qContador.SQL.Add('SELECT * FROM CONTADOR_CONT      ');
    qContador.SQL.Add(' WHERE CONT_CODIGO = :CONT_CODIGO');
    qContador.ParamByName('CONT_CODIGO').AsString := FCodigo;
    qContador.Open;
    if qContador.eof then
    begin
       FExiste:=False;
       exit;
    end;
    FExiste                      := True;
    FCodigo                      := qContador.FieldByName('CONT_CODIGO'                 ).AsString;
    FNomeFantasia                := qContador.FieldByName('CONT_NOME_FANTASIA'          ).AsString;
    FRazaoSocial                 := qContador.FieldByName('CONT_RAZAO_SOCIAL'           ).AsString;
    FStatus                      := qContador.FieldByName('CONT_STATUS'                 ).AsInteger;
end;

procedure TContador.Pegar_Detalhes;
begin
    qContador.Close;
    qContador.SQL.Clear;
    qContador.SQL.Add('SELECT * FROM CONTADOR_DETALHE_CONTD');
    qContador.SQL.Add(' WHERE CONTD_CODIGO = :CONTD_CODIGO ');
    qContador.ParamByName('CONTD_CODIGO').AsString := FCodigo;
    qContador.Open;
    if qContador.eof then
    begin
       exit;
    end;

    Detalhes.FTipoPessoa         := qContador.FieldByName('CONTD_PESSOA_FJ'          ).AsString;
    with Detalhes.FPessoaFisica do
    begin
       FCPF                      := qContador.FieldByName('CONTD_CPF'                ).AsString;
       FRG                       := qContador.FieldByName('CONTD_RG'                 ).AsString;
       FRG_OrgaoEmissor          := qContador.FieldByName('CONTD_RG_EMISSOR'         ).AsString;
       FRG_DataEmissao           := qContador.FieldByName('CONTD_RG_DTEMISSAO'       ).AsDateTime;
       FRG_DataEmissaoString     := BarrasSeDataNula(qContador.FieldByName('CONTD_RG_DTEMISSAO').AsString);
       FDataNascimento           := qContador.FieldByName('CONTD_DTNASC'             ).AsDateTime;
       FSexo                     := qContador.FieldByName('CONTD_SEXO'               ).AsString;
       FDataNascimentoString     := BarrasSeDataNula(qContador.FieldByName('CONTD_DTNASC' ).AsString);
    end;
    with Detalhes.FPessoaJuridica do
    begin
       FCNPJ                     := qContador.FieldByName('CONTD_CNPJ'               ).AsString;
       FIE                       := qContador.FieldByName('CONTD_IE'                 ).AsString;
    end;
    FDetalhes.RamoAtividade      := qContador.FieldByName('CONTD_CDRAMO'             ).AsString;
    FDetalhes.Regiao             := qContador.FieldByName('CONTD_CDREGIAO'           ).AsString;
    FDetalhes.Zona               := qContador.FieldByName('CONTD_CDZONA'             ).AsString;
    FDetalhes.FDataCadastro      := qContador.FieldByName('CONTD_DT'                 ).AsDateTime;
    Pegar_Alteracoes;
end;

procedure TContador.Pegar_Endereco;
begin
    qContador.Close;
    qContador.SQL.Clear;
    qContador.SQL.Add('SELECT * FROM CONTADOR_ENDERECO_CONTE');
    qContador.SQL.Add(' WHERE CONTE_CODIGO = :CONTE_CODIGO  ');
    qContador.ParamByName('CONTE_CODIGO').AsString := FCodigo;
    qContador.Open;
    if qContador.eof then
    begin
       exit;
    end;
    FDetalhes.Endereco.Rua         := qContador.FieldByName('CONTE_RUA'        ).AsString;
    FDetalhes.Endereco.Numero      := qContador.FieldByName('CONTE_NUMERO'     ).AsString;
    FDetalhes.Endereco.Complemento := qContador.FieldByName('CONTE_COMPLEMENTO').AsString;
    FDetalhes.Endereco.Bairro      := qContador.FieldByName('CONTE_BAIRRO'     ).AsString;
    FDetalhes.Endereco.Cidade      := qContador.FieldByName('CONTE_CDCIDADE'   ).AsString;
    FDetalhes.Endereco.CEP         := qContador.FieldByName('CONTE_CEP'        ).AsString;
end;

procedure TContador.Pegar_Observacoes;
begin
   FObservacao.Clear;
   qContador.Close;
   qContador.Sql.Clear;
   qContador.Sql.Add('SELECT CONTOBS_TEXTO          ');
   qContador.Sql.Add('  FROM CONTADOR_OBS_CONTOBS    ');
   qContador.Sql.Add(' WHERE CONTOBS_CODIGO = :COD  ');
   qContador.Sql.Add(' ORDER BY CONTOBS_LINHA       ');
   qContador.ParamByName('COD').AsString := FCodigo;
   qContador.Open;
   while not qContador.eof do
   begin
     FObservacao.add(qContador.fieldbyname('CONTOBS_TEXTO').AsString);
     qContador.Next;
   end;
end;

procedure TContador.Preencher_Parametros_CONTADOR_CONT(pQuery: TFDQuery);
begin
   pQuery.ParamByName('CONT_CODIGO'       ).AsString   := FCodigo;
   pQuery.ParamByName('CONT_NOME_FANTASIA').AsString   := FNomeFantasia;
   pQuery.ParamByName('CONT_RAZAO_SOCIAL' ).AsString   := FRazaoSocial;
   pQuery.ParamByName('CONT_STATUS'       ).AsInteger  := FStatus;
end;

function TContador.proximoCodigo: String;
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
    qProximo.SQL.Add('SELECT MAX(CONT_CODIGO) AS MAIOR');
    qProximo.SQL.Add('  FROM CONTADOR_CONT             ');
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
       qProximo.SQL.Add('SELECT CONT_CODIGO              ');
       qProximo.SQL.Add('  FROM CONTADOR_CONT           ');
       qProximo.SQL.Add(' WHERE CONT_CODIGO = :CONT_CODIGO');
       qProximo.ParamByName('CONT_CODIGO').AsString := sCodigoCandidato;
       qProximo.Open;
       while not qProximo.Eof do
       begin
          qProximo.Close;
          inc(vCodigoCandidato);
          sCodigoCandidato := FormatFloat('#',vCodigoCandidato);
          qProximo.ParamByName('CONT_CODIGO').AsString := sCodigoCandidato;
          qProximo.Open;
       end;
       qProximo.Free;
       result := sCodigoCandidato;
       exit;
    end;
end;

procedure TContador.RegistrarHistorico(pEvento,pLog: String);
begin
   //Histórico de bloqueios e desbloqueios do Contador
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('INSERT INTO CONTADOR_HISTORICO_BLOQUEIOS_CONTHB ');
   qLocal.Sql.Add('     ( CONTHB_CONTADOR,                         ');
   qLocal.Sql.Add('       CONTHB_EVENTO,                          ');
   qLocal.Sql.Add('       CONTHB_DTEVENTO,                        ');
   qLocal.Sql.Add('       CONTHB_HREVENTO,                        ');
   qLocal.Sql.Add('       CONTHB_USUEVENTO,                       ');
   qLocal.Sql.Add('       CONTHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                      ');
   qLocal.Sql.Add('VALUES                                      ');
   qLocal.Sql.Add('     (:CONTHB_CONTADOR,                         ');
   qLocal.Sql.Add('      :CONTHB_EVENTO,                          ');
   qLocal.Sql.Add('      :CONTHB_DTEVENTO,                        ');
   qLocal.Sql.Add('      :CONTHB_HREVENTO,                        ');
   qLocal.Sql.Add('      :CONTHB_USUEVENTO,                       ');
   qLocal.Sql.Add('      :CONTHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                                                                                           ');
   qLocal.ParamByName('CONTHB_CONTADOR' ).AsString   := FCodigo;
   qLocal.ParamByName('CONTHB_EVENTO'   ).AsString   := pEvento;
   qLocal.ParamByName('CONTHB_DTEVENTO' ).AsDateTime := DataServidor;
   qLocal.ParamByName('CONTHB_HREVENTO' ).AsString   := HoraServidor;
   qLocal.ParamByName('CONTHB_USUEVENTO').AsString   := Usuario.Codigo;
   qLocal.ParamByName('CONTHB_MAQEVENTO').AsString   := NomeComputador;
   qLocal.ExecSql;

   Log('Classe_Contador',pLog+' contador '+FCodigo+' - '+FNomeFantasia);
end;

procedure TContador.RegistrarHistoricoDeAtivacao;
begin
   RegistrarHistorico('Ativado','Ativou');
end;

procedure TContador.RegistrarHistoricoDeBloqueio;
begin
   RegistrarHistorico('Bloqueado','Bloqueou');
end;

procedure TContador.RegistrarHistoricoDeDesBloqueio;
begin
   RegistrarHistorico('Desbloqueado','Desbloqueou');
end;

procedure TContador.RegistrarHistoricoDeInativacao;
begin
   RegistrarHistorico('Inativado','Inativou');
end;

procedure TContador.setDetalhes(const Value: tDetalhes_Contador);
begin
   FDetalhes := Value;
end;

procedure TContador.setFCodigo(const Value: String);
begin
   if Value = '' then
      FCodigo := Copy(proximoCodigo,1,10)
   else
      FCodigo := Copy(Value,1,10);
end;

procedure TContador.setFNomeFantasia(const Value: String);
begin
   FNomeFantasia := UpperCase(Copy(Value,1,50));
end;

procedure TContador.setFObservacao(const Value: TStringList);
begin
   FObservacao := Value;
end;

procedure TContador.setFStatus(const Value: TStatusCadastral);
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

procedure TContador.setRazaoSocial(const Value: String);
begin
   FRazaoSocial := UpperCase(Copy(value,1,50));
end;

function TContador.Update: Boolean;
begin
    result := false;
    if not Update_CONTADOR_CONT           then exit;
    if not Update_CONTADOR_DETALHE_CONTD  then exit;
    if not Update_CONTADOR_ENDERECO_CONTE then exit;
    if not Update_CONTADOR_CONTATO_CONTC then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Contador','Alterou contador '+ FCodigo + ' - ' + FNomeFantasia);
end;

function TContador.Update_CONTADOR_CONT:Boolean;
begin
    try
        qContador.Close;
        qContador.SQL.Clear;
        qContador.SQL.Add('UPDATE CONTADOR_CONT                                           ');
        qContador.SQL.Add('   SET CONT_NOME_FANTASIA           = :CONT_NOME_FANTASIA,       ');
        qContador.SQL.Add('       CONT_RAZAO_SOCIAL            = :CONT_RAZAO_SOCIAL,        ');
        qContador.SQL.Add('       CONT_STATUS                  = :CONT_STATUS               ');
        qContador.SQL.Add(' WHERE CONT_CODIGO                  = :CONT_CODIGO               ');
        Preencher_Parametros_CONTADOR_CONT(qContador);
        qContador.ExecSql;
        Log('Classe_Contador','Alterou contador '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Contador '+ FNomeFantasia);
       LogErros('Classe_Contador','Erro ao alterar Contador '+ FNomeFantasia);
    end;
end;

function TContador.Update_CONTADOR_CONTATO_CONTC: Boolean;
begin
    if existe_CONTADOR_CONTATO_CONTC then
       result := alterar_CONTADOR_CONTATO_CONTC
    else
       result := inserir_CONTADOR_CONTATO_CONTC;
end;

function TContador.alterar_CONTADOR_CONTATO_CONTC: Boolean;
begin
    result := False;
    try
        qContador.Close;
        qContador.SQL.Clear;
        qContador.SQL.Add('UPDATE CONTADOR_CONTATO_CONTC         ');
        qContador.SQL.Add('   SET CONTC_NOME     = :CONTC_NOME,     ');
        qContador.SQL.Add('       CONTC_FONE1    = :CONTC_FONE1,    ');
        qContador.SQL.Add('       CONTC_FONE2    = :CONTC_FONE2,    ');
        qContador.SQL.Add('       CONTC_CEL1     = :CONTC_CEL1,     ');
        qContador.SQL.Add('       CONTC_WHATSAPP = :CONTC_WHATSAPP, ');
        qContador.SQL.Add('       CONTC_EMAIL1   = :CONTC_EMAIL1,   ');
        qContador.SQL.Add('       CONTC_EMAIL2   = :CONTC_EMAIL2    ');
        qContador.SQL.Add(' WHERE CONTC_CODIGO   = :CONTC_CODIGO    ');
        Preencher_Parametros_CONTADOR_CONTATO_CONTC(qContador);
        qContador.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao alterar Contatos do Contador ' + FNomeFantasia);
       LOGErros('Classe_Contador','Erro ao Alterar Contatos do Contador ' + FNomeFantasia);
    end;
end;

function TContador.Update_CONTADOR_DETALHE_CONTD:Boolean;
begin
    if existe_CONTADOR_DETALHE_CONTD then
       result := alterar_CONTADOR_DETALHE_CONTD
    else
       result := inserir_CONTADOR_DETALHE_CONTD;
end;

function TContador.alterar_CONTADOR_DETALHE_CONTD:Boolean;
begin
    result := false;
    try
        qContador.Close;
        qContador.SQL.Clear;
        qContador.SQL.Add('UPDATE CONTADOR_DETALHE_CONTD                                  ');
        qContador.SQL.Add('   SET CONTD_PESSOA_FJ           = :CONTD_PESSOA_FJ,           ');
        qContador.SQL.Add('       CONTD_NUVEM_ATUALIZADO    = :CONTD_NUVEM_ATUALIZADO,    ');
        qContador.SQL.Add('       CONTD_CPF                 = :CONTD_CPF,                 ');
        qContador.SQL.Add('       CONTD_CNPJ                = :CONTD_CNPJ,                ');
        qContador.SQL.Add('       CONTD_IE                  = :CONTD_IE,                  ');
        qContador.SQL.Add('       CONTD_RG                  = :CONTD_RG,                  ');
        qContador.SQL.Add('       CONTD_RG_EMISSOR          = :CONTD_RG_EMISSOR,          ');
        qContador.SQL.Add('       CONTD_RG_DTEMISSAO        = :CONTD_RG_DTEMISSAO,        ');
        qContador.SQL.Add('       CONTD_DTNASC              = :CONTD_DTNASC,              ');
        qContador.SQL.Add('       CONTD_SEXO                = :CONTD_SEXO,                ');
        qContador.SQL.Add('       CONTD_ALT_USU             = :CONTD_ALT_USU,             ');
        qContador.SQL.Add('       CONTD_ALT_DT              = :CONTD_ALT_DT,              ');
        qContador.SQL.Add('       CONTD_ALT_HR              = :CONTD_ALT_HR,              ');
        qContador.SQL.Add('       CONTD_ALT_ESTACAO         = :CONTD_ALT_ESTACAO,         ');
        qContador.SQL.Add('       CONTD_ALT_DTBLOQUEADO     = :CONTD_ALT_DTBLOQUEADO,     ');
        qContador.SQL.Add('       CONTD_ALT_DTLIBERADO      = :CONTD_ALT_DTLIBERADO,      ');
        qContador.SQL.Add('       CONTD_ALT_DTINATIVO       = :CONTD_ALT_DTINATIVO,       ');
        qContador.SQL.Add('       CONTD_CDRAMO              = :CONTD_CDRAMO,              ');
        qContador.SQL.Add('       CONTD_CDREGIAO            = :CONTD_CDREGIAO,            ');
        qContador.SQL.Add('       CONTD_CDZONA              = :CONTD_CDZONA               ');
        qContador.SQL.Add(' WHERE CONTD_CODIGO              = :CONTD_CODIGO               ');
        qContador.ParamByName('CONTD_CODIGO'          ).AsString   := FCodigo;
        qContador.ParamByName('CONTD_NUVEM_ATUALIZADO').AsInteger  := 0;
        qContador.ParamByName('CONTD_PESSOA_FJ'       ).AsString   := FDetalhes.FTipoPessoa;
        qContador.ParamByName('CONTD_CPF'             ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qContador.ParamByName('CONTD_CNPJ'            ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qContador.ParamByName('CONTD_IE'              ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qContador.ParamByName('CONTD_RG'              ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qContador.ParamByName('CONTD_RG_EMISSOR'      ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qContador.ParamByName('CONTD_RG_DTEMISSAO'    ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qContador.ParamByName('CONTD_DTNASC'          ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qContador.ParamByName('CONTD_SEXO'            ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qContador.ParamByName('CONTD_ALT_USU'         ).AsString   := Usuario.Codigo;
        qContador.ParamByName('CONTD_ALT_DT'          ).AsDateTime := DataServidor;
        qContador.ParamByName('CONTD_ALT_HR'          ).AsString   := HoraServidor;
        qContador.ParamByName('CONTD_ALT_ESTACAO'     ).AsString   := NomeComputador;
        qContador.ParamByName('CONTD_ALT_DTBLOQUEADO' ).AsDateTime := ZeroSeDataNula(FAlteracao.DataBloqueio);
        qContador.ParamByName('CONTD_ALT_DTLIBERADO'  ).AsDateTime := ZeroSeDataNula(FAlteracao.DataLiberacao);
        qContador.ParamByName('CONTD_ALT_DTINATIVO'   ).AsDateTime := ZeroSeDataNula(FAlteracao.DataInativo);
        qContador.ParamByName('CONTD_CDRAMO'          ).AsString   := FDetalhes.FRamoAtividade;
        qContador.ParamByName('CONTD_CDREGIAO'        ).AsString   := FDetalhes.FRegiao;
        qContador.ParamByName('CONTD_CDZONA'          ).AsString   := FDetalhes.FZona;
        qContador.ExecSql;

        Log('Classe_Contador','Alterou contador '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Detalhes do Contador '+ FNomeFantasia);
       LogErros('Classe_Contador','Erro ao alterar Detalhes do Contador '+ FNomeFantasia);
    end;
end;

function TContador.Update_CONTADOR_ENDERECO_CONTE:Boolean;
begin
    if existe_CONTADOR_ENDERECO_CONTE then
       result := alterar_CONTADOR_ENDERECO_CONTE
    else
       result := inserir_CONTADOR_ENDERECO_CONTE;
end;

function TContador.alterar_CONTADOR_ENDERECO_CONTE:Boolean;
begin
   try
        qContador.Close;
        qContador.SQL.Clear;
        qContador.SQL.Add('UPDATE CONTADOR_ENDERECO_CONTE                                 ');
        qContador.SQL.Add('   SET CONTE_RUA                 = :CONTE_RUA,                 ');
        qContador.SQL.Add('       CONTE_NUMERO              = :CONTE_NUMERO,              ');
        qContador.SQL.Add('       CONTE_COMPLEMENTO         = :CONTE_COMPLEMENTO,         ');
        qContador.SQL.Add('       CONTE_BAIRRO              = :CONTE_BAIRRO,              ');
        qContador.SQL.Add('       CONTE_CDCIDADE            = :CONTE_CDCIDADE,            ');
        qContador.SQL.Add('       CONTE_CEP                 = :CONTE_CEP                  ');
        qContador.SQL.Add(' WHERE CONTE_CODIGO              = :CONTE_CODIGO               ');
        qContador.ParamByName('CONTE_CODIGO'          ).AsString   := FCodigo;
        qContador.ParamByName('CONTE_RUA'             ).AsString   := FDetalhes.FEndereco.Rua;
        qContador.ParamByName('CONTE_NUMERO'          ).AsString   := FDetalhes.FEndereco.Numero;
        qContador.ParamByName('CONTE_COMPLEMENTO'     ).AsString   := FDetalhes.FEndereco.Complemento;
        qContador.ParamByName('CONTE_BAIRRO'          ).AsString   := FDetalhes.FEndereco.Bairro;
        qContador.ParamByName('CONTE_CDCIDADE'        ).AsString   := FDetalhes.FEndereco.Cidade;
        qContador.ParamByName('CONTE_CEP'             ).AsString   := FDetalhes.FEndereco.CEP;
        qContador.ExecSql;

        Log('Classe_Contador','Alterou contador '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Endereço do Contador '+ FNomeFantasia);
       LogErros('Classe_Contador','Erro ao alterar Endereço do Contador '+ FNomeFantasia);
    end;
end;

{ tDetalhes_Contador }

constructor tDetalhes_Contador.Create;
begin
  qContador := TFDQuery.Create(nil);
  qContador.ConnectionName :='X';
  FPessoaFisica  := tPessoa_Fisica.Create;
  FPessoaJuridica:= tPessoa_Juridica.Create;
  FEndereco      := TEndereco.Create;
  FContato       := TContato.Create;
end;

destructor tDetalhes_Contador.Destroy;
begin
  qContador.Free;
  FPessoaFisica.Free;
  FPessoaJuridica.Free;
  FEndereco.Free;
  FContato.Free;
  inherited;
end;

function tDetalhes_Contador.getDataCadastroString: String;
begin
   result := DateToStr(FDataCadastro);
end;

{function tDetalhes_Contador.getFCodigoMunicipio: String;
begin
   result := FCodigoMunicipio;
end;
}
function tDetalhes_Contador.getFDataCadastro: TDateTime;
begin
   result := FDataCadastro;
end;

function tDetalhes_Contador.getFRamoAtividade: String;
begin
   result := FRamoAtividade;
end;

function tDetalhes_Contador.getFRegiao: String;
begin
   Result := FRegiao;
end;

function tDetalhes_Contador.getFTipoPessoa: TTipoPessoa;
begin
   Result := StringToTipoPessoa(FTipoPessoa);
end;

function tDetalhes_Contador.getFZona: String;
begin
   Result := FZona;
end;

{
procedure tDetalhes_Contador.setFCodigoMunicipio(const Value: String);
begin
   FCodigoMunicipio := Value;
end;
}
procedure tDetalhes_Contador.setFDataCadastro(const Value: TDateTime);
begin
   FDataCadastro := Value;
end;

procedure tDetalhes_Contador.setFRamoAtividade(const Value: String);
begin
   FRamoAtividade := Copy(Value,1,10);
end;

procedure tDetalhes_Contador.setFRegiao(const Value: String);
begin
   FRegiao := Copy(Value,1,10);
end;

procedure tDetalhes_Contador.setFTipoPessoa(const Value: TTipoPessoa);
begin
   FTipoPessoa := TipoPessoaToString(Value);
end;

procedure tDetalhes_Contador.setFZona(const Value: String);
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

