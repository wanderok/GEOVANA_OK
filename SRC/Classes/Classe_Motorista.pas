unit Classe_Motorista;

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

  tDetalhes_Motorista = class
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

  TMotoristaAlteracao = class(TAlteracao);

  TMotorista = class
  private
    FExiste            : Boolean;
    FCodigo            : String;
    FNomeFantasia      : String;
    FRazaoSocial       : String;
	  FStatus            : Integer;
    FDetalhes          : tDetalhes_Motorista;
    FAlteracao         : TMotoristaAlteracao;
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
    function  getDetalhes: tDetalhes_Motorista;
    procedure setDetalhes(const Value: tDetalhes_Motorista);
    function  Insert:Boolean;
    function  Update:Boolean;
    function  DadosCorretos:Boolean;
    procedure Preencher_Parametros_MOTORISTA_MOT(pQuery:TFDQuery);
    procedure Preencher_Parametros_MOTORISTA_CONTATO_MOTC(pQuery:TFDQuery);
    procedure Pegar_Dados_Basicos;
    procedure Pegar_Detalhes;
    procedure Pegar_Endereco;
    procedure Pegar_Contato;
    procedure Pegar_Alteracoes;

    procedure Pegar_Observacoes;
    procedure Gravar_Observacoes;
    //
    function Inserir_MOTORISTA_MOT          :Boolean;
    function Inserir_MOTORISTA_DETALHE_MOTD :Boolean;
    function Inserir_MOTORISTA_ENDERECO_MOTE:Boolean;
    function Inserir_MOTORISTA_CONTATO_MOTC :Boolean;
    //
    function Update_MOTORISTA_MOT:Boolean;

    function Update_MOTORISTA_DETALHE_MOTD:Boolean;
    function existe_MOTORISTA_DETALHE_MOTD:Boolean;
    function alterar_MOTORISTA_DETALHE_MOTD:Boolean;

    function Update_MOTORISTA_ENDERECO_MOTE:Boolean;
    function existe_MOTORISTA_ENDERECO_MOTE: Boolean;
    function alterar_MOTORISTA_ENDERECO_MOTE:BooleAn;

    function Update_MOTORISTA_CONTATO_MOTC :Boolean;
    function existe_MOTORISTA_CONTATO_MOTC : Boolean;
    function alterar_MOTORISTA_CONTATO_MOTC: Boolean;

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
    Property Detalhes      : tDetalhes_Motorista read getDetalhes      write setDetalhes;
    property Alteracao     : TMotoristaAlteracao read FAlteracao       write FAlteracao;
    property Observacao    : TStringList       read getFObservacao   write setFObservacao;
    procedure Abrir;
    Function Gravar:Boolean;
end;

implementation

uses Funcoes,
     Classe_Nuvem;

var qMotorista, qLocal: TFDQuery;

{ TMotorista }

procedure TMotorista.Abrir;
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


constructor TMotorista.Create;
begin
   FDetalhes   := tDetalhes_Motorista.Create;
   FAlteracao  := TMotoristaAlteracao.Create;
   FObservacao := TStringList.Create;
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName :='X';
end;

function TMotorista.DadosCorretos: Boolean;
begin
    Result := False;
    // ...criticas...
    Result := True;
end;

destructor TMotorista.Destroy;
begin
  FDetalhes.Free;
  FAlteracao.Free;
  FObservacao.Free;
  qLocal.Free;
  inherited;
end;

function TMotorista.existe_MOTORISTA_DETALHE_MOTD: Boolean;
begin
    qMotorista.Close;
    qMotorista.SQL.Clear;
    qMotorista.SQL.Add('SELECT MOTD_CODIGO               ');
    qMotorista.SQL.Add('  FROM MOTORISTA_DETALHE_MOTD      ');
    qMotorista.SQL.Add(' WHERE MOTD_CODIGO = :MOTD_CODIGO');
    qMotorista.ParamByName('MOTD_CODIGO').AsString   := FCodigo;
    qMotorista.Open;
    result := not qMotorista.Eof;
end;

function TMotorista.existe_MOTORISTA_ENDERECO_MOTE: Boolean;
begin
    qMotorista.Close;
    qMotorista.SQL.Clear;
    qMotorista.SQL.Add('SELECT MOTE_CODIGO               ');
    qMotorista.SQL.Add('  FROM MOTORISTA_ENDERECO_MOTE      ');
    qMotorista.SQL.Add(' WHERE MOTE_CODIGO = :MOTE_CODIGO');
    qMotorista.ParamByName('MOTE_CODIGO').AsString   := FCodigo;
    qMotorista.Open;
    result := not qMotorista.Eof;
end;

function TMotorista.existe_MOTORISTA_CONTATO_MOTC: Boolean;
begin
    qMotorista.Close;
    qMotorista.SQL.Clear;
    qMotorista.SQL.Add('SELECT MOTC_CODIGO               ');
    qMotorista.SQL.Add('  FROM MOTORISTA_CONTATO_MOTC   ');
    qMotorista.SQL.Add(' WHERE MOTC_CODIGO = :MOTC_CODIGO');
    qMotorista.ParamByName('MOTC_CODIGO').AsString   := FCodigo;
    qMotorista.Open;
    result := not qMotorista.Eof;
end;

function TMotorista.getDetalhes: tDetalhes_Motorista;
begin
   result := FDetalhes;
end;

function TMotorista.getFCodigo: String;
begin
   result := FCodigo;
end;

function TMotorista.getFExiste: Boolean;
begin
   Result := FExiste;
end;

function TMotorista.getFNomeFantasia: String;
begin
   result := FNomeFantasia;
end;

function TMotorista.getFObservacao: TStringList;
begin
   result := FObservacao;
end;

function TMotorista.getFStatus: TStatusCadastral;
begin
   Result := IntToStatusCadastral(FStatus);
end;

function TMotorista.getRazaoSocial: String;
begin
   result := FRazaoSocial;
end;

function TMotorista.Gravar: Boolean;
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

procedure TMotorista.Gravar_Observacoes;
var i : Integer;
begin
   qMotorista.Close;
   qMotorista.Sql.Clear;
   qMotorista.Sql.Add('DELETE FROM MOTORISTA_OBS_MOTOBS ');
   qMotorista.Sql.Add(' WHERE MOTOBS_CODIGO = :COD    ');
   qMotorista.ParamByName('COD').AsString := FCodigo;
   qMotorista.ExecSql;

   for i := 0 to FObservacao.count-1 do
   begin
      qMotorista.close;
      qMotorista.sql.Clear;
      qMotorista.sql.Add('INSERT INTO MOTORISTA_OBS_MOTOBS   ');
      qMotorista.sql.Add('     ( MOTOBS_CODIGO,            ');
	    qMotorista.sql.Add('       MOTOBS_LINHA,             ');
      qMotorista.sql.Add('       MOTOBS_TEXTO)             ');
      qMotorista.sql.Add('VALUES                           ');
      qMotorista.sql.Add('     (:MOTOBS_CODIGO,            ');
	    qMotorista.sql.Add('      :MOTOBS_LINHA,             ');
      qMotorista.sql.Add('      :MOTOBS_TEXTO)             ');
      qMotorista.ParamByName('MOTOBS_CODIGO').AsString := FCodigo;
	    qMotorista.ParamByName('MOTOBS_LINHA' ).AsInteger:= i;
      qMotorista.ParamByName('MOTOBS_TEXTO' ).AsString := FObservacao[i];
      qMotorista.ExecSql;
   end;
end;

function TMotorista.Insert: Boolean;
begin
    result := False;
    if not Inserir_MOTORISTA_MOT           then exit;
    if not Inserir_MOTORISTA_DETALHE_MOTD  then exit;
    if not Inserir_MOTORISTA_ENDERECO_MOTE then exit;
    if not Inserir_MOTORISTA_CONTATO_MOTC then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Motorista','Cadastrou motorista ' + FCodigo + '-' + FNomeFantasia);
end;

function TMotorista.Inserir_MOTORISTA_MOT: Boolean;
begin
    result := False;
    try
        qMotorista.Close;
        qMotorista.SQL.Clear;
        qMotorista.SQL.Add('INSERT INTO MOTORISTA_MOT ');
        qMotorista.SQL.Add('     (                    ');
        qMotorista.SQL.Add('       MOT_CODIGO,        ');
        qMotorista.SQL.Add('       MOT_NOME_FANTASIA, ');
        qMotorista.SQL.Add('       MOT_RAZAO_SOCIAL,  ');
        qMotorista.SQL.Add('       MOT_STATUS         ');
        qMotorista.SQL.Add('     )                    ');
        qMotorista.SQL.Add('VALUES                    ');
        qMotorista.SQL.Add('     (                    ');
        qMotorista.SQL.Add('      :MOT_CODIGO,        ');
        qMotorista.SQL.Add('      :MOT_NOME_FANTASIA, ');
        qMotorista.SQL.Add('      :MOT_RAZAO_SOCIAL,  ');
        qMotorista.SQL.Add('      :MOT_STATUS         ');
        qMotorista.SQL.Add('     )                    ');
        Preencher_Parametros_MOTORISTA_MOT(qMotorista);
        qMotorista.ParamByname('MOT_STATUS').AsInteger := 0;
        qMotorista.ExecSql;
        result := true
    except
       Avisos.Avisar('Erro ao incluir Motorista ' + FNomeFantasia);
       LOGErros('Classe_Motorista','Erro ao incluir Motorista ' + FNomeFantasia);
    end;
end;

function TMotorista.Inserir_MOTORISTA_CONTATO_MOTC: Boolean;
begin
    result := False;
    try
        qMotorista.Close;
        qMotorista.SQL.Clear;
        qMotorista.SQL.Add('INSERT INTO MOTORISTA_CONTATO_MOTC');
        qMotorista.SQL.Add('           (MOTC_CODIGO,        ');
        qMotorista.SQL.Add('            MOTC_NOME,          ');
        qMotorista.SQL.Add('            MOTC_FONE1,         ');
        qMotorista.SQL.Add('            MOTC_FONE2,         ');
        qMotorista.SQL.Add('            MOTC_CEL1,          ');
        qMotorista.SQL.Add('            MOTC_WHATSAPP,      ');
        qMotorista.SQL.Add('            MOTC_EMAIL1,        ');
        qMotorista.SQL.Add('            MOTC_EMAIL2)        ');
        qMotorista.SQL.Add('     VALUES                     ');
        qMotorista.SQL.Add('          (:MOTC_CODIGO,        ');
        qMotorista.SQL.Add('           :MOTC_NOME,          ');
        qMotorista.SQL.Add('           :MOTC_FONE1,         ');
        qMotorista.SQL.Add('           :MOTC_FONE2,         ');
        qMotorista.SQL.Add('           :MOTC_CEL1,          ');
        qMotorista.SQL.Add('           :MOTC_WHATSAPP,      ');
        qMotorista.SQL.Add('           :MOTC_EMAIL1,        ');
        qMotorista.SQL.Add('           :MOTC_EMAIL2)        ');
        Preencher_Parametros_MOTORISTA_CONTATO_MOTC(qMotorista);
        qMotorista.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Motorista ' + FNomeFantasia);
       LOGErros('Classe_Motorista','Erro ao incluir Motorista ' + FNomeFantasia);
    end;
end;

procedure TMotorista.Preencher_Parametros_MOTORISTA_CONTATO_MOTC(pQuery:TFDQuery);
begin
   qMotorista.ParamByName('MOTC_CODIGO'  ).AsString := self.FCodigo;
   qMotorista.ParamByName('MOTC_NOME'    ).AsString := self.FDetalhes.FContato.Nome;
   qMotorista.ParamByName('MOTC_FONE1'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone1);
   qMotorista.ParamByName('MOTC_FONE2'   ).AsString := SoNumeros(self.FDetalhes.FContato.Fone2);
   qMotorista.ParamByName('MOTC_CEL1'    ).AsString := SoNumeros(self.FDetalhes.FContato.Cel);
   qMotorista.ParamByName('MOTC_WHATSAPP').AsString := SoNumeros(self.FDetalhes.FContato.WhatsApp);
   qMotorista.ParamByName('MOTC_EMAIL1'  ).AsString := self.FDetalhes.FContato.Email1;
   qMotorista.ParamByName('MOTC_EMAIL2'  ).AsString := self.FDetalhes.FContato.Email2;
end;

function TMotorista.Inserir_MOTORISTA_DETALHE_MOTD: Boolean;
begin
    result := False;
    try
        qMotorista.Close;
        qMotorista.SQL.Clear;
        qMotorista.SQL.Add('INSERT INTO MOTORISTA_DETALHE_MOTD ');
        qMotorista.SQL.Add('     (                           ');
        qMotorista.SQL.Add('       MOTD_CODIGO,              ');
        qMotorista.SQL.Add('       MOTD_PESSOA_FJ,           ');
        qMotorista.SQL.Add('       MOTD_NUVEM_ATUALIZADO,    ');
        qMotorista.SQL.Add('       MOTD_CPF,                 ');
        qMotorista.SQL.Add('       MOTD_CNPJ,                ');
        qMotorista.SQL.Add('       MOTD_IE,                  ');
        qMotorista.SQL.Add('       MOTD_RG,                  ');
        qMotorista.SQL.Add('       MOTD_RG_EMISSOR,          ');
        qMotorista.SQL.Add('       MOTD_RG_DTEMISSAO,        ');
        qMotorista.SQL.Add('       MOTD_DTNASC,              ');
        qMotorista.SQL.Add('       MOTD_SEXO,                ');
        qMotorista.SQL.Add('       MOTD_ALT_USU,             ');
        qMotorista.SQL.Add('       MOTD_ALT_DT,              ');
        qMotorista.SQL.Add('       MOTD_ALT_HR,              ');
        qMotorista.SQL.Add('       MOTD_ALT_ESTACAO,         ');
        qMotorista.SQL.Add('       MOTD_ALT_DTBLOQUEADO,     ');
        qMotorista.SQL.Add('       MOTD_ALT_DTLIBERADO,      ');
        qMotorista.SQL.Add('       MOTD_ALT_DTINATIVO,       ');
        qMotorista.SQL.Add('       MOTD_CDRAMO,              ');
        qMotorista.SQL.Add('       MOTD_CDREGIAO,            ');
        qMotorista.SQL.Add('       MOTD_CDZONA,              ');
        qMotorista.SQL.Add('       MOTD_DT                   ');
        qMotorista.SQL.Add('     )                           ');
        qMotorista.SQL.Add('VALUES                           ');
        qMotorista.SQL.Add('     (                           ');
        qMotorista.SQL.Add('      :MOTD_CODIGO,              ');
        qMotorista.SQL.Add('      :MOTD_PESSOA_FJ,           ');
        qMotorista.SQL.Add('      :MOTD_NUVEM_ATUALIZADO,    ');
        qMotorista.SQL.Add('      :MOTD_CPF,                 ');
        qMotorista.SQL.Add('      :MOTD_CNPJ,                ');
        qMotorista.SQL.Add('      :MOTD_IE,                  ');
        qMotorista.SQL.Add('      :MOTD_RG,                  ');
        qMotorista.SQL.Add('      :MOTD_RG_EMISSOR,          ');
        qMotorista.SQL.Add('      :MOTD_RG_DTEMISSAO,        ');
        qMotorista.SQL.Add('      :MOTD_DTNASC,              ');
        qMotorista.SQL.Add('      :MOTD_SEXO,                ');
        qMotorista.SQL.Add('      :MOTD_ALT_USU,             ');
        qMotorista.SQL.Add('      :MOTD_ALT_DT,              ');
        qMotorista.SQL.Add('      :MOTD_ALT_HR,              ');
        qMotorista.SQL.Add('      :MOTD_ALT_ESTACAO,         ');
        qMotorista.SQL.Add('      :MOTD_ALT_DTBLOQUEADO,     ');
        qMotorista.SQL.Add('      :MOTD_ALT_DTLIBERADO,      ');
        qMotorista.SQL.Add('      :MOTD_ALT_DTINATIVO,       ');
        qMotorista.SQL.Add('      :MOTD_CDRAMO,              ');
        qMotorista.SQL.Add('      :MOTD_CDREGIAO,            ');
        qMotorista.SQL.Add('      :MOTD_CDZONA,              ');
        qMotorista.SQL.Add('      :MOTD_DT                   ');
        qMotorista.SQL.Add('     )                           ');
        qMotorista.ParamByName('MOTD_CODIGO'             ).AsString   := FCodigo;
        qMotorista.ParamByName('MOTD_NUVEM_ATUALIZADO'   ).AsInteger  := 0;
        qMotorista.ParamByName('MOTD_PESSOA_FJ'          ).AsString   := FDetalhes.FTipoPessoa;
        qMotorista.ParamByName('MOTD_CPF'                ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qMotorista.ParamByName('MOTD_CNPJ'               ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qMotorista.ParamByName('MOTD_IE'                 ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qMotorista.ParamByName('MOTD_RG'                 ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qMotorista.ParamByName('MOTD_RG_EMISSOR'         ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qMotorista.ParamByName('MOTD_RG_DTEMISSAO'       ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qMotorista.ParamByName('MOTD_DTNASC'             ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qMotorista.ParamByName('MOTD_SEXO'               ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qMotorista.ParamByName('MOTD_ALT_USU'            ).AsString   := Usuario.Codigo;
        qMotorista.ParamByName('MOTD_ALT_DT'             ).AsDateTime := DataServidor;
        qMotorista.ParamByName('MOTD_ALT_HR'             ).AsString   := HoraServidor;
        qMotorista.ParamByName('MOTD_ALT_ESTACAO'        ).AsString   := NomeComputador;
        qMotorista.ParamByName('MOTD_ALT_DTBLOQUEADO'    ).AsDateTime := 0;
        qMotorista.ParamByName('MOTD_ALT_DTLIBERADO'     ).AsDateTime := 0;
        qMotorista.ParamByName('MOTD_ALT_DTINATIVO'      ).AsDateTime := 0;
        qMotorista.ParamByName('MOTD_CDRAMO'           ).AsString   := FDetalhes.FRamoAtividade;
        qMotorista.ParamByName('MOTD_CDREGIAO'         ).AsString   := FDetalhes.FRegiao;
        qMotorista.ParamByName('MOTD_CDZONA'           ).AsString   := FDetalhes.FZona;
        qMotorista.ParamByName('MOTD_DT'               ).AsDateTime := DataServidor;
        qMotorista.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Motorista ' + FNomeFantasia);
       LOGErros('Classe_Motorista','Erro ao incluir Motorista ' + FNomeFantasia);
    end;
end;

function TMotorista.Inserir_MOTORISTA_ENDERECO_MOTE: Boolean;
begin
    result := False;
    try
        qMotorista.Close;
        qMotorista.SQL.Clear;
        qMotorista.SQL.Add('INSERT INTO MOTORISTA_ENDERECO_MOTE');
        qMotorista.SQL.Add('     (                           ');
        qMotorista.SQL.Add('       MOTE_CODIGO,              ');
        qMotorista.SQL.Add('       MOTE_RUA,                 ');
        qMotorista.SQL.Add('       MOTE_NUMERO,              ');
        qMotorista.SQL.Add('       MOTE_COMPLEMENTO,         ');
        qMotorista.SQL.Add('       MOTE_CDCIDADE,            ');
        qMotorista.SQL.Add('       MOTE_BAIRRO,              ');
        qMotorista.SQL.Add('       MOTE_CEP                  ');
        qMotorista.SQL.Add('     )                           ');
        qMotorista.SQL.Add('VALUES                           ');
        qMotorista.SQL.Add('     (                           ');
        qMotorista.SQL.Add('      :MOTE_CODIGO,              ');
        qMotorista.SQL.Add('      :MOTE_RUA,                 ');
        qMotorista.SQL.Add('      :MOTE_NUMERO,              ');
        qMotorista.SQL.Add('      :MOTE_COMPLEMENTO,         ');
        qMotorista.SQL.Add('      :MOTE_CDCIDADE,            ');
        qMotorista.SQL.Add('      :MOTE_BAIRRO,              ');
        qMotorista.SQL.Add('      :MOTE_CEP                  ');
        qMotorista.SQL.Add('     )                           ');
        qMotorista.ParamByName('MOTE_CODIGO'     ).AsString   := FCodigo;
        qMotorista.ParamByName('MOTE_RUA'        ).AsString   := FDetalhes.FEndereco.Rua;
        qMotorista.ParamByName('MOTE_NUMERO'     ).AsString   := FDetalhes.FEndereco.Numero;
        qMotorista.ParamByName('MOTE_COMPLEMENTO').AsString   := FDetalhes.FEndereco.Complemento;
        qMotorista.ParamByName('MOTE_CDCIDADE'   ).AsString   := FDetalhes.FEndereco.Cidade;
        qMotorista.ParamByName('MOTE_BAIRRO'     ).AsString   := FDetalhes.FEndereco.Bairro;
        qMotorista.ParamByName('MOTE_CEP'        ).AsString   := FDetalhes.FEndereco.CEP;
        qMotorista.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Motorista ' + FNomeFantasia);
       LOGErros('Classe_Motorista','Erro ao incluir Motorista ' + FNomeFantasia);
    end;
end;


procedure TMotorista.LimparCampos;
begin
    FNomeFantasia      := '';
    FRazaoSocial       := '';
	  FStatus            := -1;
end;

procedure TMotorista.Pegar_Alteracoes;
begin
    with FAlteracao do
    begin
       Usuario       := qMotorista.FieldByName('MOTD_ALT_USU'        ).AsString;
       Data          := qMotorista.FieldByName('MOTD_ALT_DT'         ).AsString;
       Hora          := qMotorista.FieldByName('MOTD_ALT_HR'         ).AsString;
       Estacao       := qMotorista.FieldByName('MOTD_ALT_ESTACAO'    ).AsString;
       DataBloqueio  := qMotorista.FieldByName('MOTD_ALT_DTBLOQUEADO').AsString;
       DataLiberacao := qMotorista.FieldByName('MOTD_ALT_DTLIBERADO' ).AsString;
       DataInativo   := qMotorista.FieldByName('MOTD_ALT_DTINATIVO'  ).AsString;
    end;
end;

procedure TMotorista.Pegar_Contato;
begin
    qMotorista.Close;
    qMotorista.SQL.Clear;
    qMotorista.SQL.Add('SELECT * FROM MOTORISTA_CONTATO_MOTC');
    qMotorista.SQL.Add(' WHERE MOTC_CODIGO = :MOTC_CODIGO ');
    qMotorista.ParamByName('MOTC_CODIGO').AsString := FCodigo;
    qMotorista.Open;
    if qMotorista.eof then
    begin
       Inserir_MOTORISTA_CONTATO_MOTC;
       exit;
    end;
   Detalhes.FContato.Nome     := qMotorista.FieldByName('MOTC_NOME'    ).AsString;
   Detalhes.FContato.Fone1    := qMotorista.FieldByName('MOTC_FONE1'   ).AsString;
   Detalhes.FContato.Fone2    := qMotorista.FieldByName('MOTC_FONE2'   ).AsString;
   Detalhes.FContato.Cel      := qMotorista.FieldByName('MOTC_CEL1'    ).AsString;
   Detalhes.FContato.WhatsApp := qMotorista.FieldByName('MOTC_WHATSAPP').AsString;
   Detalhes.FContato.Email1   := qMotorista.FieldByName('MOTC_EMAIL1'  ).AsString;
   Detalhes.FContato.Email2   := qMotorista.FieldByName('MOTC_EMAIL2'  ).AsString;
end;

procedure TMotorista.Pegar_Dados_Basicos;
begin
    qMotorista.Close;
    qMotorista.SQL.Clear;
    qMotorista.SQL.Add('SELECT * FROM MOTORISTA_MOT      ');
    qMotorista.SQL.Add(' WHERE MOT_CODIGO = :MOT_CODIGO');
    qMotorista.ParamByName('MOT_CODIGO').AsString := FCodigo;
    qMotorista.Open;
    if qMotorista.eof then
    begin
       FExiste:=False;
       exit;
    end;
    FExiste                      := True;
    FCodigo                      := qMotorista.FieldByName('MOT_CODIGO'                 ).AsString;
    FNomeFantasia                := qMotorista.FieldByName('MOT_NOME_FANTASIA'          ).AsString;
    FRazaoSocial                 := qMotorista.FieldByName('MOT_RAZAO_SOCIAL'           ).AsString;
    FStatus                      := qMotorista.FieldByName('MOT_STATUS'                 ).AsInteger;
end;

procedure TMotorista.Pegar_Detalhes;
begin
    qMotorista.Close;
    qMotorista.SQL.Clear;
    qMotorista.SQL.Add('SELECT * FROM MOTORISTA_DETALHE_MOTD');
    qMotorista.SQL.Add(' WHERE MOTD_CODIGO = :MOTD_CODIGO ');
    qMotorista.ParamByName('MOTD_CODIGO').AsString := FCodigo;
    qMotorista.Open;
    if qMotorista.eof then
    begin
       exit;
    end;

    Detalhes.FTipoPessoa         := qMotorista.FieldByName('MOTD_PESSOA_FJ'          ).AsString;
    with Detalhes.FPessoaFisica do
    begin
       FCPF                      := qMotorista.FieldByName('MOTD_CPF'                ).AsString;
       FRG                       := qMotorista.FieldByName('MOTD_RG'                 ).AsString;
       FRG_OrgaoEmissor          := qMotorista.FieldByName('MOTD_RG_EMISSOR'         ).AsString;
       FRG_DataEmissao           := qMotorista.FieldByName('MOTD_RG_DTEMISSAO'       ).AsDateTime;
       FRG_DataEmissaoString     := BarrasSeDataNula(qMotorista.FieldByName('MOTD_RG_DTEMISSAO').AsString);
       FDataNascimento           := qMotorista.FieldByName('MOTD_DTNASC'             ).AsDateTime;
       FSexo                     := qMotorista.FieldByName('MOTD_SEXO'               ).AsString;
       FDataNascimentoString     := BarrasSeDataNula(qMotorista.FieldByName('MOTD_DTNASC' ).AsString);
    end;
    with Detalhes.FPessoaJuridica do
    begin
       FCNPJ                     := qMotorista.FieldByName('MOTD_CNPJ'               ).AsString;
       FIE                       := qMotorista.FieldByName('MOTD_IE'                 ).AsString;
    end;
    FDetalhes.RamoAtividade      := qMotorista.FieldByName('MOTD_CDRAMO'             ).AsString;
    FDetalhes.Regiao             := qMotorista.FieldByName('MOTD_CDREGIAO'           ).AsString;
    FDetalhes.Zona               := qMotorista.FieldByName('MOTD_CDZONA'             ).AsString;
    FDetalhes.FDataCadastro      := qMotorista.FieldByName('MOTD_DT'                 ).AsDateTime;
    Pegar_Alteracoes;
end;

procedure TMotorista.Pegar_Endereco;
begin
    qMotorista.Close;
    qMotorista.SQL.Clear;
    qMotorista.SQL.Add('SELECT * FROM MOTORISTA_ENDERECO_MOTE');
    qMotorista.SQL.Add(' WHERE MOTE_CODIGO = :MOTE_CODIGO  ');
    qMotorista.ParamByName('MOTE_CODIGO').AsString := FCodigo;
    qMotorista.Open;
    if qMotorista.eof then
    begin
       exit;
    end;
    FDetalhes.Endereco.Rua         := qMotorista.FieldByName('MOTE_RUA'        ).AsString;
    FDetalhes.Endereco.Numero      := qMotorista.FieldByName('MOTE_NUMERO'     ).AsString;
    FDetalhes.Endereco.Complemento := qMotorista.FieldByName('MOTE_COMPLEMENTO').AsString;
    FDetalhes.Endereco.Bairro      := qMotorista.FieldByName('MOTE_BAIRRO'     ).AsString;
    FDetalhes.Endereco.Cidade      := qMotorista.FieldByName('MOTE_CDCIDADE'   ).AsString;
    FDetalhes.Endereco.CEP         := qMotorista.FieldByName('MOTE_CEP'        ).AsString;
end;

procedure TMotorista.Pegar_Observacoes;
begin
   FObservacao.Clear;
   qMotorista.Close;
   qMotorista.Sql.Clear;
   qMotorista.Sql.Add('SELECT MOTOBS_TEXTO          ');
   qMotorista.Sql.Add('  FROM MOTORISTA_OBS_MOTOBS    ');
   qMotorista.Sql.Add(' WHERE MOTOBS_CODIGO = :COD  ');
   qMotorista.Sql.Add(' ORDER BY MOTOBS_LINHA       ');
   qMotorista.ParamByName('COD').AsString := FCodigo;
   qMotorista.Open;
   while not qMotorista.eof do
   begin
     FObservacao.add(qMotorista.fieldbyname('MOTOBS_TEXTO').AsString);
     qMotorista.Next;
   end;
end;

procedure TMotorista.Preencher_Parametros_MOTORISTA_MOT(pQuery: TFDQuery);
begin
   pQuery.ParamByName('MOT_CODIGO'       ).AsString   := FCodigo;
   pQuery.ParamByName('MOT_NOME_FANTASIA').AsString   := FNomeFantasia;
   pQuery.ParamByName('MOT_RAZAO_SOCIAL' ).AsString   := FRazaoSocial;
   pQuery.ParamByName('MOT_STATUS'       ).AsInteger  := FStatus;
end;

function TMotorista.proximoCodigo: String;
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
    qProximo.SQL.Add('SELECT MAX(MOT_CODIGO) AS MAIOR');
    qProximo.SQL.Add('  FROM MOTORISTA_MOT             ');
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
       qProximo.SQL.Add('SELECT MOT_CODIGO              ');
       qProximo.SQL.Add('  FROM MOTORISTA_MOT           ');
       qProximo.SQL.Add(' WHERE MOT_CODIGO = :MOT_CODIGO');
       qProximo.ParamByName('MOT_CODIGO').AsString := sCodigoCandidato;
       qProximo.Open;
       while not qProximo.Eof do
       begin
          qProximo.Close;
          inc(vCodigoCandidato);
          sCodigoCandidato := FormatFloat('#',vCodigoCandidato);
          qProximo.ParamByName('MOT_CODIGO').AsString := sCodigoCandidato;
          qProximo.Open;
       end;
       qProximo.Free;
       result := sCodigoCandidato;
       exit;
    end;
end;

procedure TMotorista.RegistrarHistorico(pEvento,pLog: String);
begin
   //Histórico de bloqueios e desbloqueios do Motorista
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('INSERT INTO MOTORISTA_HISTORICO_BLOQUEIOS_MOTHB ');
   qLocal.Sql.Add('     ( MOTHB_MOTORISTA,                         ');
   qLocal.Sql.Add('       MOTHB_EVENTO,                          ');
   qLocal.Sql.Add('       MOTHB_DTEVENTO,                        ');
   qLocal.Sql.Add('       MOTHB_HREVENTO,                        ');
   qLocal.Sql.Add('       MOTHB_USUEVENTO,                       ');
   qLocal.Sql.Add('       MOTHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                      ');
   qLocal.Sql.Add('VALUES                                      ');
   qLocal.Sql.Add('     (:MOTHB_MOTORISTA,                         ');
   qLocal.Sql.Add('      :MOTHB_EVENTO,                          ');
   qLocal.Sql.Add('      :MOTHB_DTEVENTO,                        ');
   qLocal.Sql.Add('      :MOTHB_HREVENTO,                        ');
   qLocal.Sql.Add('      :MOTHB_USUEVENTO,                       ');
   qLocal.Sql.Add('      :MOTHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                                                                                           ');
   qLocal.ParamByName('MOTHB_MOTORISTA' ).AsString   := FCodigo;
   qLocal.ParamByName('MOTHB_EVENTO'   ).AsString   := pEvento;
   qLocal.ParamByName('MOTHB_DTEVENTO' ).AsDateTime := DataServidor;
   qLocal.ParamByName('MOTHB_HREVENTO' ).AsString   := HoraServidor;
   qLocal.ParamByName('MOTHB_USUEVENTO').AsString   := Usuario.Codigo;
   qLocal.ParamByName('MOTHB_MAQEVENTO').AsString   := NomeComputador;
   qLocal.ExecSql;

   Log('Classe_Motorista',pLog+' motorista '+FCodigo+' - '+FNomeFantasia);
end;

procedure TMotorista.RegistrarHistoricoDeAtivacao;
begin
   RegistrarHistorico('Ativado','Ativou');
end;

procedure TMotorista.RegistrarHistoricoDeBloqueio;
begin
   RegistrarHistorico('Bloqueado','Bloqueou');
end;

procedure TMotorista.RegistrarHistoricoDeDesBloqueio;
begin
   RegistrarHistorico('Desbloqueado','Desbloqueou');
end;

procedure TMotorista.RegistrarHistoricoDeInativacao;
begin
   RegistrarHistorico('Inativado','Inativou');
end;

procedure TMotorista.setDetalhes(const Value: tDetalhes_Motorista);
begin
   FDetalhes := Value;
end;

procedure TMotorista.setFCodigo(const Value: String);
begin
   if Value = '' then
      FCodigo := Copy(proximoCodigo,1,10)
   else
      FCodigo := Copy(Value,1,10);
end;

procedure TMotorista.setFNomeFantasia(const Value: String);
begin
   FNomeFantasia := UpperCase(Copy(Value,1,50));
end;

procedure TMotorista.setFObservacao(const Value: TStringList);
begin
   FObservacao := Value;
end;

procedure TMotorista.setFStatus(const Value: TStatusCadastral);
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

procedure TMotorista.setRazaoSocial(const Value: String);
begin
   FRazaoSocial := UpperCase(Copy(value,1,50));
end;

function TMotorista.Update: Boolean;
begin
    result := false;
    if not Update_MOTORISTA_MOT           then exit;
    if not Update_MOTORISTA_DETALHE_MOTD  then exit;
    if not Update_MOTORISTA_ENDERECO_MOTE then exit;
    if not Update_MOTORISTA_CONTATO_MOTC then exit;
    Gravar_Observacoes;
    Result := True;
    Log('Classe_Motorista','Alterou motorista '+ FCodigo + ' - ' + FNomeFantasia);
end;

function TMotorista.Update_MOTORISTA_MOT:Boolean;
begin
    try
        qMotorista.Close;
        qMotorista.SQL.Clear;
        qMotorista.SQL.Add('UPDATE MOTORISTA_MOT                                           ');
        qMotorista.SQL.Add('   SET MOT_NOME_FANTASIA           = :MOT_NOME_FANTASIA,       ');
        qMotorista.SQL.Add('       MOT_RAZAO_SOCIAL            = :MOT_RAZAO_SOCIAL,        ');
        qMotorista.SQL.Add('       MOT_STATUS                  = :MOT_STATUS               ');
        qMotorista.SQL.Add(' WHERE MOT_CODIGO                  = :MOT_CODIGO               ');
        Preencher_Parametros_MOTORISTA_MOT(qMotorista);
        qMotorista.ExecSql;
        Log('Classe_Motorista','Alterou motorista '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Motorista '+ FNomeFantasia);
       LogErros('Classe_Motorista','Erro ao alterar Motorista '+ FNomeFantasia);
    end;
end;

function TMotorista.Update_MOTORISTA_CONTATO_MOTC: Boolean;
begin
    if existe_MOTORISTA_CONTATO_MOTC then
       result := alterar_MOTORISTA_CONTATO_MOTC
    else
       result := inserir_MOTORISTA_CONTATO_MOTC;
end;

function TMotorista.alterar_MOTORISTA_CONTATO_MOTC: Boolean;
begin
    result := False;
    try
        qMotorista.Close;
        qMotorista.SQL.Clear;
        qMotorista.SQL.Add('UPDATE MOTORISTA_CONTATO_MOTC         ');
        qMotorista.SQL.Add('   SET MOTC_NOME     = :MOTC_NOME,     ');
        qMotorista.SQL.Add('       MOTC_FONE1    = :MOTC_FONE1,    ');
        qMotorista.SQL.Add('       MOTC_FONE2    = :MOTC_FONE2,    ');
        qMotorista.SQL.Add('       MOTC_CEL1     = :MOTC_CEL1,     ');
        qMotorista.SQL.Add('       MOTC_WHATSAPP = :MOTC_WHATSAPP, ');
        qMotorista.SQL.Add('       MOTC_EMAIL1   = :MOTC_EMAIL1,   ');
        qMotorista.SQL.Add('       MOTC_EMAIL2   = :MOTC_EMAIL2    ');
        qMotorista.SQL.Add(' WHERE MOTC_CODIGO   = :MOTC_CODIGO    ');
        Preencher_Parametros_MOTORISTA_CONTATO_MOTC(qMotorista);
        qMotorista.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao alterar Contatos do Motorista ' + FNomeFantasia);
       LOGErros('Classe_Motorista','Erro ao Alterar Contatos do Motorista ' + FNomeFantasia);
    end;
end;

function TMotorista.Update_MOTORISTA_DETALHE_MOTD:Boolean;
begin
    if existe_MOTORISTA_DETALHE_MOTD then
       result := alterar_MOTORISTA_DETALHE_MOTD
    else
       result := inserir_MOTORISTA_DETALHE_MOTD;
end;

function TMotorista.alterar_MOTORISTA_DETALHE_MOTD:Boolean;
begin
    result := false;
    try
        qMotorista.Close;
        qMotorista.SQL.Clear;
        qMotorista.SQL.Add('UPDATE MOTORISTA_DETALHE_MOTD                                  ');
        qMotorista.SQL.Add('   SET MOTD_PESSOA_FJ           = :MOTD_PESSOA_FJ,           ');
        qMotorista.SQL.Add('       MOTD_NUVEM_ATUALIZADO    = :MOTD_NUVEM_ATUALIZADO,    ');
        qMotorista.SQL.Add('       MOTD_CPF                 = :MOTD_CPF,                 ');
        qMotorista.SQL.Add('       MOTD_CNPJ                = :MOTD_CNPJ,                ');
        qMotorista.SQL.Add('       MOTD_IE                  = :MOTD_IE,                  ');
        qMotorista.SQL.Add('       MOTD_RG                  = :MOTD_RG,                  ');
        qMotorista.SQL.Add('       MOTD_RG_EMISSOR          = :MOTD_RG_EMISSOR,          ');
        qMotorista.SQL.Add('       MOTD_RG_DTEMISSAO        = :MOTD_RG_DTEMISSAO,        ');
        qMotorista.SQL.Add('       MOTD_DTNASC              = :MOTD_DTNASC,              ');
        qMotorista.SQL.Add('       MOTD_SEXO                = :MOTD_SEXO,                ');
        qMotorista.SQL.Add('       MOTD_ALT_USU             = :MOTD_ALT_USU,             ');
        qMotorista.SQL.Add('       MOTD_ALT_DT              = :MOTD_ALT_DT,              ');
        qMotorista.SQL.Add('       MOTD_ALT_HR              = :MOTD_ALT_HR,              ');
        qMotorista.SQL.Add('       MOTD_ALT_ESTACAO         = :MOTD_ALT_ESTACAO,         ');
        qMotorista.SQL.Add('       MOTD_ALT_DTBLOQUEADO     = :MOTD_ALT_DTBLOQUEADO,     ');
        qMotorista.SQL.Add('       MOTD_ALT_DTLIBERADO      = :MOTD_ALT_DTLIBERADO,      ');
        qMotorista.SQL.Add('       MOTD_ALT_DTINATIVO       = :MOTD_ALT_DTINATIVO,       ');
        qMotorista.SQL.Add('       MOTD_CDRAMO              = :MOTD_CDRAMO,              ');
        qMotorista.SQL.Add('       MOTD_CDREGIAO            = :MOTD_CDREGIAO,            ');
        qMotorista.SQL.Add('       MOTD_CDZONA              = :MOTD_CDZONA               ');
        qMotorista.SQL.Add(' WHERE MOTD_CODIGO              = :MOTD_CODIGO               ');
        qMotorista.ParamByName('MOTD_CODIGO'          ).AsString   := FCodigo;
        qMotorista.ParamByName('MOTD_NUVEM_ATUALIZADO').AsInteger  := 0;
        qMotorista.ParamByName('MOTD_PESSOA_FJ'       ).AsString   := FDetalhes.FTipoPessoa;
        qMotorista.ParamByName('MOTD_CPF'             ).AsString   := FDetalhes.FPessoaFisica.FCPF;
        qMotorista.ParamByName('MOTD_CNPJ'            ).AsString   := FDetalhes.FPessoaJuridica.FCNPJ;
        qMotorista.ParamByName('MOTD_IE'              ).AsString   := FDetalhes.FPessoaJuridica.FIE;
        qMotorista.ParamByName('MOTD_RG'              ).AsString   := FDetalhes.FPessoaFisica.FRG;
        qMotorista.ParamByName('MOTD_RG_EMISSOR'      ).AsString   := FDetalhes.FPessoaFisica.FRG_OrgaoEmissor;
        qMotorista.ParamByName('MOTD_RG_DTEMISSAO'    ).AsDateTime := FDetalhes.FPessoaFisica.FRG_DataEmissao;
        qMotorista.ParamByName('MOTD_DTNASC'          ).AsDateTime := FDetalhes.FPessoaFisica.FDataNascimento;
        qMotorista.ParamByName('MOTD_SEXO'            ).AsString   := FDetalhes.FPessoaFisica.FSexo;
        qMotorista.ParamByName('MOTD_ALT_USU'         ).AsString   := Usuario.Codigo;
        qMotorista.ParamByName('MOTD_ALT_DT'          ).AsDateTime := DataServidor;
        qMotorista.ParamByName('MOTD_ALT_HR'          ).AsString   := HoraServidor;
        qMotorista.ParamByName('MOTD_ALT_ESTACAO'     ).AsString   := NomeComputador;
        qMotorista.ParamByName('MOTD_ALT_DTBLOQUEADO' ).AsDateTime := ZeroSeDataNula(FAlteracao.DataBloqueio);
        qMotorista.ParamByName('MOTD_ALT_DTLIBERADO'  ).AsDateTime := ZeroSeDataNula(FAlteracao.DataLiberacao);
        qMotorista.ParamByName('MOTD_ALT_DTINATIVO'   ).AsDateTime := ZeroSeDataNula(FAlteracao.DataInativo);
        qMotorista.ParamByName('MOTD_CDRAMO'          ).AsString   := FDetalhes.FRamoAtividade;
        qMotorista.ParamByName('MOTD_CDREGIAO'        ).AsString   := FDetalhes.FRegiao;
        qMotorista.ParamByName('MOTD_CDZONA'          ).AsString   := FDetalhes.FZona;
        qMotorista.ExecSql;

        Log('Classe_Motorista','Alterou motorista '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Detalhes do Motorista '+ FNomeFantasia);
       LogErros('Classe_Motorista','Erro ao alterar Detalhes do Motorista '+ FNomeFantasia);
    end;
end;

function TMotorista.Update_MOTORISTA_ENDERECO_MOTE:Boolean;
begin
    if existe_MOTORISTA_ENDERECO_MOTE then
       result := alterar_MOTORISTA_ENDERECO_MOTE
    else
       result := inserir_MOTORISTA_ENDERECO_MOTE;
end;

function TMotorista.alterar_MOTORISTA_ENDERECO_MOTE:Boolean;
begin
   try
        qMotorista.Close;
        qMotorista.SQL.Clear;
        qMotorista.SQL.Add('UPDATE MOTORISTA_ENDERECO_MOTE                                 ');
        qMotorista.SQL.Add('   SET MOTE_RUA                 = :MOTE_RUA,                 ');
        qMotorista.SQL.Add('       MOTE_NUMERO              = :MOTE_NUMERO,              ');
        qMotorista.SQL.Add('       MOTE_COMPLEMENTO         = :MOTE_COMPLEMENTO,         ');
        qMotorista.SQL.Add('       MOTE_BAIRRO              = :MOTE_BAIRRO,              ');
        qMotorista.SQL.Add('       MOTE_CDCIDADE            = :MOTE_CDCIDADE,            ');
        qMotorista.SQL.Add('       MOTE_CEP                 = :MOTE_CEP                  ');
        qMotorista.SQL.Add(' WHERE MOTE_CODIGO              = :MOTE_CODIGO               ');
        qMotorista.ParamByName('MOTE_CODIGO'          ).AsString   := FCodigo;
        qMotorista.ParamByName('MOTE_RUA'             ).AsString   := FDetalhes.FEndereco.Rua;
        qMotorista.ParamByName('MOTE_NUMERO'          ).AsString   := FDetalhes.FEndereco.Numero;
        qMotorista.ParamByName('MOTE_COMPLEMENTO'     ).AsString   := FDetalhes.FEndereco.Complemento;
        qMotorista.ParamByName('MOTE_BAIRRO'          ).AsString   := FDetalhes.FEndereco.Bairro;
        qMotorista.ParamByName('MOTE_CDCIDADE'        ).AsString   := FDetalhes.FEndereco.Cidade;
        qMotorista.ParamByName('MOTE_CEP'             ).AsString   := FDetalhes.FEndereco.CEP;
        qMotorista.ExecSql;

        Log('Classe_Motorista','Alterou motorista '+ FNomeFantasia);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Endereço do Motorista '+ FNomeFantasia);
       LogErros('Classe_Motorista','Erro ao alterar Endereço do Motorista '+ FNomeFantasia);
    end;
end;

{ tDetalhes_Motorista }

constructor tDetalhes_Motorista.Create;
begin
  qMotorista := TFDQuery.Create(nil);
  qMotorista.ConnectionName :='X';
  FPessoaFisica  := tPessoa_Fisica.Create;
  FPessoaJuridica:= tPessoa_Juridica.Create;
  FEndereco      := TEndereco.Create;
  FContato       := TContato.Create;
end;

destructor tDetalhes_Motorista.Destroy;
begin
  qMotorista.Free;
  FPessoaFisica.Free;
  FPessoaJuridica.Free;
  FEndereco.Free;
  FContato.Free;
  inherited;
end;

function tDetalhes_Motorista.getDataCadastroString: String;
begin
   result := DateToStr(FDataCadastro);
end;

{function tDetalhes_Motorista.getFCodigoMunicipio: String;
begin
   result := FCodigoMunicipio;
end;
}
function tDetalhes_Motorista.getFDataCadastro: TDateTime;
begin
   result := FDataCadastro;
end;

function tDetalhes_Motorista.getFRamoAtividade: String;
begin
   result := FRamoAtividade;
end;

function tDetalhes_Motorista.getFRegiao: String;
begin
   Result := FRegiao;
end;

function tDetalhes_Motorista.getFTipoPessoa: TTipoPessoa;
begin
   Result := StringToTipoPessoa(FTipoPessoa);
end;

function tDetalhes_Motorista.getFZona: String;
begin
   Result := FZona;
end;

{
procedure tDetalhes_Motorista.setFCodigoMunicipio(const Value: String);
begin
   FCodigoMunicipio := Value;
end;
}
procedure tDetalhes_Motorista.setFDataCadastro(const Value: TDateTime);
begin
   FDataCadastro := Value;
end;

procedure tDetalhes_Motorista.setFRamoAtividade(const Value: String);
begin
   FRamoAtividade := Copy(Value,1,10);
end;

procedure tDetalhes_Motorista.setFRegiao(const Value: String);
begin
   FRegiao := Copy(Value,1,10);
end;

procedure tDetalhes_Motorista.setFTipoPessoa(const Value: TTipoPessoa);
begin
   FTipoPessoa := TipoPessoaToString(Value);
end;

procedure tDetalhes_Motorista.setFZona(const Value: String);
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

