unit Classe_Colaborador;

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

  tDetalhes_Colaborador = class
    private
      FDataCadastro      : TDateTime;
      FTipoPessoa	       : String;
      FPessoaFisica      : tPessoa_Fisica;
      FPessoaJuridica    : tPessoa_Juridica;
      FRamoAtividade     : String;
      FRegiao            : String;
      FZona              : String;
      FTipo              : String;
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
      function getFTipo: String;
      procedure setFTipo(const Value: String);

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
      property Tipo              : String           read getFTipo               write setFTipo;
      property Endereco          : TEndereco        read FEndereco              write FEndereco;
      property Contato           : TContato         read FContato               write FContato;
end;

  TColaboradorAlteracao = class(TAlteracao);

  TColaborador = class
  private
    FExiste            : Boolean;
    FCodigo            : String;
    FNomeFantasia      : String;
    FRazaoSocial       : String;
	  FStatus            : Integer;
    FDetalhes          : tDetalhes_Colaborador;
    FAlteracao         : TColaboradorAlteracao;
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
    function  getDetalhes: tDetalhes_Colaborador;
    procedure setDetalhes(const Value: tDetalhes_Colaborador);
    function  Insert:Boolean;
    function  Update:Boolean;
    function  DadosCorretos:Boolean;
    procedure Preencher_Parametros_COLABORADOR_COL(pQuery:TFDQuery);
    procedure Preencher_Parametros_COLABORADOR_CONTATO_COLC(pQuery:TFDQuery);
    procedure Pegar_Dados_Basicos;
    procedure Pegar_Detalhes;
    procedure Pegar_Endereco;
    procedure Pegar_Contato;
    procedure Pegar_Alteracoes;

    procedure Pegar_Observacoes;
    procedure Gravar_Observacoes;
    //
    function Inserir_COLABORADOR_COL           :Boolean;
    function Inserir_COLABORADOR_DETALHE_COLD  :Boolean;
    function Inserir_COLABORADOR_ENDERECO_COLE :Boolean;
    function Inserir_COLABORADOR_CONTATO_COLC  :Boolean;
    //
    function Update_COLABORADOR_COL:Boolean;

    function Update_COLABORADOR_DETALHE_COLD :Boolean;
    function existe_COLABORADOR_DETALHE_COLD :Boolean;
    function alterar_COLABORADOR_DETALHE_COLD:Boolean;

    function Update_COLABORADOR_ENDERECO_COLE:Boolean;
    function existe_COLABORADOR_ENDERECO_COLE: Boolean;
    function alterar_COLABORADOR_ENDERECO_COLE:BooleAn;

    function Update_COLABORADOR_CONTATO_COLC:Boolean;
    function existe_COLABORADOR_CONTATO_COLC: Boolean;
    function alterar_COLABORADOR_CONTATO_COLC: Boolean;

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
    property Existe        : Boolean               read getFExiste;
    Property Codigo        : String                read getFCodigo       write setFCodigo;
    Property NomeFantasia  : String                read getFNomeFantasia write setFNomeFantasia;
    Property RazaoSocial   : String                read getRazaoSocial   write setRazaoSocial;
    Property Status        : TStatusCadastral      read getFStatus       write setFStatus;
    Property Detalhes      : tDetalhes_Colaborador read getDetalhes      write setDetalhes;
    property Alteracao     : TColaboradorAlteracao read FAlteracao       write FAlteracao;
    property Observacao    : TStringList           read getFObservacao   write setFObservacao;
    procedure Abrir;
    Function Gravar:Boolean;
end;

implementation

uses FuncoesSMC,
     Classe_Nuvem;

var qColaborador, qLocal: TFDQuery;

{ TColaborador }

procedure TColaborador.Abrir;
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


constructor TColaborador.Create;
begin
   FDetalhes   := tDetalhes_Colaborador.Create;
   FAlteracao  := TColaboradorAlteracao.Create;
   FObservacao := TStringList.Create;
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName :='X';
end;

function TColaborador.DadosCorretos: Boolean;
begin
    Result := False;
    // ...criticas...
    Result := True;
end;

destructor TColaborador.Destroy;
begin
  FDetalhes.Free;
  FAlteracao.Free;
  FObservacao.Free;
  qLocal.Free;
  inherited;
end;

function TColaborador.existe_COLABORADOR_DETALHE_COLD: Boolean;
begin
    qColaborador.Close;
    qColaborador.SQL.Clear;
    qColaborador.SQL.Add('SELECT COLD_CODIGO               ');
    qColaborador.SQL.Add('  FROM COLABORADOR_DETALHE_COLD  ');
    qColaborador.SQL.Add(' WHERE COLD_CODIGO = :COLD_CODIGO');
    qColaborador.ParamByName('COLD_CODIGO').AsString   := FCodigo;
    qColaborador.Open;
    result := not qColaborador.Eof;
end;

function TColaborador.existe_COLABORADOR_ENDERECO_COLE: Boolean;
begin
    qColaborador.Close;
    qColaborador.SQL.Clear;
    qColaborador.SQL.Add('SELECT COLE_CODIGO               ');
    qColaborador.SQL.Add('  FROM COLABORADOR_ENDERECO_COLE ');
    qColaborador.SQL.Add(' WHERE COLE_CODIGO = :COLE_CODIGO');
    qColaborador.ParamByName('COLE_CODIGO').AsString   := FCodigo;
    qColaborador.Open;
    result := not qColaborador.Eof;
end;

function TColaborador.existe_COLABORADOR_CONTATO_COLC: Boolean;
begin
    qColaborador.Close;
    qColaborador.SQL.Clear;
    qColaborador.SQL.Add('SELECT COLC_CODIGO               ');
    qColaborador.SQL.Add('  FROM COLABORADOR_CONTATO_COLC  ');
    qColaborador.SQL.Add(' WHERE COLC_CODIGO = :COLC_CODIGO');
    qColaborador.ParamByName('COLC_CODIGO').AsString   := FCodigo;
    qColaborador.Open;
    result := not qColaborador.Eof;
end;

function TColaborador.getDetalhes: tDetalhes_Colaborador;
begin
   result := FDetalhes;
end;

function TColaborador.getFCodigo: String;
begin
   result := FCodigo;
end;

function TColaborador.getFExiste: Boolean;
begin
   Result := FExiste;
end;

function TColaborador.getFNomeFantasia: String;
begin
   result := FNomeFantasia;
end;

function TColaborador.getFObservacao: TStringList;
begin
   result := FObservacao;
end;

function TColaborador.getFStatus: TStatusCadastral;
begin
   Result := IntToStatusCadastral(FStatus);
end;

function TColaborador.getRazaoSocial: String;
begin
   result := FRazaoSocial;
end;

function TColaborador.Gravar: Boolean;
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

procedure TColaborador.Gravar_Observacoes;
var i : Integer;
begin
   qColaborador.Close;
   qColaborador.Sql.Clear;
   qColaborador.Sql.Add('DELETE FROM COLABORADOR_OBS_COLOBS ');
   qColaborador.Sql.Add(' WHERE COLOBS_CODIGO = :COD        ');
   qColaborador.ParamByName('COD').AsString := FCodigo;
   qColaborador.ExecSql;

   for i := 0 to FObservacao.count-1 do
   begin
      qColaborador.close;
      qColaborador.sql.Clear;
      qColaborador.sql.Add('INSERT INTO COLABORADOR_OBS_COLOBS');
      qColaborador.sql.Add('     ( COLOBS_CODIGO,             ');
	    qColaborador.sql.Add('       COLOBS_LINHA,              ');
      qColaborador.sql.Add('       COLOBS_TEXTO)              ');
      qColaborador.sql.Add('VALUES                            ');
      qColaborador.sql.Add('     (:COLOBS_CODIGO,             ');
	    qColaborador.sql.Add('      :COLOBS_LINHA,              ');
      qColaborador.sql.Add('      :COLOBS_TEXTO)              ');
      qColaborador.ParamByName('COLOBS_CODIGO').AsString := FCodigo;
	    qColaborador.ParamByName('COLOBS_LINHA' ).AsInteger:= i;
      qColaborador.ParamByName('COLOBS_TEXTO' ).AsString := FObservacao[i];
      qColaborador.ExecSql;
   end;
end;

function TColaborador.Insert: Boolean;
begin
    result := False;
    if not Inserir_COLABORADOR_COL           then exit;
    if not Inserir_COLABORADOR_DETALHE_COLD  then exit;
    if not Inserir_COLABORADOR_ENDERECO_COLE then exit;
    if not Inserir_COLABORADOR_CONTATO_COLC  then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Colaborador','Cadastrou colaborador ' + FCodigo + '-' + FNomeFantasia);
end;

function TColaborador.Inserir_COLABORADOR_COL: Boolean;
begin
    result := False;
    try
        qColaborador.Close;
        qColaborador.SQL.Clear;
        qColaborador.SQL.Add('INSERT INTO COLABORADOR_COL');
        qColaborador.SQL.Add('     (                     ');
        qColaborador.SQL.Add('       COL_CODIGO,         ');
        qColaborador.SQL.Add('       COL_NOME_FANTASIA,  ');
        qColaborador.SQL.Add('       COL_RAZAO_SOCIAL,   ');
        qColaborador.SQL.Add('       COL_STATUS          ');
        qColaborador.SQL.Add('     )                     ');
        qColaborador.SQL.Add('VALUES                     ');
        qColaborador.SQL.Add('     (                     ');
        qColaborador.SQL.Add('      :COL_CODIGO,         ');
        qColaborador.SQL.Add('      :COL_NOME_FANTASIA,  ');
        qColaborador.SQL.Add('      :COL_RAZAO_SOCIAL,   ');
        qColaborador.SQL.Add('      :COL_STATUS          ');
        qColaborador.SQL.Add('     )                     ');
        Preencher_Parametros_COLABORADOR_COL(qColaborador);
        qColaborador.ParamByname('COL_STATUS').AsInteger := 0;
        qColaborador.ExecSql;
        result := true
    except
       Avisos.Avisar('Erro ao incluir Colaborador ' + FNomeFantasia);
       LOGErros('Classe_Colaborador','Erro ao incluir Colaborador ' + FNomeFantasia);
    end;
end;

function TColaborador.Inserir_COLABORADOR_CONTATO_COLC: Boolean;
begin
    result := False;
    try
        qColaborador.Close;
        qColaborador.SQL.Clear;
        qColaborador.SQL.Add('INSERT INTO COLABORADOR_CONTATO_COLC');
        qColaborador.SQL.Add('           (COLC_CODIGO,        ');
        qColaborador.SQL.Add('            COLC_NOME,          ');
        qColaborador.SQL.Add('            COLC_FONE1,         ');
        qColaborador.SQL.Add('            COLC_FONE2,         ');
        qColaborador.SQL.Add('            COLC_CEL1,          ');
        qColaborador.SQL.Add('            COLC_WHATSAPP,      ');
        qColaborador.SQL.Add('            COLC_EMAIL1,        ');
        qColaborador.SQL.Add('            COLC_EMAIL2)        ');
        qColaborador.SQL.Add('     VALUES                     ');
        qColaborador.SQL.Add('          (:COLC_CODIGO,        ');
        qColaborador.SQL.Add('           :COLC_NOME,          ');
        qColaborador.SQL.Add('           :COLC_FONE1,         ');
        qColaborador.SQL.Add('           :COLC_FONE2,         ');
        qColaborador.SQL.Add('           :COLC_CEL1,          ');
        qColaborador.SQL.Add('           :COLC_WHATSAPP,      ');
        qColaborador.SQL.Add('           :COLC_EMAIL1,        ');
        qColaborador.SQL.Add('           :COLC_EMAIL2)        ');
        Preencher_Parametros_COLABORADOR_CONTATO_COLC(qColaborador);
        qColaborador.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Colaborador ' + FNomeFantasia);
       LOGErros('Classe_Colaborador','Erro ao incluir Colaborador ' + FNomeFantasia);
    end;
end;

procedure TColaborador.Preencher_Parametros_COLABORADOR_CONTATO_COLC(pQuery:TFDQuery);
begin
   qColaborador.ParamByName('COLC_CODIGO'  ).AsString := self.FCodigo;
   qColaborador.ParamByName('COLC_NOME'    ).AsString := self.FDetalhes.FContato.Nome;
   qColaborador.ParamByName('COLC_FONE1'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone1);
   qColaborador.ParamByName('COLC_FONE2'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone2);
   qColaborador.ParamByName('COLC_CEL1'    ).AsString := SoNumeros(self.FDetalhes.FContato.Cel);
   qColaborador.ParamByName('COLC_WHATSAPP').AsString := SoNumeros(self.FDetalhes.FContato.WhatsApp);
   qColaborador.ParamByName('COLC_EMAIL1'  ).AsString := self.FDetalhes.FContato.Email1;
   qColaborador.ParamByName('COLC_EMAIL2'  ).AsString := self.FDetalhes.FContato.Email2;
end;

function TColaborador.Inserir_COLABORADOR_DETALHE_COLD: Boolean;
begin
    result := False;
    try
        qColaborador.Close;
        qColaborador.SQL.Clear;
        qColaborador.SQL.Add('INSERT INTO COLABORADOR_DETALHE_COLD ');
        qColaborador.SQL.Add('     (                           ');
        qColaborador.SQL.Add('       COLD_CODIGO,              ');
        qColaborador.SQL.Add('       COLD_PESSOA_FJ,           ');
        qColaborador.SQL.Add('       COLD_NUVEM_ATUALIZADO,    ');
        qColaborador.SQL.Add('       COLD_CPF,                 ');
        qColaborador.SQL.Add('       COLD_CNPJ,                ');
        qColaborador.SQL.Add('       COLD_IE,                  ');
        qColaborador.SQL.Add('       COLD_RG,                  ');
        qColaborador.SQL.Add('       COLD_RG_EMISSOR,          ');
        qColaborador.SQL.Add('       COLD_RG_DTEMISSAO,        ');
        qColaborador.SQL.Add('       COLD_DTNASC,              ');
        qColaborador.SQL.Add('       COLD_SEXO,                ');
        qColaborador.SQL.Add('       COLD_ALT_USU,             ');
        qColaborador.SQL.Add('       COLD_ALT_DT,              ');
        qColaborador.SQL.Add('       COLD_ALT_HR,              ');
        qColaborador.SQL.Add('       COLD_ALT_ESTACAO,         ');
        qColaborador.SQL.Add('       COLD_ALT_DTBLOQUEADO,     ');
        qColaborador.SQL.Add('       COLD_ALT_DTLIBERADO,      ');
        qColaborador.SQL.Add('       COLD_ALT_DTINATIVO,       ');
        qColaborador.SQL.Add('       COLD_CDRAMO,              ');
        qColaborador.SQL.Add('       COLD_CDREGIAO,            ');
        qColaborador.SQL.Add('       COLD_CDZONA,              ');
        qColaborador.SQL.Add('       COLD_TIPO,                ');
        qColaborador.SQL.Add('       COLD_DT                   ');
        qColaborador.SQL.Add('     )                           ');
        qColaborador.SQL.Add('VALUES                           ');
        qColaborador.SQL.Add('     (                           ');
        qColaborador.SQL.Add('      :COLD_CODIGO,              ');
        qColaborador.SQL.Add('      :COLD_PESSOA_FJ,           ');
        qColaborador.SQL.Add('      :COLD_NUVEM_ATUALIZADO,    ');
        qColaborador.SQL.Add('      :COLD_CPF,                 ');
        qColaborador.SQL.Add('      :COLD_CNPJ,                ');
        qColaborador.SQL.Add('      :COLD_IE,                  ');
        qColaborador.SQL.Add('      :COLD_RG,                  ');
        qColaborador.SQL.Add('      :COLD_RG_EMISSOR,          ');
        qColaborador.SQL.Add('      :COLD_RG_DTEMISSAO,        ');
        qColaborador.SQL.Add('      :COLD_DTNASC,              ');
        qColaborador.SQL.Add('      :COLD_SEXO,                ');
        qColaborador.SQL.Add('      :COLD_ALT_USU,             ');
        qColaborador.SQL.Add('      :COLD_ALT_DT,              ');
        qColaborador.SQL.Add('      :COLD_ALT_HR,              ');
        qColaborador.SQL.Add('      :COLD_ALT_ESTACAO,         ');
        qColaborador.SQL.Add('      :COLD_ALT_DTBLOQUEADO,     ');
        qColaborador.SQL.Add('      :COLD_ALT_DTLIBERADO,      ');
        qColaborador.SQL.Add('      :COLD_ALT_DTINATIVO,       ');
        qColaborador.SQL.Add('      :COLD_CDRAMO,              ');
        qColaborador.SQL.Add('      :COLD_CDREGIAO,            ');
        qColaborador.SQL.Add('      :COLD_CDZONA,              ');
        qColaborador.SQL.Add('      :COLD_TIPO,                ');
        qColaborador.SQL.Add('      :COLD_DT                   ');
        qColaborador.SQL.Add('     )                           ');
        qColaborador.ParamByName('COLD_CODIGO'             ).AsString   := FCodigo;
        qColaborador.ParamByName('COLD_NUVEM_ATUALIZADO'   ).AsInteger  := 0;
        qColaborador.ParamByName('COLD_PESSOA_FJ'          ).AsString   := FDetalhes.FTipoPessoa;
        qColaborador.ParamByName('COLD_CPF'                ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qColaborador.ParamByName('COLD_CNPJ'               ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qColaborador.ParamByName('COLD_IE'                 ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qColaborador.ParamByName('COLD_RG'                 ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qColaborador.ParamByName('COLD_RG_EMISSOR'         ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qColaborador.ParamByName('COLD_RG_DTEMISSAO'       ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qColaborador.ParamByName('COLD_DTNASC'             ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qColaborador.ParamByName('COLD_SEXO'               ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qColaborador.ParamByName('COLD_ALT_USU'            ).AsString   := Usuario.Codigo;
        qColaborador.ParamByName('COLD_ALT_DT'             ).AsDateTime := DataServidor;
        qColaborador.ParamByName('COLD_ALT_HR'             ).AsString   := HoraServidor;
        qColaborador.ParamByName('COLD_ALT_ESTACAO'        ).AsString   := NomeComputador;
        qColaborador.ParamByName('COLD_ALT_DTBLOQUEADO'    ).AsDateTime := 0;
        qColaborador.ParamByName('COLD_ALT_DTLIBERADO'     ).AsDateTime := 0;
        qColaborador.ParamByName('COLD_ALT_DTINATIVO'      ).AsDateTime := 0;
        qColaborador.ParamByName('COLD_CDRAMO'             ).AsString   := FDetalhes.FRamoAtividade;
        qColaborador.ParamByName('COLD_CDREGIAO'           ).AsString   := FDetalhes.FRegiao;
        qColaborador.ParamByName('COLD_CDZONA'             ).AsString   := FDetalhes.FZona;
        qColaborador.ParamByName('COLD_TIPO'               ).AsString   := FDetalhes.FTipo;
        qColaborador.ParamByName('COLD_DT'                 ).AsDateTime := DataServidor;
        qColaborador.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Colaborador ' + FNomeFantasia);
       LOGErros('Classe_Colaborador','Erro ao incluir Colaborador ' + FNomeFantasia);
    end;
end;

function TColaborador.Inserir_COLABORADOR_ENDERECO_COLE: Boolean;
begin
    result := False;
    try
        qColaborador.Close;
        qColaborador.SQL.Clear;
        qColaborador.SQL.Add('INSERT INTO COLABORADOR_ENDERECO_COLE');
        qColaborador.SQL.Add('     (                           ');
        qColaborador.SQL.Add('       COLE_CODIGO,              ');
        qColaborador.SQL.Add('       COLE_RUA,                 ');
        qColaborador.SQL.Add('       COLE_NUMERO,              ');
        qColaborador.SQL.Add('       COLE_COMPLEMENTO,         ');
        qColaborador.SQL.Add('       COLE_CDCIDADE,            ');
        qColaborador.SQL.Add('       COLE_BAIRRO,              ');
        qColaborador.SQL.Add('       COLE_CEP                  ');
        qColaborador.SQL.Add('     )                           ');
        qColaborador.SQL.Add('VALUES                           ');
        qColaborador.SQL.Add('     (                           ');
        qColaborador.SQL.Add('      :COLE_CODIGO,              ');
        qColaborador.SQL.Add('      :COLE_RUA,                 ');
        qColaborador.SQL.Add('      :COLE_NUMERO,              ');
        qColaborador.SQL.Add('      :COLE_COMPLEMENTO,         ');
        qColaborador.SQL.Add('      :COLE_CDCIDADE,            ');
        qColaborador.SQL.Add('      :COLE_BAIRRO,              ');
        qColaborador.SQL.Add('      :COLE_CEP                  ');
        qColaborador.SQL.Add('     )                           ');
        qColaborador.ParamByName('COLE_CODIGO'     ).AsString   := FCodigo;
        qColaborador.ParamByName('COLE_RUA'        ).AsString   := FDetalhes.FEndereco.Rua;
        qColaborador.ParamByName('COLE_NUMERO'     ).AsString   := FDetalhes.FEndereco.Numero;
        qColaborador.ParamByName('COLE_COMPLEMENTO').AsString   := FDetalhes.FEndereco.Complemento;
        qColaborador.ParamByName('COLE_CDCIDADE'   ).AsString   := FDetalhes.FEndereco.Cidade;
        qColaborador.ParamByName('COLE_BAIRRO'     ).AsString   := FDetalhes.FEndereco.Bairro;
        qColaborador.ParamByName('COLE_CEP'        ).AsString   := FDetalhes.FEndereco.CEP;
        qColaborador.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Colaborador ' + FNomeFantasia);
       LOGErros('Classe_Colaborador','Erro ao incluir Colaborador ' + FNomeFantasia);
    end;
end;


procedure TColaborador.LimparCampos;
begin
    FNomeFantasia      := '';
    FRazaoSocial       := '';
	  FStatus            := -1;
end;

procedure TColaborador.Pegar_Alteracoes;
begin
    with FAlteracao do
    begin
       Usuario       := qColaborador.FieldByName('COLD_ALT_USU'        ).AsString;
       Data          := qColaborador.FieldByName('COLD_ALT_DT'         ).AsString;
       Hora          := qColaborador.FieldByName('COLD_ALT_HR'         ).AsString;
       Estacao       := qColaborador.FieldByName('COLD_ALT_ESTACAO'    ).AsString;
       DataBloqueio  := qColaborador.FieldByName('COLD_ALT_DTBLOQUEADO').AsString;
       DataLiberacao := qColaborador.FieldByName('COLD_ALT_DTLIBERADO' ).AsString;
       DataInativo   := qColaborador.FieldByName('COLD_ALT_DTINATIVO'  ).AsString;
    end;
end;

procedure TColaborador.Pegar_Contato;
begin
    qColaborador.Close;
    qColaborador.SQL.Clear;
    qColaborador.SQL.Add('SELECT * FROM COLABORADOR_CONTATO_COLC');
    qColaborador.SQL.Add(' WHERE COLC_CODIGO = :COLC_CODIGO ');
    qColaborador.ParamByName('COLC_CODIGO').AsString := FCodigo;
    qColaborador.Open;
    if qColaborador.eof then
    begin
       Inserir_COLABORADOR_CONTATO_COLC;
       exit;
    end;
   Detalhes.FContato.Nome     := qColaborador.FieldByName('COLC_NOME'    ).AsString;
   Detalhes.FContato.Fone1    := qColaborador.FieldByName('COLC_FONE1'   ).AsString;
   Detalhes.FContato.Fone2    := qColaborador.FieldByName('COLC_FONE2'   ).AsString;
   Detalhes.FContato.Cel      := qColaborador.FieldByName('COLC_CEL1'    ).AsString;
   Detalhes.FContato.WhatsApp := qColaborador.FieldByName('COLC_WHATSAPP').AsString;
   Detalhes.FContato.Email1   := qColaborador.FieldByName('COLC_EMAIL1'  ).AsString;
   Detalhes.FContato.Email2   := qColaborador.FieldByName('COLC_EMAIL2'  ).AsString;
end;

procedure TColaborador.Pegar_Dados_Basicos;
begin
    qColaborador.Close;
    qColaborador.SQL.Clear;
    qColaborador.SQL.Add('SELECT * FROM COLABORADOR_COL      ');
    qColaborador.SQL.Add(' WHERE COL_CODIGO = :COL_CODIGO');
    qColaborador.ParamByName('COL_CODIGO').AsString := FCodigo;
    qColaborador.Open;
    if qColaborador.eof then
    begin
       FExiste:=False;
       exit;
    end;
    FExiste                      := True;
    FCodigo                      := qColaborador.FieldByName('COL_CODIGO'                 ).AsString;
    FNomeFantasia                := qColaborador.FieldByName('COL_NOME_FANTASIA'          ).AsString;
    FRazaoSocial                 := qColaborador.FieldByName('COL_RAZAO_SOCIAL'           ).AsString;
    FStatus                      := qColaborador.FieldByName('COL_STATUS'                 ).AsInteger;
end;

procedure TColaborador.Pegar_Detalhes;
begin
    qColaborador.Close;
    qColaborador.SQL.Clear;
    qColaborador.SQL.Add('SELECT * FROM COLABORADOR_DETALHE_COLD');
    qColaborador.SQL.Add(' WHERE COLD_CODIGO = :COLD_CODIGO ');
    qColaborador.ParamByName('COLD_CODIGO').AsString := FCodigo;
    qColaborador.Open;
    if qColaborador.eof then
    begin
       exit;
    end;

    Detalhes.FTipoPessoa         := qColaborador.FieldByName('COLD_PESSOA_FJ'          ).AsString;
    with Detalhes.FPessoaFisica do
    begin
       FCPF                      := qColaborador.FieldByName('COLD_CPF'                ).AsString;
       FRG                       := qColaborador.FieldByName('COLD_RG'                 ).AsString;
       FRG_OrgaoEmissor          := qColaborador.FieldByName('COLD_RG_EMISSOR'         ).AsString;
       FRG_DataEmissao           := qColaborador.FieldByName('COLD_RG_DTEMISSAO'       ).AsDateTime;
       FRG_DataEmissaoString     := BarrasSeDataNula(qColaborador.FieldByName('COLD_RG_DTEMISSAO').AsString);
       FDataNascimento           := qColaborador.FieldByName('COLD_DTNASC'             ).AsDateTime;
       FSexo                     := qColaborador.FieldByName('COLD_SEXO'               ).AsString;
       FDataNascimentoString     := BarrasSeDataNula(qColaborador.FieldByName('COLD_DTNASC' ).AsString);
    end;
    with Detalhes.FPessoaJuridica do
    begin
       FCNPJ                     := qColaborador.FieldByName('COLD_CNPJ'               ).AsString;
       FIE                       := qColaborador.FieldByName('COLD_IE'                 ).AsString;
    end;
    FDetalhes.RamoAtividade      := qColaborador.FieldByName('COLD_CDRAMO'             ).AsString;
    FDetalhes.Regiao             := qColaborador.FieldByName('COLD_CDREGIAO'           ).AsString;
    FDetalhes.Zona               := qColaborador.FieldByName('COLD_CDZONA'             ).AsString;
    FDetalhes.Tipo               := qColaborador.FieldByName('COLD_TIPO'               ).AsString;
    FDetalhes.FDataCadastro      := qColaborador.FieldByName('COLD_DT'                 ).AsDateTime;
    Pegar_Alteracoes;
end;

procedure TColaborador.Pegar_Endereco;
begin
    qColaborador.Close;
    qColaborador.SQL.Clear;
    qColaborador.SQL.Add('SELECT * FROM COLABORADOR_ENDERECO_COLE');
    qColaborador.SQL.Add(' WHERE COLE_CODIGO = :COLE_CODIGO  ');
    qColaborador.ParamByName('COLE_CODIGO').AsString := FCodigo;
    qColaborador.Open;
    if qColaborador.eof then
    begin
       exit;
    end;
    FDetalhes.Endereco.Rua         := qColaborador.FieldByName('COLE_RUA'        ).AsString;
    FDetalhes.Endereco.Numero      := qColaborador.FieldByName('COLE_NUMERO'     ).AsString;
    FDetalhes.Endereco.Complemento := qColaborador.FieldByName('COLE_COMPLEMENTO').AsString;
    FDetalhes.Endereco.Bairro      := qColaborador.FieldByName('COLE_BAIRRO'     ).AsString;
    FDetalhes.Endereco.Cidade      := qColaborador.FieldByName('COLE_CDCIDADE'   ).AsString;
    FDetalhes.Endereco.CEP         := qColaborador.FieldByName('COLE_CEP'        ).AsString;
end;

procedure TColaborador.Pegar_Observacoes;
begin
   FObservacao.Clear;
   qColaborador.Close;
   qColaborador.Sql.Clear;
   qColaborador.Sql.Add('SELECT COLOBS_TEXTO          ');
   qColaborador.Sql.Add('  FROM COLABORADOR_OBS_COLOBS    ');
   qColaborador.Sql.Add(' WHERE COLOBS_CODIGO = :COD  ');
   qColaborador.Sql.Add(' ORDER BY COLOBS_LINHA       ');
   qColaborador.ParamByName('COD').AsString := FCodigo;
   qColaborador.Open;
   while not qColaborador.eof do
   begin
     FObservacao.add(qColaborador.fieldbyname('COLOBS_TEXTO').AsString);
     qColaborador.Next;
   end;
end;

procedure TColaborador.Preencher_Parametros_COLABORADOR_COL(pQuery: TFDQuery);
begin
   pQuery.ParamByName('COL_CODIGO'       ).AsString   := FCodigo;
   pQuery.ParamByName('COL_NOME_FANTASIA').AsString   := FNomeFantasia;
   pQuery.ParamByName('COL_RAZAO_SOCIAL' ).AsString   := FRazaoSocial;
   pQuery.ParamByName('COL_STATUS'       ).AsInteger  := FStatus;
end;

function TColaborador.proximoCodigo: String;
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
    qProximo.SQL.Add('SELECT MAX(COL_CODIGO) AS MAIOR');
    qProximo.SQL.Add('  FROM COLABORADOR_COL             ');
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
       qProximo.SQL.Add('SELECT COL_CODIGO              ');
       qProximo.SQL.Add('  FROM COLABORADOR_COL             ');
       qProximo.SQL.Add(' WHERE COL_CODIGO = :COL_CODIGO');
       qProximo.ParamByName('COL_CODIGO').AsString := sCodigoCandidato;
       qProximo.Open;
       while not qProximo.Eof do
       begin
          qProximo.Close;
          inc(vCodigoCandidato);
          sCodigoCandidato := FormatFloat('#',vCodigoCandidato);
          qProximo.ParamByName('COL_CODIGO').AsString := sCodigoCandidato;
          qProximo.Open;
       end;
       qProximo.Free;
       result := sCodigoCandidato;
       exit;
    end;
end;

procedure TColaborador.RegistrarHistorico(pEvento,pLog: String);
begin
   //Histórico de bloqueios e desbloqueios do colaborador
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('INSERT INTO COLABORADOR_HISTORICO_BLOQUEIOS_COLHB ');
   qLocal.Sql.Add('     ( COLHB_COLABORADOR,                         ');
   qLocal.Sql.Add('       COLHB_EVENTO,                              ');
   qLocal.Sql.Add('       COLHB_DTEVENTO,                            ');
   qLocal.Sql.Add('       COLHB_HREVENTO,                            ');
   qLocal.Sql.Add('       COLHB_USUEVENTO,                           ');
   qLocal.Sql.Add('       COLHB_MAQEVENTO                            ');
   qLocal.Sql.Add('     )                                            ');
   qLocal.Sql.Add('VALUES                                            ');
   qLocal.Sql.Add('     (:COLHB_COLABORADOR,                         ');
   qLocal.Sql.Add('      :COLHB_EVENTO,                              ');
   qLocal.Sql.Add('      :COLHB_DTEVENTO,                            ');
   qLocal.Sql.Add('      :COLHB_HREVENTO,                            ');
   qLocal.Sql.Add('      :COLHB_USUEVENTO,                           ');
   qLocal.Sql.Add('      :COLHB_MAQEVENTO                            ');
   qLocal.Sql.Add('     )                                            ');
   qLocal.ParamByName('COLHB_COLABORADOR').AsString   := FCodigo;
   qLocal.ParamByName('COLHB_EVENTO'     ).AsString   := pEvento;
   qLocal.ParamByName('COLHB_DTEVENTO'   ).AsDateTime := DataServidor;
   qLocal.ParamByName('COLHB_HREVENTO'   ).AsString   := HoraServidor;
   qLocal.ParamByName('COLHB_USUEVENTO'  ).AsString   := Usuario.Codigo;
   qLocal.ParamByName('COLHB_MAQEVENTO'  ).AsString   := NomeComputador;
   qLocal.ExecSql;

   Log('Classe_Colaborador',pLog+' colaborador '+FCodigo+' - '+FNomeFantasia);
end;

procedure TColaborador.RegistrarHistoricoDeAtivacao;
begin
   RegistrarHistorico('Ativado','Ativou');
end;

procedure TColaborador.RegistrarHistoricoDeBloqueio;
begin
   RegistrarHistorico('Bloqueado','Bloqueou');
end;

procedure TColaborador.RegistrarHistoricoDeDesBloqueio;
begin
   RegistrarHistorico('Desbloqueado','Desbloqueou');
end;

procedure TColaborador.RegistrarHistoricoDeInativacao;
begin
   RegistrarHistorico('Inativado','Inativou');
end;

procedure TColaborador.setDetalhes(const Value: tDetalhes_Colaborador);
begin
   FDetalhes := Value;
end;

procedure TColaborador.setFCodigo(const Value: String);
begin
   if Value = '' then
      FCodigo := Copy(proximoCodigo,1,10)
   else
      FCodigo := Copy(Value,1,10);
end;

procedure TColaborador.setFNomeFantasia(const Value: String);
begin
   FNomeFantasia := UpperCase(Copy(Value,1,50));
end;

procedure TColaborador.setFObservacao(const Value: TStringList);
begin
   FObservacao := Value;
end;

procedure TColaborador.setFStatus(const Value: TStatusCadastral);
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

procedure TColaborador.setRazaoSocial(const Value: String);
begin
   FRazaoSocial := UpperCase(Copy(value,1,50));
end;

function TColaborador.Update: Boolean;
begin
    result := false;
    if not Update_COLABORADOR_COL           then exit;
    if not Update_COLABORADOR_DETALHE_COLD  then exit;
    if not Update_COLABORADOR_ENDERECO_COLE then exit;
    if not Update_COLABORADOR_CONTATO_COLC  then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Colaborador','Alterou colaborador '+ FCodigo + ' - ' + FNomeFantasia);
end;

function TColaborador.Update_COLABORADOR_COL:Boolean;
begin
    try
        qColaborador.Close;
        qColaborador.SQL.Clear;
        qColaborador.SQL.Add('UPDATE COLABORADOR_COL                                             ');
        qColaborador.SQL.Add('   SET COL_NOME_FANTASIA           = :COL_NOME_FANTASIA,       ');
        qColaborador.SQL.Add('       COL_RAZAO_SOCIAL            = :COL_RAZAO_SOCIAL,        ');
        qColaborador.SQL.Add('       COL_STATUS                  = :COL_STATUS               ');
        qColaborador.SQL.Add(' WHERE COL_CODIGO                  = :COL_CODIGO               ');
        Preencher_Parametros_COLABORADOR_COL(qColaborador);
        qColaborador.ExecSql;
        Log('Classe_Colaborador','Alterou Colaborador '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Colaborador '+ FNomeFantasia);
       LogErros('Classe_Colaborador','Erro ao alterar Colaborador '+ FNomeFantasia);
    end;
end;

function TColaborador.Update_COLABORADOR_CONTATO_COLC: Boolean;
begin
    if existe_COLABORADOR_CONTATO_COLC then
       result := alterar_COLABORADOR_CONTATO_COLC
    else
       result := inserir_COLABORADOR_CONTATO_COLC;
end;

function TColaborador.alterar_COLABORADOR_CONTATO_COLC: Boolean;
begin
    result := False;
    try
        qColaborador.Close;
        qColaborador.SQL.Clear;
        qColaborador.SQL.Add('UPDATE COLABORADOR_CONTATO_COLC            ');
        qColaborador.SQL.Add('   SET COLC_NOME     = :COLC_NOME,     ');
        qColaborador.SQL.Add('       COLC_FONE1    = :COLC_FONE1,    ');
        qColaborador.SQL.Add('       COLC_FONE2    = :COLC_FONE2,    ');
        qColaborador.SQL.Add('       COLC_CEL1     = :COLC_CEL1,     ');
        qColaborador.SQL.Add('       COLC_WHATSAPP = :COLC_WHATSAPP, ');
        qColaborador.SQL.Add('       COLC_EMAIL1   = :COLC_EMAIL1,   ');
        qColaborador.SQL.Add('       COLC_EMAIL2   = :COLC_EMAIL2    ');
        qColaborador.SQL.Add(' WHERE COLC_CODIGO   = :COLC_CODIGO    ');
        Preencher_Parametros_COLABORADOR_CONTATO_COLC(qColaborador);
        qColaborador.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao alterar Contatos do Colaborador ' + FNomeFantasia);
       LOGErros('Classe_Colaborador','Erro ao Alterar Contatos do Colaborador ' + FNomeFantasia);
    end;
end;

function TColaborador.Update_COLABORADOR_DETALHE_COLD:Boolean;
begin
    if existe_COLABORADOR_DETALHE_COLD then
       result := alterar_COLABORADOR_DETALHE_COLD
    else
       result := inserir_COLABORADOR_DETALHE_COLD;
end;

function TColaborador.alterar_COLABORADOR_DETALHE_COLD:Boolean;
begin
    result := false;
    try
        qColaborador.Close;
        qColaborador.SQL.Clear;
        qColaborador.SQL.Add('UPDATE COLABORADOR_DETALHE_COLD                                  ');
        qColaborador.SQL.Add('   SET COLD_PESSOA_FJ           = :COLD_PESSOA_FJ,           ');
        qColaborador.SQL.Add('       COLD_NUVEM_ATUALIZADO    = :COLD_NUVEM_ATUALIZADO,    ');
        qColaborador.SQL.Add('       COLD_CPF                 = :COLD_CPF,                 ');
        qColaborador.SQL.Add('       COLD_CNPJ                = :COLD_CNPJ,                ');
        qColaborador.SQL.Add('       COLD_IE                  = :COLD_IE,                  ');
        qColaborador.SQL.Add('       COLD_RG                  = :COLD_RG,                  ');
        qColaborador.SQL.Add('       COLD_RG_EMISSOR          = :COLD_RG_EMISSOR,          ');
        qColaborador.SQL.Add('       COLD_RG_DTEMISSAO        = :COLD_RG_DTEMISSAO,        ');
        qColaborador.SQL.Add('       COLD_DTNASC              = :COLD_DTNASC,              ');
        qColaborador.SQL.Add('       COLD_SEXO                = :COLD_SEXO,                ');
        qColaborador.SQL.Add('       COLD_ALT_USU             = :COLD_ALT_USU,             ');
        qColaborador.SQL.Add('       COLD_ALT_DT              = :COLD_ALT_DT,              ');
        qColaborador.SQL.Add('       COLD_ALT_HR              = :COLD_ALT_HR,              ');
        qColaborador.SQL.Add('       COLD_ALT_ESTACAO         = :COLD_ALT_ESTACAO,         ');
        qColaborador.SQL.Add('       COLD_ALT_DTBLOQUEADO     = :COLD_ALT_DTBLOQUEADO,     ');
        qColaborador.SQL.Add('       COLD_ALT_DTLIBERADO      = :COLD_ALT_DTLIBERADO,      ');
        qColaborador.SQL.Add('       COLD_ALT_DTINATIVO       = :COLD_ALT_DTINATIVO,       ');
        qColaborador.SQL.Add('       COLD_CDRAMO              = :COLD_CDRAMO,              ');
        qColaborador.SQL.Add('       COLD_CDREGIAO            = :COLD_CDREGIAO,            ');
        qColaborador.SQL.Add('       COLD_CDZONA              = :COLD_CDZONA,              ');
        qColaborador.SQL.Add('       COLD_TIPO                = :COLD_TIPO                 ');
        qColaborador.SQL.Add(' WHERE COLD_CODIGO              = :COLD_CODIGO               ');
        qColaborador.ParamByName('COLD_CODIGO'          ).AsString   := FCodigo;
        qColaborador.ParamByName('COLD_NUVEM_ATUALIZADO').AsInteger  := 0;
        qColaborador.ParamByName('COLD_PESSOA_FJ'       ).AsString   := FDetalhes.FTipoPessoa;
        qColaborador.ParamByName('COLD_CPF'             ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qColaborador.ParamByName('COLD_CNPJ'            ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qColaborador.ParamByName('COLD_IE'              ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qColaborador.ParamByName('COLD_RG'              ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qColaborador.ParamByName('COLD_RG_EMISSOR'      ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qColaborador.ParamByName('COLD_RG_DTEMISSAO'    ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qColaborador.ParamByName('COLD_DTNASC'          ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qColaborador.ParamByName('COLD_SEXO'            ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qColaborador.ParamByName('COLD_ALT_USU'         ).AsString   := Usuario.Codigo;
        qColaborador.ParamByName('COLD_ALT_DT'          ).AsDateTime := DataServidor;
        qColaborador.ParamByName('COLD_ALT_HR'          ).AsString   := HoraServidor;
        qColaborador.ParamByName('COLD_ALT_ESTACAO'     ).AsString   := NomeComputador;
        qColaborador.ParamByName('COLD_ALT_DTBLOQUEADO' ).AsDateTime := ZeroSeDataNula(FAlteracao.DataBloqueio);
        qColaborador.ParamByName('COLD_ALT_DTLIBERADO'  ).AsDateTime := ZeroSeDataNula(FAlteracao.DataLiberacao);
        qColaborador.ParamByName('COLD_ALT_DTINATIVO'   ).AsDateTime := ZeroSeDataNula(FAlteracao.DataInativo);
        qColaborador.ParamByName('COLD_CDRAMO'          ).AsString   := FDetalhes.FRamoAtividade;
        qColaborador.ParamByName('COLD_CDREGIAO'        ).AsString   := FDetalhes.FRegiao;
        qColaborador.ParamByName('COLD_CDZONA'          ).AsString   := FDetalhes.FZona;
        qColaborador.ParamByName('COLD_TIPO'            ).AsString   := FDetalhes.FTipo;
        qColaborador.ExecSql;

        Log('Classe_Colaborador','Alterou Colaborador '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Detalhes do Colaborador '+ FNomeFantasia);
       LogErros('Classe_Colaborador','Erro ao alterar Detalhes do Colaborador '+ FNomeFantasia);
    end;
end;

function TColaborador.Update_COLABORADOR_ENDERECO_COLE:Boolean;
begin
    if existe_COLABORADOR_ENDERECO_COLE then
       result := alterar_COLABORADOR_ENDERECO_COLE
    else
       result := inserir_COLABORADOR_ENDERECO_COLE;
end;

function TColaborador.alterar_COLABORADOR_ENDERECO_COLE:Boolean;
begin
   try
        qColaborador.Close;
        qColaborador.SQL.Clear;
        qColaborador.SQL.Add('UPDATE COLABORADOR_ENDERECO_COLE                                 ');
        qColaborador.SQL.Add('   SET COLE_RUA                 = :COLE_RUA,                 ');
        qColaborador.SQL.Add('       COLE_NUMERO              = :COLE_NUMERO,              ');
        qColaborador.SQL.Add('       COLE_COMPLEMENTO         = :COLE_COMPLEMENTO,         ');
        qColaborador.SQL.Add('       COLE_BAIRRO              = :COLE_BAIRRO,              ');
        qColaborador.SQL.Add('       COLE_CDCIDADE            = :COLE_CDCIDADE,            ');
        qColaborador.SQL.Add('       COLE_CEP                 = :COLE_CEP                  ');
        qColaborador.SQL.Add(' WHERE COLE_CODIGO              = :COLE_CODIGO               ');
        qColaborador.ParamByName('COLE_CODIGO'          ).AsString   := FCodigo;
        qColaborador.ParamByName('COLE_RUA'             ).AsString   := FDetalhes.FEndereco.Rua;
        qColaborador.ParamByName('COLE_NUMERO'          ).AsString   := FDetalhes.FEndereco.Numero;
        qColaborador.ParamByName('COLE_COMPLEMENTO'     ).AsString   := FDetalhes.FEndereco.Complemento;
        qColaborador.ParamByName('COLE_BAIRRO'          ).AsString   := FDetalhes.FEndereco.Bairro;
        qColaborador.ParamByName('COLE_CDCIDADE'        ).AsString   := FDetalhes.FEndereco.Cidade;
        qColaborador.ParamByName('COLE_CEP'             ).AsString   := FDetalhes.FEndereco.CEP;
        qColaborador.ExecSql;

        Log('Classe_Colaborador','Alterou Colaborador '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Endereço do Colaborador '+ FNomeFantasia);
       LogErros('Classe_Colaborador','Erro ao alterar Endereço do Colaborador '+ FNomeFantasia);
    end;
end;

{ tDetalhes_Colaborador }

constructor tDetalhes_Colaborador.Create;
begin
  qColaborador := TFDQuery.Create(nil);
  qColaborador.ConnectionName :='X';
  FPessoaFisica  := tPessoa_Fisica.Create;
  FPessoaJuridica:= tPessoa_Juridica.Create;
  FEndereco      := TEndereco.Create;
  FContato       := TContato.Create;
end;

destructor tDetalhes_Colaborador.Destroy;
begin
  qColaborador.Free;
  FPessoaFisica.Free;
  FPessoaJuridica.Free;
  FEndereco.Free;
  FContato.Free;
  inherited;
end;

function tDetalhes_Colaborador.getDataCadastroString: String;
begin
   result := DateToStr(FDataCadastro);
end;

{function tDetalhes_Colaborador.getFCodigoMunicipio: String;
begin
   result := FCodigoMunicipio;
end;
}
function tDetalhes_Colaborador.getFDataCadastro: TDateTime;
begin
   result := FDataCadastro;
end;

function tDetalhes_Colaborador.getFRamoAtividade: String;
begin
   result := FRamoAtividade;
end;

function tDetalhes_Colaborador.getFRegiao: String;
begin
   Result := FRegiao;
end;

function tDetalhes_Colaborador.getFTipo: String;
begin
  Result := FTipo;
end;

function tDetalhes_Colaborador.getFTipoPessoa: TTipoPessoa;
begin
   Result := StringToTipoPessoa(FTipoPessoa);
end;

function tDetalhes_Colaborador.getFZona: String;
begin
   Result := FZona;
end;

{
procedure tDetalhes_Colaborador.setFCodigoMunicipio(const Value: String);
begin
   FCodigoMunicipio := Value;
end;
}
procedure tDetalhes_Colaborador.setFDataCadastro(const Value: TDateTime);
begin
   FDataCadastro := Value;
end;

procedure tDetalhes_Colaborador.setFRamoAtividade(const Value: String);
begin
   FRamoAtividade := Copy(Value,1,10);
end;

procedure tDetalhes_Colaborador.setFRegiao(const Value: String);
begin
   FRegiao := Copy(Value,1,10);
end;

procedure tDetalhes_Colaborador.setFTipo(const Value: String);
begin
   FTipo := Copy(Value,1,10);
end;

procedure tDetalhes_Colaborador.setFTipoPessoa(const Value: TTipoPessoa);
begin
   FTipoPessoa := TipoPessoaToString(Value);
end;

procedure tDetalhes_Colaborador.setFZona(const Value: String);
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

