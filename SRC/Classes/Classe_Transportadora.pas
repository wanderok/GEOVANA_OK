unit Classe_Transportadora;

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

  tDetalhes_Transportadora = class
    private
      FDataCadastro      : TDateTime;
      FTipoPessoa	       : String;
      FPessoaFisica      : tPessoa_Fisica;
      FPessoaJuridica    : tPessoa_Juridica;
      FRamoAtividade     : String;
      FRegiao            : String;
      FZona              : String;
      FRNTC              : String;
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
    function getFRNTC: String;
    procedure setFRNTC(const Value: String);

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
      property RNTC              : String           read getFRNTC               write setFRNTC;
      property Endereco          : TEndereco        read FEndereco              write FEndereco;
      property Contato           : TContato         read FContato               write FContato;
end;

  TTransportadoraAlteracao = class(TAlteracao);

  TTransportadora = class
  private
    FExiste            : Boolean;
    FCodigo            : String;
    FNomeFantasia      : String;
    FRazaoSocial       : String;
	  FStatus            : Integer;
    FDetalhes          : tDetalhes_Transportadora;
    FAlteracao         : TTransportadoraAlteracao;
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
    function  getDetalhes: tDetalhes_Transportadora;
    procedure setDetalhes(const Value: tDetalhes_Transportadora);
    function  Insert:Boolean;
    function  Update:Boolean;
    function  DadosCorretos:Boolean;
    procedure Preencher_Parametros_TRANSPORTADORA_TRA(pQuery:TFDQuery);
    procedure Preencher_Parametros_TRANSPORTADORA_CONTATO_TRAC(pQuery:TFDQuery);
    procedure Pegar_Dados_Basicos;
    procedure Pegar_Detalhes;
    procedure Pegar_Endereco;
    procedure Pegar_Contato;
    procedure Pegar_Alteracoes;

    procedure Pegar_Observacoes;
    procedure Gravar_Observacoes;
    //
    function Inserir_TRANSPORTADORA_TRA          :Boolean;
    function Inserir_TRANSPORTADORA_DETALHE_TRAD :Boolean;
    function Inserir_TRANSPORTADORA_ENDERECO_TRAE:Boolean;
    function Inserir_TRANSPORTADORA_CONTATO_TRAC :Boolean;
    //
    function Update_TRANSPORTADORA_TRA:Boolean;

    function Update_TRANSPORTADORA_DETALHE_TRAD:Boolean;
    function existe_TRANSPORTADORA_DETALHE_TRAD:Boolean;
    function alterar_TRANSPORTADORA_DETALHE_TRAD:Boolean;

    function Update_TRANSPORTADORA_ENDERECO_TRAE:Boolean;
    function existe_TRANSPORTADORA_ENDERECO_TRAE: Boolean;
    function alterar_TRANSPORTADORA_ENDERECO_TRAE:BooleAn;

    function Update_TRANSPORTADORA_CONTATO_TRAC :Boolean;
    function existe_TRANSPORTADORA_CONTATO_TRAC : Boolean;
    function alterar_TRANSPORTADORA_CONTATO_TRAC: Boolean;

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
    Property Detalhes      : tDetalhes_Transportadora read getDetalhes      write setDetalhes;
    property Alteracao     : TTransportadoraAlteracao read FAlteracao       write FAlteracao;
    property Observacao    : TStringList       read getFObservacao   write setFObservacao;
    procedure Abrir;
    Function Gravar:Boolean;
end;

implementation

uses FuncoesSMC,
     Classe_Nuvem;

var qTransportadora, qLocal: TFDQuery;

{ TTransportadora }

procedure TTransportadora.Abrir;
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


constructor TTransportadora.Create;
begin
   FDetalhes   := tDetalhes_Transportadora.Create;
   FAlteracao  := TTransportadoraAlteracao.Create;
   FObservacao := TStringList.Create;
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName :='X';
end;

function TTransportadora.DadosCorretos: Boolean;
begin
    Result := False;
    // ...criticas...
    Result := True;
end;

destructor TTransportadora.Destroy;
begin
  FDetalhes.Free;
  FAlteracao.Free;
  FObservacao.Free;
  qLocal.Free;
  inherited;
end;

function TTransportadora.existe_TRANSPORTADORA_DETALHE_TRAD: Boolean;
begin
    qTransportadora.Close;
    qTransportadora.SQL.Clear;
    qTransportadora.SQL.Add('SELECT TRAD_CODIGO               ');
    qTransportadora.SQL.Add('  FROM TRANSPORTADORA_DETALHE_TRAD      ');
    qTransportadora.SQL.Add(' WHERE TRAD_CODIGO = :TRAD_CODIGO');
    qTransportadora.ParamByName('TRAD_CODIGO').AsString   := FCodigo;
    qTransportadora.Open;
    result := not qTransportadora.Eof;
end;

function TTransportadora.existe_TRANSPORTADORA_ENDERECO_TRAE: Boolean;
begin
    qTransportadora.Close;
    qTransportadora.SQL.Clear;
    qTransportadora.SQL.Add('SELECT TRAE_CODIGO               ');
    qTransportadora.SQL.Add('  FROM TRANSPORTADORA_ENDERECO_TRAE      ');
    qTransportadora.SQL.Add(' WHERE TRAE_CODIGO = :TRAE_CODIGO');
    qTransportadora.ParamByName('TRAE_CODIGO').AsString   := FCodigo;
    qTransportadora.Open;
    result := not qTransportadora.Eof;
end;

function TTransportadora.existe_TRANSPORTADORA_CONTATO_TRAC: Boolean;
begin
    qTransportadora.Close;
    qTransportadora.SQL.Clear;
    qTransportadora.SQL.Add('SELECT TRAC_CODIGO               ');
    qTransportadora.SQL.Add('  FROM TRANSPORTADORA_CONTATO_TRAC   ');
    qTransportadora.SQL.Add(' WHERE TRAC_CODIGO = :TRAC_CODIGO');
    qTransportadora.ParamByName('TRAC_CODIGO').AsString   := FCodigo;
    qTransportadora.Open;
    result := not qTransportadora.Eof;
end;

function TTransportadora.getDetalhes: tDetalhes_Transportadora;
begin
   result := FDetalhes;
end;

function TTransportadora.getFCodigo: String;
begin
   result := FCodigo;
end;

function TTransportadora.getFExiste: Boolean;
begin
   Result := FExiste;
end;

function TTransportadora.getFNomeFantasia: String;
begin
   result := FNomeFantasia;
end;

function TTransportadora.getFObservacao: TStringList;
begin
   result := FObservacao;
end;

function TTransportadora.getFStatus: TStatusCadastral;
begin
   Result := IntToStatusCadastral(FStatus);
end;

function TTransportadora.getRazaoSocial: String;
begin
   result := FRazaoSocial;
end;

function TTransportadora.Gravar: Boolean;
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

procedure TTransportadora.Gravar_Observacoes;
var i : Integer;
begin
   qTransportadora.Close;
   qTransportadora.Sql.Clear;
   qTransportadora.Sql.Add('DELETE FROM TRANSPORTADORA_OBS_TRAOBS ');
   qTransportadora.Sql.Add(' WHERE TRAOBS_CODIGO = :COD    ');
   qTransportadora.ParamByName('COD').AsString := FCodigo;
   qTransportadora.ExecSql;

   for i := 0 to FObservacao.count-1 do
   begin
      qTransportadora.close;
      qTransportadora.sql.Clear;
      qTransportadora.sql.Add('INSERT INTO TRANSPORTADORA_OBS_TRAOBS   ');
      qTransportadora.sql.Add('     ( TRAOBS_CODIGO,            ');
	    qTransportadora.sql.Add('       TRAOBS_LINHA,             ');
      qTransportadora.sql.Add('       TRAOBS_TEXTO)             ');
      qTransportadora.sql.Add('VALUES                           ');
      qTransportadora.sql.Add('     (:TRAOBS_CODIGO,            ');
	    qTransportadora.sql.Add('      :TRAOBS_LINHA,             ');
      qTransportadora.sql.Add('      :TRAOBS_TEXTO)             ');
      qTransportadora.ParamByName('TRAOBS_CODIGO').AsString := FCodigo;
	    qTransportadora.ParamByName('TRAOBS_LINHA' ).AsInteger:= i;
      qTransportadora.ParamByName('TRAOBS_TEXTO' ).AsString := FObservacao[i];
      qTransportadora.ExecSql;
   end;
end;

function TTransportadora.Insert: Boolean;
begin
    result := False;
    if not Inserir_TRANSPORTADORA_TRA           then exit;
    if not Inserir_TRANSPORTADORA_DETALHE_TRAD  then exit;
    if not Inserir_TRANSPORTADORA_ENDERECO_TRAE then exit;
    if not Inserir_TRANSPORTADORA_CONTATO_TRAC then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Transportadora','Cadastrou transportadora ' + FCodigo + '-' + FNomeFantasia);
end;

function TTransportadora.Inserir_TRANSPORTADORA_TRA: Boolean;
begin
    result := False;
    try
        qTransportadora.Close;
        qTransportadora.SQL.Clear;
        qTransportadora.SQL.Add('INSERT INTO TRANSPORTADORA_TRA ');
        qTransportadora.SQL.Add('     (                    ');
        qTransportadora.SQL.Add('       TRA_CODIGO,        ');
        qTransportadora.SQL.Add('       TRA_NOME_FANTASIA, ');
        qTransportadora.SQL.Add('       TRA_RAZAO_SOCIAL,  ');
        qTransportadora.SQL.Add('       TRA_STATUS         ');
        qTransportadora.SQL.Add('     )                    ');
        qTransportadora.SQL.Add('VALUES                    ');
        qTransportadora.SQL.Add('     (                    ');
        qTransportadora.SQL.Add('      :TRA_CODIGO,        ');
        qTransportadora.SQL.Add('      :TRA_NOME_FANTASIA, ');
        qTransportadora.SQL.Add('      :TRA_RAZAO_SOCIAL,  ');
        qTransportadora.SQL.Add('      :TRA_STATUS         ');
        qTransportadora.SQL.Add('     )                    ');
        Preencher_Parametros_TRANSPORTADORA_TRA(qTransportadora);
        qTransportadora.ParamByname('TRA_STATUS').AsInteger := 0;
        qTransportadora.ExecSql;
        result := true
    except
       Avisos.Avisar('Erro ao incluir Transportadora ' + FNomeFantasia);
       LOGErros('Classe_Transportadora','Erro ao incluir Transportadora ' + FNomeFantasia);
    end;
end;

function TTransportadora.Inserir_TRANSPORTADORA_CONTATO_TRAC: Boolean;
begin
    result := False;
    try
        qTransportadora.Close;
        qTransportadora.SQL.Clear;
        qTransportadora.SQL.Add('INSERT INTO TRANSPORTADORA_CONTATO_TRAC');
        qTransportadora.SQL.Add('           (TRAC_CODIGO,        ');
        qTransportadora.SQL.Add('            TRAC_NOME,          ');
        qTransportadora.SQL.Add('            TRAC_FONE1,         ');
        qTransportadora.SQL.Add('            TRAC_FONE2,         ');
        qTransportadora.SQL.Add('            TRAC_CEL1,          ');
        qTransportadora.SQL.Add('            TRAC_WHATSAPP,      ');
        qTransportadora.SQL.Add('            TRAC_EMAIL1,        ');
        qTransportadora.SQL.Add('            TRAC_EMAIL2)        ');
        qTransportadora.SQL.Add('     VALUES                     ');
        qTransportadora.SQL.Add('          (:TRAC_CODIGO,        ');
        qTransportadora.SQL.Add('           :TRAC_NOME,          ');
        qTransportadora.SQL.Add('           :TRAC_FONE1,         ');
        qTransportadora.SQL.Add('           :TRAC_FONE2,         ');
        qTransportadora.SQL.Add('           :TRAC_CEL1,          ');
        qTransportadora.SQL.Add('           :TRAC_WHATSAPP,      ');
        qTransportadora.SQL.Add('           :TRAC_EMAIL1,        ');
        qTransportadora.SQL.Add('           :TRAC_EMAIL2)        ');
        Preencher_Parametros_TRANSPORTADORA_CONTATO_TRAC(qTransportadora);
        qTransportadora.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Transportadora ' + FNomeFantasia);
       LOGErros('Classe_Transportadora','Erro ao incluir Transportadora ' + FNomeFantasia);
    end;
end;

procedure TTransportadora.Preencher_Parametros_TRANSPORTADORA_CONTATO_TRAC(pQuery:TFDQuery);
begin
   qTransportadora.ParamByName('TRAC_CODIGO'  ).AsString := self.FCodigo;
   qTransportadora.ParamByName('TRAC_NOME'    ).AsString := self.FDetalhes.FContato.Nome;
   qTransportadora.ParamByName('TRAC_FONE1'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone1);
   qTransportadora.ParamByName('TRAC_FONE2'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone2);
   qTransportadora.ParamByName('TRAC_CEL1'    ).AsString := SoNumeros(self.FDetalhes.FContato.Cel);
   qTransportadora.ParamByName('TRAC_WHATSAPP').AsString := SoNumeros(self.FDetalhes.FContato.WhatsApp);
   qTransportadora.ParamByName('TRAC_EMAIL1'  ).AsString := self.FDetalhes.FContato.Email1;
   qTransportadora.ParamByName('TRAC_EMAIL2'  ).AsString := self.FDetalhes.FContato.Email2;
end;

function TTransportadora.Inserir_TRANSPORTADORA_DETALHE_TRAD: Boolean;
begin
    result := False;
    try
        qTransportadora.Close;
        qTransportadora.SQL.Clear;
        qTransportadora.SQL.Add('INSERT INTO TRANSPORTADORA_DETALHE_TRAD ');
        qTransportadora.SQL.Add('     (                           ');
        qTransportadora.SQL.Add('       TRAD_CODIGO,              ');
        qTransportadora.SQL.Add('       TRAD_PESSOA_FJ,           ');
        qTransportadora.SQL.Add('       TRAD_NUVEM_ATUALIZADO,    ');
        qTransportadora.SQL.Add('       TRAD_CPF,                 ');
        qTransportadora.SQL.Add('       TRAD_CNPJ,                ');
        qTransportadora.SQL.Add('       TRAD_IE,                  ');
        qTransportadora.SQL.Add('       TRAD_RG,                  ');
        qTransportadora.SQL.Add('       TRAD_RG_EMISSOR,          ');
        qTransportadora.SQL.Add('       TRAD_RG_DTEMISSAO,        ');
        qTransportadora.SQL.Add('       TRAD_DTNASC,              ');
        qTransportadora.SQL.Add('       TRAD_SEXO,                ');
        qTransportadora.SQL.Add('       TRAD_ALT_USU,             ');
        qTransportadora.SQL.Add('       TRAD_ALT_DT,              ');
        qTransportadora.SQL.Add('       TRAD_ALT_HR,              ');
        qTransportadora.SQL.Add('       TRAD_ALT_ESTACAO,         ');
        qTransportadora.SQL.Add('       TRAD_ALT_DTBLOQUEADO,     ');
        qTransportadora.SQL.Add('       TRAD_ALT_DTLIBERADO,      ');
        qTransportadora.SQL.Add('       TRAD_ALT_DTINATIVO,       ');
        qTransportadora.SQL.Add('       TRAD_CDRAMO,              ');
        qTransportadora.SQL.Add('       TRAD_CDREGIAO,            ');
        qTransportadora.SQL.Add('       TRAD_CDZONA,              ');
        qTransportadora.SQL.Add('       TRAD_RNTC,                ');
        qTransportadora.SQL.Add('       TRAD_DT                   ');
        qTransportadora.SQL.Add('     )                           ');
        qTransportadora.SQL.Add('VALUES                           ');
        qTransportadora.SQL.Add('     (                           ');
        qTransportadora.SQL.Add('      :TRAD_CODIGO,              ');
        qTransportadora.SQL.Add('      :TRAD_PESSOA_FJ,           ');
        qTransportadora.SQL.Add('      :TRAD_NUVEM_ATUALIZADO,    ');
        qTransportadora.SQL.Add('      :TRAD_CPF,                 ');
        qTransportadora.SQL.Add('      :TRAD_CNPJ,                ');
        qTransportadora.SQL.Add('      :TRAD_IE,                  ');
        qTransportadora.SQL.Add('      :TRAD_RG,                  ');
        qTransportadora.SQL.Add('      :TRAD_RG_EMISSOR,          ');
        qTransportadora.SQL.Add('      :TRAD_RG_DTEMISSAO,        ');
        qTransportadora.SQL.Add('      :TRAD_DTNASC,              ');
        qTransportadora.SQL.Add('      :TRAD_SEXO,                ');
        qTransportadora.SQL.Add('      :TRAD_ALT_USU,             ');
        qTransportadora.SQL.Add('      :TRAD_ALT_DT,              ');
        qTransportadora.SQL.Add('      :TRAD_ALT_HR,              ');
        qTransportadora.SQL.Add('      :TRAD_ALT_ESTACAO,         ');
        qTransportadora.SQL.Add('      :TRAD_ALT_DTBLOQUEADO,     ');
        qTransportadora.SQL.Add('      :TRAD_ALT_DTLIBERADO,      ');
        qTransportadora.SQL.Add('      :TRAD_ALT_DTINATIVO,       ');
        qTransportadora.SQL.Add('      :TRAD_CDRAMO,              ');
        qTransportadora.SQL.Add('      :TRAD_CDREGIAO,            ');
        qTransportadora.SQL.Add('      :TRAD_CDZONA,              ');
        qTransportadora.SQL.Add('      :TRAD_RNTC,                ');
        qTransportadora.SQL.Add('      :TRAD_DT                   ');
        qTransportadora.SQL.Add('     )                           ');
        qTransportadora.ParamByName('TRAD_CODIGO'             ).AsString   := FCodigo;
        qTransportadora.ParamByName('TRAD_NUVEM_ATUALIZADO'   ).AsInteger  := 0;
        qTransportadora.ParamByName('TRAD_PESSOA_FJ'          ).AsString   := FDetalhes.FTipoPessoa;
        qTransportadora.ParamByName('TRAD_CPF'                ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qTransportadora.ParamByName('TRAD_CNPJ'               ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qTransportadora.ParamByName('TRAD_IE'                 ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qTransportadora.ParamByName('TRAD_RG'                 ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qTransportadora.ParamByName('TRAD_RG_EMISSOR'         ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qTransportadora.ParamByName('TRAD_RG_DTEMISSAO'       ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qTransportadora.ParamByName('TRAD_DTNASC'             ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qTransportadora.ParamByName('TRAD_SEXO'               ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qTransportadora.ParamByName('TRAD_ALT_USU'            ).AsString   := Usuario.Codigo;
        qTransportadora.ParamByName('TRAD_ALT_DT'             ).AsDateTime := DataServidor;
        qTransportadora.ParamByName('TRAD_ALT_HR'             ).AsString   := HoraServidor;
        qTransportadora.ParamByName('TRAD_ALT_ESTACAO'        ).AsString   := NomeComputador;
        qTransportadora.ParamByName('TRAD_ALT_DTBLOQUEADO'    ).AsDateTime := 0;
        qTransportadora.ParamByName('TRAD_ALT_DTLIBERADO'     ).AsDateTime := 0;
        qTransportadora.ParamByName('TRAD_ALT_DTINATIVO'      ).AsDateTime := 0;
        qTransportadora.ParamByName('TRAD_CDRAMO'           ).AsString   := FDetalhes.FRamoAtividade;
        qTransportadora.ParamByName('TRAD_CDREGIAO'         ).AsString   := FDetalhes.FRegiao;
        qTransportadora.ParamByName('TRAD_CDZONA'           ).AsString   := FDetalhes.FZona;
        qTransportadora.ParamByName('TRAD_RNTC'             ).AsString   := FDetalhes.FRNTC;
        qTransportadora.ParamByName('TRAD_DT'               ).AsDateTime := DataServidor;
        qTransportadora.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Transportadora ' + FNomeFantasia);
       LOGErros('Classe_Transportadora','Erro ao incluir Transportadora ' + FNomeFantasia);
    end;
end;

function TTransportadora.Inserir_TRANSPORTADORA_ENDERECO_TRAE: Boolean;
begin
    result := False;
    try
        qTransportadora.Close;
        qTransportadora.SQL.Clear;
        qTransportadora.SQL.Add('INSERT INTO TRANSPORTADORA_ENDERECO_TRAE');
        qTransportadora.SQL.Add('     (                           ');
        qTransportadora.SQL.Add('       TRAE_CODIGO,              ');
        qTransportadora.SQL.Add('       TRAE_RUA,                 ');
        qTransportadora.SQL.Add('       TRAE_NUMERO,              ');
        qTransportadora.SQL.Add('       TRAE_COMPLEMENTO,         ');
        qTransportadora.SQL.Add('       TRAE_CDCIDADE,            ');
        qTransportadora.SQL.Add('       TRAE_BAIRRO,              ');
        qTransportadora.SQL.Add('       TRAE_CEP                  ');
        qTransportadora.SQL.Add('     )                           ');
        qTransportadora.SQL.Add('VALUES                           ');
        qTransportadora.SQL.Add('     (                           ');
        qTransportadora.SQL.Add('      :TRAE_CODIGO,              ');
        qTransportadora.SQL.Add('      :TRAE_RUA,                 ');
        qTransportadora.SQL.Add('      :TRAE_NUMERO,              ');
        qTransportadora.SQL.Add('      :TRAE_COMPLEMENTO,         ');
        qTransportadora.SQL.Add('      :TRAE_CDCIDADE,            ');
        qTransportadora.SQL.Add('      :TRAE_BAIRRO,              ');
        qTransportadora.SQL.Add('      :TRAE_CEP                  ');
        qTransportadora.SQL.Add('     )                           ');
        qTransportadora.ParamByName('TRAE_CODIGO'     ).AsString   := FCodigo;
        qTransportadora.ParamByName('TRAE_RUA'        ).AsString   := FDetalhes.FEndereco.Rua;
        qTransportadora.ParamByName('TRAE_NUMERO'     ).AsString   := FDetalhes.FEndereco.Numero;
        qTransportadora.ParamByName('TRAE_COMPLEMENTO').AsString   := FDetalhes.FEndereco.Complemento;
        qTransportadora.ParamByName('TRAE_CDCIDADE'   ).AsString   := FDetalhes.FEndereco.Cidade;
        qTransportadora.ParamByName('TRAE_BAIRRO'     ).AsString   := FDetalhes.FEndereco.Bairro;
        qTransportadora.ParamByName('TRAE_CEP'        ).AsString   := FDetalhes.FEndereco.CEP;
        qTransportadora.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Transportadora ' + FNomeFantasia);
       LOGErros('Classe_Transportadora','Erro ao incluir Transportadora ' + FNomeFantasia);
    end;
end;


procedure TTransportadora.LimparCampos;
begin
    FNomeFantasia      := '';
    FRazaoSocial       := '';
	  FStatus            := -1;
end;

procedure TTransportadora.Pegar_Alteracoes;
begin
    with FAlteracao do
    begin
       Usuario       := qTransportadora.FieldByName('TRAD_ALT_USU'        ).AsString;
       Data          := qTransportadora.FieldByName('TRAD_ALT_DT'         ).AsString;
       Hora          := qTransportadora.FieldByName('TRAD_ALT_HR'         ).AsString;
       Estacao       := qTransportadora.FieldByName('TRAD_ALT_ESTACAO'    ).AsString;
       DataBloqueio  := qTransportadora.FieldByName('TRAD_ALT_DTBLOQUEADO').AsString;
       DataLiberacao := qTransportadora.FieldByName('TRAD_ALT_DTLIBERADO' ).AsString;
       DataInativo   := qTransportadora.FieldByName('TRAD_ALT_DTINATIVO'  ).AsString;
    end;
end;

procedure TTransportadora.Pegar_Contato;
begin
    qTransportadora.Close;
    qTransportadora.SQL.Clear;
    qTransportadora.SQL.Add('SELECT * FROM TRANSPORTADORA_CONTATO_TRAC');
    qTransportadora.SQL.Add(' WHERE TRAC_CODIGO = :TRAC_CODIGO ');
    qTransportadora.ParamByName('TRAC_CODIGO').AsString := FCodigo;
    qTransportadora.Open;
    if qTransportadora.eof then
    begin
       Inserir_TRANSPORTADORA_CONTATO_TRAC;
       exit;
    end;
   Detalhes.FContato.Nome     := qTransportadora.FieldByName('TRAC_NOME'    ).AsString;
   Detalhes.FContato.Fone1    := qTransportadora.FieldByName('TRAC_FONE1'   ).AsString;
   Detalhes.FContato.Fone2    := qTransportadora.FieldByName('TRAC_FONE2'   ).AsString;
   Detalhes.FContato.Cel      := qTransportadora.FieldByName('TRAC_CEL1'    ).AsString;
   Detalhes.FContato.WhatsApp := qTransportadora.FieldByName('TRAC_WHATSAPP').AsString;
   Detalhes.FContato.Email1   := qTransportadora.FieldByName('TRAC_EMAIL1'  ).AsString;
   Detalhes.FContato.Email2   := qTransportadora.FieldByName('TRAC_EMAIL2'  ).AsString;
end;

procedure TTransportadora.Pegar_Dados_Basicos;
begin
    qTransportadora.Close;
    qTransportadora.SQL.Clear;
    qTransportadora.SQL.Add('SELECT * FROM TRANSPORTADORA_TRA      ');
    qTransportadora.SQL.Add(' WHERE TRA_CODIGO = :TRA_CODIGO');
    qTransportadora.ParamByName('TRA_CODIGO').AsString := FCodigo;
    qTransportadora.Open;
    if qTransportadora.eof then
    begin
       FExiste:=False;
       exit;
    end;
    FExiste                      := True;
    FCodigo                      := qTransportadora.FieldByName('TRA_CODIGO'                 ).AsString;
    FNomeFantasia                := qTransportadora.FieldByName('TRA_NOME_FANTASIA'          ).AsString;
    FRazaoSocial                 := qTransportadora.FieldByName('TRA_RAZAO_SOCIAL'           ).AsString;
    FStatus                      := qTransportadora.FieldByName('TRA_STATUS'                 ).AsInteger;
end;

procedure TTransportadora.Pegar_Detalhes;
begin
    qTransportadora.Close;
    qTransportadora.SQL.Clear;
    qTransportadora.SQL.Add('SELECT * FROM TRANSPORTADORA_DETALHE_TRAD');
    qTransportadora.SQL.Add(' WHERE TRAD_CODIGO = :TRAD_CODIGO ');
    qTransportadora.ParamByName('TRAD_CODIGO').AsString := FCodigo;
    qTransportadora.Open;
    if qTransportadora.eof then
    begin
       exit;
    end;

    Detalhes.FTipoPessoa         := qTransportadora.FieldByName('TRAD_PESSOA_FJ'          ).AsString;
    with Detalhes.FPessoaFisica do
    begin
       FCPF                      := qTransportadora.FieldByName('TRAD_CPF'                ).AsString;
       FRG                       := qTransportadora.FieldByName('TRAD_RG'                 ).AsString;
       FRG_OrgaoEmissor          := qTransportadora.FieldByName('TRAD_RG_EMISSOR'         ).AsString;
       FRG_DataEmissao           := qTransportadora.FieldByName('TRAD_RG_DTEMISSAO'       ).AsDateTime;
       FRG_DataEmissaoString     := BarrasSeDataNula(qTransportadora.FieldByName('TRAD_RG_DTEMISSAO').AsString);
       FDataNascimento           := qTransportadora.FieldByName('TRAD_DTNASC'             ).AsDateTime;
       FSexo                     := qTransportadora.FieldByName('TRAD_SEXO'               ).AsString;
       FDataNascimentoString     := BarrasSeDataNula(qTransportadora.FieldByName('TRAD_DTNASC' ).AsString);
    end;
    with Detalhes.FPessoaJuridica do
    begin
       FCNPJ                     := qTransportadora.FieldByName('TRAD_CNPJ'               ).AsString;
       FIE                       := qTransportadora.FieldByName('TRAD_IE'                 ).AsString;
    end;
    FDetalhes.RamoAtividade      := qTransportadora.FieldByName('TRAD_CDRAMO'             ).AsString;
    FDetalhes.Regiao             := qTransportadora.FieldByName('TRAD_CDREGIAO'           ).AsString;
    FDetalhes.Zona               := qTransportadora.FieldByName('TRAD_CDZONA'             ).AsString;
    FDetalhes.RNTC               := qTransportadora.FieldByName('TRAD_RNTC'               ).AsString;
    FDetalhes.FDataCadastro      := qTransportadora.FieldByName('TRAD_DT'                 ).AsDateTime;
    Pegar_Alteracoes;
end;

procedure TTransportadora.Pegar_Endereco;
begin
    qTransportadora.Close;
    qTransportadora.SQL.Clear;
    qTransportadora.SQL.Add('SELECT * FROM TRANSPORTADORA_ENDERECO_TRAE');
    qTransportadora.SQL.Add(' WHERE TRAE_CODIGO = :TRAE_CODIGO  ');
    qTransportadora.ParamByName('TRAE_CODIGO').AsString := FCodigo;
    qTransportadora.Open;
    if qTransportadora.eof then
    begin
       exit;
    end;
    FDetalhes.Endereco.Rua         := qTransportadora.FieldByName('TRAE_RUA'        ).AsString;
    FDetalhes.Endereco.Numero      := qTransportadora.FieldByName('TRAE_NUMERO'     ).AsString;
    FDetalhes.Endereco.Complemento := qTransportadora.FieldByName('TRAE_COMPLEMENTO').AsString;
    FDetalhes.Endereco.Bairro      := qTransportadora.FieldByName('TRAE_BAIRRO'     ).AsString;
    FDetalhes.Endereco.Cidade      := qTransportadora.FieldByName('TRAE_CDCIDADE'   ).AsString;
    FDetalhes.Endereco.CEP         := qTransportadora.FieldByName('TRAE_CEP'        ).AsString;
end;

procedure TTransportadora.Pegar_Observacoes;
begin
   FObservacao.Clear;
   qTransportadora.Close;
   qTransportadora.Sql.Clear;
   qTransportadora.Sql.Add('SELECT TRAOBS_TEXTO          ');
   qTransportadora.Sql.Add('  FROM TRANSPORTADORA_OBS_TRAOBS    ');
   qTransportadora.Sql.Add(' WHERE TRAOBS_CODIGO = :COD  ');
   qTransportadora.Sql.Add(' ORDER BY TRAOBS_LINHA       ');
   qTransportadora.ParamByName('COD').AsString := FCodigo;
   qTransportadora.Open;
   while not qTransportadora.eof do
   begin
     FObservacao.add(qTransportadora.fieldbyname('TRAOBS_TEXTO').AsString);
     qTransportadora.Next;
   end;
end;

procedure TTransportadora.Preencher_Parametros_TRANSPORTADORA_TRA(pQuery: TFDQuery);
begin
   pQuery.ParamByName('TRA_CODIGO'       ).AsString   := FCodigo;
   pQuery.ParamByName('TRA_NOME_FANTASIA').AsString   := FNomeFantasia;
   pQuery.ParamByName('TRA_RAZAO_SOCIAL' ).AsString   := FRazaoSocial;
   pQuery.ParamByName('TRA_STATUS'       ).AsInteger  := FStatus;
end;

function TTransportadora.proximoCodigo: String;
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
    qProximo.SQL.Add('SELECT MAX(TRA_CODIGO) AS MAIOR');
    qProximo.SQL.Add('  FROM TRANSPORTADORA_TRA             ');
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
       qProximo.SQL.Add('SELECT TRA_CODIGO              ');
       qProximo.SQL.Add('  FROM TRANSPORTADORA_TRA           ');
       qProximo.SQL.Add(' WHERE TRA_CODIGO = :TRA_CODIGO');
       qProximo.ParamByName('TRA_CODIGO').AsString := sCodigoCandidato;
       qProximo.Open;
       while not qProximo.Eof do
       begin
          qProximo.Close;
          inc(vCodigoCandidato);
          sCodigoCandidato := FormatFloat('#',vCodigoCandidato);
          qProximo.ParamByName('TRA_CODIGO').AsString := sCodigoCandidato;
          qProximo.Open;
       end;
       qProximo.Free;
       result := sCodigoCandidato;
       exit;
    end;
end;

procedure TTransportadora.RegistrarHistorico(pEvento,pLog: String);
begin
   //Hist�rico de bloqueios e desbloqueios da Transportadora
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('INSERT INTO TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB ');
   qLocal.Sql.Add('     ( TRAHB_TRANSPORTADORA,                         ');
   qLocal.Sql.Add('       TRAHB_EVENTO,                          ');
   qLocal.Sql.Add('       TRAHB_DTEVENTO,                        ');
   qLocal.Sql.Add('       TRAHB_HREVENTO,                        ');
   qLocal.Sql.Add('       TRAHB_USUEVENTO,                       ');
   qLocal.Sql.Add('       TRAHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                        ');
   qLocal.Sql.Add('VALUES                                        ');
   qLocal.Sql.Add('     (:TRAHB_TRANSPORTADORA,                  ');
   qLocal.Sql.Add('      :TRAHB_EVENTO,                          ');
   qLocal.Sql.Add('      :TRAHB_DTEVENTO,                        ');
   qLocal.Sql.Add('      :TRAHB_HREVENTO,                        ');
   qLocal.Sql.Add('      :TRAHB_USUEVENTO,                       ');
   qLocal.Sql.Add('      :TRAHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                                                                                           ');
   qLocal.ParamByName('TRAHB_TRANSPORTADORA').AsString   := FCodigo;
   qLocal.ParamByName('TRAHB_EVENTO'   ).AsString   := pEvento;
   qLocal.ParamByName('TRAHB_DTEVENTO' ).AsDateTime := DataServidor;
   qLocal.ParamByName('TRAHB_HREVENTO' ).AsString   := HoraServidor;
   qLocal.ParamByName('TRAHB_USUEVENTO').AsString   := Usuario.Codigo;
   qLocal.ParamByName('TRAHB_MAQEVENTO').AsString   := NomeComputador;
   qLocal.ExecSql;

   Log('Classe_Transportadora',pLog+' transportadora '+FCodigo+' - '+FNomeFantasia);
end;

procedure TTransportadora.RegistrarHistoricoDeAtivacao;
begin
   RegistrarHistorico('Ativado','Ativou');
end;

procedure TTransportadora.RegistrarHistoricoDeBloqueio;
begin
   RegistrarHistorico('Bloqueado','Bloqueou');
end;

procedure TTransportadora.RegistrarHistoricoDeDesBloqueio;
begin
   RegistrarHistorico('Desbloqueado','Desbloqueou');
end;

procedure TTransportadora.RegistrarHistoricoDeInativacao;
begin
   RegistrarHistorico('Inativado','Inativou');
end;

procedure TTransportadora.setDetalhes(const Value: tDetalhes_Transportadora);
begin
   FDetalhes := Value;
end;

procedure TTransportadora.setFCodigo(const Value: String);
begin
   if Value = '' then
      FCodigo := Copy(proximoCodigo,1,10)
   else
      FCodigo := Copy(Value,1,10);
end;

procedure TTransportadora.setFNomeFantasia(const Value: String);
begin
   FNomeFantasia := UpperCase(Copy(Value,1,50));
end;

procedure TTransportadora.setFObservacao(const Value: TStringList);
begin
   FObservacao := Value;
end;

procedure TTransportadora.setFStatus(const Value: TStatusCadastral);
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

procedure TTransportadora.setRazaoSocial(const Value: String);
begin
   FRazaoSocial := UpperCase(Copy(value,1,50));
end;

function TTransportadora.Update: Boolean;
begin
    result := false;
    if not Update_TRANSPORTADORA_TRA           then exit;
    if not Update_TRANSPORTADORA_DETALHE_TRAD  then exit;
    if not Update_TRANSPORTADORA_ENDERECO_TRAE then exit;
    if not Update_TRANSPORTADORA_CONTATO_TRAC then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Transportadora','Alterou transportadora '+ FCodigo + ' - ' + FNomeFantasia);
end;

function TTransportadora.Update_TRANSPORTADORA_TRA:Boolean;
begin
    try
        qTransportadora.Close;
        qTransportadora.SQL.Clear;
        qTransportadora.SQL.Add('UPDATE TRANSPORTADORA_TRA                                           ');
        qTransportadora.SQL.Add('   SET TRA_NOME_FANTASIA           = :TRA_NOME_FANTASIA,       ');
        qTransportadora.SQL.Add('       TRA_RAZAO_SOCIAL            = :TRA_RAZAO_SOCIAL,        ');
        qTransportadora.SQL.Add('       TRA_STATUS                  = :TRA_STATUS               ');
        qTransportadora.SQL.Add(' WHERE TRA_CODIGO                  = :TRA_CODIGO               ');
        Preencher_Parametros_TRANSPORTADORA_TRA(qTransportadora);
        qTransportadora.ExecSql;
        Log('Classe_Transportadora','Alterou transportadora '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Transportadora '+ FNomeFantasia);
       LogErros('Classe_Transportadora','Erro ao alterar Transportadora '+ FNomeFantasia);
    end;
end;

function TTransportadora.Update_TRANSPORTADORA_CONTATO_TRAC: Boolean;
begin
    if existe_TRANSPORTADORA_CONTATO_TRAC then
       result := alterar_TRANSPORTADORA_CONTATO_TRAC
    else
       result := inserir_TRANSPORTADORA_CONTATO_TRAC;
end;

function TTransportadora.alterar_TRANSPORTADORA_CONTATO_TRAC: Boolean;
begin
    result := False;
    try
        qTransportadora.Close;
        qTransportadora.SQL.Clear;
        qTransportadora.SQL.Add('UPDATE TRANSPORTADORA_CONTATO_TRAC         ');
        qTransportadora.SQL.Add('   SET TRAC_NOME     = :TRAC_NOME,     ');
        qTransportadora.SQL.Add('       TRAC_FONE1    = :TRAC_FONE1,    ');
        qTransportadora.SQL.Add('       TRAC_FONE2    = :TRAC_FONE2,    ');
        qTransportadora.SQL.Add('       TRAC_CEL1     = :TRAC_CEL1,     ');
        qTransportadora.SQL.Add('       TRAC_WHATSAPP = :TRAC_WHATSAPP, ');
        qTransportadora.SQL.Add('       TRAC_EMAIL1   = :TRAC_EMAIL1,   ');
        qTransportadora.SQL.Add('       TRAC_EMAIL2   = :TRAC_EMAIL2    ');
        qTransportadora.SQL.Add(' WHERE TRAC_CODIGO   = :TRAC_CODIGO    ');
        Preencher_Parametros_TRANSPORTADORA_CONTATO_TRAC(qTransportadora);
        qTransportadora.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao alterar Contatos do Transportadora ' + FNomeFantasia);
       LOGErros('Classe_Transportadora','Erro ao Alterar Contatos do Transportadora ' + FNomeFantasia);
    end;
end;

function TTransportadora.Update_TRANSPORTADORA_DETALHE_TRAD:Boolean;
begin
    if existe_TRANSPORTADORA_DETALHE_TRAD then
       result := alterar_TRANSPORTADORA_DETALHE_TRAD
    else
       result := inserir_TRANSPORTADORA_DETALHE_TRAD;
end;

function TTransportadora.alterar_TRANSPORTADORA_DETALHE_TRAD:Boolean;
begin
    result := false;
    try
        qTransportadora.Close;
        qTransportadora.SQL.Clear;
        qTransportadora.SQL.Add('UPDATE TRANSPORTADORA_DETALHE_TRAD                                  ');
        qTransportadora.SQL.Add('   SET TRAD_PESSOA_FJ           = :TRAD_PESSOA_FJ,           ');
        qTransportadora.SQL.Add('       TRAD_NUVEM_ATUALIZADO    = :TRAD_NUVEM_ATUALIZADO,    ');
        qTransportadora.SQL.Add('       TRAD_CPF                 = :TRAD_CPF,                 ');
        qTransportadora.SQL.Add('       TRAD_CNPJ                = :TRAD_CNPJ,                ');
        qTransportadora.SQL.Add('       TRAD_IE                  = :TRAD_IE,                  ');
        qTransportadora.SQL.Add('       TRAD_RG                  = :TRAD_RG,                  ');
        qTransportadora.SQL.Add('       TRAD_RG_EMISSOR          = :TRAD_RG_EMISSOR,          ');
        qTransportadora.SQL.Add('       TRAD_RG_DTEMISSAO        = :TRAD_RG_DTEMISSAO,        ');
        qTransportadora.SQL.Add('       TRAD_DTNASC              = :TRAD_DTNASC,              ');
        qTransportadora.SQL.Add('       TRAD_SEXO                = :TRAD_SEXO,                ');
        qTransportadora.SQL.Add('       TRAD_ALT_USU             = :TRAD_ALT_USU,             ');
        qTransportadora.SQL.Add('       TRAD_ALT_DT              = :TRAD_ALT_DT,              ');
        qTransportadora.SQL.Add('       TRAD_ALT_HR              = :TRAD_ALT_HR,              ');
        qTransportadora.SQL.Add('       TRAD_ALT_ESTACAO         = :TRAD_ALT_ESTACAO,         ');
        qTransportadora.SQL.Add('       TRAD_ALT_DTBLOQUEADO     = :TRAD_ALT_DTBLOQUEADO,     ');
        qTransportadora.SQL.Add('       TRAD_ALT_DTLIBERADO      = :TRAD_ALT_DTLIBERADO,      ');
        qTransportadora.SQL.Add('       TRAD_ALT_DTINATIVO       = :TRAD_ALT_DTINATIVO,       ');
        qTransportadora.SQL.Add('       TRAD_CDRAMO              = :TRAD_CDRAMO,              ');
        qTransportadora.SQL.Add('       TRAD_CDREGIAO            = :TRAD_CDREGIAO,            ');
        qTransportadora.SQL.Add('       TRAD_CDZONA              = :TRAD_CDZONA,              ');
        qTransportadora.SQL.Add('       TRAD_RNTC                = :TRAD_RNTC                 ');
        qTransportadora.SQL.Add(' WHERE TRAD_CODIGO              = :TRAD_CODIGO               ');
        qTransportadora.ParamByName('TRAD_CODIGO'          ).AsString   := FCodigo;
        qTransportadora.ParamByName('TRAD_NUVEM_ATUALIZADO').AsInteger  := 0;
        qTransportadora.ParamByName('TRAD_PESSOA_FJ'       ).AsString   := FDetalhes.FTipoPessoa;
        qTransportadora.ParamByName('TRAD_CPF'             ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qTransportadora.ParamByName('TRAD_CNPJ'            ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qTransportadora.ParamByName('TRAD_IE'              ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qTransportadora.ParamByName('TRAD_RG'              ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qTransportadora.ParamByName('TRAD_RG_EMISSOR'      ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qTransportadora.ParamByName('TRAD_RG_DTEMISSAO'    ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qTransportadora.ParamByName('TRAD_DTNASC'          ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qTransportadora.ParamByName('TRAD_SEXO'            ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qTransportadora.ParamByName('TRAD_ALT_USU'         ).AsString   := Usuario.Codigo;
        qTransportadora.ParamByName('TRAD_ALT_DT'          ).AsDateTime := DataServidor;
        qTransportadora.ParamByName('TRAD_ALT_HR'          ).AsString   := HoraServidor;
        qTransportadora.ParamByName('TRAD_ALT_ESTACAO'     ).AsString   := NomeComputador;
        qTransportadora.ParamByName('TRAD_ALT_DTBLOQUEADO' ).AsDateTime := ZeroSeDataNula(FAlteracao.DataBloqueio);
        qTransportadora.ParamByName('TRAD_ALT_DTLIBERADO'  ).AsDateTime := ZeroSeDataNula(FAlteracao.DataLiberacao);
        qTransportadora.ParamByName('TRAD_ALT_DTINATIVO'   ).AsDateTime := ZeroSeDataNula(FAlteracao.DataInativo);
        qTransportadora.ParamByName('TRAD_CDRAMO'          ).AsString   := FDetalhes.FRamoAtividade;
        qTransportadora.ParamByName('TRAD_CDREGIAO'        ).AsString   := FDetalhes.FRegiao;
        qTransportadora.ParamByName('TRAD_CDZONA'          ).AsString   := FDetalhes.FZona;
        qTransportadora.ParamByName('TRAD_RNTC'            ).AsString   := FDetalhes.FRNTC;
        qTransportadora.ExecSql;

        Log('Classe_Transportadora','Alterou transportadora '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Detalhes do Transportadora '+ FNomeFantasia);
       LogErros('Classe_Transportadora','Erro ao alterar Detalhes do Transportadora '+ FNomeFantasia);
    end;
end;

function TTransportadora.Update_TRANSPORTADORA_ENDERECO_TRAE:Boolean;
begin
    if existe_TRANSPORTADORA_ENDERECO_TRAE then
       result := alterar_TRANSPORTADORA_ENDERECO_TRAE
    else
       result := inserir_TRANSPORTADORA_ENDERECO_TRAE;
end;

function TTransportadora.alterar_TRANSPORTADORA_ENDERECO_TRAE:Boolean;
begin
   try
        qTransportadora.Close;
        qTransportadora.SQL.Clear;
        qTransportadora.SQL.Add('UPDATE TRANSPORTADORA_ENDERECO_TRAE                          ');
        qTransportadora.SQL.Add('   SET TRAE_RUA                 = :TRAE_RUA,                 ');
        qTransportadora.SQL.Add('       TRAE_NUMERO              = :TRAE_NUMERO,              ');
        qTransportadora.SQL.Add('       TRAE_COMPLEMENTO         = :TRAE_COMPLEMENTO,         ');
        qTransportadora.SQL.Add('       TRAE_BAIRRO              = :TRAE_BAIRRO,              ');
        qTransportadora.SQL.Add('       TRAE_CDCIDADE            = :TRAE_CDCIDADE,            ');
        qTransportadora.SQL.Add('       TRAE_CEP                 = :TRAE_CEP                  ');
        qTransportadora.SQL.Add(' WHERE TRAE_CODIGO              = :TRAE_CODIGO               ');
        qTransportadora.ParamByName('TRAE_CODIGO'          ).AsString   := FCodigo;
        qTransportadora.ParamByName('TRAE_RUA'             ).AsString   := FDetalhes.FEndereco.Rua;
        qTransportadora.ParamByName('TRAE_NUMERO'          ).AsString   := FDetalhes.FEndereco.Numero;
        qTransportadora.ParamByName('TRAE_COMPLEMENTO'     ).AsString   := FDetalhes.FEndereco.Complemento;
        qTransportadora.ParamByName('TRAE_BAIRRO'          ).AsString   := FDetalhes.FEndereco.Bairro;
        qTransportadora.ParamByName('TRAE_CDCIDADE'        ).AsString   := FDetalhes.FEndereco.Cidade;
        qTransportadora.ParamByName('TRAE_CEP'             ).AsString   := FDetalhes.FEndereco.CEP;
        qTransportadora.ExecSql;

        Log('Classe_Transportadora','Alterou transportadora '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Endere�o do Transportadora '+ FNomeFantasia);
       LogErros('Classe_Transportadora','Erro ao alterar Endere�o do Transportadora '+ FNomeFantasia);
    end;
end;

{ tDetalhes_Transportadora }

constructor tDetalhes_Transportadora.Create;
begin
  qTransportadora := TFDQuery.Create(nil);
  qTransportadora.ConnectionName :='X';
  FPessoaFisica  := tPessoa_Fisica.Create;
  FPessoaJuridica:= tPessoa_Juridica.Create;
  FEndereco      := TEndereco.Create;
  FContato       := TContato.Create;
end;

destructor tDetalhes_Transportadora.Destroy;
begin
  qTransportadora.Free;
  FPessoaFisica.Free;
  FPessoaJuridica.Free;
  FEndereco.Free;
  FContato.Free;
  inherited;
end;

function tDetalhes_Transportadora.getDataCadastroString: String;
begin
   result := DateToStr(FDataCadastro);
end;

{function tDetalhes_Transportadora.getFCodigoMunicipio: String;
begin
   result := FCodigoMunicipio;
end;
}
function tDetalhes_Transportadora.getFDataCadastro: TDateTime;
begin
   result := FDataCadastro;
end;

function tDetalhes_Transportadora.getFRamoAtividade: String;
begin
   result := FRamoAtividade;
end;

function tDetalhes_Transportadora.getFRegiao: String;
begin
   Result := FRegiao;
end;

function tDetalhes_Transportadora.getFRNTC: String;
begin
   Result := FRNTC;
end;

function tDetalhes_Transportadora.getFTipoPessoa: TTipoPessoa;
begin
   Result := StringToTipoPessoa(FTipoPessoa);
end;

function tDetalhes_Transportadora.getFZona: String;
begin
   Result := FZona;
end;

{
procedure tDetalhes_Transportadora.setFCodigoMunicipio(const Value: String);
begin
   FCodigoMunicipio := Value;
end;
}
procedure tDetalhes_Transportadora.setFDataCadastro(const Value: TDateTime);
begin
   FDataCadastro := Value;
end;

procedure tDetalhes_Transportadora.setFRamoAtividade(const Value: String);
begin
   FRamoAtividade := Copy(Value,1,10);
end;

procedure tDetalhes_Transportadora.setFRegiao(const Value: String);
begin
   FRegiao := Copy(Value,1,10);
end;

procedure tDetalhes_Transportadora.setFRNTC(const Value: String);
begin
   FRNTC := Copy(Value,1,20);
end;

procedure tDetalhes_Transportadora.setFTipoPessoa(const Value: TTipoPessoa);
begin
   FTipoPessoa := TipoPessoaToString(Value);
end;

procedure tDetalhes_Transportadora.setFZona(const Value: String);
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

