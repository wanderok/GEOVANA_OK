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
	  FAtiva                       : Boolean;   // EMP_BLOQUEADA        varchar(1)  NULL
    FNomeFantasia                : String;    // EMP_NOME_FANTASIA    varchar(50) NULL
    FCodigoUniSystem             : String;    // EMP_CODIGO_UNISYSTEM varchar(10) NULL
	  FRazaoSocial                 : String;    // EMP_RAZAOSOCIAL      varchar(30) NULL
    FPessoaJuridica              : Boolean;   // EMP_PESSOAJF         varchar(1)  NULL
    FDataInicioAtividades        : TDateTime; // EMP_INICIOATIVIDADES DATETIME    NULL
    FDataInicioAtividadesString  : String;
    FInscricaoEstadual           : String;    // EMP_INSCRICAO_ESTADUAL    varchar(20) NULL
    FInscricaoMunicipal          : String;    // EMP_INSCRICAO_MUNICIPAL   varchar(20) NULL
    FSUFRAMA                     : String;    // EMP_SUFRAMA               varchar(10) NULL
    FCNAE                        : String;    // EMP_CNAE 	               varchar(10) NULL
    FCNPJ                        : String;    // EMP_CNPJ 	               varchar(20) NULL
    FNIRE                        : String;    // EMP_NIRE 	               varchar(11) NULL
    FIESubstTributario           : String;    // EMP_INSCRICAO_ESTADUAL_ST varchar(20) NULL
    FEnderecoRua                 : String;    // EMP_ENDERECO              varchar(40) NULL
    FEnderecoCEP                 : String;    // EMP_CEP                   varchar(20) NULL,
    FEnderecoNumero              : String;    // EMP_ENDERECO_NUMERO        varchar(10) NULL,
    FEnderecoBairro              : String;    // EMP_BAIRRO                 varchar(50) NULL,
    FEnderecoComplemento         : String;    // EMP_ENDERECO_COMPLEMENTO   varchar(60) NULL,
    FEnderecoMunicipio           : String;    // EMP_CIDADE                 varchar(40) NULL,
    FEnderecoMunicipioIBGE       : String;    // EMP_IBGECIDADE             varchar(10) NULL,
    FEnderecoUF                  : String;    // EMP_UF                     varchar(2) NULL,
    FEnderecoUFIBGE              : String;    // EMP_IBGEUF                 varchar(2)  NULL
    FTelefone                    : String;    // EMP_FONES                  varchar(40) NULL
    FCelular                     : String;    // EMP_CELULAR                varchar(40) NULL
    FWhatsApp                    : String;    // EMP_WHATSAPP               varchar(40) NULL
    FEmail                       : String;    // EMP_EMAIL                  varchar(40) NULL
    FContribuinteIPI             : Boolean;   // EMP_CONTRIBUINTE_IPI       integer null
    FResponsavelNome             : String;    // EMP_RESPONSAVEL_NOME       varchar(40) NULL
    FResponsavelTelefone         : String;    // EMP_RESPONSAVEL_TELEFONE   varchar(40) NULL
    FResponsavelCelular          : String;    // EMP_RESPONSAVEL_CELULAR    varchar(40) NULL
    FResponsavelEmail            : String;    // EMP_RESPONSAVEL_EMAIL      varchar(40) NULL
    FContadorEmpresa             : String;    // EMP_CONTADOR_EMPRESA       VARCHAR(40) MULL
    FContadorResponsavel         : String;    // EMP_CONTADOR_RESPONSAVEL   VARCHAR(40) MULL
    FContadorCNPJ                : String;    // EMP_CONTADOR_CNPJ          VARCHAR(14) MULL
    FContadorCPF                 : String;    // EMP_CONTADOR_CPF           VARCHAR(11) MULL
    FContadorTelefone1           : String;    // EMP_CONTADOR_TEL1          VARCHAR(20) MULL
    FContadorTelefone2           : String;    // EMP_CONTADOR_TEL2          VARCHAR(20) MULL
    FContadorCRC                 : String;    // EMP_CONTADOR_CRC           VARCHAR(20) MULL
    FContadorCelular1            : String;    // EMP_CONTADOR_CEL1          VARCHAR(20) MULL
    FContadorCelular2            : String;    // EMP_CONTADOR_CEL2          VARCHAR(20) MULL
    FContadorEmail               : String;    // EMP_CONTADOR_EMAIL         VARCHAR(40) MULL


//  FNomeDecente         : String;   // EMP_SEI LA O  QUE.....
//PASSO 3
{


EMP_CNPJCPF] [varchar](20) NULL,
	[EMP_CORTELA] [int] NULL,
	[EMP_CORLETRA] [int] NULL,
	[EMP_DISCIPLINAS] [int] NULL,
	[EMP_QTDMESAS] [int] NULL,
	[EMP_FONTEMAPAMESAS] [int] NULL,
	[EMP_CODIGOINTERFACE] [varchar](3) NULL,
	[EMP_FAX] [varchar](40) NULL,
	[EMP_GERENTE] [varchar](40) NULL,
	[EMP_FONESGERENTE] [varchar](40) NULL,
	[EMP_FAXGERENTE] [varchar](40) NULL,
	[EMP_EMAILGERENTE] [varchar](40) NULL,
	[EMP_ALMOXARIFADOPARADIESEL] [varchar](10) NULL,

	[EMP_CIDADENOME] [varchar](40) NULL,
	[EMP_EMPRESA_SIMPLES_NACIONAL] [int] NULL,
	[EMP_CERTIFICADOVENCE] [datetime] NULL,

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
    function getFIESubstTributario: String;
    procedure setFIESubstTributario(const Value: String);
    function getFEnderecoRua: String;
    procedure setFEnderecoRua(const Value: String);
    function getFEnderecoCEP: String;
    procedure setFEnderecoCEP(const Value: String);
    function getFEnderecoNumero: String;
    procedure setFEnderecoNumero(const Value: String);
    function getFEnderecoBairro: String;
    procedure setFEnderecoBairro(const Value: String);
    function getFEnderecoComplemento: String;
    procedure setFEnderecoComplemento(const Value: String);
    function getFEnderecoMunicipio: String;
    procedure setFEnderecoMunicipio(const Value: String);
    function getFEnderecoMunicipioIBGE: String;
    procedure setFEnderecoMunicipioIBGE(const Value: String);
    function getFEnderecoUF: String;
    procedure setFEnderecoUF(const Value: String);
    function getFContribuinteIPI: Boolean;
    procedure setFContribuinteIPI(const Value: Boolean);
    function getFCelular: String;
    function getFEmail: String;
    function getFEnderecoUFIBGE: String;
    function getFTelefone: String;
    function getFWhatsApp: String;
    procedure setFCelular(const Value: String);
    procedure setFEmail(const Value: String);
    procedure setFEnderecoUFIBGE(const Value: String);
    procedure setFTelefone(const Value: String);
    procedure setFWhatsApp(const Value: String);
    function getFResponsavelCelular: String;
    function getFResponsavelEmail: String;
    function getFResponsavelNome: String;
    function getFResponsavelTelefone: String;
    procedure setFResponsavelCelular(const Value: String);
    procedure setFResponsavelEmail(const Value: String);
    procedure setFResponsavelNome(const Value: String);
    procedure setFResponsavelTelefone(const Value: String);
    function getFContadorEmpresa: String;
    procedure setFContadorEmpresa(const Value: String);
    procedure setFContadorResponsavel(const Value: String);
    function getFContadorCNPJ: String;
    procedure setFContadorCNPJ(const Value: String);
    function getFContadorCPF: String;
    procedure setFContadorCPF(const Value: String);
    function getFContadorTelefone1: String;
    procedure setFContadorTelefone1(const Value: String);
    function getFContadorTelefone2: String;
    procedure setFContadorTelefone2(const Value: String);
    function getFContadorCRC: String;
    procedure setFContadorCRC(const Value: String);
    function getFContadorCelular1: String;
    procedure setFContadorCelular1(const Value: String);
    function getFContadorCelular2: String;
    procedure setFContadorCelular2(const Value: String);
    function getFContadorEmail: String;
    procedure setFContadorEmail(const Value: String);
    function getFContadorResponsavel: String;

   public
      property NomeFantasia                : String    read getFNomeFantasia                write setFNomeFantasia;
      property RazaoSocial                 : String    read getFRazaoSocial                 write setFRazaoSocial;
      property CodigoUniSystem             : String    read getFCodigoUniSystem             write setFCodigoUniSystem;
      property DataInicioAtividades        : TDateTime read getFDataInicioAtividades        write setFDataInicioAtividades;
      property DataInicioAtividadesString  : String    read getDataInicioAtividadesString;
	    property Ativa                       : Boolean   read getFAtiva                       write setFAtiva;
      property PessoaJuridica              : Boolean   read getFPessoaJuridica              write setFPessoaJuridica;
      property Existe                      : Boolean   read getFExiste;
      property InscricaoEstadual           : String    read getFInscricaoEstadual           write setFInscricaoEstadual;
      property InscricaoMunicipal          : String    read getFInscricaoMunicipal          write setFInscricaoMunicipal;
      property SUFRAMA                     : String    read getFSUFRAMA                     write setFSUFRAMA;
      property CNAE                        : String    read getFCNAE                        write setFCNAE;
      property CNPJ                        : String    read getFCNPJ                        write setFCNPJ;
      property NIRE                        : String    read getFNIRE                        write setFNIRE;
      property IESubstTributario           : String    read getFIESubstTributario           write setFIESubstTributario;
      property EnderecoRua                 : String    read getFEnderecoRua                 write setFEnderecoRua;
      property EnderecoCEP                 : String    read getFEnderecoCEP                 write setFEnderecoCEP;
      property EnderecoNumero              : String    read getFEnderecoNumero              write setFEnderecoNumero;
      property EnderecoBairro              : String    read getFEnderecoBairro              write setFEnderecoBairro;
      property EnderecoComplemento         : String    read getFEnderecoComplemento         write setFEnderecoComplemento;
      property EnderecoMunicipio           : String    read getFEnderecoMunicipio           write setFEnderecoMunicipio;
      property EnderecoMunicipioIBGE       : String    read getFEnderecoMunicipioIBGE       write setFEnderecoMunicipioIBGE;
      property EnderecoUF                  : String    read getFEnderecoUF                  write setFEnderecoUF;
      property EnderecoUFIBGE              : String    read getFEnderecoUFIBGE              write setFEnderecoUFIBGE;
      property Telefone                    : String    read getFTelefone                    write setFTelefone;
      property Celular                     : String    read getFCelular                     write setFCelular;
      property WhatsApp                    : String    read getFWhatsApp                    write setFWhatsApp;
      property Email                       : String    read getFEmail                       write setFEmail;
      property ContribuinteIPI             : Boolean   read getFContribuinteIPI             write setFContribuinteIPI;
      property ResponsavelNome             : String    read getFResponsavelNome             write setFResponsavelNome;
      property ResponsavelTelefone         : String    read getFResponsavelTelefone         write setFResponsavelTelefone;
      property ResponsavelCelular          : String    read getFResponsavelCelular          write setFResponsavelCelular;
      property ResponsavelEmail            : String    read getFResponsavelEmail            write setFResponsavelEmail;
      property ContadorEmpresa             : String    read getFContadorEmpresa             write setFContadorEmpresa;
      property ContadorResponsavel         : String    read getFContadorResponsavel         write setFContadorResponsavel;
      property ContadorCNPJ                : String    read getFContadorCNPJ                write setFContadorCNPJ;
      property ContadorCPF                 : String    read getFContadorCPF                 write setFContadorCPF;
      property ContadorTelefone1           : String    read getFContadorTelefone1           write setFContadorTelefone1;
      property ContadorTelefone2           : String    read getFContadorTelefone2           write setFContadorTelefone2;
      property ContadorCRC                 : String    read getFContadorCRC                 write setFContadorCRC;
      property ContadorCelular1            : String    read getFContadorCelular1            write setFContadorCelular1;
      property ContadorCelular2            : String    read getFContadorCelular2            write setFContadorCelular2;
      property ContadorEmail               : String    read getFContadorEmail               write setFContadorEmail;



     //PASSO 4
      procedure Abrir;
      Function Gravar:Boolean;
   end;

{
UPDATE EMPRESA_EMP SET EMP_CONTRIBUINTE_IPI = 1
UPDATE EMPRESA_EMP SET EMP_APURACAO_MENSAL = 1
UPDATE EMPRESA_EMP SET EMP_CELULAR = 'CEL TEST'
UPDATE EMPRESA_EMP SET EMP_WHATSAPP = 'ZAP TEST'

}

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
    FExiste                      := True;
    FNomeFantasia                := qLocal.FieldByName('EMP_NOME_FANTASIA'        ).AsString;
    FRazaoSocial                 := qLocal.FieldByName('EMP_RAZAOSOCIAL'          ).AsString;
    FCodigoUniSystem             := qLocal.FieldByName('EMP_CODIGO_UNISYSTEM'     ).AsString;
    FDataInicioAtividades        := qLocal.FieldByName('EMP_INICIOATIVIDADES'     ).AsDateTime;
    FDataInicioAtividadesString  := qLocal.FieldByName('EMP_INICIOATIVIDADES'     ).AsString;
    FAtiva                       :=(qLocal.FieldByName('EMP_BLOQUEADA'            ).AsString = 'N');
    FPessoaJuridica              :=(qLocal.FieldByName('EMP_PESSOAJF'             ).AsString = 'J');
    FInscricaoEstadual           := qLocal.FieldByName('EMP_INSCRICAO_ESTADUAL'   ).AsString;
    FInscricaoMunicipal          := qLocal.FieldByName('EMP_INSCRICAO_MUNICIPAL'  ).AsString;
    FSUFRAMA                     := qLocal.FieldByName('EMP_SUFRAMA'              ).AsString;
    FCNAE                        := qLocal.FieldByName('EMP_CNAE'                 ).AsString;
    FCNPJ                        := qLocal.FieldByName('EMP_CNPJ'                 ).AsString;
    FNIRE                        := qLocal.FieldByName('EMP_NIRE'                 ).AsString;
    FIESubstTributario           := qLocal.FieldByName('EMP_INSCRICAO_ESTADUAL_ST').AsString;
    FEnderecoRua                 := qLocal.FieldByName('EMP_ENDERECO'             ).AsString;
    FEnderecoCEP                 := qLocal.FieldByName('EMP_CEP'                  ).AsString;
    FEnderecoNumero              := qLocal.FieldByName('EMP_ENDERECO_NUMERO'      ).AsString;
    FEnderecoBairro              := qLocal.FieldByName('EMP_BAIRRO'               ).AsString;
    FEnderecoComplemento         := qLocal.FieldByname('EMP_ENDERECO_COMPLEMENTO' ).AsString;
    FEnderecoMunicipio           := qLocal.FieldByname('EMP_CIDADE'               ).AsString;
    FEnderecoMunicipioIBGE       := qLocal.FieldByname('EMP_IBGECIDADE'           ).AsString;
    FEnderecoUF                  := qLocal.FieldByname('EMP_UF'                   ).AsString;
    FContribuinteIPI             :=(qLocal.FieldByname('EMP_CONTRIBUINTE_IPI'     ).AsInteger = 1);
    FResponsavelNome             := qLocal.FieldByname('EMP_RESPONSAVEL_NOME'     ).AsString;
    FResponsavelTelefone         := qLocal.FieldByname('EMP_RESPONSAVEL_TELEFONE' ).AsString;
    FResponsavelCelular          := qLocal.FieldByname('EMP_RESPONSAVEL_CELULAR'  ).AsString;
    FResponsavelEmail            := qLocal.FieldByname('EMP_RESPONSAVEL_EMAIL'    ).AsString;
    FContadorEmpresa             := qLocal.FieldByname('EMP_CONTADOR_EMPRESA'     ).AsString;
    FContadorResponsavel         := qLocal.FieldByname('EMP_CONTADOR_RESPONSAVEL' ).AsString;
    FContadorCNPJ                := qLocal.FieldByname('EMP_CONTADOR_CNPJ'        ).AsString;
    FContadorCPF                 := qLocal.FieldByname('EMP_CONTADOR_CPF'         ).AsString;
    FContadorTelefone1           := qLocal.FieldByname('EMP_CONTADOR_TEL1'        ).AsString;
    FContadorTelefone2           := qLocal.FieldByname('EMP_CONTADOR_TEL2'        ).AsString;
    FContadorCRC                 := qLocal.FieldByname('EMP_CONTADOR_CRC'         ).AsString;
    FContadorCelular1            := qLocal.FieldByname('EMP_CONTADOR_CEL1'        ).AsString;
    FContadorCelular2            := qLocal.FieldByname('EMP_CONTADOR_CEL2'        ).AsString;
    FContadorEmail               := qLocal.FieldByname('EMP_CONTADOR_EMAIL'       ).AsString;

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

function TEmpresa.getFEmail: String;
begin
   result := self.Email;
end;

function TEmpresa.getFTelefone: String;
begin
   result := self.FTelefone;
end;

function TEmpresa.getFWhatsApp: String;
begin
   result := self.FWhatsApp;
end;

function TEmpresa.getFEnderecoBairro: String;
begin
   result := self.FEnderecoBairro;
end;

function TEmpresa.getFEnderecoCEP: String;
begin
   result := self.FEnderecoCEP;
end;

function TEmpresa.getFEnderecoMunicipioIBGE: String;
begin
   result := self.FEnderecoMunicipioIBGE;
end;

function TEmpresa.getFEnderecoComplemento: String;
begin
   result := self.FEnderecoComplemento;
end;

function TEmpresa.getFEnderecoMunicipio: String;
begin
   result := self.FEnderecoMunicipio;
end;

function TEmpresa.getFEnderecoNumero: String;
begin
   result := self.FEnderecoNumero;
end;

function TEmpresa.getFCelular: String;
begin
   result := self.FCelular;
end;

function TEmpresa.getFCNAE: String;
begin
   result := self.FCNAE;
end;

function TEmpresa.getFCNPJ: String;
begin
   result := self.FCNPJ; // FormataCPF_CGC(self.FCNPJ);
end;

function TEmpresa.getFCodigoUniSystem: String;
begin
   result := self.FCodigoUniSystem;
end;

function TEmpresa.getFContribuinteIPI: Boolean;
begin
   result := self.FContribuinteIPI
end;

function TEmpresa.getFDataInicioAtividades: TDateTime;
begin
   result := self.FDataInicioAtividades;
end;

function TEmpresa.getFEnderecoRua: String;
begin
   result := self.FEnderecoRua;
end;

function TEmpresa.getFEnderecoUF: String;
begin
   result:= self.FEnderecoUF;
end;

function TEmpresa.getFEnderecoUFIBGE: String;
begin
   result := self.FEnderecoUFIBGE;
end;

function TEmpresa.getFExiste: Boolean;
begin
   result := self.FExiste;
end;

function TEmpresa.getFIESubstTributario: String;
begin
   result := self.FIESubstTributario;
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

function TEmpresa.getFResponsavelCelular: String;
begin
   Result := self.FResponsavelCelular;
end;

function TEmpresa.getFResponsavelEmail: String;
begin
   Result := self.FResponsavelEmail;
end;

function TEmpresa.getFResponsavelNome: String;
begin
   Result := self.FResponsavelNome;
end;

function TEmpresa.getFResponsavelTelefone: String;
begin
   Result := self.FResponsavelTelefone;
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
        qEmpresa.SQL.Add('INSERT INTO EMPRESA_EMP           ');
        qEmpresa.SQL.Add('     (                            ');
        qEmpresa.SQL.Add('       EMP_NOME_FANTASIA,         ');
        qEmpresa.SQL.Add('       EMP_RAZAOSOCIAL,           ');
        qEmpresa.SQL.Add('       EMP_CODIGO_UNISYSTEM,      ');
        qEmpresa.SQL.Add('       EMP_INICIOATIVIDADES,      ');
        qEmpresa.SQL.Add('       EMP_BLOQUEADA,             ');
        qEmpresa.SQL.Add('       EMP_PESSOAJF,              ');
        qEmpresa.SQL.Add('       EMP_INSCRICAO_ESTADUAL,    ');
        qEmpresa.SQL.Add('       EMP_INSCRICAO_MUNICIPAL,   ');
        qEmpresa.SQL.Add('       EMP_SUFRAMA,               ');
        qEmpresa.SQL.Add('       EMP_CNAE,                  ');
        qEmpresa.SQL.Add('       EMP_CNPJ,                  ');
        qEmpresa.SQL.Add('       EMP_NIRE,                  ');
        qEmpresa.SQL.Add('       EMP_INSCRICAO_ESTADUAL_ST, ');
        qEmpresa.SQL.Add('       EMP_ENDERECO,              ');
        qEmpresa.SQL.Add('       EMP_CEP,                   ');
        qEmpresa.SQL.Add('       EMP_ENDERECO_NUMERO,       ');
        qEmpresa.SQL.Add('       EMP_BAIRRO,                ');
        qEmpresa.SQL.Add('       EMP_ENDERECO_COMPLEMENTO,  ');
        qEmpresa.SQL.Add('       EMP_CIDADE,                ');
        qEmpresa.SQL.Add('       EMP_IBGECIDADE,            ');
        qEmpresa.SQL.Add('       EMP_UF,                    ');
        qEmpresa.SQL.Add('       EMP_IBGEUF,                ');
        qEmpresa.SQL.Add('       EMP_FONES,                 ');
        qEmpresa.SQL.Add('       EMP_CELULAR,               ');
        qEmpresa.SQL.Add('       EMP_WHATSAPP,              ');
        qEmpresa.SQL.Add('       EMP_EMAIL,                 ');
        qEmpresa.SQL.Add('       EMP_CONTRIBUINTE_IPI,      ');
        qEmpresa.SQL.Add('       EMP_RESPONSAVEL_NOME,      ');
        qEmpresa.SQL.Add('       EMP_RESPONSAVEL_TELEFONE,  ');
        qEmpresa.SQL.Add('       EMP_RESPONSAVEL_CELULAR,   ');
        qEmpresa.SQL.Add('       EMP_RESPONSAVEL_EMAIL,     ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_EMPRESA,      ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_RESPONSAVEL,  ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_CNPJ,         ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_CPF,          ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_TEL1,         ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_TEL2,         ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_CRC,          ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_CEL1,         ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_CEL2,         ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_EMAIL,        ');

        //passo10
        qEmpresa.SQL.Add('     )                            ');
        qEmpresa.SQL.Add('VALUES                            ');
        qEmpresa.SQL.Add('     (                            ');
        qEmpresa.SQL.Add('      :EMP_NOME_FANTASIA,         ');
        qEmpresa.SQL.Add('      :EMP_RAZAOSOCIAL,           ');
        qEmpresa.SQL.Add('      :EMP_CODIGO_UNISYSTEM,      ');
        qEmpresa.SQL.Add('      :EMP_INICIOATIVIDADES,      ');
        qEmpresa.SQL.Add('      :EMP_BLOQUEADA,             ');
        qEmpresa.SQL.Add('      :EMP_PESSOAJF,              ');
        qEmpresa.SQL.Add('      :EMP_INSCRICAO_ESTADUAL,    ');
        qEmpresa.SQL.Add('      :EMP_INSCRICAO_MUNICIPAL,   ');
        qEmpresa.SQL.Add('      :EMP_SUFRAMA,               ');
        qEmpresa.SQL.Add('      :EMP_CNAE,                  ');
        qEmpresa.SQL.Add('      :EMP_CNPJ,                  ');
        qEmpresa.SQL.Add('      :EMP_NIRE,                  ');
        qEmpresa.SQL.Add('      :EMP_INSCRICAO_ESTADUAL_ST, ');
        qEmpresa.SQL.Add('      :EMP_ENDERECO,              ');
        qEmpresa.SQL.Add('      :EMP_CEP,                   ');
        qEmpresa.SQL.Add('      :EMP_ENDERECO_NUMERO,       ');
        qEmpresa.SQL.Add('      :EMP_BAIRRO,                ');
        qEmpresa.SQL.Add('      :EMP_ENDERECO_COMPLEMENTO,  ');
        qEmpresa.SQL.Add('      :EMP_CIDADE,                ');
        qEmpresa.SQL.Add('      :EMP_IBGECIDADE,            ');
        qEmpresa.SQL.Add('      :EMP_UF,                    ');
        qEmpresa.SQL.Add('      :EMP_IBGEUF,                ');
        qEmpresa.SQL.Add('      :EMP_FONES,                 ');
        qEmpresa.SQL.Add('      :EMP_CELULAR,               ');
        qEmpresa.SQL.Add('      :EMP_WHATSAPP,              ');
        qEmpresa.SQL.Add('      :EMP_EMAIL,                 ');
        qEmpresa.SQL.Add('      :EMP_CONTRIBUINTE_IPI,      ');
        qEmpresa.SQL.Add('      :EMP_RESPONSAVEL_NOME,      ');
        qEmpresa.SQL.Add('      :EMP_RESPONSAVEL_TELEFONE,  ');
        qEmpresa.SQL.Add('      :EMP_RESPONSAVEL_CELULAR,   ');
        qEmpresa.SQL.Add('      :EMP_RESPONSAVEL_EMAIL,     ');
        qEmpresa.SQL.Add('      :EMP_CONTADOR_EMPRESA,      ');
        qEmpresa.SQL.Add('      :EMP_CONTADOR_RESPONSAVEL,  ');
        qEmpresa.SQL.Add('      :EMP_CONTADOR_CNPJ,         ');
        qEmpresa.SQL.Add('      :EMP_CONTADOR_CPF,          ');
        qEmpresa.SQL.Add('      :EMP_CONTADOR_TEL1,         ');
        qEmpresa.SQL.Add('      :EMP_CONTADOR_TEL2,         ');
        qEmpresa.SQL.Add('      :EMP_CONTADOR_CRC,          ');
        qEmpresa.SQL.Add('      :EMP_CONTADOR_CEL1,         ');
        qEmpresa.SQL.Add('      :EMP_CONTADOR_CEL2,         ');
        qEmpresa.SQL.Add('      :EMP_CONTADOR_EMAIL,        ');
        qEmpresa.SQL.Add('     )                            ');

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
    qEmpresa.ParamByName('EMP_NOME_FANTASIA'        ).AsString   := FNomeFantasia;
    qEmpresa.ParamByName('EMP_RAZAOSOCIAL'          ).AsString   := FRazaoSocial;
    qEmpresa.ParamByName('EMP_CODIGO_UNISYSTEM'     ).AsString   := FCodigoUniSystem;
    qEmpresa.ParamByName('EMP_INICIOATIVIDADES'     ).AsDateTime := FDataInicioAtividades;
    if FAtiva then
       qEmpresa.ParamByName('EMP_BLOQUEADA'         ).AsString   := 'N'
    else
       qEmpresa.ParamByName('EMP_BLOQUEADA'         ).AsString   := 'S';
    qEmpresa.ParamByName('EMP_INSCRICAO_ESTADUAL'   ).AsString   := FInscricaoEstadual;
    qEmpresa.ParamByName('EMP_INSCRICAO_MUNICIPAL'  ).AsString   := FInscricaoMunicipal;
    qEmpresa.ParamByName('EMP_SUFRAMA'              ).AsString   := FSUFRAMA;
    qEmpresa.ParamByName('EMP_CNAE'                 ).AsString   := FCNAE;
    qEmpresa.ParamByName('EMP_CNPJ'                 ).AsString   := FCNPJ;
    qEmpresa.ParamByName('EMP_NIRE'                 ).AsString   := FNIRE;
    qEmpresa.ParamByName('EMP_INSCRICAO_ESTADUAL_ST').AsString   := FIESubstTributario;
    qEmpresa.ParamByName('EMP_ENDERECO'             ).AsString   := FEnderecoRua;
    qEmpresa.ParamByName('EMP_CEP'                  ).AsString   := FEnderecoCEP;
    qEmpresa.ParamByName('EMP_ENDERECO_NUMERO'      ).AsString   := FEnderecoNumero;
    qEmpresa.ParamByName('EMP_BAIRRO'               ).AsString   := FEnderecoBairro;
    qEmpresa.ParamByName('EMP_ENDERECO_COMPLEMENTO' ).AsString   := FEnderecoComplemento;
    qEmpresa.ParamByName('EMP_CIDADE'               ).AsString   := FEnderecoMunicipio;
    qEmpresa.ParamByName('EMP_IBGECIDADE'           ).AsString   := FEnderecoMunicipioIBGE;
    qEmpresa.ParamByName('EMP_UF'                   ).AsString   := FEnderecoUF;
    qEmpresa.ParamByName('EMP_IBGEUF'               ).AsString   := FEnderecoUFIBGE;
    qEmpresa.ParamByName('EMP_FONES'                ).AsString   := FTelefone;
    qEmpresa.ParamByName('EMP_CELULAR'              ).AsString   := FCelular;
    qEmpresa.ParamByName('EMP_WHATSAPP'             ).AsString   := FWhatsApp;
    qEmpresa.ParamByName('EMP_EMAIL'                ).AsString   := FEmail;
    qEmpresa.ParamByName('EMP_CONTRIBUINTE_IPI'     ).AsInteger  := f0ou1(FContribuinteIPI);
    qEmpresa.ParamByName('EMP_RESPONSAVEL_NOME'     ).AsString   := FResponsavelNome;
    qEmpresa.ParamByName('EMP_RESPONSAVEL_TELEFONE' ).AsString   := FResponsavelTelefone;
    qEmpresa.ParamByName('EMP_RESPONSAVEL_CELULAR'  ).AsString   := FResponsavelCelular;
    qEmpresa.ParamByName('EMP_RESPONSAVEL_EMAIL'    ).AsString   := FResponsavelEmail;
    qEmpresa.ParamByName('EMP_CONTADOR_EMPRESA'     ).AsString   := FContadorEmpresa;
    qEmpresa.ParamByName('EMP_CONTADOR_RESPONSAVEL' ).AsString   := FContadorResponsavel;
    qEmpresa.ParamByName('EMP_CONTADOR_CNPJ'        ).AsString   := FContadorCNPJ;
    qEmpresa.ParamByName('EMP_CONTADOR_CPF'         ).AsString   := FContadorCPF;
    qEmpresa.ParamByName('EMP_CONTADOR_TEL1'        ).AsString   := FContadorTelefone1;
    qEmpresa.ParamByName('EMP_CONTADOR_TEL2'        ).AsString   := FContadorTelefone2;
    qEmpresa.ParamByName('EMP_CONTADOR_CRC'         ).AsString   := FContadorCRC;
    qEmpresa.ParamByName('EMP_CONTADOR_CEL1'        ).AsString   := FContadorCelular1;
    qEmpresa.ParamByName('EMP_CONTADOR_CEL2'        ).AsString   := FContadorCelular2;
    qEmpresa.ParamByName('EMP_CONTADOR_EMAIL'       ).AsString   := FContadorEmail;
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
   FSUFRAMA := Copy(Value,1,11);
end;

procedure TEmpresa.setFEmail(const Value: String);
begin
   FEmail := Copy(Value,1,40);
end;

procedure TEmpresa.setFTelefone(const Value: String);
begin
   FTelefone := Copy(Value,1,40);
end;

procedure TEmpresa.setFWhatsApp(const Value: String);
begin
   FWhatsApp := Copy(Value,1,40);
end;

procedure TEmpresa.setFEnderecoBairro(const Value: String);
begin
   FEnderecoBairro := Copy(Value,1,50)
end;

procedure TEmpresa.setFEnderecoCEP(const Value: String);
begin
   FEnderecoCEP := Copy(Value,1,20);
end;

procedure TEmpresa.setFEnderecoMunicipioIBGE(const Value: String);
begin
   EnderecoMunicipioIBGE := Copy(Value,1,10)
end;

procedure TEmpresa.setFEnderecoComplemento(const Value: String);
begin
   FEnderecoComplemento := Copy(Value,1,60);
end;

procedure TEmpresa.setFEnderecoUFIBGE(const Value: String);
begin
   FEnderecoUFIBGE := Copy(Value,1,2);
end;

procedure TEmpresa.setFEnderecoMunicipio(const Value: String);
begin
   FEnderecoMunicipio := Copy(Value,1,40);
end;

procedure TEmpresa.setFEnderecoNumero(const Value: String);
begin
   FEnderecoNumero := Copy(Value,1,10);
end;

procedure TEmpresa.setFCelular(const Value: String);
begin
   FCelular := Copy(Value,1,40);
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

procedure TEmpresa.setFContribuinteIPI(const Value: Boolean);
begin
  self.FContribuinteIPI := Value;
end;

procedure TEmpresa.setFDataInicioAtividades(const Value: TDateTime);
begin
   self.FDataInicioAtividades := Value; // este � data, nao precisaok
end;

procedure TEmpresa.setFEnderecoRua(const Value: String);
begin
   self.FEnderecoRua := Value;
end;

procedure TEmpresa.setFEnderecoUF(const Value: String);
begin
   self.FEnderecoUF := copy(value,1,2);
end;

procedure TEmpresa.setFIESubstTributario(const Value: String);
begin
   self.FIESubstTributario := Copy(Value,1,20);
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

procedure TEmpresa.setFResponsavelCelular(const Value: String);
begin
   FResponsavelCelular := Copy(Value,1,40);
end;

procedure TEmpresa.setFResponsavelEmail(const Value: String);
begin
   FResponsavelEmail := Copy(Value,1,40);
end;

procedure TEmpresa.setFResponsavelNome(const Value: String);
begin
   FResponsavelNome := Copy(Value,1,40);
end;

procedure TEmpresa.setFResponsavelTelefone(const Value: String);
begin
   FResponsavelTelefone := Copy(Value,1,40);
end;

function TEmpresa.Update:Boolean;
begin
    try
        qEmpresa := TFDQuery.Create(nil);
        qEmpresa.ConnectionName :='X';
        qEmpresa.Close;
        qEmpresa.SQL.Clear;
        qEmpresa.SQL.Add('UPDATE EMPRESA_EMP                                             ');
        qEmpresa.SQL.Add('   SET EMP_NOME_FANTASIA         = :EMP_NOME_FANTASIA,         ');
        qEmpresa.SQL.Add('       EMP_RAZAOSOCIAL           = :EMP_RAZAOSOCIAL,           ');
        qEmpresa.SQL.Add('       EMP_CODIGO_UNISYSTEM      = :EMP_CODIGO_UNISYSTEM,      ');
        qEmpresa.SQL.Add('       EMP_INICIOATIVIDADES      = :EMP_INICIOATIVIDADES,      ');
        qEmpresa.SQL.Add('       EMP_BLOQUEADA             = :EMP_BLOQUEADA,             ');
        qEmpresa.SQL.Add('       EMP_PESSOAJF              = :EMP_PESSOAJF,              ');
        qEmpresa.SQL.Add('       EMP_INSCRICAO_ESTADUAL    = :EMP_INSCRICAO_ESTADUAL,    ');
        qEmpresa.SQL.Add('       EMP_INSCRICAO_MUNICIPAL   = :EMP_INSCRICAO_MUNICIPAL,   ');
        qEmpresa.SQL.Add('       EMP_SUFRAMA               = :EMP_SUFRAMA,               ');
        qEmpresa.SQL.Add('       EMP_CNAE                  = :EMP_CNAE,                  ');
        qEmpresa.SQL.Add('       EMP_CNPJ                  = :EMP_CNPJ,                  ');
        qEmpresa.SQL.Add('       EMP_NIRE                  = :EMP_NIRE,                  ');
        qEmpresa.SQL.Add('       EMP_INSCRICAO_ESTADUAL_ST = :EMP_INSCRICAO_ESTADUAL_ST, ');
        qEmpresa.SQL.Add('       EMP_ENDERECO              = :EMP_ENDERECO,              ');
        qEmpresa.SQL.Add('       EMP_CEP                   = :EMP_CEP,                   ');
        qEmpresa.SQL.Add('       EMP_ENDERECO_NUMERO       = :EMP_ENDERECO_NUMERO,       ');
        qEmpresa.SQL.Add('       EMP_BAIRRO                = :EMP_BAIRRO,                ');
        qEmpresa.SQL.Add('       EMP_ENDERECO_COMPLEMENTO  = :EMP_ENDERECO_COMPLEMENTO,  ');
        qEmpresa.SQL.Add('       EMP_CIDADE                = :EMP_CIDADE,                ');
        qEmpresa.SQL.Add('       EMP_IBGECIDADE            = :EMP_IBGECIDADE,            ');
        qEmpresa.SQL.Add('       EMP_UF                    = :EMP_UF,                    ');
        qEmpresa.SQL.Add('       EMP_IBGEUF                = :EMP_IBGEUF,                ');
        qEmpresa.SQL.Add('       EMP_FONES                 = :EMP_FONES,                 ');
        qEmpresa.SQL.Add('       EMP_CELULAR               = :EMP_CELULAR,               ');
        qEmpresa.SQL.Add('       EMP_WHATSAPP              = :EMP_WHATSAPP,              ');
        qEmpresa.SQL.Add('       EMP_EMAIL                 = :EMP_EMAIL,                 ');
        qEmpresa.SQL.Add('       EMP_CONTRIBUINTE_IPI      = :EMP_CONTRIBUINTE_IPI,      ');
        qEmpresa.SQL.Add('       EMP_RESPONSAVEL_NOME      = :EMP_RESPONSAVEL_NOME,      ');
        qEmpresa.SQL.Add('       EMP_RESPONSAVEL_TELEFONE  = :EMP_RESPONSAVEL_TELEFONE,  ');
        qEmpresa.SQL.Add('       EMP_RESPONSAVEL_CELULAR   = :EMP_RESPONSAVEL_CELULAR,   ');
        qEmpresa.SQL.Add('       EMP_RESPONSAVEL_EMAIL     = :EMP_RESPONSAVEL_EMAIL,     ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_EMPRESA      = :EMP_CONTADOR_EMPRESA,      ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_RESPONSAVEL  = :EMP_CONTADOR_RESPONSAVEL,  ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_CNPJ         = :EMP_CONTADOR_CNPJ,         ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_CPF          = :EMP_CONTADOR_CPF,          ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_TEL1         = :EMP_CONTADOR_TEL1,         ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_TEL2         = :EMP_CONTADOR_TEL2,         ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_CRC          = :EMP_CONTADOR_CRC,          ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_CEL1         = :EMP_CONTADOR_CEL1,         ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_CEL2         = :EMP_CONTADOR_CEL2,         ');
        qEmpresa.SQL.Add('       EMP_CONTADOR_EMAIL        = :EMP_CONTADOR_EMAIL         ');

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

function TEmpresa.getFContadorEmpresa: String;
begin
   Result := self.FContadorEmpresa;
end;

procedure TEmpresa.setFContadorEmpresa(const Value: String);
begin
  FContadorEmpresa  := Copy(Value,1,40);
end;

function TEmpresa.getFContadorResponsavel: String;
begin
   result := FContadorResponsavel;
end;

procedure TEmpresa.setFContadorResponsavel(const Value: String);
begin
  FContadorEmpresa  := Copy(Value,1,40);
end;

function TEmpresa.getFContadorCNPJ: String;
begin
   Result := self.FContadorCNPJ;
end;

procedure TEmpresa.setFContadorCNPJ(const Value: String);
begin
  FContadorCNPJ  := Copy(Value,1,14);
end;

function TEmpresa.getFContadorCPF: String;
begin
   Result := self.FContadorCPF;
end;

procedure TEmpresa.setFContadorCPF(const Value: String);
begin
  FContadorCPF  := Copy(Value,1,11);
end;

function TEmpresa.getFContadorTelefone1: String;
begin
   Result := self.FContadorTelefone1;
end;

procedure TEmpresa.setFContadorTelefone1(const Value: String);
begin
  FContadorTelefone1  := Copy(Value,1,40);
end;

function TEmpresa.getFContadorTelefone2: String;
begin
   Result := self.FContadorTelefone2;
end;

procedure TEmpresa.setFContadorTelefone2(const Value: String);
begin
  FContadorTelefone2  := Copy(Value,1,40);
end;

function TEmpresa.getFContadorCRC: String;
begin
   Result := self.FContadorCRC;
end;

procedure TEmpresa.setFContadorCRC(const Value: String);
begin
   FContadorCRC  := Copy(Value,1,20);
end;

function TEmpresa.getFContadorCelular1: String;
begin
   Result := self.FContadorCelular1;
end;

procedure TEmpresa.setFContadorCelular1(const Value: String);
begin
   FContadorCelular1  := Copy(Value,1,40);
end;

function TEmpresa.getFContadorCelular2: String;
begin
   Result := self.FContadorCelular2;
end;

procedure TEmpresa.setFContadorCelular2(const Value: String);
begin
   FContadorCelular1  := Copy(Value,1,40);
end;

function TEmpresa.getFContadorEmail: String;
begin
   Result := self.FContadorEmail;
end;

procedure TEmpresa.setFContadorEmail(const Value: String);
begin
  FContadorEmail := Copy(Value,1,40);
end;

end.

