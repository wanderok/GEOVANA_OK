unit Classe_Fornecedor;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
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

  tDetalhes_Fornecedor = class
    private
      FDataCadastro      : TDateTime;
      FTipoPessoa	       : String;
      FPessoaFisica      : tPessoa_Fisica;
      FPessoaJuridica    : tPessoa_Juridica;
      FRamoAtividade     : String;
      FProdutorRural     : Integer;
      FRegiao            : String;
      FZona              : String;
      FEndereco          : TEndereco;
      FContato           : TContato;
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
    function getFProdutorRural: TSimOuNao;
    procedure setFProdutorRural(const Value: TSimOuNao);
      //function getFCodigoMunicipio: String;
      //procedure setFCodigoMunicipio(const Value: String); // FORD_DT

    public
      constructor Create;
      destructor Destroy; override;
      property DataCadastro      : TDateTime        read getFDataCadastro       write setFDataCadastro;
      property DataCadastroString: String           read getDataCadastroString;
      property TipoPessoa        : TTipoPessoa      read getFTipoPessoa         write setFTipoPessoa;
      property PessoaFisica      : tPessoa_Fisica   read FPessoaFisica          write FPessoaFisica;
      property PessoaJuridica    : tPessoa_Juridica read FPessoaJuridica        write FPessoaJuridica;
      property RamoAtividade     : String           read getFRamoAtividade      write setFRamoAtividade;
      property ProdutorRural     : TSimOuNao        read getFProdutorRural      write setFProdutorRural;
      property Regiao            : String           read getFRegiao             write setFRegiao;
      property Zona              : String           read getFZona               write setFZona;
      property Endereco          : TEndereco        read FEndereco              write FEndereco;
      property Contato           : TContato         read FContato               write FContato;
      //property Municipio         : String         read getFCodigoMunicipio    write setFCodigoMunicipio;
end;

  TFornecedorAlteracao = class(TAlteracao);

  TFornecedor = class
  private
    FExiste            : Boolean;
    FCodigo            : String;
    FNomeFantasia      : String;
    FRazaoSocial       : String;
	  FStatus            : Integer;
    FDetalhes          : tDetalhes_Fornecedor;
    FAlteracao         : TFornecedorAlteracao;
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
    function  getDetalhes: tDetalhes_Fornecedor;
    procedure setDetalhes(const Value: tDetalhes_Fornecedor);
    function  Insert:Boolean;
    function  Update:Boolean;
    function  DadosCorretos:Boolean;
    procedure Preencher_Parametros_FORNECEDOR_FOR(pQuery:TFDQuery);
    procedure Preencher_Parametros_FORNECEDOR_CONTATO_FORC(pQuery:TFDQuery);
    procedure Pegar_Dados_Basicos;
    procedure Pegar_Detalhes;
    procedure Pegar_Endereco;
    procedure Pegar_Contato;
    procedure Pegar_Alteracoes;

    procedure Pegar_Observacoes;
    procedure Gravar_Observacoes;
    //
    function Inserir_FORNECEDOR_FOR           :Boolean;
    function Inserir_FORNECEDOR_DETALHE_FORD  :Boolean;
    function Inserir_FORNECEDOR_ENDERECO_FORE :Boolean;
    function Inserir_FORNECEDOR_CONTATO_FORC  :Boolean;
    //
    function Update_FORNECEDOR_FOR:Boolean;

    function Update_FORNECEDOR_DETALHE_FORD:Boolean;
    function existe_FORNECEDOR_DETALHE_FORD:Boolean;
    function alterar_FORNECEDOR_DETALHE_FORD:Boolean;

    function Update_FORNECEDOR_ENDERECO_FORE:Boolean;
    function existe_FORNECEDOR_ENDERECO_FORE: Boolean;
    function alterar_FORNECEDOR_ENDERECO_FORE:BooleAn;

    function Update_FORNECEDOR_CONTATO_FORC:Boolean;
    function existe_FORNECEDOR_CONTATO_FORC: Boolean;
    function alterar_FORNECEDOR_CONTATO_FORC: Boolean;

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
    Property Detalhes      : tDetalhes_Fornecedor read getDetalhes      write setDetalhes;
    property Alteracao     : TFornecedorAlteracao read FAlteracao       write FAlteracao;
    property Observacao    : TStringList       read getFObservacao   write setFObservacao;
    procedure Abrir;
    Function Gravar:Boolean;
end;

implementation

uses FuncoesSMC;

var qFornecedor, qLocal: TFDQuery;

{ TFornecedor }

procedure TFornecedor.Abrir;
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


constructor TFornecedor.Create;
begin
   FDetalhes  := tDetalhes_Fornecedor.Create;
   FAlteracao := TFornecedorAlteracao.Create;
   FObservacao := TStringList.Create;
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName :='X';
end;

function TFornecedor.DadosCorretos: Boolean;
begin
    Result := False;
    // ...criticas...
    Result := True;
end;

destructor TFornecedor.Destroy;
begin
  FDetalhes.Free;
  FAlteracao.Free;
  FObservacao.Free;
  qLocal.Free;
  inherited;
end;

function TFornecedor.existe_FORNECEDOR_DETALHE_FORD: Boolean;
begin
    qFornecedor.Close;
    qFornecedor.SQL.Clear;
    qFornecedor.SQL.Add('SELECT FORD_CODIGO               ');
    qFornecedor.SQL.Add('  FROM FORNECEDOR_DETALHE_FORD      ');
    qFornecedor.SQL.Add(' WHERE FORD_CODIGO = :FORD_CODIGO');
    qFornecedor.ParamByName('FORD_CODIGO').AsString   := FCodigo;
    qFornecedor.Open;
    result := not qFornecedor.Eof;
end;

function TFornecedor.existe_FORNECEDOR_ENDERECO_FORE: Boolean;
begin
    qFornecedor.Close;
    qFornecedor.SQL.Clear;
    qFornecedor.SQL.Add('SELECT FORE_CODIGO               ');
    qFornecedor.SQL.Add('  FROM FORNECEDOR_ENDERECO_FORE      ');
    qFornecedor.SQL.Add(' WHERE FORE_CODIGO = :FORE_CODIGO');
    qFornecedor.ParamByName('FORE_CODIGO').AsString   := FCodigo;
    qFornecedor.Open;
    result := not qFornecedor.Eof;
end;

function TFornecedor.existe_FORNECEDOR_CONTATO_FORC: Boolean;
begin
    qFornecedor.Close;
    qFornecedor.SQL.Clear;
    qFornecedor.SQL.Add('SELECT FORC_CODIGO               ');
    qFornecedor.SQL.Add('  FROM FORNECEDOR_CONTATO_FORC      ');
    qFornecedor.SQL.Add(' WHERE FORC_CODIGO = :FORC_CODIGO');
    qFornecedor.ParamByName('FORC_CODIGO').AsString   := FCodigo;
    qFornecedor.Open;
    result := not qFornecedor.Eof;
end;

function TFornecedor.getDetalhes: tDetalhes_Fornecedor;
begin
   result := FDetalhes;
end;

function TFornecedor.getFCodigo: String;
begin
   result := FCodigo;
end;

function TFornecedor.getFExiste: Boolean;
begin
   Result := FExiste;
end;

function TFornecedor.getFNomeFantasia: String;
begin
   result := FNomeFantasia;
end;

function TFornecedor.getFObservacao: TStringList;
begin
   result := FObservacao;
end;

function TFornecedor.getFStatus: TStatusCadastral;
begin
   Result := IntToStatusCadastral(FStatus);
end;

function TFornecedor.getRazaoSocial: String;
begin
   result := FRazaoSocial;
end;

function TFornecedor.Gravar: Boolean;
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

procedure TFornecedor.Gravar_Observacoes;
var i : Integer;
begin
   qFornecedor.Close;
   qFornecedor.Sql.Clear;
   qFornecedor.Sql.Add('DELETE FROM FORNECEDOR_OBS_FOROBS ');
   qFornecedor.Sql.Add(' WHERE FOROBS_CODIGO = :COD    ');
   qFornecedor.ParamByName('COD').AsString := FCodigo;
   qFornecedor.ExecSql;

   for i := 0 to FObservacao.count-1 do
   begin
      qFornecedor.close;
      qFornecedor.sql.Clear;
      qFornecedor.sql.Add('INSERT INTO FORNECEDOR_OBS_FOROBS   ');
      qFornecedor.sql.Add('     ( FOROBS_CODIGO,            ');
	    qFornecedor.sql.Add('       FOROBS_LINHA,             ');
      qFornecedor.sql.Add('       FOROBS_TEXTO)             ');
      qFornecedor.sql.Add('VALUES                           ');
      qFornecedor.sql.Add('     (:FOROBS_CODIGO,            ');
	    qFornecedor.sql.Add('      :FOROBS_LINHA,             ');
      qFornecedor.sql.Add('      :FOROBS_TEXTO)             ');
      qFornecedor.ParamByName('FOROBS_CODIGO').AsString := FCodigo;
	    qFornecedor.ParamByName('FOROBS_LINHA' ).AsInteger:= i;
      qFornecedor.ParamByName('FOROBS_TEXTO' ).AsString := FObservacao[i];
      qFornecedor.ExecSql;
   end;
end;

function TFornecedor.Insert: Boolean;
begin
    result := False;
    if not Inserir_FORNECEDOR_FOR           then exit;
    if not Inserir_FORNECEDOR_DETALHE_FORD  then exit;
    if not Inserir_FORNECEDOR_ENDERECO_FORE then exit;
    if not Inserir_FORNECEDOR_CONTATO_FORC  then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Fornecedor','Cadastrou fornecedor ' + FCodigo + '-' + FNomeFantasia);
end;

function TFornecedor.Inserir_FORNECEDOR_FOR: Boolean;
begin
    result := False;
    try
        qFornecedor.Close;
        qFornecedor.SQL.Clear;
        qFornecedor.SQL.Add('INSERT INTO FORNECEDOR_FOR   ');
        qFornecedor.SQL.Add('     (                    ');
        qFornecedor.SQL.Add('       FOR_CODIGO,        ');
        qFornecedor.SQL.Add('       FOR_NOME_FANTASIA, ');
        qFornecedor.SQL.Add('       FOR_RAZAO_SOCIAL,  ');
        qFornecedor.SQL.Add('       FOR_STATUS         ');
        qFornecedor.SQL.Add('     )                    ');
        qFornecedor.SQL.Add('VALUES                    ');
        qFornecedor.SQL.Add('     (                    ');
        qFornecedor.SQL.Add('      :FOR_CODIGO,        ');
        qFornecedor.SQL.Add('      :FOR_NOME_FANTASIA, ');
        qFornecedor.SQL.Add('      :FOR_RAZAO_SOCIAL,  ');
        qFornecedor.SQL.Add('      :FOR_STATUS         ');
        qFornecedor.SQL.Add('     )                    ');
        Preencher_Parametros_FORNECEDOR_FOR(qFornecedor);
        qFornecedor.ParamByname('FOR_STATUS').AsInteger := 0;
        qFornecedor.ExecSql;
        result := true
    except
       ShowMessage('Erro ao incluir Fornecedor ' + FNomeFantasia);
       LOGErros('Classe_Fornecedor','Erro ao incluir Fornecedor ' + FNomeFantasia);
    end;
end;

function TFornecedor.Inserir_FORNECEDOR_CONTATO_FORC: Boolean;
begin
    result := False;
    try
        qFornecedor.Close;
        qFornecedor.SQL.Clear;
        qFornecedor.SQL.Add('INSERT INTO FORNECEDOR_CONTATO_FORC');
        qFornecedor.SQL.Add('           (FORC_CODIGO,        ');
        qFornecedor.SQL.Add('            FORC_NOME,          ');
        qFornecedor.SQL.Add('            FORC_FONE1,         ');
        qFornecedor.SQL.Add('            FORC_FONE2,         ');
        qFornecedor.SQL.Add('            FORC_CEL1,          ');
        qFornecedor.SQL.Add('            FORC_WHATSAPP,      ');
        qFornecedor.SQL.Add('            FORC_EMAIL1,        ');
        qFornecedor.SQL.Add('            FORC_EMAIL2)        ');
        qFornecedor.SQL.Add('     VALUES                     ');
        qFornecedor.SQL.Add('          (:FORC_CODIGO,        ');
        qFornecedor.SQL.Add('           :FORC_NOME,          ');
        qFornecedor.SQL.Add('           :FORC_FONE1,         ');
        qFornecedor.SQL.Add('           :FORC_FONE2,         ');
        qFornecedor.SQL.Add('           :FORC_CEL1,          ');
        qFornecedor.SQL.Add('           :FORC_WHATSAPP,      ');
        qFornecedor.SQL.Add('           :FORC_EMAIL1,        ');
        qFornecedor.SQL.Add('           :FORC_EMAIL2)        ');
        Preencher_Parametros_FORNECEDOR_CONTATO_FORC(qFornecedor);
        qFornecedor.ExecSql;
        Result := true;
    except
       ShowMessage('Erro ao incluir Fornecedor ' + FNomeFantasia);
       LOGErros('Classe_Fornecedor','Erro ao incluir Fornecedor ' + FNomeFantasia);
    end;
end;

procedure TFornecedor.Preencher_Parametros_FORNECEDOR_CONTATO_FORC(pQuery:TFDQuery);
begin
   qFornecedor.ParamByName('FORC_CODIGO'  ).AsString := self.FCodigo;
   qFornecedor.ParamByName('FORC_NOME'    ).AsString := self.FDetalhes.FContato.Nome;
   qFornecedor.ParamByName('FORC_FONE1'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone1);
   qFornecedor.ParamByName('FORC_FONE2'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone2);
   qFornecedor.ParamByName('FORC_CEL1'    ).AsString := SoNumeros(self.FDetalhes.FContato.Cel);
   qFornecedor.ParamByName('FORC_WHATSAPP').AsString := SoNumeros(self.FDetalhes.FContato.WhatsApp);
   qFornecedor.ParamByName('FORC_EMAIL1'  ).AsString := self.FDetalhes.FContato.Email1;
   qFornecedor.ParamByName('FORC_EMAIL2'  ).AsString := self.FDetalhes.FContato.Email2;
end;

function TFornecedor.Inserir_FORNECEDOR_DETALHE_FORD: Boolean;
begin
    result := False;
    try
        qFornecedor.Close;
        qFornecedor.SQL.Clear;
        qFornecedor.SQL.Add('INSERT INTO FORNECEDOR_DETALHE_FORD ');
        qFornecedor.SQL.Add('     (                           ');
        qFornecedor.SQL.Add('       FORD_CODIGO,              ');
        qFornecedor.SQL.Add('       FORD_PESSOA_FJ,           ');
        qFornecedor.SQL.Add('       FORD_NUVEM_ATUALIZADO,    ');
        qFornecedor.SQL.Add('       FORD_CPF,                 ');
        qFornecedor.SQL.Add('       FORD_CNPJ,                ');
        qFornecedor.SQL.Add('       FORD_IE,                  ');
        qFornecedor.SQL.Add('       FORD_RG,                  ');
        qFornecedor.SQL.Add('       FORD_RG_EMISSOR,          ');
        qFornecedor.SQL.Add('       FORD_RG_DTEMISSAO,        ');
        qFornecedor.SQL.Add('       FORD_DTNASC,              ');
        qFornecedor.SQL.Add('       FORD_SEXO,                ');
        qFornecedor.SQL.Add('       FORD_ALT_USU,             ');
        qFornecedor.SQL.Add('       FORD_ALT_DT,              ');
        qFornecedor.SQL.Add('       FORD_ALT_HR,              ');
        qFornecedor.SQL.Add('       FORD_ALT_ESTACAO,         ');
        qFornecedor.SQL.Add('       FORD_ALT_DTBLOQUEADO,     ');
        qFornecedor.SQL.Add('       FORD_ALT_DTLIBERADO,      ');
        qFornecedor.SQL.Add('       FORD_ALT_DTINATIVO,       ');
        qFornecedor.SQL.Add('       FORD_PRODUTOR_RURAL,      ');
        qFornecedor.SQL.Add('       FORD_CDRAMO,              ');
        qFornecedor.SQL.Add('       FORD_CDREGIAO,            ');
        qFornecedor.SQL.Add('       FORD_CDZONA,              ');
        qFornecedor.SQL.Add('       FORD_DT                   ');
        qFornecedor.SQL.Add('     )                           ');
        qFornecedor.SQL.Add('VALUES                           ');
        qFornecedor.SQL.Add('     (                           ');
        qFornecedor.SQL.Add('      :FORD_CODIGO,              ');
        qFornecedor.SQL.Add('      :FORD_PESSOA_FJ,           ');
        qFornecedor.SQL.Add('      :FORD_NUVEM_ATUALIZADO,    ');
        qFornecedor.SQL.Add('      :FORD_CPF,                 ');
        qFornecedor.SQL.Add('      :FORD_CNPJ,                ');
        qFornecedor.SQL.Add('      :FORD_IE,                  ');
        qFornecedor.SQL.Add('      :FORD_RG,                  ');
        qFornecedor.SQL.Add('      :FORD_RG_EMISSOR,          ');
        qFornecedor.SQL.Add('      :FORD_RG_DTEMISSAO,        ');
        qFornecedor.SQL.Add('      :FORD_DTNASC,              ');
        qFornecedor.SQL.Add('      :FORD_SEXO,                ');
        qFornecedor.SQL.Add('      :FORD_ALT_USU,             ');
        qFornecedor.SQL.Add('      :FORD_ALT_DT,              ');
        qFornecedor.SQL.Add('      :FORD_ALT_HR,              ');
        qFornecedor.SQL.Add('      :FORD_ALT_ESTACAO,         ');
        qFornecedor.SQL.Add('      :FORD_ALT_DTBLOQUEADO,     ');
        qFornecedor.SQL.Add('      :FORD_ALT_DTLIBERADO,      ');
        qFornecedor.SQL.Add('      :FORD_ALT_DTINATIVO,       ');
        qFornecedor.SQL.Add('      :FORD_PRODUTOR_RURAL,      ');
        qFornecedor.SQL.Add('      :FORD_CDRAMO,              ');
        qFornecedor.SQL.Add('      :FORD_CDREGIAO,            ');
        qFornecedor.SQL.Add('      :FORD_CDZONA,              ');
        qFornecedor.SQL.Add('      :FORD_DT                   ');
        qFornecedor.SQL.Add('     )                           ');
        qFornecedor.ParamByName('FORD_CODIGO'             ).AsString   := FCodigo;
        qFornecedor.ParamByName('FORD_NUVEM_ATUALIZADO'   ).AsInteger  := 0;
        qFornecedor.ParamByName('FORD_PESSOA_FJ'          ).AsString   := FDetalhes.FTipoPessoa;
        qFornecedor.ParamByName('FORD_CPF'                ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qFornecedor.ParamByName('FORD_CNPJ'               ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qFornecedor.ParamByName('FORD_IE'                 ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qFornecedor.ParamByName('FORD_RG'                 ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qFornecedor.ParamByName('FORD_RG_EMISSOR'         ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qFornecedor.ParamByName('FORD_RG_DTEMISSAO'       ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qFornecedor.ParamByName('FORD_DTNASC'             ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qFornecedor.ParamByName('FORD_SEXO'               ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qFornecedor.ParamByName('FORD_ALT_USU'            ).AsString   := Usuario.Codigo;
        qFornecedor.ParamByName('FORD_ALT_DT'             ).AsDateTime := DataServidor;
        qFornecedor.ParamByName('FORD_ALT_HR'             ).AsString   := HoraServidor;
        qFornecedor.ParamByName('FORD_ALT_ESTACAO'        ).AsString   := NomeComputador;
        qFornecedor.ParamByName('FORD_ALT_DTBLOQUEADO'    ).AsDateTime := 0;
        qFornecedor.ParamByName('FORD_ALT_DTLIBERADO'     ).AsDateTime := 0;
        qFornecedor.ParamByName('FORD_ALT_DTINATIVO'      ).AsDateTime := 0;
        qFornecedor.ParamByName('FORD_PRODUTOR_RURAL'     ).AsInteger  := FDetalhes.FProdutorRural;
        qFornecedor.ParamByName('FORD_CDRAMO'             ).AsString   := FDetalhes.FRamoAtividade;
        qFornecedor.ParamByName('FORD_CDREGIAO'           ).AsString   := FDetalhes.FRegiao;
        qFornecedor.ParamByName('FORD_CDZONA'             ).AsString   := FDetalhes.FZona;
        qFornecedor.ParamByName('FORD_DT'                 ).AsDateTime := DataServidor;
        qFornecedor.ExecSql;
        Result := true;
    except
       ShowMessage('Erro ao incluir Fornecedor ' + FNomeFantasia);
       LOGErros('Classe_Fornecedor','Erro ao incluir Fornecedor ' + FNomeFantasia);
    end;
end;

function TFornecedor.Inserir_FORNECEDOR_ENDERECO_FORE: Boolean;
begin
    result := False;
    try
        qFornecedor.Close;
        qFornecedor.SQL.Clear;
        qFornecedor.SQL.Add('INSERT INTO FORNECEDOR_ENDERECO_FORE');
        qFornecedor.SQL.Add('     (                           ');
        qFornecedor.SQL.Add('       FORE_CODIGO,              ');
        qFornecedor.SQL.Add('       FORE_RUA,                 ');
        qFornecedor.SQL.Add('       FORE_NUMERO,              ');
        qFornecedor.SQL.Add('       FORE_COMPLEMENTO,         ');
        qFornecedor.SQL.Add('       FORE_CDCIDADE,            ');
        qFornecedor.SQL.Add('       FORE_BAIRRO,              ');
        qFornecedor.SQL.Add('       FORE_CEP                  ');
        qFornecedor.SQL.Add('     )                           ');
        qFornecedor.SQL.Add('VALUES                           ');
        qFornecedor.SQL.Add('     (                           ');
        qFornecedor.SQL.Add('      :FORE_CODIGO,              ');
        qFornecedor.SQL.Add('      :FORE_RUA,                 ');
        qFornecedor.SQL.Add('      :FORE_NUMERO,              ');
        qFornecedor.SQL.Add('      :FORE_COMPLEMENTO,         ');
        qFornecedor.SQL.Add('      :FORE_CDCIDADE,            ');
        qFornecedor.SQL.Add('      :FORE_BAIRRO,              ');
        qFornecedor.SQL.Add('      :FORE_CEP                  ');
        qFornecedor.SQL.Add('     )                           ');
        qFornecedor.ParamByName('FORE_CODIGO'     ).AsString   := FCodigo;
        qFornecedor.ParamByName('FORE_RUA'        ).AsString   := FDetalhes.FEndereco.Rua;
        qFornecedor.ParamByName('FORE_NUMERO'     ).AsString   := FDetalhes.FEndereco.Numero;
        qFornecedor.ParamByName('FORE_COMPLEMENTO').AsString   := FDetalhes.FEndereco.Complemento;
        qFornecedor.ParamByName('FORE_CDCIDADE'   ).AsString   := FDetalhes.FEndereco.Cidade;
        qFornecedor.ParamByName('FORE_BAIRRO'     ).AsString   := FDetalhes.FEndereco.Bairro;
        qFornecedor.ParamByName('FORE_CEP'        ).AsString   := FDetalhes.FEndereco.CEP;
        qFornecedor.ExecSql;
        Result := true;
    except
       ShowMessage('Erro ao incluir Fornecedor ' + FNomeFantasia);
       LOGErros('Classe_Fornecedor','Erro ao incluir Fornecedor ' + FNomeFantasia);
    end;
end;


procedure TFornecedor.LimparCampos;
begin
    FNomeFantasia      := '';
    FRazaoSocial       := '';
	  FStatus            := -1;
end;

procedure TFornecedor.Pegar_Alteracoes;
begin
    with FAlteracao do
    begin
       Usuario       := qFornecedor.FieldByName('FORD_ALT_USU'        ).AsString;
       Data          := qFornecedor.FieldByName('FORD_ALT_DT'         ).AsString;
       Hora          := qFornecedor.FieldByName('FORD_ALT_HR'         ).AsString;
       Estacao       := qFornecedor.FieldByName('FORD_ALT_ESTACAO'    ).AsString;
       DataBloqueio  := qFornecedor.FieldByName('FORD_ALT_DTBLOQUEADO').AsString;
       DataLiberacao := qFornecedor.FieldByName('FORD_ALT_DTLIBERADO' ).AsString;
       DataInativo   := qFornecedor.FieldByName('FORD_ALT_DTINATIVO'  ).AsString;
    end;
end;

procedure TFornecedor.Pegar_Contato;
begin
    qFornecedor.Close;
    qFornecedor.SQL.Clear;
    qFornecedor.SQL.Add('SELECT * FROM FORNECEDOR_CONTATO_FORC');
    qFornecedor.SQL.Add(' WHERE FORC_CODIGO = :FORC_CODIGO    ');
    qFornecedor.ParamByName('FORC_CODIGO').AsString := FCodigo;
    qFornecedor.Open;
    if qFornecedor.eof then
    begin
       Inserir_FORNECEDOR_CONTATO_FORC;
       exit;
    end;
   Detalhes.FContato.Nome     := qFornecedor.FieldByName('FORC_NOME'    ).AsString;
   Detalhes.FContato.Fone1    := qFornecedor.FieldByName('FORC_FONE1'   ).AsString;
   Detalhes.FContato.Fone2    := qFornecedor.FieldByName('FORC_FONE2'   ).AsString;
   Detalhes.FContato.Cel      := qFornecedor.FieldByName('FORC_CEL1'    ).AsString;
   Detalhes.FContato.WhatsApp := qFornecedor.FieldByName('FORC_WHATSAPP').AsString;
   Detalhes.FContato.Email1   := qFornecedor.FieldByName('FORC_EMAIL1'  ).AsString;
   Detalhes.FContato.Email2   := qFornecedor.FieldByName('FORC_EMAIL2'  ).AsString;
end;

procedure TFornecedor.Pegar_Dados_Basicos;
begin
    qFornecedor.Close;
    qFornecedor.SQL.Clear;
    qFornecedor.SQL.Add('SELECT * FROM FORNECEDOR_FOR   ');
    qFornecedor.SQL.Add(' WHERE FOR_CODIGO = :FOR_CODIGO');
    qFornecedor.ParamByName('FOR_CODIGO').AsString := FCodigo;
    qFornecedor.Open;
    if qFornecedor.eof then
    begin
       FExiste:=False;
       exit;
    end;
    FExiste                      := True;
    FCodigo                      := qFornecedor.FieldByName('FOR_CODIGO'                 ).AsString;
    FNomeFantasia                := qFornecedor.FieldByName('FOR_NOME_FANTASIA'          ).AsString;
    FRazaoSocial                 := qFornecedor.FieldByName('FOR_RAZAO_SOCIAL'           ).AsString;
    FStatus                      := qFornecedor.FieldByName('FOR_STATUS'                 ).AsInteger;
end;

procedure TFornecedor.Pegar_Detalhes;
begin
    qFornecedor.Close;
    qFornecedor.SQL.Clear;
    qFornecedor.SQL.Add('SELECT * FROM FORNECEDOR_DETALHE_FORD');
    qFornecedor.SQL.Add(' WHERE FORD_CODIGO = :FORD_CODIGO    ');
    qFornecedor.ParamByName('FORD_CODIGO').AsString := FCodigo;
    qFornecedor.Open;
    if qFornecedor.eof then
    begin
       exit;
    end;

    Detalhes.FTipoPessoa         := qFornecedor.FieldByName('FORD_PESSOA_FJ'          ).AsString;
    with Detalhes.FPessoaFisica do
    begin
       FCPF                      := qFornecedor.FieldByName('FORD_CPF'                ).AsString;
       FRG                       := qFornecedor.FieldByName('FORD_RG'                 ).AsString;
       FRG_OrgaoEmissor          := qFornecedor.FieldByName('FORD_RG_EMISSOR'         ).AsString;
       FRG_DataEmissao           := qFornecedor.FieldByName('FORD_RG_DTEMISSAO'       ).AsDateTime;
       FRG_DataEmissaoString     := BarrasSeDataNula(qFornecedor.FieldByName('FORD_RG_DTEMISSAO').AsString);
       FDataNascimento           := qFornecedor.FieldByName('FORD_DTNASC'             ).AsDateTime;
       FSexo                     := qFornecedor.FieldByName('FORD_SEXO'               ).AsString;
       FDataNascimentoString     := BarrasSeDataNula(qFornecedor.FieldByName('FORD_DTNASC' ).AsString);
    end;
    with Detalhes.FPessoaJuridica do
    begin
       FCNPJ                     := qFornecedor.FieldByName('FORD_CNPJ'               ).AsString;
       FIE                       := qFornecedor.FieldByName('FORD_IE'                 ).AsString;
    end;
    FDetalhes.FRamoAtividade     := qFornecedor.FieldByName('FORD_CDRAMO'             ).AsString;
    FDetalhes.FProdutorRural     := qFornecedor.FieldByName('FORD_PRODUTOR_RURAL'     ).AsInteger;
    FDetalhes.FRegiao            := qFornecedor.FieldByName('FORD_CDREGIAO'           ).AsString;
    FDetalhes.FZona              := qFornecedor.FieldByName('FORD_CDZONA'             ).AsString;
    FDetalhes.FDataCadastro      := qFornecedor.FieldByName('FORD_DT'                 ).AsDateTime;
    Pegar_Alteracoes;
end;

procedure TFornecedor.Pegar_Endereco;
begin
    qFornecedor.Close;
    qFornecedor.SQL.Clear;
    qFornecedor.SQL.Add('SELECT * FROM FORNECEDOR_ENDERECO_FORE');
    qFornecedor.SQL.Add(' WHERE FORE_CODIGO = :FORE_CODIGO  ');
    qFornecedor.ParamByName('FORE_CODIGO').AsString := FCodigo;
    qFornecedor.Open;
    if qFornecedor.eof then
    begin
       exit;
    end;
    FDetalhes.Endereco.Rua         := qFornecedor.FieldByName('FORE_RUA'        ).AsString;
    FDetalhes.Endereco.Numero      := qFornecedor.FieldByName('FORE_NUMERO'     ).AsString;
    FDetalhes.Endereco.Complemento := qFornecedor.FieldByName('FORE_COMPLEMENTO').AsString;
    FDetalhes.Endereco.Bairro      := qFornecedor.FieldByName('FORE_BAIRRO'     ).AsString;
    FDetalhes.Endereco.Cidade      := qFornecedor.FieldByName('FORE_CDCIDADE'   ).AsString;
    FDetalhes.Endereco.CEP         := qFornecedor.FieldByName('FORE_CEP'        ).AsString;
end;

procedure TFornecedor.Pegar_Observacoes;
begin
   FObservacao.Clear;
   qFornecedor.Close;
   qFornecedor.Sql.Clear;
   qFornecedor.Sql.Add('SELECT FOROBS_TEXTO          ');
   qFornecedor.Sql.Add('  FROM FORNECEDOR_OBS_FOROBS ');
   qFornecedor.Sql.Add(' WHERE FOROBS_CODIGO = :COD  ');
   qFornecedor.Sql.Add(' ORDER BY FOROBS_LINHA       ');
   qFornecedor.ParamByName('COD').AsString := FCodigo;
   qFornecedor.Open;
   while not qFornecedor.eof do
   begin
     FObservacao.add(qFornecedor.fieldbyname('FOROBS_TEXTO').AsString);
     qFornecedor.Next;
   end;
end;

procedure TFornecedor.Preencher_Parametros_FORNECEDOR_FOR(pQuery: TFDQuery);
begin
   pQuery.ParamByName('FOR_CODIGO'       ).AsString   := FCodigo;
   pQuery.ParamByName('FOR_NOME_FANTASIA').AsString   := FNomeFantasia;
   pQuery.ParamByName('FOR_RAZAO_SOCIAL' ).AsString   := FRazaoSocial;
   pQuery.ParamByName('FOR_STATUS'       ).AsInteger  := FStatus;
end;

function TFornecedor.proximoCodigo: String;
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
    qProximo.SQL.Add('SELECT MAX(FOR_CODIGO) AS MAIOR');
    qProximo.SQL.Add('  FROM FORNECEDOR_FOR             ');
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
       qProximo.SQL.Add('SELECT FOR_CODIGO              ');
       qProximo.SQL.Add('  FROM FORNECEDOR_FOR             ');
       qProximo.SQL.Add(' WHERE FOR_CODIGO = :FOR_CODIGO');
       qProximo.ParamByName('FOR_CODIGO').AsString := sCodigoCandidato;
       qProximo.Open;
       while not qProximo.Eof do
       begin
          qProximo.Close;
          inc(vCodigoCandidato);
          sCodigoCandidato := FormatFloat('#',vCodigoCandidato);
          qProximo.ParamByName('FOR_CODIGO').AsString := sCodigoCandidato;
          qProximo.Open;
       end;
       qProximo.Free;
       result := sCodigoCandidato;
       exit;
    end;
end;

procedure TFornecedor.RegistrarHistorico(pEvento,pLog: String);
begin
   //Histórico de bloqueios e desbloqueios do fornecedor
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('INSERT INTO FORNECEDOR_HISTORICO_BLOQUEIOS_FHB ');
   qLocal.Sql.Add('     ( FHB_FORNECEDOR,                         ');
   qLocal.Sql.Add('       FHB_EVENTO,                             ');
   qLocal.Sql.Add('       FHB_DTEVENTO,                           ');
   qLocal.Sql.Add('       FHB_HREVENTO,                           ');
   qLocal.Sql.Add('       FHB_USUEVENTO,                          ');
   qLocal.Sql.Add('       FHB_MAQEVENTO                           ');
   qLocal.Sql.Add('     )                                         ');
   qLocal.Sql.Add('VALUES                                         ');
   qLocal.Sql.Add('     (:FHB_FORNECEDOR,                         ');
   qLocal.Sql.Add('      :FHB_EVENTO,                             ');
   qLocal.Sql.Add('      :FHB_DTEVENTO,                           ');
   qLocal.Sql.Add('      :FHB_HREVENTO,                           ');
   qLocal.Sql.Add('      :FHB_USUEVENTO,                          ');
   qLocal.Sql.Add('      :FHB_MAQEVENTO                           ');
   qLocal.Sql.Add('     )                                                                                                           ');
   qLocal.ParamByName('FHB_FORNECEDOR').AsString   := FCodigo;
   qLocal.ParamByName('FHB_EVENTO'    ).AsString   := pEvento;
   qLocal.ParamByName('FHB_DTEVENTO'  ).AsDateTime := DataServidor;
   qLocal.ParamByName('FHB_HREVENTO'  ).AsString   := HoraServidor;
   qLocal.ParamByName('FHB_USUEVENTO' ).AsString   := Usuario.Codigo;
   qLocal.ParamByName('FHB_MAQEVENTO' ).AsString   := NomeComputador;
   qLocal.ExecSql;

   Log('Classe_Fornecedor',pLog+' fornecedor '+FCodigo+' - '+FNomeFantasia);
end;

procedure TFornecedor.RegistrarHistoricoDeAtivacao;
begin
   RegistrarHistorico('Ativado','Ativou');
end;

procedure TFornecedor.RegistrarHistoricoDeBloqueio;
begin
   RegistrarHistorico('Bloqueado','Bloqueou');
end;

procedure TFornecedor.RegistrarHistoricoDeDesBloqueio;
begin
   RegistrarHistorico('Desbloqueado','Desbloqueou');
end;

procedure TFornecedor.RegistrarHistoricoDeInativacao;
begin
   RegistrarHistorico('Inativado','Inativou');
end;

procedure TFornecedor.setDetalhes(const Value: tDetalhes_Fornecedor);
begin
   FDetalhes := Value;
end;

procedure TFornecedor.setFCodigo(const Value: String);
begin
   if Value = '' then
      FCodigo := Copy(proximoCodigo,1,10)
   else
      FCodigo := Copy(Value,1,10);
end;

procedure TFornecedor.setFNomeFantasia(const Value: String);
begin
   FNomeFantasia := UpperCase(Copy(Value,1,50));
end;

procedure TFornecedor.setFObservacao(const Value: TStringList);
begin
   FObservacao := Value;
end;

procedure TFornecedor.setFStatus(const Value: TStatusCadastral);
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

procedure TFornecedor.setRazaoSocial(const Value: String);
begin
   FRazaoSocial := UpperCase(Copy(value,1,50));
end;

function TFornecedor.Update: Boolean;
begin
    result := false;
    if not Update_FORNECEDOR_FOR           then exit;
    if not Update_FORNECEDOR_DETALHE_FORD  then exit;
    if not Update_FORNECEDOR_ENDERECO_FORE then exit;
    if not Update_FORNECEDOR_CONTATO_FORC  then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Fornecedor','Alterou fornecedor '+ FCodigo + ' - ' + FNomeFantasia);
end;

function TFornecedor.Update_FORNECEDOR_FOR:Boolean;
begin
    try
        qFornecedor.Close;
        qFornecedor.SQL.Clear;
        qFornecedor.SQL.Add('UPDATE FORNECEDOR_FOR                                             ');
        qFornecedor.SQL.Add('   SET FOR_NOME_FANTASIA           = :FOR_NOME_FANTASIA,       ');
        qFornecedor.SQL.Add('       FOR_RAZAO_SOCIAL            = :FOR_RAZAO_SOCIAL,        ');
        qFornecedor.SQL.Add('       FOR_STATUS                  = :FOR_STATUS               ');
        qFornecedor.SQL.Add(' WHERE FOR_CODIGO                  = :FOR_CODIGO               ');
        Preencher_Parametros_FORNECEDOR_FOR(qFornecedor);
        qFornecedor.ExecSql;
        Log('Classe_Fornecedor','Alterou Fornecedor '+ FNomeFantasia);
        Result := True;
    except
       ShowMessage('Erro ao alterar Fornecedor '+ FNomeFantasia);
       LogErros('Classe_Fornecedor','Erro ao alterar Fornecedor '+ FNomeFantasia);
    end;
end;

function TFornecedor.Update_FORNECEDOR_CONTATO_FORC: Boolean;
begin
    if existe_FORNECEDOR_CONTATO_FORC then
       result := alterar_FORNECEDOR_CONTATO_FORC
    else
       result := inserir_FORNECEDOR_CONTATO_FORC;
end;

function TFornecedor.alterar_FORNECEDOR_CONTATO_FORC: Boolean;
begin
    result := False;
    try
        qFornecedor.Close;
        qFornecedor.SQL.Clear;
        qFornecedor.SQL.Add('UPDATE FORNECEDOR_CONTATO_FORC            ');
        qFornecedor.SQL.Add('   SET FORC_NOME     = :FORC_NOME,     ');
        qFornecedor.SQL.Add('       FORC_FONE1    = :FORC_FONE1,    ');
        qFornecedor.SQL.Add('       FORC_FONE2    = :FORC_FONE2,    ');
        qFornecedor.SQL.Add('       FORC_CEL1     = :FORC_CEL1,     ');
        qFornecedor.SQL.Add('       FORC_WHATSAPP = :FORC_WHATSAPP, ');
        qFornecedor.SQL.Add('       FORC_EMAIL1   = :FORC_EMAIL1,   ');
        qFornecedor.SQL.Add('       FORC_EMAIL2   = :FORC_EMAIL2    ');
        qFornecedor.SQL.Add(' WHERE FORC_CODIGO   = :FORC_CODIGO    ');
        Preencher_Parametros_FORNECEDOR_CONTATO_FORC(qFornecedor);
        qFornecedor.ExecSql;
        Result := true;
    except
       ShowMessage('Erro ao alterar Contatos do Fornecedor ' + FNomeFantasia);
       LOGErros('Classe_Fornecedor','Erro ao Alterar Contatos do Fornecedor ' + FNomeFantasia);
    end;
end;

function TFornecedor.Update_FORNECEDOR_DETALHE_FORD:Boolean;
begin
    if existe_FORNECEDOR_DETALHE_FORD then
       result := alterar_FORNECEDOR_DETALHE_FORD
    else
       result := inserir_FORNECEDOR_DETALHE_FORD;
end;

function TFornecedor.alterar_FORNECEDOR_DETALHE_FORD:Boolean;
begin
    result := false;
    try
        qFornecedor.Close;
        qFornecedor.SQL.Clear;
        qFornecedor.SQL.Add('UPDATE FORNECEDOR_DETALHE_FORD                                  ');
        qFornecedor.SQL.Add('   SET FORD_PESSOA_FJ           = :FORD_PESSOA_FJ,           ');
        qFornecedor.SQL.Add('       FORD_NUVEM_ATUALIZADO    = :FORD_NUVEM_ATUALIZADO,    ');
        qFornecedor.SQL.Add('       FORD_CPF                 = :FORD_CPF,                 ');
        qFornecedor.SQL.Add('       FORD_CNPJ                = :FORD_CNPJ,                ');
        qFornecedor.SQL.Add('       FORD_IE                  = :FORD_IE,                  ');
        qFornecedor.SQL.Add('       FORD_RG                  = :FORD_RG,                  ');
        qFornecedor.SQL.Add('       FORD_RG_EMISSOR          = :FORD_RG_EMISSOR,          ');
        qFornecedor.SQL.Add('       FORD_RG_DTEMISSAO        = :FORD_RG_DTEMISSAO,        ');
        qFornecedor.SQL.Add('       FORD_DTNASC              = :FORD_DTNASC,              ');
        qFornecedor.SQL.Add('       FORD_SEXO                = :FORD_SEXO,                ');
        qFornecedor.SQL.Add('       FORD_ALT_USU             = :FORD_ALT_USU,             ');
        qFornecedor.SQL.Add('       FORD_ALT_DT              = :FORD_ALT_DT,              ');
        qFornecedor.SQL.Add('       FORD_ALT_HR              = :FORD_ALT_HR,              ');
        qFornecedor.SQL.Add('       FORD_ALT_ESTACAO         = :FORD_ALT_ESTACAO,         ');
        qFornecedor.SQL.Add('       FORD_ALT_DTBLOQUEADO     = :FORD_ALT_DTBLOQUEADO,     ');
        qFornecedor.SQL.Add('       FORD_ALT_DTLIBERADO      = :FORD_ALT_DTLIBERADO,      ');
        qFornecedor.SQL.Add('       FORD_ALT_DTINATIVO       = :FORD_ALT_DTINATIVO,       ');
        qFornecedor.SQL.Add('       FORD_PRODUTOR_RURAL      = :FORD_PRODUTOR_RURAL,      ');
        qFornecedor.SQL.Add('       FORD_CDRAMO              = :FORD_CDRAMO,              ');
        qFornecedor.SQL.Add('       FORD_CDREGIAO            = :FORD_CDREGIAO,            ');
        qFornecedor.SQL.Add('       FORD_CDZONA              = :FORD_CDZONA               ');
        qFornecedor.SQL.Add(' WHERE FORD_CODIGO              = :FORD_CODIGO               ');
        qFornecedor.ParamByName('FORD_CODIGO'          ).AsString   := FCodigo;
        qFornecedor.ParamByName('FORD_NUVEM_ATUALIZADO').AsInteger  := 0;
        qFornecedor.ParamByName('FORD_PESSOA_FJ'       ).AsString   := FDetalhes.FTipoPessoa;
        qFornecedor.ParamByName('FORD_CPF'             ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qFornecedor.ParamByName('FORD_CNPJ'            ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qFornecedor.ParamByName('FORD_IE'              ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qFornecedor.ParamByName('FORD_RG'              ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qFornecedor.ParamByName('FORD_RG_EMISSOR'      ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qFornecedor.ParamByName('FORD_RG_DTEMISSAO'    ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qFornecedor.ParamByName('FORD_DTNASC'          ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qFornecedor.ParamByName('FORD_SEXO'            ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qFornecedor.ParamByName('FORD_ALT_USU'         ).AsString   := Usuario.Codigo;
        qFornecedor.ParamByName('FORD_ALT_DT'          ).AsDateTime := DataServidor;
        qFornecedor.ParamByName('FORD_ALT_HR'          ).AsString   := HoraServidor;
        qFornecedor.ParamByName('FORD_ALT_ESTACAO'     ).AsString   := NomeComputador;
        qFornecedor.ParamByName('FORD_ALT_DTBLOQUEADO' ).AsDateTime := ZeroSeDataNula(FAlteracao.DataBloqueio);
        qFornecedor.ParamByName('FORD_ALT_DTLIBERADO'  ).AsDateTime := ZeroSeDataNula(FAlteracao.DataLiberacao);
        qFornecedor.ParamByName('FORD_ALT_DTINATIVO'   ).AsDateTime := ZeroSeDataNula(FAlteracao.DataInativo);
        qFornecedor.ParamByName('FORD_PRODUTOR_RURAL'  ).AsInteger  := FDetalhes.FProdutorRural;
        qFornecedor.ParamByName('FORD_CDRAMO'          ).AsString   := FDetalhes.FRamoAtividade;
        qFornecedor.ParamByName('FORD_CDREGIAO'        ).AsString   := FDetalhes.FRegiao;
        qFornecedor.ParamByName('FORD_CDZONA'          ).AsString   := FDetalhes.FZona;
        qFornecedor.ExecSql;

        Log('Classe_Fornecedor','Alterou Fornecedor '+ FNomeFantasia);
        Result := True;
    except
       ShowMessage('Erro ao alterar Detalhes do Fornecedor '+ FNomeFantasia);
       LogErros('Classe_Fornecedor','Erro ao alterar Detalhes do Fornecedor '+ FNomeFantasia);
    end;
end;

function TFornecedor.Update_FORNECEDOR_ENDERECO_FORE:Boolean;
begin
    if existe_FORNECEDOR_ENDERECO_FORE then
       result := alterar_FORNECEDOR_ENDERECO_FORE
    else
       result := inserir_FORNECEDOR_ENDERECO_FORE;
end;

function TFornecedor.alterar_FORNECEDOR_ENDERECO_FORE:Boolean;
begin
   try
        qFornecedor.Close;
        qFornecedor.SQL.Clear;
        qFornecedor.SQL.Add('UPDATE FORNECEDOR_ENDERECO_FORE                                 ');
        qFornecedor.SQL.Add('   SET FORE_RUA                 = :FORE_RUA,                 ');
        qFornecedor.SQL.Add('       FORE_NUMERO              = :FORE_NUMERO,              ');
        qFornecedor.SQL.Add('       FORE_COMPLEMENTO         = :FORE_COMPLEMENTO,         ');
        qFornecedor.SQL.Add('       FORE_BAIRRO              = :FORE_BAIRRO,              ');
        qFornecedor.SQL.Add('       FORE_CDCIDADE            = :FORE_CDCIDADE,            ');
        qFornecedor.SQL.Add('       FORE_CEP                 = :FORE_CEP                  ');
        qFornecedor.SQL.Add(' WHERE FORE_CODIGO              = :FORE_CODIGO               ');
        qFornecedor.ParamByName('FORE_CODIGO'          ).AsString   := FCodigo;
        qFornecedor.ParamByName('FORE_RUA'             ).AsString   := FDetalhes.FEndereco.Rua;
        qFornecedor.ParamByName('FORE_NUMERO'          ).AsString   := FDetalhes.FEndereco.Numero;
        qFornecedor.ParamByName('FORE_COMPLEMENTO'     ).AsString   := FDetalhes.FEndereco.Complemento;
        qFornecedor.ParamByName('FORE_BAIRRO'          ).AsString   := FDetalhes.FEndereco.Bairro;
        qFornecedor.ParamByName('FORE_CDCIDADE'        ).AsString   := FDetalhes.FEndereco.Cidade;
        qFornecedor.ParamByName('FORE_CEP'             ).AsString   := FDetalhes.FEndereco.CEP;
        qFornecedor.ExecSql;

        Log('Classe_Fornecedor','Alterou Fornecedor '+ FNomeFantasia);
        Result := True;
    except
       ShowMessage('Erro ao alterar Endereço do Fornecedor '+ FNomeFantasia);
       LogErros('Classe_Fornecedor','Erro ao alterar Endereço do Fornecedor '+ FNomeFantasia);
    end;
end;

{ tDetalhes_Fornecedor }

constructor tDetalhes_Fornecedor.Create;
begin
  qFornecedor := TFDQuery.Create(nil);
  qFornecedor.ConnectionName :='X';
  FPessoaFisica  := tPessoa_Fisica.Create;
  FPessoaJuridica:= tPessoa_Juridica.Create;
  FEndereco      := TEndereco.Create;
  FContato       := TContato.Create;
end;

destructor tDetalhes_Fornecedor.Destroy;
begin
  qFornecedor.Free;
  FPessoaFisica.Free;
  FPessoaJuridica.Free;
  FEndereco.Free;
  FContato.Free;
  inherited;
end;

function tDetalhes_Fornecedor.getDataCadastroString: String;
begin
   result := DateToStr(FDataCadastro);
end;

{function tDetalhes_Fornecedor.getFCodigoMunicipio: String;
begin
   result := FCodigoMunicipio;
end;
}
function tDetalhes_Fornecedor.getFDataCadastro: TDateTime;
begin
   result := FDataCadastro;
end;

function tDetalhes_Fornecedor.getFProdutorRural: TSimOuNao;
begin
   result := intToSimOuNao(FProdutorRural);
end;

function tDetalhes_Fornecedor.getFRamoAtividade: String;
begin
   result := FRamoAtividade;
end;

function tDetalhes_Fornecedor.getFRegiao: String;
begin
   Result := FRegiao;
end;

function tDetalhes_Fornecedor.getFTipoPessoa: TTipoPessoa;
begin
   Result := StringToTipoPessoa(FTipoPessoa);
end;

function tDetalhes_Fornecedor.getFZona: String;
begin
   Result := FZona;
end;

{
procedure tDetalhes_Fornecedor.setFCodigoMunicipio(const Value: String);
begin
   FCodigoMunicipio := Value;
end;
}
procedure tDetalhes_Fornecedor.setFDataCadastro(const Value: TDateTime);
begin
   FDataCadastro := Value;
end;

procedure tDetalhes_Fornecedor.setFProdutorRural(const Value: TSimOuNao);
begin
   FProdutorRural := SimOuNaoToInt(Value);
end;

procedure tDetalhes_Fornecedor.setFRamoAtividade(const Value: String);
begin
   FRamoAtividade := Copy(Value,1,10);
end;

procedure tDetalhes_Fornecedor.setFRegiao(const Value: String);
begin
   FRegiao := Copy(Value,1,10);
end;

procedure tDetalhes_Fornecedor.setFTipoPessoa(const Value: TTipoPessoa);
begin
   FTipoPessoa := TipoPessoaToString(Value);
end;

procedure tDetalhes_Fornecedor.setFZona(const Value: String);
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
CREATE TABLE FORNECEDOR_FOR(
	FOR_FATURA_ENDERECO varchar(40) NULL,
	FOR_FATURA_CEP varchar(9) NULL,
	FOR_FATURA_CIDADE varchar(20) NULL,
	FOR_FATURA_BAIRRO varchar(20) NULL,
	FOR_FATURA_UF varchar(2) NULL,
	FOR_FATURA_TELEFONE varchar(20) NULL,
	FOR_FATURA_CONTATO varchar(40) NULL,
	FOR_CNPJ_CPF varchar(18) NULL,
	FOR_INSCRICAO_ESTADUAL varchar(22) NULL,
	FOR_INSCRICAO_MUNICIPAL varchar(22) NULL,
	FOR_ENTREGA_ENDERECO varchar(44) NULL,
	FOR_ENTREGA_CEP varchar(9) NULL,
	FOR_ENTREGA_CIDADE varchar(20) NULL,
	FOR_ENTREGA_BAIRRO varchar(20) NULL,
	FOR_ENTREGA_UF varchar(2) NULL,
	FOR_ENTREGA_TELEFONE varchar(20) NULL,
	FOR_ENTREGA_CONTATO varchar(40) NULL,
	FOR_COBRANCA_ENDERECO varchar(44) NULL,
	FOR_COBRANCA_CEP varchar(9) NULL,
	FOR_COBRANCA_CIDADE varchar(20) NULL,
	FOR_COBRANCA_BAIRRO varchar(20) NULL,
	FOR_COBRANCA_UF varchar(2) NULL,
	FOR_COBRANCA_TELEFONE varchar(20) NULL,
	FOR_COBRANCA_CONTATO varchar(40) NULL,
	FOR_TELEFONE_GERAL varchar(36) NULL,
	FOR_FAX_GERAL varchar(12) NULL,
	FOR_CONTATO_GERAL varchar(40) NULL,
	FOR_EMAIL_GERAL varchar(40) NULL,
	FOR_SITE varchar(40) NULL,
	FOR_FATURAR_SIMNAO varchar(1) NULL,
	FOR_ATIVO_SIMNAO varchar(1) NULL,
	FOR_CDVENDEDOR varchar(10) NULL,
	FOR_OBSERVACAO varchar(40) NULL,
	FOR_LIMITE_CREDITO float NULL,
	FOR_RG varchar(20) NULL,
	FOR_DTNASC datetime NULL,
	FOR_SEXO varchar(1) NULL,
	FOR_FORMAPG varchar(10) NULL,
	FOR_CDSUBTABELA_PRECOS varchar(10) NULL,
	FOR_OBSNOTA1 varchar(50) NULL,
	FOR_OBSNOTA2 varchar(50) NULL,
	FOR_OBSNOTA3 varchar(50) NULL,
	FOR_OBSNOTA4 varchar(50) NULL,
	FOR_NR_PED_NF varchar(1) NULL,
	FOR_CONTACONTABIL varchar(20) NULL,
	FOR_IMPDADOSDPNF varchar(1) NULL,
	FOR_CDPRODUTO_PROPRIO varchar(1) NULL,
	FOR_CONSTARELVENDA varchar(1) NULL,
	FOR_RECADASTRADO varchar(1) NULL,
	FOR_ATACADOVAREJO varchar(1) NULL,
	FOR_DTCADASTRO datetime NULL,
	FOR_CDROTA varchar(10) NULL,
	FOR_ROTAPOSICAO varchar(10) NULL,
	FOR_SITUACAOCREDITO varchar(1) NULL,
	FOR_CDRAMOATIVIDADE varchar(10) NULL,
	FOR_MULTADIARIA float NULL,
	FOR_GRUPO varchar(10) NULL,
	FOR_DESCONTO float NULL,
	FOR_TRIBUTACAO_ICMS varchar(1) NULL,
	FOR_SALDO float NULL,
	FOR_MOSTRAOBS varchar(1) NULL,
	FOR_NOTA_FISCAL varchar(1) NULL,
	FOR_DTBLOQUEIO datetime NULL,
	FOR_USUBLOQUEIO varchar(10) NULL,
	FOR_TPVEICULO varchar(10) NULL,
	FOR_REGIAO varchar(10) NULL,
	FOR_CDTABELA_PRECOS varchar(10) NULL,
	FOR_USU varchar(10) NULL,
	FOR_DT datetime NULL,
	FOR_HR varchar(5) NULL,
	FOR_CDINTERFACE varchar(10) NULL,
	FOR_CONTRIBUINTE_ICMS varchar(3) NULL,
	FOR_CRITICA_PEDIDO_DOBRADO varchar(1) NULL,
	FOR_DTLIBERACAO datetime NULL,
	FOR_USULIBERACAO varchar(10) NULL,
	FOR_HRLIBERACAO varchar(5) NULL,
	FOR_HRBLOQUEIO varchar(5) NULL,
	FOR_RESOLUCAODESCONTOICMS varchar(1) NULL,
	FOR_NOMEFINANCEIRO varchar(40) NULL,
	FOR_FONEFINANCEIRO varchar(40) NULL,
	FOR_FAXFINANCEIRO varchar(40) NULL,
	FOR_EMAILFINANCEIRO varchar(40) NULL,
	FOR_PERCDESCONTO numeric(12, 2) NULL,
	FOR_TPCOBRANCA varchar(1) NULL,
	FOR_AVISTA varchar(1) NULL,
	FOR_FRETEVP varchar(1) NULL,
	FOR_SERIENF varchar(5) NULL,
	FOR_CALCULANDO varchar(1) NULL,
	FOR_PREFIXOFAT varchar(20) NULL,
	FOR_DOCUMENTOCOBRANCA varchar(10) NULL,
	FOR_FORCOBRANCA varchar(20) NULL,
	FOR_DIAVENCEFATURA int NULL,
	FOR_RESOLUCAODESCONTOICMSVALOR varchar(1) NULL,
	FOR_IMPORTARVENDASIAC varchar(10) NULL,
	FOR_AVISAVENDASETEMDEBITO varchar(1) NULL,
	FOR_SALDODEVEDOR numeric(12, 2) NULL,
	FOR_COMISSAOVENDEDOR numeric(12, 4) NULL,
	FOR_ENTREGA_OBSERVACAO1 varchar(100) NULL,
	FOR_COBRANCA_OBSERVACAO varchar(100) NULL,
	FOR_FATURA_OBSERVACAO varchar(100) NULL,
	FOR_RESTRICAOFINANCEIRA varchar(100) NULL,
	FOR_ENTREGA_OBSERVACAO2 varchar(100) NULL,
	FOR_ENTREGA_OBSERVACAO3 varchar(100) NULL,
	FOR_ENTREGA_CONTATO_FONE varchar(20) NULL,
	FOR_FORNECEDORBANCARIODESDE varchar(2) NULL,
	FOR_FATURA_BAIRRO40 varchar(40) NULL,
	FOR_ENTREGA_BAIRRO40 varchar(40) NULL,
	FOR_COBRANCA_BAIRRO40 varchar(40) NULL,
	FOR_ANIVERSARIODDMM varchar(5) NULL,
	FOR_DTVENCE datetime NULL,
	FOR_SIGLA varchar(20) NULL,
	FOR_ENDERECO_NUMERO varchar(10) NULL,
	FOR_IBGECIDADE varchar(10) NULL,
	FOR_IBGEUF varchar(2) NULL,
	FOR_PRAZO_DE_ATRASO int NULL,
	FOR_TPPRECO int NULL,
	FOR_EXPORTADOBANCO varchar(1) NULL,
	FOR_ADERJ int NULL,
	FOR_USUARIO varchar(1) NULL,
	FOR_LOGMEIN_USUARIO varchar(40) NULL,
	FOR_LOGMEIN_SENHA varchar(40) NULL,
	FOR_ACEITAPRAZOMENOR varchar(1) NULL,
	FOR_EMAILXMLNFE varchar(50) NULL,
	FOR_FATURA_NUMERO varchar(10) NULL,
	FOR_COBRANCA_NUMERO varchar(10) NULL,
	FOR_MOTIVOINATIVO varchar(10) NULL,
	FOR_MODELOBOLETO varchar(10) NULL,
	FOR_CALCULOU varchar(1) NULL,
	FOR_CONSTARPESO varchar(1) NULL,
	FOR_DTULTIMACOMPRA datetime NULL,
	FOR_DIASSEMCOMPRAR int NULL,
	FOR_PRAZO int NULL,
	FOR_LIGARCOMFREQUENCIA int NULL,
	FOR_NOTADEACOMPANHAMENTO int NULL,
	FOR_CONTATO_DIAANIVERARIO int NULL,
	FOR_CONTATO_MESANIVERARIO int NULL,
	FOR_CONTATO_SEXO int NULL,
	FOR_EXPORTAR int NULL,
	FOR_REACAOAOTELEMARKETING int NULL,
	FOR_EXIGENOTAFISCAL int NULL,
	FOR_CDPROMOTOR varchar(10) NULL,
	FOR_NEXTEL varchar(12) NULL,
	FOR_NEXTEL_ID varchar(20) NULL,
	FOR_ACEITAPROMOTOR int NULL,
	FOR_PAGAMENSALIDADES int NULL,
	FOR_FREQUENCIACOBRANCA int NULL,
	FOR_INDICACAO_IE int NULL,
	FOR_SKYPE varchar(40) NULL,
	FOR_SKYPEBRENA varchar(40) NULL,
	FOR_SKYPESENHA varchar(40) NULL,
	FOR_SKYPEEMAIL varchar(40) NULL,
	FOR_SKYPEEMAILSENHA varchar(40) NULL,
	FOR_INSTAGRAM varchar(40) NULL,
	FOR_FACEBOOK varchar(40) NULL,
	FOR_BLOG varchar(40) NULL,
	FOR_TWITTER varchar(40) NULL,
	FOR_LINKEDIN varchar(40) NULL,
	FOR_EMAILNAVENDA int NULL,
	FOR_MOSTRARDEBITOS int NULL,
	FOR_COMOCONHECEU varchar(10) NULL,
	FOR_MIGRADOEM varchar(8) NULL,
	FOR_FALTOU varchar(1) NULL,
	FOR_WHATSAPP int NULL,
	FOR_REDESOCIAL varchar(40) NULL,
	FOR_FOTO1 varchar(100) NULL,
	FOR_FOTO2 varchar(100) NULL,
	FOR_FLAG int NULL,
	FOR_CORRIGIU int NULL,
	FOR_EXPIRAEM datetime NULL,
	FOR_ATUALIZADO_NA_NUVEM int NOT NULL,
	FOR_ATUALIZADO_NA_NUVEMW int NOT NULL,
	FOR_DTNUVEM datetime NULL,
	FOR_HRNUVEM varchar(5) NULL,
	FOR_SMC int NULL,
	FOR_ATIVO int NULL,
	FOR_IM varchar(20) NULL,
	FOR_CPAIS int NULL,
	FOR_SUFRAMA varchar(9) NULL

GO



}
ALTER TABLE FORNECEDOR_DETALHE_FORD ADD	FOR_ATUALIZADO_NA_NUVEM int NOT NULL
ALTER TABLE FORNECEDOR_DETALHE_FORD ADD		FOR_DTNUVEM datetime NULL
ALTER TABLE FORNECEDOR_DETALHE_FORD ADD		FOR_HRNUVEM varchar(5) NULL
ALTER TABLE FORNECEDOR_DETALHE_FORD ADD		FOR_SMC int NULL
ALTER TABLE FORNECEDOR_DETALHE_FORD ADD		FOR_ATIVO int NULL
ALTER TABLE FORNECEDOR_DETALHE_FORD ADD		FOR_IM varchar(20) NULL
ALTER TABLE FORNECEDOR_DETALHE_FORD ADD		FOR_CPAIS int NULL
ALTER TABLE FORNECEDOR_DETALHE_FORD ADD		FOR_SUFRAMA varchar(9) NULL




