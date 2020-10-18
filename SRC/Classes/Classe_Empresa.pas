unit Classe_Empresa;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option;

type
   TEmpresa = class
  private
	  FAtiva               : Boolean;   // EMP_BLOQUEADA        varchar(1)  NULL
    FNomeFantasia        : String;    // EMP_NOME_FANTASIA    varchar(50) NULL
    FCodigoUniSystem     : String;    // EMP_CODIGO_UNISYSTEM varchar(10) NULL
	  FRazaoSocial         : String;    // EMP_RAZAOSOCIAL      varchar(30) NULL
    FPessoaJuridica      : Boolean;   // EMP_PESSOAJF         varchar(1)  NULL
    FDataInicioAtividades: TDateTime; // EMP_INICIOATIVIDADES DATETIME    NULL
    FDataInicioAtividadesString:String;
    FInscricaoEstadual   : String;    // EMP_INSCRICAO_ESTADUAL  varchar(20) NULL
    FInscricaoMunicipal  : String;    // EMP_INSCRICAO_MUNICIPAL varchar(20) NULL

    FSUFRAMA             : String;    // EMP_SUFRAMA          varchar(10) NULL
    FCNAE                : String;    // EMP_CNAE 	          varchar(10) NULL
    FCNPJ                : String;    // EMP_CNPJ 	          varchar(20) NULL
    FNIRE                : String;    // EMP_NIRE 	          varchar(11) NULL

  //  FNomeDecente         : String;   // EMP_SEI LA O  QUE.....
//PASSO 3
{



EMP_CNPJCPF] [varchar](20) NULL,
	[EMP_CORTELA] [int] NULL,
	[EMP_CORLETRA] [int] NULL,
	[EMP_DISCIPLINAS] [int] NULL,
	[EMP_QTDMESAS] [int] NULL,
	[EMP_FONTEMAPAMESAS] [int] NULL,
	[EMP_NOME_FANTASIA] [varchar](50) NULL,
	[EMP_UF] [varchar](2) NULL,
	[EMP_CODIGOINTERFACE] [varchar](3) NULL,
	[EMP_CIDADE] [varchar](40) NULL,
	[EMP_ENDERECO] [varchar](40) NULL,
	[EMP_CEP] [varchar](20) NULL,
	[EMP_FONES] [varchar](40) NULL,
	[EMP_FAX] [varchar](40) NULL,
	[EMP_EMAIL] [varchar](40) NULL,
	[EMP_GERENTE] [varchar](40) NULL,
	[EMP_FONESGERENTE] [varchar](40) NULL,
	[EMP_FAXGERENTE] [varchar](40) NULL,
	[EMP_EMAILGERENTE] [varchar](40) NULL,
	[EMP_ALMOXARIFADOPARADIESEL] [varchar](10) NULL,
	[EMP_IBGEUF] [varchar](2) NULL,
	[EMP_IBGECIDADE] [varchar](10) NULL,

	[EMP_ENDERECO_NUMERO] [varchar](10) NULL,
	[EMP_BAIRRO] [varchar](50) NULL,
	[EMP_ENDERECO_COMPLEMENTO] [varchar](60) NULL,
	[EMP_CIDADENOME] [varchar](40) NULL,
	[EMP_EMPRESA_SIMPLES_NACIONAL] [int] NULL,
	[EMP_CERTIFICADOVENCE] [datetime] NULL,
	[EMP_INSCRICAOMUNICIPAL] [varchar](20) NULL,
	[EMP_ALIQ_CREDITO_ICMS] [numeric](12, 2) NULL,
	[EMP_CSOSN] [varchar](3) NULL,
	[EMP_CRT] [varchar](1) NULL,

	[EMP_BOLETO] [int] NULL,
	[EMP_BANCO] [varchar](20) NULL,
	[EMP_CDBANCO] [varchar](3) NULL,
	[EMP_NMBANCO] [varchar](40) NULL,
	[EMP_CDCEDENTE] [varchar](20) NULL,
	[EMP_DGCEDENTE] [varchar](1) NULL,
	[EMP_CARTEIRA] [varchar](20) NULL,
	[EMP_AGENCIA] [varchar](20) NULL,
	[EMP_DGAGENCIA] [varchar](2) NULL,
	[EMP_CONTACORRENTE] [varchar](20) NULL,
	[EMP_DIGITOCC] [varchar](2) NULL,
	[EMP_ESPECIE] [varchar](10) NULL,
	[EMP_MULTAATRASO] [numeric](12, 2) NULL,
	[EMP_JUROSDIA] [numeric](12, 2) NULL,
	[EMP_ACRESCIMOBOLETO] [numeric](12, 2) NULL,
	[EMP_PRINTER_COMANDA] [varchar](40) NULL,
	[EMP_PRINTER_COZINHA] [varchar](40) NULL,
	[EMP_PRINTER_NFCE] [varchar](40) NULL,
	[EMP_LINHASAPOSCUPOM] [int] NULL,
	[EMP_TEMPOSEMCOMANDARMESA] [varchar](5) NULL,
	[EMP_MSGRODAPECOMANDA] [varchar](40) NULL,
	[EMP_MSGRODAPERECIBO] [varchar](40) NULL,
	[EMP_TAXAGARCOM] [numeric](12, 2) NULL,
	[EMP_COUVERT] [numeric](12, 2) NULL,
  }
    FExiste         : Boolean;



    function getFNomeFantasia: String;
    function getFExiste: Boolean;
    function getFCodigoUniSystem: String;
    function getFAtiva: Boolean;
    procedure setFAtiva(const Value: Boolean);
    procedure setFCodigoUniSystem(const Value: String);
    procedure setFNomeFantasia(const Value: String);
    function getFPessoaJuridica: Boolean;
    procedure setFPessoaJuridica(const Value: Boolean);
    function getFRazaoSocial: String;
    procedure setFRazaoSocial(const Value: String);
    function getFDataInicioAtividades: TDateTime;
    procedure setFDataInicioAtividades(const Value: TDateTime);
    function Insert:Boolean;
    function Update:Boolean;
    function DadosCorretos:Boolean;
    function NaoInformadoString(pCampo,pDescricao:String):Boolean;
    function getFInscricaoEstadual: String;
    procedure setFInscricaoEstadual(const Value: String);
    function getFSUFRAMA: String;
    procedure setFSUFRAMA(const Value: String);
    procedure Preencher_Parametros_Empresa;
    function getFCNAE: String;
    procedure setFCNAE(const Value: String);
    function getFCNPJ: String;
    procedure setFCNPJ(const Value: String);
    function getFInscricaoMunicipal: String;
    procedure setFInscricaoMunicipal(const Value: String);
    function getDataInicioAtividadesString: String;
    function getFNIRE: String;
    procedure setFNIRE(const Value: String);
   public
      property NomeFantasia     : String  read  getFNomeFantasia
                                          write setFNomeFantasia;
      property RazaoSocial      : String  read  getFRazaoSocial
                                          write setFRazaoSocial;
      property CodigoUniSystem  : String  read  getFCodigoUniSystem
                                          write setFCodigoUniSystem;
      property DataInicioAtividades: TDateTime
                                          read  getFDataInicioAtividades
                                          write setFDataInicioAtividades;
      property DataInicioAtividadesString: String
                                          read  getDataInicioAtividadesString;
	    property Ativa            : Boolean read  getFAtiva
                                          write setFAtiva;
      property PessoaJuridica   : Boolean read  getFPessoaJuridica
                                          write setFPessoaJuridica;
      property Existe           : Boolean read  getFExiste;

      property InscricaoEstadual: String  read  getFInscricaoEstadual
                                          write setFInscricaoEstadual;
      property InscricaoMunicipal: String  read  getFInscricaoMunicipal
                                          write setFInscricaoMunicipal;
      property SUFRAMA          : String  read  getFSUFRAMA
                                          write setFSUFRAMA;
      property CNAE             : String  read  getFCNAE
                                          write setFCNAE;
      property CNPJ             : String  read  getFCNPJ
                                          write setFCNPJ;
      property NIRE             : String  read  getFNIRE
                                          write setFNIRE;

      //PASSO 4
      procedure Abrir;
      Function Gravar:Boolean;
   end;

implementation
{ TEmpresa }

uses Funcoes;

var qEmpresa: TFDQuery;

procedure TEmpresa.Abrir;
var qLocal: TFDQuery;
begin
    qLocal := TFDQuery.Create(nil);
    qLocal.ConnectionName :='X';
    qLocal.Close;
    qLocal.SQL.Clear;
    qLocal.SQL.Add('SELECT * FROM EMPRESA_EMP');
    qLocal.Open;
    FNomeFantasia   := '';
    FCodigoUniSystem:= '';
    FRazaoSocial    := '';
    if qLocal.eof then
    begin
       FExiste:=False;
       qLocal.Free;
       exit;
    end;
    FExiste              := True;
    FNomeFantasia        := qLocal.FieldByName('EMP_NOME_FANTASIA'      ).AsString;
    FRazaoSocial         := qLocal.FieldByName('EMP_RAZAOSOCIAL'        ).AsString;
    FCodigoUniSystem     := qLocal.FieldByName('EMP_CODIGO_UNISYSTEM'   ).AsString;
    FDataInicioAtividades:= qLocal.FieldByName('EMP_INICIOATIVIDADES'   ).AsDateTime;
    FDataInicioAtividadesString := qLocal.FieldByName('EMP_INICIOATIVIDADES').AsString;
    FAtiva               :=(qLocal.FieldByName('EMP_BLOQUEADA'          ).AsString = 'N');
    FPessoaJuridica      :=(qLocal.FieldByName('EMP_PESSOAJF'           ).AsString = 'J');
    FInscricaoEstadual   := qLocal.FieldByName('EMP_INSCRICAO_ESTADUAL' ).AsString;
    FInscricaoMunicipal  := qLocal.FieldByName('EMP_INSCRICAO_MUNICIPAL').AsString;
    FSUFRAMA             := qLocal.FieldByName('EMP_SUFRAMA'            ).AsString;
    FCNAE                := qLocal.FieldByName('EMP_CNAE'               ).AsString;
    FCNPJ                := qLocal.FieldByName('EMP_CNPJ'               ).AsString;
    FNIRE                := qLocal.FieldByName('EMP_NIRE'               ).AsString;

    //PASSO 9
    Qlocal.Free;
end;

function TEmpresa.DadosCorretos: Boolean;
begin
    Result := False;
    if NaoInformadoString(FNomeFantasia   ,'Nome Fantasia'   ) or
       NaoInformadoString(FCodigoUniSystem,'C�digo Unisystem') or
	     NaoInformadoString(FRazaoSocial    ,'Raz�o Social'    ) then
       exit;

    Result := True;
end;

function TEmpresa.getDataInicioAtividadesString: String;
begin
   result := self.FDataInicioAtividadesString;
end;

function TEmpresa.getFAtiva: Boolean;
begin
  result := FAtiva;
end;

function TEmpresa.getFSUFRAMA: String;
begin
   result := Copy(self.FSUFRAMA,1,10);
end;

function TEmpresa.getFCNAE: String;
begin
   result := self.FCNAE;
end;

function TEmpresa.getFCNPJ: String;
begin
   result := FormataCPF_CGC(self.FCNPJ);
end;

function TEmpresa.getFCodigoUniSystem: String;
begin
   result := self.FCodigoUniSystem;
end;

function TEmpresa.getFDataInicioAtividades: TDateTime;
begin
   result := self.FDataInicioAtividades;
end;

function TEmpresa.getFExiste: Boolean;
begin
   result := self.FExiste;
end;

function TEmpresa.getFInscricaoEstadual: String;
begin
   result := self.FInscricaoEstadual;
end;

function TEmpresa.getFInscricaoMunicipal: String;
begin
   result := self.FInscricaoMunicipal;
end;

function TEmpresa.getFNIRE: String;
begin
   result := self.FNIRE;
end;

function TEmpresa.getFNomeFantasia: String;
begin
   result := self.FNomeFantasia;
end;

function TEmpresa.getFPessoaJuridica: Boolean;
begin
   Result := self.FPessoaJuridica;
end;

function TEmpresa.getFRazaoSocial: String;
begin
   Result := self.FRazaoSocial;
end;

function TEmpresa.Gravar:Boolean;
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

function TEmpresa.Insert:Boolean;
var qEmpresa: TFDQuery;
begin
    result := False;
    try
        qEmpresa := TFDQuery.Create(nil);
        qEmpresa.ConnectionName :='X';
        qEmpresa.Close;
        qEmpresa.SQL.Clear;
        qEmpresa.SQL.Add('INSERT INTO EMPRESA_EMP        ');
        qEmpresa.SQL.Add('     (                         ');
        qEmpresa.SQL.Add('       EMP_NOME_FANTASIA,      ');
        qEmpresa.SQL.Add('       EMP_RAZAOSOCIAL,        ');
        qEmpresa.SQL.Add('       EMP_CODIGO_UNISYSTEM,   ');
        qEmpresa.SQL.Add('       EMP_INICIOATIVIDADES,   ');
        qEmpresa.SQL.Add('       EMP_BLOQUEADA,          ');
        qEmpresa.SQL.Add('       EMP_PESSOAJF,           ');
        qEmpresa.SQL.Add('       EMP_INSCRICAO_ESTADUAL, ');
        qEmpresa.SQL.Add('       EMP_INSCRICAO_MUNICIPAL,');
        qEmpresa.SQL.Add('       EMP_SUFRAMA,            ');
        qEmpresa.SQL.Add('       EMP_CNAE,               ');
        qEmpresa.SQL.Add('       EMP_CNPJ,               ');
        qEmpresa.SQL.Add('       EMP_NIRE,               ');

        //passo10
        qEmpresa.SQL.Add('     )                         ');
        qEmpresa.SQL.Add('VALUES                         ');
        qEmpresa.SQL.Add('     (                         ');
        qEmpresa.SQL.Add('      :EMP_NOME_FANTASIA,      ');
        qEmpresa.SQL.Add('      :EMP_RAZAOSOCIAL,        ');
        qEmpresa.SQL.Add('      :EMP_CODIGO_UNISYSTEM,   ');
        qEmpresa.SQL.Add('      :EMP_INICIOATIVIDADES,   ');
        qEmpresa.SQL.Add('      :EMP_BLOQUEADA,          ');
        qEmpresa.SQL.Add('      :EMP_PESSOAJF,           ');
        qEmpresa.SQL.Add('      :EMP_INSCRICAO_ESTADUAL, ');
        qEmpresa.SQL.Add('      :EMP_INSCRICAO_MUNICIPAL,');
        qEmpresa.SQL.Add('      :EMP_SUFRAMA,            ');
        qEmpresa.SQL.Add('      :EMP_CNAE,               ');
        qEmpresa.SQL.Add('      :EMP_CNPJ,               ');
        qEmpresa.SQL.Add('      :EMP_NIRE,               ');

        qEmpresa.SQL.Add('     )                        ');
        //passo 11
        Preencher_Parametros_Empresa;
        qEmpresa.ExecSql;
        qEmpresa.Free;
        Log('Incluiu empresa '+ Empresa.FNomeFantasia);
        Result := True;
    except
       ShowMessage('Erro ao incluir Empresa');
       LOGErros('Erro ao incluir Empresa');
    end;
end;

procedure TEmpresa.Preencher_Parametros_Empresa;
begin
    qEmpresa.ParamByName('EMP_NOME_FANTASIA'      ).AsString   := FNomeFantasia;
    qEmpresa.ParamByName('EMP_RAZAOSOCIAL'        ).AsString   := FRazaoSocial;
    qEmpresa.ParamByName('EMP_CODIGO_UNISYSTEM'   ).AsString   := FCodigoUniSystem;
    qEmpresa.ParamByName('EMP_INICIOATIVIDADES'   ).AsDateTime := FDataInicioAtividades;
    if FAtiva then
       qEmpresa.ParamByName('EMP_BLOQUEADA'       ).AsString   := 'N'
    else
       qEmpresa.ParamByName('EMP_BLOQUEADA'       ).AsString   := 'S';
    qEmpresa.ParamByName('EMP_INSCRICAO_ESTADUAL' ).AsString   := FInscricaoEstadual;
    qEmpresa.ParamByName('EMP_INSCRICAO_MUNICIPAL').AsString   := FInscricaoMunicipal;
    qEmpresa.ParamByName('EMP_SUFRAMA'            ).AsString   := FSUFRAMA;
    qEmpresa.ParamByName('EMP_CNAE'               ).AsString   := FCNAE;
    qEmpresa.ParamByName('EMP_CNPJ'               ).AsString   := FCNPJ;
    qEmpresa.ParamByName('EMP_NIRE'               ).AsString   := FNIRE;

    //passo12
end;

function TEmpresa.NaoInformadoString(pCampo, pDescricao: String): Boolean;
begin
   Result := False;
   if pCampo = '' then
   begin
     ShowMessage('Informe '+pDescricao);
     exit;
   end;
   Result := True;
end;

procedure TEmpresa.setFAtiva(const Value: Boolean);
begin
   FAtiva := Value;
end;

procedure TEmpresa.setFSUFRAMA(const Value: String);
begin
   fSUFRAMA := Value;
end;

procedure TEmpresa.setFCNAE(const Value: String);
begin
  FCNAE := Copy(Value,1,10);
end;

procedure TEmpresa.setFCNPJ(const Value: String);
begin
   FCNPJ := Copy(SoNumeros(Value),1,14)
end;

procedure TEmpresa.setFCodigoUniSystem(const Value: String);
begin
  FCodigoUniSystem := Copy(Value,10);
end;

procedure TEmpresa.setFDataInicioAtividades(const Value: TDateTime);
begin
   self.FDataInicioAtividades := Value;
end;

procedure TEmpresa.setFInscricaoEstadual(const Value: String);
begin
   self.FInscricaoEstadual := Copy(Value,1,20);
end;

procedure TEmpresa.setFInscricaoMunicipal(const Value: String);
begin
   self.FInscricaoMunicipal := Copy(Value,1,20);
end;

procedure TEmpresa.setFNIRE(const Value: String);
begin
   FNIRE := Copy(Value,1,11);
end;

procedure TEmpresa.setFNomeFantasia(const Value: String);
begin
  FNomeFantasia := Copy(Value,1,50);
end;

procedure TEmpresa.setFPessoaJuridica(const Value: Boolean);
begin
   FPessoaJuridica := Value;
end;

procedure TEmpresa.setFRazaoSocial(const Value: String);
begin
   FRazaoSocial := Copy(Value,1,30);
end;

function TEmpresa.Update:Boolean;
begin
    try
        qEmpresa := TFDQuery.Create(nil);
        qEmpresa.ConnectionName :='X';
        qEmpresa.Close;
        qEmpresa.SQL.Clear;
        qEmpresa.SQL.Add('UPDATE EMPRESA_EMP                                        ');
        qEmpresa.SQL.Add('   SET EMP_NOME_FANTASIA       = :EMP_NOME_FANTASIA,      ');
        qEmpresa.SQL.Add('       EMP_RAZAOSOCIAL         = :EMP_RAZAOSOCIAL,        ');
        qEmpresa.SQL.Add('       EMP_CODIGO_UNISYSTEM    = :EMP_CODIGO_UNISYSTEM,   ');
        qEmpresa.SQL.Add('       EMP_INICIOATIVIDADES    = :EMP_INICIOATIVIDADES,   ');
        qEmpresa.SQL.Add('       EMP_BLOQUEADA           = :EMP_BLOQUEADA,          ');
        qEmpresa.SQL.Add('       EMP_PESSOAJF            = :EMP_PESSOAJF,           ');
        qEmpresa.SQL.Add('       EMP_INSCRICAO_ESTADUAL  = :EMP_INSCRICAO_ESTADUAL, ');
        qEmpresa.SQL.Add('       EMP_INSCRICAO_MUNICIPAL = :EMP_INSCRICAO_MUNICIPAL,');
        qEmpresa.SQL.Add('       EMP_SUFRAMA             = :EMP_SUFRAMA,            ');
        qEmpresa.SQL.Add('       EMP_CNAE                = :EMP_CNAE,               ');
        qEmpresa.SQL.Add('       EMP_CNPJ                = :EMP_CNPJ,               ');
        qEmpresa.SQL.Add('       EMP_NIRE                = :EMP_NIRE,               ');

        //passo11
        Preencher_Parametros_Empresa;
        qEmpresa.ExecSql;
        qEmpresa.Free;
        Log('Alterou empresa '+ Empresa.FNomeFantasia);
        Result := True;
    except
       ShowMessage('Erro ao alterar Empresa');
       LogErros('Erro ao alterar Empresa');
    end;
end;

end.

