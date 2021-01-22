unit Classe_Produto;

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

   TTributacao_de_Produto = class
   private
     FNFE_104_I05_NCM  : String;
     FNFE_104_I05_CEST : String;
     FNFE_107_I08_CFOP : String;

    function getFNFE_104_I05_NCM: String;
    procedure setFNFE_104_I05_NCM(const Value: String);
    function getFNFE_104_I05_CEST: String;
    procedure setFNFE_104_I05_CEST(const Value: String);
    function getFNFE_107_I08_CFOP: String;
    procedure setFNFE_107_I08_CFOP(const Value: String);
   published
    property NFE_104_I05_NCM  : String read getFNFE_104_I05_NCM  write setFNFE_104_I05_NCM;
    property NFE_104_I05_CEST : String read getFNFE_104_I05_CEST write setFNFE_104_I05_CEST;
    property NFE_107_I08_CFOP : String read getFNFE_107_I08_CFOP write setFNFE_107_I08_CFOP;


   end;

  tPrecos_Produtos  = class
  private
     FVarejo      : Real;
     FDistribuidor: Real;
     FAtacado     : Real;
    function getFAtacado: Real;
    function getFDistribuidor: Real;
    function getFVarejo: Real;
    procedure setFAtacado(const Value: Real);
    procedure setFDistribuidor(const Value: Real);
    procedure setFVarejo(const Value: Real);
    public
      property Varejo:       Real read getFVarejo       write setFVarejo;
      property Distribuidor: Real read getFDistribuidor write setFDistribuidor;
      property Atacado:      Real read getFAtacado      write setFAtacado;

  end;

  tDetalhes_Produto = class
    private
      FDataCadastro      : TDateTime;
      FMarca             : String;
      FFamilia           : String;
      FGrupo             : String;
      FSubGrupo          : String;
      FTipo              : String;
      FImpressora        : String;

      function  getFDataCadastro: TDateTime;
      procedure setFDataCadastro(const Value: TDateTime);
      function  getDataCadastroString: String;
      function getFMarca: String;
      procedure setFMarca(const Value: String);
      function getFFamilia: String;
      procedure setFFamilia(const Value: String);
      function getFGrupo: String;
      procedure setFGrupo(const Value: String);
      function getFSubGrupo: String;
      procedure setFSubGrupo(const Value: String);
    function getFImpressora: String;
    function getFTipo: String;
    procedure setFImpressora(const Value: String);
    procedure setFTipo(const Value: String);
    public
      constructor Create;
      destructor Destroy; override;
      property DataCadastro      : TDateTime        read getFDataCadastro       write setFDataCadastro;
      property DataCadastroString: String           read getDataCadastroString;
      property Marca             : String           read getFMarca              write setFMarca;
      property Familia           : String           read getFFamilia            write setFFamilia;
      property Grupo             : String           read getFGrupo              write setFGrupo;
      property SubGrupo          : String           read getFSubGrupo           write setFSubGrupo;
      property Tipo              : String           read getFTipo               write setFTipo;
      property Impressora        : String           read getFImpressora         write setFImpressora;

end;

TProdutoAlteracao = class(TAlteracao);

TProduto = class
  private
    FExiste            : Boolean;
    FCodigo            : String;
    FNome              : String;
    FUnidade           : String;
	  FStatus            : Integer;
    FPrecos            : tPrecos_Produtos;
    FDetalhes          : tDetalhes_Produto;
    FAlteracao         : tProdutoAlteracao;
    FObservacao        : TStringList;
    FTributacao        : TTributacao_de_Produto;
    qProduto,
    qLocal: TFDQuery;
    function getFStatus : TStatusCadastral;
    function getDetalhes: tDetalhes_Produto;
    function getFCodigo: String;
    function getFExiste: Boolean;
    function getFNome  : String;
    procedure setDetalhes(const Value: tDetalhes_Produto);
    procedure setFCodigo(const Value: String);
    procedure setFNome(const Value: String);

    function  Update:Boolean;
    function  Update_PRODUTO_PROD:Boolean;
    function  Update_PRODUTO_DETALHE_PRODD :Boolean;
    function  Update_PRODUTO_FISCAL_PRODF  :Boolean;

    function  existe_PRODUTO_DETALHE_PRODD :Boolean;
    function  existe_PRODUTO_FISCAL_PRODF  :Boolean;

    function  alterar_PRODUTO_DETALHE_PRODD:Boolean;
    function  alterar_PRODUTO_FISCAL_PRODF :Boolean;

    function  Insert:Boolean;
    function  Inserir_PRODUTO_PROD          :Boolean;
    function  Inserir_PRODUTO_DETALHES_PRODD:Boolean;
    function  Inserir_PRODUTO_FISCAL_PRODF  :Boolean;

    function  DadosCorretos:Boolean;
    procedure Preencher_Parametros_PRODUTO_PROD(pQuery:TFDQuery);
    procedure Preencher_Parametros_PRODUTO_DETALHES_PRODD(pQuery:TFDQuery);
    procedure Preencher_Parametros_RODUTO_FISCAL_PRODF(pQuery:TFDQuery);

    procedure RegistrarHistoricoDeAtivacao;
    procedure RegistrarHistoricoDeBloqueio;
    procedure RegistrarHistoricoDeDesBloqueio;
    procedure RegistrarHistoricoDeInativacao;
    procedure RegistrarHistorico(pEvento,pLog:String);

    procedure setFStatus(const Value: TStatusCadastral);
    function getFUnidade: String;
    procedure setFUnidade(const Value: String);
    procedure LimparCampos;
    procedure Recuperar_Dados_Basicos;
    procedure Recuperar_Detalhes;
    procedure Recuperar_Tributacao;
    procedure Recuperar_Alteracoes;

    procedure Recuperar_Observacoes;
    procedure Gravar_Observacoes;
    function getFObservacao: TStringList;
    procedure setFObservacao(const Value: TStringList);
    function getFTributacao: TTributacao_de_Produto;
    procedure setFTributacao(const Value: TTributacao_de_Produto);
    //function getFObservacao: TStringList;
    //function getFUnidade: String;
    //function Gravar: Boolean;
    //procedure Gravar_Observacoes;
    //function Inserir_PRODUTO_DETALHES_PRODD: Boolean;
    //function Inserir_PRODUTO_PROD: Boolean;
    //procedure LimparCampos;
    //procedure Recuperar_Alteracoes;
    //procedure Recuperar_Dados_Basicos;
    //procedure Recuperar_Detalhes;
    //procedure Recuperar_Observacoes;
    //procedure Preencher_Parametros_PRODUTO_PROD(pQuery: TFDQuery);
    //procedure RegistrarHistorico(pEvento, pLog: String);
    //procedure RegistrarHistoricoDeAtivacao;
    //procedure RegistrarHistoricoDeBloqueio;
    //procedure RegistrarHistoricoDeDesBloqueio;
    //procedure RegistrarHistoricoDeInativacao;
    //procedure setFObservacao(const Value: TStringList);
    //procedure setFStatus(const Value: TStatusCadastral);
    //procedure setFUnidade(const Value: String);
  public
      constructor Create;
      destructor Destroy; override;
      property Existe        : Boolean                read getFExiste;
      Property Codigo        : String                 read getFCodigo     write setFCodigo;
      Property Nome          : String                 read getFNome       write setFNome;
      Property Unidade       : String                 read getFUnidade    write setFUnidade;
      Property Status        : TStatusCadastral       read getFStatus     write setFStatus;
      Property Precos        : tPrecos_Produtos       read FPrecos        write FPrecos;
      Property Detalhes      : tDetalhes_Produto      read getDetalhes    write setDetalhes;
      property Alteracao     : TProdutoAlteracao      read FAlteracao     write FAlteracao;
      property Observacao    : TStringList            read getFObservacao write setFObservacao;
      property Tributacao    : TTributacao_de_Produto read getFTributacao write setFTributacao;
      procedure Abrir;
      Function Gravar:Boolean;
end;

implementation

uses FuncoesSMC,
     Classe_Nuvem;

{ tDetalhes_Produto }

constructor tDetalhes_Produto.Create;
begin
end;

destructor tDetalhes_Produto.Destroy;
begin
  inherited;
end;

function tDetalhes_Produto.getDataCadastroString: String;
begin
  result := DateToStr(FDataCadastro);
end;

function tDetalhes_Produto.getFDataCadastro: TDateTime;
begin
  result := FDataCadastro;
end;

function tDetalhes_Produto.getFFamilia: String;
begin
  result := FFamilia;
end;

function tDetalhes_Produto.getFGrupo: String;
begin
  result := FGrupo;
end;

function tDetalhes_Produto.getFImpressora: String;
begin
  result := FImpressora;
end;

function tDetalhes_Produto.getFMarca: String;
begin
  result := FMarca;
end;

function tDetalhes_Produto.getFSubGrupo: String;
begin
  result := FSubGrupo;
end;

function tDetalhes_Produto.getFTipo: String;
begin
  result := FTipo;
end;

procedure tDetalhes_Produto.setFDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
end;

procedure tDetalhes_Produto.setFFamilia(const Value: String);
begin
  FFamilia := Value;
end;

procedure tDetalhes_Produto.setFGrupo(const Value: String);
begin
  FGrupo := Value;
end;

procedure tDetalhes_Produto.setFImpressora(const Value: String);
begin
   FImpressora := Value;
end;

procedure tDetalhes_Produto.setFMarca(const Value: String);
begin
   FMarca := Value;
end;

procedure tDetalhes_Produto.setFSubGrupo(const Value: String);
begin
   FSubGrupo := Value;
end;

procedure tDetalhes_Produto.setFTipo(const Value: String);
begin
   FTipo := Value;
end;

{ TProduto }

procedure TProduto.Abrir;
begin
    LimparCampos;

    if not Existe then
       exit;

    Recuperar_Dados_Basicos;
    Recuperar_Detalhes;
    Recuperar_Tributacao;
    Recuperar_Observacoes;
end;

function TProduto.alterar_PRODUTO_DETALHE_PRODD: Boolean;
begin
    result := false;
    try
        qProduto.Close;
        qProduto.SQL.Clear;
        qProduto.SQL.Add('UPDATE PRODUTO_DETALHES_PRODD                         ');
        qProduto.SQL.Add('   SET PRODD_CDMARCA         = :PRODD_CDMARCA,        ');
        qProduto.SQL.Add('       PRODD_CDFAMILIA       = :PRODD_CDFAMILIA,      ');
        qProduto.SQL.Add('       PRODD_CDGRUPO         = :PRODD_CDGRUPO,        ');
        qProduto.SQL.Add('       PRODD_CDSUBGRUPO      = :PRODD_CDSUBGRUPO,     ');
        qProduto.SQL.Add('       PRODD_CDTIPO          = :PRODD_CDTIPO,         ');
        qProduto.SQL.Add('       PRODD_CDIMPRESSORA    = :PRODD_CDIMPRESSORA,   ');
        qProduto.SQL.Add('       PRODD_ALT_USU         = :PRODD_ALT_USU,        ');
        qProduto.SQL.Add('       PRODD_ALT_DT          = :PRODD_ALT_DT,         ');
        qProduto.SQL.Add('       PRODD_ALT_HR          = :PRODD_ALT_HR,         ');
        qProduto.SQL.Add('       PRODD_ALT_ESTACAO     = :PRODD_ALT_ESTACAO,    ');
        qProduto.SQL.Add('       PRODD_ALT_DTBLOQUEADO = :PRODD_ALT_DTBLOQUEADO,');
        qProduto.SQL.Add('       PRODD_ALT_DTLIBERADO  = :PRODD_ALT_DTLIBERADO, ');
        qProduto.SQL.Add('       PRODD_ALT_DTINATIVO   = :PRODD_ALT_DTINATIVO,  ');
        qProduto.SQL.Add('       PRODD_NUVEM_ATUALIZADO= :PRODD_NUVEM_ATUALIZADO');
        qProduto.SQL.Add(' WHERE PRODD_CODIGO          = :PRODD_CODIGO          ');

        Preencher_Parametros_PRODUTO_DETALHES_PRODD(qProduto);

        qProduto.ExecSql;

        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Detalhes do Produto '+ FNome);
       LogErros('Classe_Produto','Erro ao alterar Detalhes do Produto '+ FNome);
    end;
end;

function TProduto.alterar_PRODUTO_FISCAL_PRODF: Boolean;
begin
    result := false;
    try
        qProduto.Close;
        qProduto.SQL.Clear;
        qProduto.SQL.Add('UPDATE PRODUTO_FISCAL_PRODF                             ');
        qProduto.SQL.Add('   SET PRODF_NFE_104_I05_NCM  = :PRODF_NFE_104_I05_NCM, ');
        qProduto.SQL.Add('       PRODF_NFE_104_I05_CEST = :PRODF_NFE_104_I05_CEST,');
        qProduto.SQL.Add('       PRODF_NFE_107_I08_CFOP = :PRODF_NFE_107_I08_CFOP ');
        qProduto.SQL.Add(' WHERE PRODF_CODIGO          = :PRODF_CODIGO            ');

        Preencher_Parametros_RODUTO_FISCAL_PRODF(qProduto);

        qProduto.ExecSql;

        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Tributação do Produto '+ FNome);
       LogErros('Classe_Produto','Erro ao alterar Detalhes do Produto '+ FNome);
    end;
end;

constructor TProduto.Create;
begin
   FDetalhes   := tDetalhes_Produto.Create;
   FPrecos     := tPrecos_Produtos.Create;
   FObservacao := TStringList.Create;
   FAlteracao  := TProdutoAlteracao.Create;
   FTributacao := TTributacao_de_Produto.Create;
   qProduto := TFDQuery.Create(nil);
   qProduto.ConnectionName :='X';
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName :='X';
end;

function TProduto.DadosCorretos: Boolean;
begin
    Result := False;
    // ...criticas...
    Result := True;
end;

destructor TProduto.Destroy;
begin
  FDetalhes.Free;
  FPrecos.Free;
  FAlteracao.Free;
  FObservacao.Free;
  FTributacao.Free;
  qProduto.Free;
  qLocal.Free;
  inherited;
end;

function TProduto.existe_PRODUTO_DETALHE_PRODD: Boolean;
begin
    qProduto.Close;
    qProduto.SQL.Clear;
    qProduto.SQL.Add('SELECT PRODD_CODIGO                ');
    qProduto.SQL.Add('  FROM PRODUTO_DETALHES_PRODD      ');
    qProduto.SQL.Add(' WHERE PRODD_CODIGO = :PRODD_CODIGO');
    qProduto.ParamByName('PRODD_CODIGO').AsString := FCodigo;
    qProduto.Open;
    result := not qProduto.Eof;
end;

function TProduto.existe_PRODUTO_FISCAL_PRODF: Boolean;
begin
    qProduto.Close;
    qProduto.SQL.Clear;
    qProduto.SQL.Add('SELECT PRODF_CODIGO                ');
    qProduto.SQL.Add('  FROM PRODUTO_FISCAL_PRODF        ');
    qProduto.SQL.Add(' WHERE PRODF_CODIGO = :PRODF_CODIGO');
    qProduto.ParamByName('PRODF_CODIGO').AsString := FCodigo;
    qProduto.Open;
    result := not qProduto.Eof;
end;

function TProduto.getDetalhes: tDetalhes_Produto;
begin
   result := FDetalhes;
end;

function TProduto.getFCodigo: String;
begin
   Result := FCodigo;
end;

function TProduto.getFExiste: Boolean;
begin
    qProduto.Close;
    qProduto.SQL.Clear;
    qProduto.SQL.Add('SELECT *                         ');
    qProduto.SQL.Add('  FROM PRODUTO_PROD              ');
    qProduto.SQL.Add(' WHERE PROD_CODIGO = :PROD_CODIGO');
    qProduto.ParamByName('PROD_CODIGO').AsString   := FCodigo;
    qProduto.Open;
    result := not qProduto.Eof;
end;

function TProduto.getFNome: String;
begin
  Result :=  FNome;
end;

function TProduto.getFObservacao: TStringList;
begin
   result := FObservacao;
end;

function TProduto.getFStatus: TStatusCadastral;
begin
   Result := IntToStatusCadastral(FStatus);
end;

function TProduto.getFTributacao: TTributacao_de_Produto;
begin
  Result := FTributacao;
end;

function TProduto.getFUnidade: String;
begin
   Result := FUnidade;
end;

function TProduto.Gravar: Boolean;
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

procedure TProduto.Gravar_Observacoes;
var i : Integer;
begin
   qProduto.Close;
   qProduto.Sql.Clear;
   qProduto.Sql.Add('DELETE FROM PRODUTO_OBS_PRODOBS ');
   qProduto.Sql.Add(' WHERE PRODOBS_CODIGO = :COD    ');
   qProduto.ParamByName('COD').AsString := FCodigo;
   qProduto.ExecSql;

   for i := 0 to FObservacao.count-1 do
   begin
      qProduto.close;
      qProduto.sql.Clear;
      qProduto.sql.Add('INSERT INTO PRODUTO_OBS_PRODOBS   ');
      qProduto.sql.Add('     ( PRODOBS_CODIGO,            ');
	    qProduto.sql.Add('       PRODOBS_LINHA,             ');
      qProduto.sql.Add('       PRODOBS_TEXTO)             ');
      qProduto.sql.Add('VALUES                           ');
      qProduto.sql.Add('     (:PRODOBS_CODIGO,            ');
	    qProduto.sql.Add('      :PRODOBS_LINHA,             ');
      qProduto.sql.Add('      :PRODOBS_TEXTO)             ');
      qProduto.ParamByName('PRODOBS_CODIGO').AsString := FCodigo;
	    qProduto.ParamByName('PRODOBS_LINHA' ).AsInteger:= i;
      qProduto.ParamByName('PRODOBS_TEXTO' ).AsString := FObservacao[i];
      qProduto.ExecSql;
   end;
end;

function TProduto.Inserir_PRODUTO_DETALHES_PRODD: Boolean;
begin
    result := False;
    try
        qProduto.Close;
        qProduto.SQL.Clear;
        qProduto.SQL.Add('INSERT INTO PRODUTO_DETALHES_PRODD ');
        qProduto.SQL.Add('     (                             ');
        qProduto.SQL.Add('       PRODD_CODIGO,               ');
        qProduto.SQL.Add('       PRODD_CDMARCA,              ');
        qProduto.SQL.Add('       PRODD_CDFAMILIA,            ');
        qProduto.SQL.Add('       PRODD_CDGRUPO,              ');
        qProduto.SQL.Add('       PRODD_CDSUBGRUPO,           ');
        qProduto.SQL.Add('       PRODD_CDTIPO,               ');
        qProduto.SQL.Add('       PRODD_CDIMPRESSORA,         ');
        qProduto.SQL.Add('       PRODD_ALT_USU,              ');
        qProduto.SQL.Add('       PRODD_ALT_DT,               ');
        qProduto.SQL.Add('       PRODD_ALT_HR,               ');
        qProduto.SQL.Add('       PRODD_ALT_ESTACAO,          ');
        qProduto.SQL.Add('       PRODD_ALT_DTBLOQUEADO,      ');
        qProduto.SQL.Add('       PRODD_ALT_DTLIBERADO,       ');
        qProduto.SQL.Add('       PRODD_ALT_DTINATIVO,        ');
        qProduto.SQL.Add('       PRODD_NUVEM_ATUALIZADO      ');
        qProduto.SQL.Add('     )                             ');
        qProduto.SQL.Add('VALUES                             ');
        qProduto.SQL.Add('     (                             ');
        qProduto.SQL.Add('      :PRODD_CODIGO,               ');
        qProduto.SQL.Add('      :PRODD_CDMARCA,              ');
        qProduto.SQL.Add('      :PRODD_CDFAMILIA,            ');
        qProduto.SQL.Add('      :PRODD_CDGRUPO,              ');
        qProduto.SQL.Add('      :PRODD_CDSUBGRUPO,           ');
        qProduto.SQL.Add('      :PRODD_CDTIPO,               ');
        qProduto.SQL.Add('      :PRODD_CDIMPRESSORA,         ');
        qProduto.SQL.Add('      :PRODD_ALT_USU,              ');
        qProduto.SQL.Add('      :PRODD_ALT_DT,               ');
        qProduto.SQL.Add('      :PRODD_ALT_HR,               ');
        qProduto.SQL.Add('      :PRODD_ALT_ESTACAO,          ');
        qProduto.SQL.Add('      :PRODD_ALT_DTBLOQUEADO,      ');
        qProduto.SQL.Add('      :PRODD_ALT_DTLIBERADO,       ');
        qProduto.SQL.Add('      :PRODD_ALT_DTINATIVO,        ');
        qProduto.SQL.Add('      :PRODD_NUVEM_ATUALIZADO      ');
        qProduto.SQL.Add('     )                             ');

        Preencher_Parametros_PRODUTO_DETALHES_PRODD(qProduto);

        qProduto.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Detalhes do Produto ' + FNome);
       LOGErros('Classe_Produto','Erro ao incluir Detalhes do Produto ' + FNome);
    end;
end;

function TProduto.Inserir_PRODUTO_FISCAL_PRODF: Boolean;
begin
    result := False;
    try
        qProduto.Close;
        qProduto.SQL.Clear;
        qProduto.SQL.Add('INSERT INTO PRODUTO_FISCAL_PRODF   ');
        qProduto.SQL.Add('     (                             ');
        qProduto.SQL.Add('       PRODF_CODIGO,               ');
        qProduto.SQL.Add('       PRODF_NFE_104_I05_NCM,      ');
        qProduto.SQL.Add('       PRODF_NFE_104_I05_CEST,     ');
        qProduto.SQL.Add('       PRODF_NFE_107_I08_CFOP      ');
        qProduto.SQL.Add('     )                             ');
        qProduto.SQL.Add('VALUES                             ');
        qProduto.SQL.Add('     (                             ');
        qProduto.SQL.Add('      :PRODF_CODIGO,               ');
        qProduto.SQL.Add('      :PRODF_NFE_104_I05_NCM,      ');
        qProduto.SQL.Add('      :PRODF_NFE_104_I05_CEST,     ');
        qProduto.SQL.Add('      :PRODF_NFE_107_I08_CFOP      ');
        qProduto.SQL.Add('     )                             ');

        Preencher_Parametros_RODUTO_FISCAL_PRODF(qProduto);

        qProduto.ExecSql;
        Result := true;
    except
       Avisos.Avisar('Erro ao incluir Produto ' + FNome);
       LOGErros('Classe_Produto','Erro ao incluir Produto ' + FNome);
    end;

end;

function TProduto.Inserir_PRODUTO_PROD: Boolean;
begin
    result := False;
    try
        qProduto.Close;
        qProduto.SQL.Clear;
        qProduto.SQL.Add('INSERT INTO PRODUTO_PROD       ');
        qProduto.SQL.Add('     (                         ');
        qProduto.SQL.Add('       PROD_CODIGO,            ');
        qProduto.SQL.Add('       PROD_DESCRICAO,         ');
        qProduto.SQL.Add('       PROD_CDUM,              ');
        qProduto.SQL.Add('       PROD_STATUS,            ');
        qProduto.SQL.Add('       PROD_PRECO_VAREJO,      ');
        qProduto.SQL.Add('       PROD_PRECO_DISTRIBUIDOR,');
        qProduto.SQL.Add('       PROD_PRECO_ATACADO      ');
        qProduto.SQL.Add('     )                         ');
        qProduto.SQL.Add('VALUES                         ');
        qProduto.SQL.Add('     (                         ');
        qProduto.SQL.Add('      :PROD_CODIGO,            ');
        qProduto.SQL.Add('      :PROD_DESCRICAO,         ');
        qProduto.SQL.Add('      :PROD_CDUM,              ');
        qProduto.SQL.Add('      :PROD_STATUS,            ');
        qProduto.SQL.Add('      :PROD_PRECO_VAREJO,      ');
        qProduto.SQL.Add('      :PROD_PRECO_DISTRIBUIDOR,');
        qProduto.SQL.Add('      :PROD_PRECO_ATACADO      ');
        qProduto.SQL.Add('     )                         ');
        Preencher_Parametros_PRODUTO_PROD(qProduto);
        qProduto.ParamByname('PROD_STATUS').AsInteger := 0;
        qProduto.ExecSql;
        result := true
    except
       Avisos.Avisar('Erro ao incluir Produto ' + FNome);
       LOGErros('Classe_Produto','Erro ao incluir Produto ' + FNome);
    end;
end;

function TProduto.Insert: Boolean;
begin
   result := False;
    if not Inserir_PRODUTO_PROD           then exit;
    if not Inserir_PRODUTO_DETALHES_PRODD then exit;
    if not Inserir_PRODUTO_FISCAL_PRODF   then exit;

    Gravar_Observacoes;
    Result := True;
    Log('Classe_Produto','Cadastrou produto ' + FCodigo + '-' + FNome);
end;

procedure TProduto.LimparCampos;
begin
    FNome    := '';
    FUnidade := '';
	  FStatus  := -1;
end;

procedure TProduto.Recuperar_Alteracoes;
begin
    with FAlteracao do
    begin
       Usuario       := qProduto.FieldByName('PRODD_ALT_USU'        ).AsString;
       Data          := qProduto.FieldByName('PRODD_ALT_DT'         ).AsString;
       Hora          := qProduto.FieldByName('PRODD_ALT_HR'         ).AsString;
       Estacao       := qProduto.FieldByName('PRODD_ALT_ESTACAO'    ).AsString;
       DataBloqueio  := qProduto.FieldByName('PRODD_ALT_DTBLOQUEADO').AsString;
       DataLiberacao := qProduto.FieldByName('PRODD_ALT_DTLIBERADO' ).AsString;
       DataInativo   := qProduto.FieldByName('PRODD_ALT_DTINATIVO'  ).AsString;
    end;
end;

procedure TProduto.Recuperar_Dados_Basicos;
begin
    FCodigo  := qProduto.FieldByName('PROD_CODIGO'   ).AsString;
    FNome    := qProduto.FieldByName('PROD_DESCRICAO').AsString;
    FUnidade := qProduto.FieldByName('PROD_CDUM'     ).AsString;
    FStatus  := qProduto.FieldByName('PROD_STATUS'   ).AsInteger;

    FPrecos.FVarejo       := qProduto.FieldByName('PROD_PRECO_VAREJO'      ).AsFloat;
    FPrecos.FDistribuidor := qProduto.FieldByName('PROD_PRECO_DISTRIBUIDOR').AsFloat;
    FPrecos.FAtacado      := qProduto.FieldByName('PROD_PRECO_ATACADO'     ).AsFloat;
end;

procedure TProduto.Recuperar_Detalhes;
begin
    qProduto.Close;
    qProduto.SQL.Clear;
    qProduto.SQL.Add('SELECT * FROM PRODUTO_DETALHES_PRODD');
    qProduto.SQL.Add(' WHERE PRODD_CODIGO = :PRODD_CODIGO ');
    qProduto.ParamByName('PRODD_CODIGO').AsString := FCodigo;
    qProduto.Open;
    if qProduto.eof then
    begin
       exit;
    end;

    FDetalhes.FMarca        := qProduto.FieldByName('PRODD_CDMARCA'     ).AsString;
    FDetalhes.FFamilia      := qProduto.FieldByName('PRODD_CDFAMILIA'   ).AsString;
    FDetalhes.FGrupo        := qProduto.FieldByName('PRODD_CDGRUPO'     ).AsString;
    FDetalhes.FSubGrupo     := qProduto.FieldByName('PRODD_CDSUBGRUPO'  ).AsString;
    FDetalhes.FTipo         := qProduto.FieldByName('PRODD_CDTIPO'      ).AsString;
    FDetalhes.FImpressora   := qProduto.FieldByName('PRODD_CDIMPRESSORA').AsString;
    FDetalhes.FDataCadastro := qProduto.FieldByName('PRODD_DT'        ).AsDateTime;
    Recuperar_Alteracoes;
end;

procedure TProduto.Recuperar_Observacoes;
begin
   FObservacao.Clear;
   qProduto.Close;
   qProduto.Sql.Clear;
   qProduto.Sql.Add('SELECT PRODOBS_TEXTO          ');
   qProduto.Sql.Add('  FROM PRODUTO_OBS_PRODOBS    ');
   qProduto.Sql.Add(' WHERE PRODOBS_CODIGO = :COD  ');
   qProduto.Sql.Add(' ORDER BY PRODOBS_LINHA       ');
   qProduto.ParamByName('COD').AsString := FCodigo;
   qProduto.Open;
   while not qProduto.eof do
   begin
     FObservacao.add(qProduto.fieldbyname('PRODOBS_TEXTO').AsString);
     qProduto.Next;
   end;
end;

procedure TProduto.Recuperar_Tributacao;
begin
    qProduto.Close;
    qProduto.SQL.Clear;
    qProduto.SQL.Add('SELECT * FROM PRODUTO_FISCAL_PRODF');
    qProduto.SQL.Add(' WHERE PRODF_CODIGO = :PRODF_CODIGO ');
    qProduto.ParamByName('PRODF_CODIGO').AsString := FCodigo;
    qProduto.Open;
    if qProduto.eof then
    begin
       exit;
    end;

    FTributacao.NFE_104_I05_NCM  := qProduto.FieldByName('PRODF_NFE_104_I05_NCM' ).AsString;
    FTributacao.NFE_104_I05_CEST := qProduto.FieldByName('PRODF_NFE_104_I05_CEST').AsString;
    FTributacao.NFE_107_I08_CFOP := qProduto.FieldByName('PRODF_NFE_107_I08_CFOP').AsString;

end;

procedure TProduto.Preencher_Parametros_PRODUTO_DETALHES_PRODD(
  pQuery: TFDQuery);
begin
   pQuery.ParamByName('PRODD_CODIGO'          ).AsString   := FCodigo;
   pQuery.ParamByName('PRODD_NUVEM_ATUALIZADO').AsInteger  := 0;
   pQuery.ParamByName('PRODD_CDMARCA'         ).AsString   := FDetalhes.FMarca;
   pQuery.ParamByName('PRODD_CDFAMILIA'       ).AsString   := FDetalhes.FFamilia;
   pQuery.ParamByName('PRODD_CDGRUPO'         ).AsString   := FDetalhes.FGrupo;
   pQuery.ParamByName('PRODD_CDSUBGRUPO'      ).AsString   := FDetalhes.FSubGrupo;
   pQuery.ParamByName('PRODD_CDTIPO'          ).AsString   := FDetalhes.FTipo;
   pQuery.ParamByName('PRODD_CDIMPRESSORA'    ).AsString   := FDetalhes.FImpressora;
   pQuery.ParamByName('PRODD_ALT_USU'         ).AsString   := Usuario.Codigo;
   pQuery.ParamByName('PRODD_ALT_DT'          ).AsDateTime := DataServidor;
   pQuery.ParamByName('PRODD_ALT_HR'          ).AsString   := HoraServidor;
   pQuery.ParamByName('PRODD_ALT_ESTACAO'     ).AsString   := NomeComputador;
   pQuery.ParamByName('PRODD_ALT_DTBLOQUEADO' ).AsDateTime := 0;
   pQuery.ParamByName('PRODD_ALT_DTLIBERADO'  ).AsDateTime := 0;
   pQuery.ParamByName('PRODD_ALT_DTINATIVO'   ).AsDateTime := 0;
end;

procedure TProduto.Preencher_Parametros_PRODUTO_PROD(pQuery: TFDQuery);
begin
   pQuery.ParamByName('PROD_CODIGO'            ).AsString   := FCodigo;
   pQuery.ParamByName('PROD_DESCRICAO'         ).AsString   := FNome;
   pQuery.ParamByName('PROD_CDUM'              ).AsString   := FUnidade;
   pQuery.ParamByName('PROD_STATUS'            ).AsInteger  := FStatus;

   //PRECOS
   pQuery.ParamByName('PROD_PRECO_VAREJO'      ).AsFloat := FPrecos.FVarejo;
   pQuery.ParamByName('PROD_PRECO_DISTRIBUIDOR').AsFloat := FPrecos.FDistribuidor;
   pQuery.ParamByName('PROD_PRECO_ATACADO'     ).AsFloat := FPrecos.FAtacado;
end;

procedure TProduto.Preencher_Parametros_RODUTO_FISCAL_PRODF(pQuery: TFDQuery);
begin
   qProduto.ParamByName('PRODF_CODIGO'          ).AsString := FCodigo;
   qProduto.ParamByName('PRODF_NFE_104_I05_NCM' ).AsString := FTributacao.FNFE_104_I05_NCM;
   qProduto.ParamByName('PRODF_NFE_104_I05_CEST').AsString := FTributacao.FNFE_104_I05_CEST;
   qProduto.ParamByName('PRODF_NFE_107_I08_CFOP').AsString := FTributacao.FNFE_107_I08_CFOP;
end;

procedure TProduto.RegistrarHistorico(pEvento, pLog: String);
begin
   //Histórico de bloqueios e desbloqueios do cliente
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('INSERT INTO PRODUTO_HISTORICO_BLOQUEIOS_PHB ');
   qLocal.Sql.Add('     ( PHB_PRODUTO,                         ');
   qLocal.Sql.Add('       PHB_EVENTO,                          ');
   qLocal.Sql.Add('       PHB_DTEVENTO,                        ');
   qLocal.Sql.Add('       PHB_HREVENTO,                        ');
   qLocal.Sql.Add('       PHB_USUEVENTO,                       ');
   qLocal.Sql.Add('       PHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                      ');
   qLocal.Sql.Add('VALUES                                      ');
   qLocal.Sql.Add('     (:PHB_PRODUTO,                         ');
   qLocal.Sql.Add('      :PHB_EVENTO,                          ');
   qLocal.Sql.Add('      :PHB_DTEVENTO,                        ');
   qLocal.Sql.Add('      :PHB_HREVENTO,                        ');
   qLocal.Sql.Add('      :PHB_USUEVENTO,                       ');
   qLocal.Sql.Add('      :PHB_MAQEVENTO                        ');
   qLocal.Sql.Add('     )                                                                                                           ');
   qLocal.ParamByName('PHB_PRODUTO'  ).AsString   := FCodigo;
   qLocal.ParamByName('PHB_EVENTO'   ).AsString   := pEvento;
   qLocal.ParamByName('PHB_DTEVENTO' ).AsDateTime := DataServidor;
   qLocal.ParamByName('PHB_HREVENTO' ).AsString   := HoraServidor;
   qLocal.ParamByName('PHB_USUEVENTO').AsString   := Usuario.Codigo;
   qLocal.ParamByName('PHB_MAQEVENTO').AsString   := NomeComputador;
   qLocal.ExecSql;

   Log('Classe_Produto',pLog+' produto '+FCodigo+' - '+FNome);

end;

procedure TProduto.RegistrarHistoricoDeAtivacao;
begin
   RegistrarHistorico('Ativado','Ativou');
end;

procedure TProduto.RegistrarHistoricoDeBloqueio;
begin
   RegistrarHistorico('Bloqueado','Bloqueou');
end;

procedure TProduto.RegistrarHistoricoDeDesBloqueio;
begin
   RegistrarHistorico('Desbloqueado','Desbloqueou');
end;

procedure TProduto.RegistrarHistoricoDeInativacao;
begin
   RegistrarHistorico('Inativado','Inativou');
end;

procedure TProduto.setDetalhes(const Value: tDetalhes_Produto);
begin
   FDetalhes := Value;
end;

procedure TProduto.setFCodigo(const Value: String);
begin
   FCodigo := Value;
end;

procedure TProduto.setFNome(const Value: String);
begin
   FNome := Value;
end;

procedure TProduto.setFObservacao(const Value: TStringList);
begin
   FObservacao := Value;
end;

procedure TProduto.setFStatus(const Value: TStatusCadastral);
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

procedure TProduto.setFTributacao(const Value: TTributacao_de_Produto);
begin
   FTributacao := Value;
end;

procedure TProduto.setFUnidade(const Value: String);
begin
   FUnidade := Value;
end;

function TProduto.Update: Boolean;
begin
    result := false;

    if not Update_PRODUTO_PROD           then exit;
    if not Update_PRODUTO_DETALHE_PRODD  then exit;
    if not Update_PRODUTO_FISCAL_PRODF   then exit;

    Gravar_Observacoes;
    Log('Classe_Produto','Alterou produto '+ FCodigo + ' - ' + FNome);

   Result := True;
end;

function TProduto.Update_PRODUTO_DETALHE_PRODD: Boolean;
begin
    if existe_PRODUTO_DETALHE_PRODD then
       result := alterar_PRODUTO_DETALHE_PRODD
    else
       result := Inserir_PRODUTO_DETALHES_PRODD;
end;

function TProduto.Update_PRODUTO_FISCAL_PRODF: Boolean;
begin
    if existe_PRODUTO_FISCAL_PRODF then
       result := alterar_PRODUTO_FISCAL_PRODF
    else
       result := Inserir_PRODUTO_FISCAL_PRODF;
end;

function TProduto.Update_PRODUTO_PROD: Boolean;
begin
    try
        qProduto.Close;
        qProduto.SQL.Clear;
        qProduto.SQL.Add('UPDATE PRODUTO_PROD                                       ');
        qProduto.SQL.Add('   SET PROD_DESCRICAO          = :PROD_DESCRICAO,         ');
        qProduto.SQL.Add('       PROD_CDUM               = :PROD_CDUM,              ');
        qProduto.SQL.Add('       PROD_STATUS             = :PROD_STATUS,            ');
        qProduto.SQL.Add('       PROD_PRECO_VAREJO       = :PROD_PRECO_VAREJO,      ');
        qProduto.SQL.Add('       PROD_PRECO_DISTRIBUIDOR = :PROD_PRECO_DISTRIBUIDOR,');
        qProduto.SQL.Add('       PROD_PRECO_ATACADO      = :PROD_PRECO_ATACADO      ');
        qProduto.SQL.Add(' WHERE PROD_CODIGO             = :PROD_CODIGO             ');
        Preencher_Parametros_PRODUTO_PROD(qProduto);
        qProduto.ExecSql;
        Log('Classe_Produto','Alterou Produto '+ FNome);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Produto '+ FNome);
       LogErros('Classe_Cliente','Erro ao alterar Produto '+ FNome);
    end;
end;

{ tPrecos_Produtos }

function tPrecos_Produtos.getFAtacado: Real;
begin
   result := FAtacado;
end;

function tPrecos_Produtos.getFDistribuidor: Real;
begin
   result := FDistribuidor;
end;

function tPrecos_Produtos.getFVarejo: Real;
begin
   result := FVarejo;
end;

procedure tPrecos_Produtos.setFAtacado(const Value: Real);
begin
   FAtacado := Value;
end;

procedure tPrecos_Produtos.setFDistribuidor(const Value: Real);
begin
   FDistribuidor := Value;
end;

procedure tPrecos_Produtos.setFVarejo(const Value: Real);
begin
   FVarejo := Value;
end;

{ TTributacao_de_Produto }

function TTributacao_de_Produto.getFNFE_104_I05_CEST: String;
begin
   result := FNFE_104_I05_CEST;
end;

function TTributacao_de_Produto.getFNFE_104_I05_NCM: String;
begin
   Result := self.FNFE_104_I05_NCM;
end;

function TTributacao_de_Produto.getFNFE_107_I08_CFOP: String;
begin
   result := FNFE_107_I08_CFOP;
end;

procedure TTributacao_de_Produto.setFNFE_104_I05_CEST(const Value: String);
begin
  Self.FNFE_104_I05_CEST := Value;
end;

procedure TTributacao_de_Produto.setFNFE_104_I05_NCM(const Value: String);
begin
   self.FNFE_104_I05_NCM := Value;
end;

procedure TTributacao_de_Produto.setFNFE_107_I08_CFOP(const Value: String);
begin
  Self.FNFE_107_I08_CFOP := Value;
end;

end.
