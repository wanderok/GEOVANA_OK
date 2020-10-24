unit Classe_Empresa;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,

     Classe_EmpresaTributacao,
     validadorDeDocumentos;

type

   TEmpresa = class
  private
	  FAtiva                       : Boolean;   // EMP_BLOQUEADA               varchar(1)   NULL
    FNomeFantasia                : String;    // EMP_NOME_FANTASIA           varchar(50)  NULL
	  FRazaoSocial                 : String;    // EMP_RAZAOSOCIAL             varchar(50)  NULL
    FPessoaJuridica              : Boolean;   // EMP_PESSOAJF                varchar(1)   NULL
    FEMP_PESSOAJF                : String;
    FDataInicioAtividades        : TDateTime; // EMP_INICIOATIVIDADES        DATETIME     NULL
    FDataInicioAtividadesString  : String;
    FInscricaoEstadual           : String;    // EMP_INSCRICAO_ESTADUAL      varchar(20)  NULL
    FInscricaoMunicipal          : String;    // EMP_INSCRICAO_MUNICIPAL     varchar(20)  NULL
    FSUFRAMA                     : String;    // EMP_SUFRAMA                 varchar(10)  NULL
    FCNAE                        : String;    // EMP_CNAE 	                 varchar(10)  NULL
    FCNPJ                        : String;    // EMP_CNPJ 	                 varchar(20)  NULL
    FNIRE                        : String;    // EMP_NIRE 	                 varchar(11)  NULL
    FIESubstTributario           : String;    // EMP_INSCRICAO_ESTADUAL_ST   varchar(20)  NULL
    FEnderecoRua                 : String;    // EMP_ENDERECO                varchar(40)  NULL
    FEnderecoCEP                 : String;    // EMP_CEP                     varchar(20)  NULL,
    FEnderecoNumero              : String;    // EMP_ENDERECO_NUMERO         varchar(10)  NULL,
    FEnderecoBairro              : String;    // EMP_BAIRRO                  varchar(50)  NULL,
    FEnderecoComplemento         : String;    // EMP_ENDERECO_COMPLEMENTO    varchar(60)  NULL,
    FEnderecoMunicipio           : String;    // EMP_CIDADE                  varchar(40)  NULL,
    FEnderecoMunicipioIBGE       : String;    // EMP_IBGECIDADE              varchar(10)  NULL,
    FEnderecoUF                  : String;    // EMP_UF                      varchar(2)   NULL,
    FEnderecoUFIBGE              : String;    // EMP_IBGEUF                  varchar(2)   NULL
    FTelefone                    : String;    // EMP_FONES                   varchar(40)  NULL
    FCelular                     : String;    // EMP_CELULAR                 varchar(40)  NULL
    FWhatsApp                    : String;    // EMP_WHATSAPP                varchar(40)  NULL
    FEmail                       : String;    // EMP_EMAIL                   varchar(40)  NULL
    FContribuinteIPI             : Boolean;   // EMP_CONTRIBUINTE_IPI        integer      NULL
    fTratarICMS_Diferimento      : Boolean;   // EMP_TRATAR_ICMS_DIFERIMENTO integer      NULL
    FResponsavelNome             : String;    // EMP_RESPONSAVEL_NOME        varchar(40)  NULL
    FResponsavelWhatsApp         : String;    // EMP_RESPONSAVEL_WHATSAPP    varchar(40)  NULL
    FResponsavelCelular          : String;    // EMP_RESPONSAVEL_CELULAR     varchar(40)  NULL
    FResponsavelEmail            : String;    // EMP_RESPONSAVEL_EMAIL       varchar(40)  NULL
    FContadorEmpresa             : String;    // EMP_CONTADOR_EMPRESA        VARCHAR(40)  NULL
    FContadorResponsavel         : String;    // EMP_CONTADOR_RESPONSAVEL    VARCHAR(40)  NULL
    FContadorCNPJ                : String;    // EMP_CONTADOR_CNPJ           VARCHAR(14)  NULL
    FContadorCPF                 : String;    // EMP_CONTADOR_CPF            VARCHAR(11)  NULL
    FContadorTelefone1           : String;    // EMP_CONTADOR_TEL1           VARCHAR(20)  NULL
    FContadorTelefone2           : String;    // EMP_CONTADOR_TEL2           VARCHAR(20)  NULL
    FContadorCRC                 : String;    // EMP_CONTADOR_CRC            VARCHAR(20)  NULL
    FContadorCelular1            : String;    // EMP_CONTADOR_CEL1           VARCHAR(20)  NULL
    FContadorCelular2            : String;    // EMP_CONTADOR_CEL2           VARCHAR(20)  NULL
    FContadorEmail               : String;    // EMP_CONTADOR_EMAIL          VARCHAR(40)  NULL
    FLogomarca                   : String;    // EMP_LOGO                    VARCHAR(255) NULL
    FAssinatura                  : String;    // EMP_ASSINATURA              VARCHAR(255) NULL
    //PASSO 3
    FTributacao                  : TTributosDeEmpresa;
    FDataCadastro                : TDateTime; // EMP_DT                      DATETIME     NULL
    FDataCadastroString          : String;
    FCodigoUniSystem             : String;    // EMP_CODIGO_UNISYSTEM        varchar(10)  NULL
    FExiste         : Boolean;

    procedure Preencher_Parametros_Empresa(pQuery:TFDQuery);
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
    function getFResponsavelWhatsApp: String;
    procedure setFResponsavelCelular(const Value: String);
    procedure setFResponsavelEmail(const Value: String);
    procedure setFResponsavelNome(const Value: String);
    procedure setFResponsavelWhatsApp(const Value: String);
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
    function getDataCadastroString: String;
    function getFDataCadastro: TDateTime;
    procedure setFDataCadastro(const Value: TDateTime);
    function getFLogomarca: String;
    procedure setFLogomarca(const Value: String);
    function getFAssinatura: String;
    procedure setFAssinatura(const Value: String);
    function getFTratarICMS_Diferimento: Boolean;
    procedure setFTratarICMS_Diferimento(const Value: Boolean);

   public
    constructor Create;
    destructor Destroy; override;
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
      property TratarICMS_Diferimento      : Boolean   read getFTratarICMS_Diferimento      write setFTratarICMS_Diferimento;
      property ResponsavelNome             : String    read getFResponsavelNome             write setFResponsavelNome;
      property ResponsavelWhatsApp         : String    read getFResponsavelWhatsApp         write setFResponsavelWhatsApp;
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
      property Logomarca                   : String    read getFLogomarca                   write setFLogomarca;
      property Assinatura                  : String    read getFAssinatura                  write setFAssinatura;

      //
      property DataCadastro                : TDateTime read getFDataCadastro                write setFDataCadastro;
      property DataCadastroString          : String    read getDataCadastroString;
      property Tributacao                  : TTributosDeEmpresa read FTributacao write FTributacao;

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
    FExiste                      := True;
    FNomeFantasia                := qLocal.FieldByName('EMP_NOME_FANTASIA'          ).AsString;
    FRazaoSocial                 := qLocal.FieldByName('EMP_RAZAOSOCIAL'            ).AsString;
    FDataInicioAtividades        := qLocal.FieldByName('EMP_INICIOATIVIDADES'       ).AsDateTime;
    FDataInicioAtividadesString  := qLocal.FieldByName('EMP_INICIOATIVIDADES'       ).AsString;
    FAtiva                       :=(qLocal.FieldByName('EMP_BLOQUEADA'              ).AsString = 'N');
    FPessoaJuridica              :=(qLocal.FieldByName('EMP_PESSOAJF'               ).AsString = 'J');
    FInscricaoEstadual           := qLocal.FieldByName('EMP_INSCRICAO_ESTADUAL'     ).AsString;
    FInscricaoMunicipal          := qLocal.FieldByName('EMP_INSCRICAO_MUNICIPAL'    ).AsString;
    FSUFRAMA                     := qLocal.FieldByName('EMP_SUFRAMA'                ).AsString;
    FCNAE                        := qLocal.FieldByName('EMP_CNAE'                   ).AsString;
    FCNPJ                        := qLocal.FieldByName('EMP_CNPJ'                   ).AsString;
    FNIRE                        := qLocal.FieldByName('EMP_NIRE'                   ).AsString;
    FIESubstTributario           := qLocal.FieldByName('EMP_INSCRICAO_ESTADUAL_ST'  ).AsString;
    FEnderecoRua                 := qLocal.FieldByName('EMP_ENDERECO'               ).AsString;
    FEnderecoCEP                 := qLocal.FieldByName('EMP_CEP'                    ).AsString;
    FEnderecoNumero              := qLocal.FieldByName('EMP_ENDERECO_NUMERO'        ).AsString;
    FEnderecoBairro              := qLocal.FieldByName('EMP_BAIRRO'                 ).AsString;
    FEnderecoComplemento         := qLocal.FieldByname('EMP_ENDERECO_COMPLEMENTO'   ).AsString;
    FEnderecoMunicipio           := qLocal.FieldByname('EMP_CIDADE'                 ).AsString;
    FEnderecoMunicipioIBGE       := qLocal.FieldByname('EMP_IBGECIDADE'             ).AsString;
    FEnderecoUF                  := qLocal.FieldByname('EMP_UF'                     ).AsString;
    FEnderecoUFIBGE              := qLocal.FieldByName('EMP_IBGEUF'                 ).AsString;
    FTelefone                    := qLocal.FieldByName('EMP_FONES'                  ).AsString;
    FCelular                     := qLocal.FieldByName('EMP_CELULAR'                ).AsString;
    FWhatsApp                    := qLocal.FieldByName('EMP_WHATSAPP'               ).AsString;
    FEmail                       := qLocal.FieldByName('EMP_EMAIL'                  ).AsString;
    FContribuinteIPI             :=(qLocal.FieldByname('EMP_CONTRIBUINTE_IPI'       ).AsInteger = 1);
    FTratarICMS_Diferimento      :=(qLocal.FieldByname('EMP_TRATAR_ICMS_DIFERIMENTO').AsInteger = 1);
    FResponsavelNome             := qLocal.FieldByname('EMP_RESPONSAVEL_NOME'       ).AsString;
    FResponsavelWhatsApp         := qLocal.FieldByname('EMP_RESPONSAVEL_WHATSAPP'   ).AsString;
    FResponsavelCelular          := qLocal.FieldByname('EMP_RESPONSAVEL_CELULAR'    ).AsString;
    FResponsavelEmail            := qLocal.FieldByname('EMP_RESPONSAVEL_EMAIL'      ).AsString;
    FContadorEmpresa             := qLocal.FieldByname('EMP_CONTADOR_EMPRESA'       ).AsString;
    FContadorResponsavel         := qLocal.FieldByname('EMP_CONTADOR_RESPONSAVEL'   ).AsString;
    FContadorCNPJ                := qLocal.FieldByname('EMP_CONTADOR_CNPJ'          ).AsString;
    FContadorCPF                 := qLocal.FieldByname('EMP_CONTADOR_CPF'           ).AsString;
    FContadorTelefone1           := qLocal.FieldByname('EMP_CONTADOR_TEL1'          ).AsString;
    FContadorTelefone2           := qLocal.FieldByname('EMP_CONTADOR_TEL2'          ).AsString;
    FContadorCRC                 := qLocal.FieldByname('EMP_CONTADOR_CRC'           ).AsString;
    FContadorCelular1            := qLocal.FieldByname('EMP_CONTADOR_CEL1'          ).AsString;
    FContadorCelular2            := qLocal.FieldByname('EMP_CONTADOR_CEL2'          ).AsString;
    FContadorEmail               := qLocal.FieldByname('EMP_CONTADOR_EMAIL'         ).AsString;
    FLogomarca                   := qLocal.FieldByname('EMP_LOGO'                   ).AsString;
    FAssinatura                  := qLocal.FieldByname('EMP_ASSINATURA'             ).AsString;

    FTributacao.PIS.Cumulativo   :=(qLocal.FieldByName('EMP_PIS_CUMULATIVO'         ).AsInteger = 1);
    FTributacao.PIS.Aliquota     := qLocal.FieldByName('EMP_PIS_ALIQUOTA'           ).AsFloat;
    FTributacao.COFINS.Cumulativo:=(qLocal.FieldByName('EMP_COFINS_CUMULATIVO'      ).AsInteger = 1);
    FTributacao.COFINS.Aliquota  := qLocal.FieldByName('EMP_COFINS_ALIQUOTA'        ).AsFloat;

    FDataCadastro                := qLocal.FieldByName('EMP_DT'                     ).AsDateTime;
    FCodigoUniSystem             := qLocal.FieldByName('EMP_CODIGO_UNISYSTEM'       ).AsString;

    //PASSO 9
    Qlocal.Free;
end;

constructor TEmpresa.Create;
begin
   FTributacao := TTributosDeEmpresa.Create;
end;

function TEmpresa.DadosCorretos: Boolean;
begin
    Result := False;
 //   if NaoInformadoString(FNomeFantasia   ,'Nome Fantasia'   ) or
 //      NaoInformadoString(FCodigoUniSystem,'Código Unisystem') or
 //	     NaoInformadoString(FRazaoSocial    ,'Razão Social'    ) then
 //      exit;

    Result := True;
end;

destructor TEmpresa.Destroy;
begin
  FTributacao.Free;
  inherited;
end;

function TEmpresa.getDataCadastroString: String;
begin
   FDataCadastroString := DateToStr(FDataCadastro);
   result := self.FDataCadastroString;
end;

function TEmpresa.getDataInicioAtividadesString: String;
begin
   result := self.FDataInicioAtividadesString;
end;

function TEmpresa.getFAssinatura: String;
begin
   result := self.FAssinatura;
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
   result := self.FEmail;
end;

function TEmpresa.getFTelefone: String;
begin
   result := frmValidadorDeDocumentos.formataTelCel(self.FTelefone);
end;

function TEmpresa.getFTratarICMS_Diferimento: Boolean;
begin
   result := self.FTratarICMS_Diferimento;
end;

function TEmpresa.getFWhatsApp: String;
begin
   result := FrmValidadorDeDocumentos.formataTelCel(self.FWhatsApp);
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
   result := FrmValidadorDeDocumentos.formataTelCel(self.FCelular);
end;

function TEmpresa.getFCNAE: String;
begin
   result := self.FCNAE;
end;

function TEmpresa.getFCNPJ: String;
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

function TEmpresa.getFCodigoUniSystem: String;
begin
   result := self.FCodigoUniSystem;
end;

function TEmpresa.getFContribuinteIPI: Boolean;
begin
   result := self.FContribuinteIPI
end;

function TEmpresa.getFDataCadastro: TDateTime;
begin
   result := self.FDataCadastro;
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

function TEmpresa.getFLogomarca: String;
begin
   result := self.FLogomarca;
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
   Result := FrmValidadorDeDocumentos.formataTelCel(self.FResponsavelCelular);
end;

function TEmpresa.getFResponsavelEmail: String;
begin
   Result := self.FResponsavelEmail;
end;

function TEmpresa.getFResponsavelNome: String;
begin
   Result := self.FResponsavelNome;
end;

function TEmpresa.getFResponsavelWhatsApp: String;
begin
   Result := FrmValidadorDeDocumentos.formataTelCel(self.FResponsavelWhatsApp);
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
var qLocal:TFDQuery;
begin
    result := False;
    try
        qLocal := TFDQuery.Create(nil);
        qLocal.ConnectionName :='X';
        qLocal.Close;
        qLocal.SQL.Clear;
        qLocal.SQL.Add('INSERT INTO EMPRESA_EMP            ');
        qLocal.SQL.Add('     (                             ');
        qLocal.SQL.Add('       EMP_NOME_FANTASIA,          ');
        qLocal.SQL.Add('       EMP_RAZAOSOCIAL,            ');
        qLocal.SQL.Add('       EMP_CODIGO_UNISYSTEM,       ');
        qLocal.SQL.Add('       EMP_INICIOATIVIDADES,       ');
        qLocal.SQL.Add('       EMP_BLOQUEADA,              ');
        qLocal.SQL.Add('       EMP_PESSOAJF,               ');
        qLocal.SQL.Add('       EMP_INSCRICAO_ESTADUAL,     ');
        qLocal.SQL.Add('       EMP_INSCRICAO_MUNICIPAL,    ');
        qLocal.SQL.Add('       EMP_SUFRAMA,                ');
        qLocal.SQL.Add('       EMP_CNAE,                   ');
        qLocal.SQL.Add('       EMP_CNPJ,                   ');
        qLocal.SQL.Add('       EMP_NIRE,                   ');
        qLocal.SQL.Add('       EMP_INSCRICAO_ESTADUAL_ST,  ');
        qLocal.SQL.Add('       EMP_ENDERECO,               ');
        qLocal.SQL.Add('       EMP_CEP,                    ');
        qLocal.SQL.Add('       EMP_ENDERECO_NUMERO,        ');
        qLocal.SQL.Add('       EMP_BAIRRO,                 ');
        qLocal.SQL.Add('       EMP_ENDERECO_COMPLEMENTO,   ');
        qLocal.SQL.Add('       EMP_CIDADE,                 ');
        qLocal.SQL.Add('       EMP_IBGECIDADE,             ');
        qLocal.SQL.Add('       EMP_UF,                     ');
        qLocal.SQL.Add('       EMP_IBGEUF,                 ');
        qLocal.SQL.Add('       EMP_FONES,                  ');
        qLocal.SQL.Add('       EMP_CELULAR,                ');
        qLocal.SQL.Add('       EMP_WHATSAPP,               ');
        qLocal.SQL.Add('       EMP_EMAIL,                  ');
        qLocal.SQL.Add('       EMP_CONTRIBUINTE_IPI,       ');
        qLocal.SQL.Add('       EMP_TRATAR_ICMS_DIFERIMENTO,');
        qLocal.SQL.Add('       EMP_RESPONSAVEL_NOME,       ');
        qLocal.SQL.Add('       EMP_RESPONSAVEL_WHATSAPP,   ');
        qLocal.SQL.Add('       EMP_RESPONSAVEL_CELULAR,    ');
        qLocal.SQL.Add('       EMP_RESPONSAVEL_EMAIL,      ');
        qLocal.SQL.Add('       EMP_CONTADOR_EMPRESA,       ');
        qLocal.SQL.Add('       EMP_CONTADOR_RESPONSAVEL,   ');
        qLocal.SQL.Add('       EMP_CONTADOR_CNPJ,          ');
        qLocal.SQL.Add('       EMP_CONTADOR_CPF,           ');
        qLocal.SQL.Add('       EMP_CONTADOR_TEL1,          ');
        qLocal.SQL.Add('       EMP_CONTADOR_TEL2,          ');
        qLocal.SQL.Add('       EMP_CONTADOR_CRC,           ');
        qLocal.SQL.Add('       EMP_CONTADOR_CEL1,          ');
        qLocal.SQL.Add('       EMP_CONTADOR_CEL2,          ');
        qLocal.SQL.Add('       EMP_CONTADOR_EMAIL,         ');
        qLocal.SQL.Add('       EMP_LOGO,                   ');
        qLocal.SQL.Add('       EMP_ASSINATURA,             ');
        qLocal.SQL.Add('       EMP_DT,                     ');
        qLocal.SQL.Add('       EMP_PIS_CUMULATIVO,         ');
        qLocal.SQL.Add('       EMP_PIS_ALIQUOTA,           ');
        qLocal.SQL.Add('       EMP_COFINS_CUMULATIVO,      ');
        qLocal.SQL.Add('       EMP_COFINS_ALIQUOTA         ');
        qLocal.SQL.Add('     )                             ');
        qLocal.SQL.Add('VALUES                             ');
        qLocal.SQL.Add('     (                             ');
        qLocal.SQL.Add('      :EMP_NOME_FANTASIA,          ');
        qLocal.SQL.Add('      :EMP_RAZAOSOCIAL,            ');
        qLocal.SQL.Add('      :EMP_CODIGO_UNISYSTEM,       ');
        qLocal.SQL.Add('      :EMP_INICIOATIVIDADES,       ');
        qLocal.SQL.Add('      :EMP_BLOQUEADA,              ');
        qLocal.SQL.Add('      :EMP_PESSOAJF,               ');
        qLocal.SQL.Add('      :EMP_INSCRICAO_ESTADUAL,     ');
        qLocal.SQL.Add('      :EMP_INSCRICAO_MUNICIPAL,    ');
        qLocal.SQL.Add('      :EMP_SUFRAMA,                ');
        qLocal.SQL.Add('      :EMP_CNAE,                   ');
        qLocal.SQL.Add('      :EMP_CNPJ,                   ');
        qLocal.SQL.Add('      :EMP_NIRE,                   ');
        qLocal.SQL.Add('      :EMP_INSCRICAO_ESTADUAL_ST,  ');
        qLocal.SQL.Add('      :EMP_ENDERECO,               ');
        qLocal.SQL.Add('      :EMP_CEP,                    ');
        qLocal.SQL.Add('      :EMP_ENDERECO_NUMERO,        ');
        qLocal.SQL.Add('      :EMP_BAIRRO,                 ');
        qLocal.SQL.Add('      :EMP_ENDERECO_COMPLEMENTO,   ');
        qLocal.SQL.Add('      :EMP_CIDADE,                 ');
        qLocal.SQL.Add('      :EMP_IBGECIDADE,             ');
        qLocal.SQL.Add('      :EMP_UF,                     ');
        qLocal.SQL.Add('      :EMP_IBGEUF,                 ');
        qLocal.SQL.Add('      :EMP_FONES,                  ');
        qLocal.SQL.Add('      :EMP_CELULAR,                ');
        qLocal.SQL.Add('      :EMP_WHATSAPP,               ');
        qLocal.SQL.Add('      :EMP_EMAIL,                  ');
        qLocal.SQL.Add('      :EMP_CONTRIBUINTE_IPI,       ');
        qLocal.SQL.Add('      :EMP_TRATAR_ICMS_DIFERIMENTO,');
        qLocal.SQL.Add('      :EMP_RESPONSAVEL_NOME,       ');
        qLocal.SQL.Add('      :EMP_RESPONSAVEL_WHATSAPP,   ');
        qLocal.SQL.Add('      :EMP_RESPONSAVEL_CELULAR,    ');
        qLocal.SQL.Add('      :EMP_RESPONSAVEL_EMAIL,      ');
        qLocal.SQL.Add('      :EMP_CONTADOR_EMPRESA,       ');
        qLocal.SQL.Add('      :EMP_CONTADOR_RESPONSAVEL,   ');
        qLocal.SQL.Add('      :EMP_CONTADOR_CNPJ,          ');
        qLocal.SQL.Add('      :EMP_CONTADOR_CPF,           ');
        qLocal.SQL.Add('      :EMP_CONTADOR_TEL1,          ');
        qLocal.SQL.Add('      :EMP_CONTADOR_TEL2,          ');
        qLocal.SQL.Add('      :EMP_CONTADOR_CRC,           ');
        qLocal.SQL.Add('      :EMP_CONTADOR_CEL1,          ');
        qLocal.SQL.Add('      :EMP_CONTADOR_CEL2,          ');
        qLocal.SQL.Add('      :EMP_CONTADOR_EMAIL,         ');
        qLocal.SQL.Add('      :EMP_LOGO,                   ');
        qLocal.SQL.Add('      :EMP_ASSINATURA,             ');
        qLocal.SQL.Add('      :EMP_DT,                     ');
        qLocal.SQL.Add('      :EMP_PIS_CUMULATIVO,         ');
        qLocal.SQL.Add('      :EMP_PIS_ALIQUOTA,           ');
        qLocal.SQL.Add('      :EMP_COFINS_CUMULATIVO,      ');
        qLocal.SQL.Add('      :EMP_COFINS_ALIQUOTA         ');
        qLocal.SQL.Add('     )                             ');

        //passo 11
        Preencher_Parametros_Empresa(qLocal);
        qLocal.ParamByName('EMP_DT').AsDateTime := DataServidor;

        qLocal.ExecSql;
        qLocal.Free;
        Log('Incluiu empresa '+ Empresa.FNomeFantasia);
        Result := True;
    except
       qLocal.Free;
       ShowMessage('Erro ao incluir Empresa');
       LOGErros('Erro ao incluir Empresa');
    end;
end;

procedure TEmpresa.Preencher_Parametros_Empresa(pQuery:TFDQuery);
begin
    pQuery.ParamByName('EMP_PESSOAJF'               ).AsString   := FEMP_PESSOAJF;
    pQuery.ParamByName('EMP_NOME_FANTASIA'          ).AsString   := FNomeFantasia;
    pQuery.ParamByName('EMP_RAZAOSOCIAL'            ).AsString   := FRazaoSocial;
    pQuery.ParamByName('EMP_CODIGO_UNISYSTEM'       ).AsString   := FCodigoUniSystem;
    pQuery.ParamByName('EMP_INICIOATIVIDADES'       ).AsDateTime := FDataInicioAtividades;
    if FAtiva then
       pQuery.ParamByName('EMP_BLOQUEADA'           ).AsString   := 'N'
    else
       pQuery.ParamByName('EMP_BLOQUEADA'           ).AsString   := 'S';
    pQuery.ParamByName('EMP_INSCRICAO_ESTADUAL'     ).AsString   := FInscricaoEstadual;
    pQuery.ParamByName('EMP_INSCRICAO_MUNICIPAL'    ).AsString   := FInscricaoMunicipal;
    pQuery.ParamByName('EMP_SUFRAMA'                ).AsString   := FSUFRAMA;
    pQuery.ParamByName('EMP_CNAE'                   ).AsString   := FCNAE;
    pQuery.ParamByName('EMP_CNPJ'                   ).AsString   := FCNPJ;
    pQuery.ParamByName('EMP_NIRE'                   ).AsString   := FNIRE;
    pQuery.ParamByName('EMP_INSCRICAO_ESTADUAL_ST'  ).AsString   := FIESubstTributario;
    pQuery.ParamByName('EMP_ENDERECO'               ).AsString   := FEnderecoRua;
    pQuery.ParamByName('EMP_CEP'                    ).AsString   := FEnderecoCEP;
    pQuery.ParamByName('EMP_ENDERECO_NUMERO'        ).AsString   := FEnderecoNumero;
    pQuery.ParamByName('EMP_BAIRRO'                 ).AsString   := FEnderecoBairro;
    pQuery.ParamByName('EMP_ENDERECO_COMPLEMENTO'   ).AsString   := FEnderecoComplemento;
    pQuery.ParamByName('EMP_CIDADE'                 ).AsString   := FEnderecoMunicipio;
    pQuery.ParamByName('EMP_IBGECIDADE'             ).AsString   := FEnderecoMunicipioIBGE;
    pQuery.ParamByName('EMP_UF'                     ).AsString   := FEnderecoUF;
    pQuery.ParamByName('EMP_IBGEUF'                 ).AsString   := FEnderecoUFIBGE;
    pQuery.ParamByName('EMP_FONES'                  ).AsString   := FTelefone;
    pQuery.ParamByName('EMP_CELULAR'                ).AsString   := FCelular;
    pQuery.ParamByName('EMP_WHATSAPP'               ).AsString   := FWhatsApp;
    pQuery.ParamByName('EMP_EMAIL'                  ).AsString   := FEmail;
    pQuery.ParamByName('EMP_CONTRIBUINTE_IPI'       ).AsInteger  := f0ou1(FContribuinteIPI);
    pQuery.ParamByName('EMP_TRATAR_ICMS_DIFERIMENTO').AsInteger  := f0ou1(FTratarICMS_Diferimento);
    pQuery.ParamByName('EMP_RESPONSAVEL_NOME'       ).AsString   := FResponsavelNome;
    pQuery.ParamByName('EMP_RESPONSAVEL_WHATSAPP'   ).AsString   := FResponsavelWhatsApp;
    pQuery.ParamByName('EMP_RESPONSAVEL_CELULAR'    ).AsString   := FResponsavelCelular;
    pQuery.ParamByName('EMP_RESPONSAVEL_EMAIL'      ).AsString   := FResponsavelEmail;
    pQuery.ParamByName('EMP_CONTADOR_EMPRESA'       ).AsString   := FContadorEmpresa;
    pQuery.ParamByName('EMP_CONTADOR_RESPONSAVEL'   ).AsString   := FContadorResponsavel;
    pQuery.ParamByName('EMP_CONTADOR_CNPJ'          ).AsString   := FContadorCNPJ;
    pQuery.ParamByName('EMP_CONTADOR_CPF'           ).AsString   := FContadorCPF;
    pQuery.ParamByName('EMP_CONTADOR_TEL1'          ).AsString   := FContadorTelefone1;
    pQuery.ParamByName('EMP_CONTADOR_TEL2'          ).AsString   := FContadorTelefone2;
    pQuery.ParamByName('EMP_CONTADOR_CRC'           ).AsString   := FContadorCRC;
    pQuery.ParamByName('EMP_CONTADOR_CEL1'          ).AsString   := FContadorCelular1;
    pQuery.ParamByName('EMP_CONTADOR_CEL2'          ).AsString   := FContadorCelular2;
    pQuery.ParamByName('EMP_CONTADOR_EMAIL'         ).AsString   := FContadorEmail;
    pQuery.ParamByName('EMP_LOGO'                   ).AsString   := FLogomarca;
    pQuery.ParamByName('EMP_ASSINATURA'             ).AsString   := FAssinatura;
    pQuery.ParamByName('EMP_CODIGO_UNISYSTEM'       ).AsString   := FCodigoUniSystem;
    pQuery.ParamByName('EMP_PIS_CUMULATIVO'         ).AsInteger  := f0ou1(FTributacao.PIS.Cumulativo);
    pQuery.ParamByName('EMP_PIS_ALIQUOTA'           ).AsFloat    := FTributacao.PIS.Aliquota;
    pQuery.ParamByName('EMP_COFINS_CUMULATIVO'      ).AsInteger  := f0ou1(FTributacao.COFINS.Cumulativo);
    pQuery.ParamByName('EMP_COFINS_ALIQUOTA'        ).AsFloat    := FTributacao.COFINS.Aliquota;
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

procedure TEmpresa.setFAssinatura(const Value: String);
begin
   FAssinatura := Copy(Value,1,255);
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
   FTelefone := Copy(SoNumeros(Value),1,40);
end;

procedure TEmpresa.setFTratarICMS_Diferimento(const Value: Boolean);
begin
   FTratarICMS_Diferimento := Value;
end;

procedure TEmpresa.setFWhatsApp(const Value: String);
begin
   FWhatsApp := Copy(SoNumeros(Value),1,40);
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
   FEnderecoMunicipioIBGE := Copy(Value,1,10)
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
   FCelular := Copy(SoNumeros(Value),1,40);
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
  self.FCodigoUniSystem := Copy(Value,1,10);
end;

procedure TEmpresa.setFContribuinteIPI(const Value: Boolean);
begin
  self.FContribuinteIPI := Value;
end;

procedure TEmpresa.setFDataCadastro(const Value: TDateTime);
begin
   self.FDataCadastro := Value;
end;

procedure TEmpresa.setFDataInicioAtividades(const Value: TDateTime);
begin
   self.FDataInicioAtividades := Value;
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

procedure TEmpresa.setFLogomarca(const Value: String);
begin
   self.FLogomarca := copy(value,1,
   255);
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
   if value then
      self.FEMP_PESSOAJF := 'J'
   else
      self.FEMP_PESSOAJF := 'F';
end;

procedure TEmpresa.setFRazaoSocial(const Value: String);
begin
   FRazaoSocial := Copy(Value,1,50);
end;

procedure TEmpresa.setFResponsavelCelular(const Value: String);
begin
   FResponsavelCelular := Copy(SoNumeros(Value),1,40);
end;

procedure TEmpresa.setFResponsavelEmail(const Value: String);
begin
   FResponsavelEmail := Copy(Value,1,40);
end;

procedure TEmpresa.setFResponsavelNome(const Value: String);
begin
   FResponsavelNome := Copy(Value,1,40);
end;

procedure TEmpresa.setFResponsavelWhatsApp(const Value: String);
begin
   FResponsavelWhatsApp := Copy(SoNumeros(Value),1,40);
end;

function TEmpresa.Update:Boolean;
var qLocal: TFDQuery;
begin
    try
        qLocal := TFDQuery.Create(nil);
        qLocal.ConnectionName :='X';
        qLocal.Close;
        qLocal.SQL.Clear;
        qLocal.SQL.Add('UPDATE EMPRESA_EMP                                               ');
        qLocal.SQL.Add('   SET EMP_NOME_FANTASIA           = :EMP_NOME_FANTASIA,         ');
        qLocal.SQL.Add('       EMP_RAZAOSOCIAL             = :EMP_RAZAOSOCIAL,           ');
        qLocal.SQL.Add('       EMP_INICIOATIVIDADES        = :EMP_INICIOATIVIDADES,      ');
        qLocal.SQL.Add('       EMP_BLOQUEADA               = :EMP_BLOQUEADA,             ');
        qLocal.SQL.Add('       EMP_PESSOAJF                = :EMP_PESSOAJF,              ');
        qLocal.SQL.Add('       EMP_INSCRICAO_ESTADUAL      = :EMP_INSCRICAO_ESTADUAL,    ');
        qLocal.SQL.Add('       EMP_INSCRICAO_MUNICIPAL     = :EMP_INSCRICAO_MUNICIPAL,   ');
        qLocal.SQL.Add('       EMP_SUFRAMA                 = :EMP_SUFRAMA,               ');
        qLocal.SQL.Add('       EMP_CNAE                    = :EMP_CNAE,                  ');
        qLocal.SQL.Add('       EMP_CNPJ                    = :EMP_CNPJ,                  ');
        qLocal.SQL.Add('       EMP_NIRE                    = :EMP_NIRE,                  ');
        qLocal.SQL.Add('       EMP_INSCRICAO_ESTADUAL_ST   = :EMP_INSCRICAO_ESTADUAL_ST, ');
        qLocal.SQL.Add('       EMP_ENDERECO                = :EMP_ENDERECO,              ');
        qLocal.SQL.Add('       EMP_CEP                     = :EMP_CEP,                   ');
        qLocal.SQL.Add('       EMP_ENDERECO_NUMERO         = :EMP_ENDERECO_NUMERO,       ');
        qLocal.SQL.Add('       EMP_BAIRRO                  = :EMP_BAIRRO,                ');
        qLocal.SQL.Add('       EMP_ENDERECO_COMPLEMENTO    = :EMP_ENDERECO_COMPLEMENTO,  ');
        qLocal.SQL.Add('       EMP_CIDADE                  = :EMP_CIDADE,                ');
        qLocal.SQL.Add('       EMP_IBGECIDADE              = :EMP_IBGECIDADE,            ');
        qLocal.SQL.Add('       EMP_UF                      = :EMP_UF,                    ');
        qLocal.SQL.Add('       EMP_IBGEUF                  = :EMP_IBGEUF,                ');
        qLocal.SQL.Add('       EMP_FONES                   = :EMP_FONES,                 ');
        qLocal.SQL.Add('       EMP_CELULAR                 = :EMP_CELULAR,               ');
        qLocal.SQL.Add('       EMP_WHATSAPP                = :EMP_WHATSAPP,              ');
        qLocal.SQL.Add('       EMP_EMAIL                   = :EMP_EMAIL,                 ');
        qLocal.SQL.Add('       EMP_CONTRIBUINTE_IPI        = :EMP_CONTRIBUINTE_IPI,      ');
        qLocal.SQL.Add('       EMP_TRATAR_ICMS_DIFERIMENTO = :EMP_TRATAR_ICMS_DIFERIMENTO,      ');
        qLocal.SQL.Add('       EMP_RESPONSAVEL_NOME        = :EMP_RESPONSAVEL_NOME,      ');
        qLocal.SQL.Add('       EMP_RESPONSAVEL_WHATSAPP    = :EMP_RESPONSAVEL_WHATSAPP,  ');
        qLocal.SQL.Add('       EMP_RESPONSAVEL_CELULAR     = :EMP_RESPONSAVEL_CELULAR,   ');
        qLocal.SQL.Add('       EMP_RESPONSAVEL_EMAIL       = :EMP_RESPONSAVEL_EMAIL,     ');
        qLocal.SQL.Add('       EMP_CONTADOR_EMPRESA        = :EMP_CONTADOR_EMPRESA,      ');
        qLocal.SQL.Add('       EMP_CONTADOR_RESPONSAVEL    = :EMP_CONTADOR_RESPONSAVEL,  ');
        qLocal.SQL.Add('       EMP_CONTADOR_CNPJ           = :EMP_CONTADOR_CNPJ,         ');
        qLocal.SQL.Add('       EMP_CONTADOR_CPF            = :EMP_CONTADOR_CPF,          ');
        qLocal.SQL.Add('       EMP_CONTADOR_TEL1           = :EMP_CONTADOR_TEL1,         ');
        qLocal.SQL.Add('       EMP_CONTADOR_TEL2           = :EMP_CONTADOR_TEL2,         ');
        qLocal.SQL.Add('       EMP_CONTADOR_CRC            = :EMP_CONTADOR_CRC,          ');
        qLocal.SQL.Add('       EMP_CONTADOR_CEL1           = :EMP_CONTADOR_CEL1,         ');
        qLocal.SQL.Add('       EMP_CONTADOR_CEL2           = :EMP_CONTADOR_CEL2,         ');
        qLocal.SQL.Add('       EMP_CONTADOR_EMAIL          = :EMP_CONTADOR_EMAIL,        ');
        qLocal.SQL.Add('       EMP_LOGO                    = :EMP_LOGO,                  ');
        qLocal.SQL.Add('       EMP_ASSINATURA              = :EMP_ASSINATURA,            ');
        qLocal.SQL.Add('       EMP_PIS_CUMULATIVO          = :EMP_PIS_CUMULATIVO,        ');
        qLocal.SQL.Add('       EMP_PIS_ALIQUOTA            = :EMP_PIS_ALIQUOTA,          ');
        qLocal.SQL.Add('       EMP_COFINS_CUMULATIVO       = :EMP_COFINS_CUMULATIVO,     ');
        qLocal.SQL.Add('       EMP_COFINS_ALIQUOTA         = :EMP_COFINS_ALIQUOTA,       ');

        //--------------------------------------------------------------------------------
        qLocal.SQL.Add('       EMP_DT                      = :EMP_DT,                    ');
        qLocal.SQL.Add('       EMP_CODIGO_UNISYSTEM        = :EMP_CODIGO_UNISYSTEM       ');

        //passo11
        Preencher_Parametros_Empresa(qLocal);
        qLocal.ParamByName('EMP_DT').AsDateTime := FDataCadastro;
        qLocal.ExecSql;
        qLocal.Free;
        Log('Alterou empresa '+ Empresa.FNomeFantasia);
        Result := True;
    except
       qLocal.Free;
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
  FContadorResponsavel  := Copy(Value,1,40);
end;

function TEmpresa.getFContadorCNPJ: String;
begin
   if self.FContadorCNPJ = '' then
   begin
     result := self.FContadorCNPJ;
     exit;
   end;
   self.FContadorCNPJ :=Trim(self.FContadorCNPJ);
   if frmValidadorDeDocumentos.CNPJ_Valido(self.FContadorCNPJ) then
      result := vVDD_DocumentoFormatado;
end;

procedure TEmpresa.setFContadorCNPJ(const Value: String);
begin
  FContadorCNPJ  := Copy(SoNumeros(Value),1,14);
end;

function TEmpresa.getFContadorCPF: String;
begin
   if self.FContadorCPF = '' then
   begin
     result := self.FContadorCPF;
     exit;
   end;
   self.FContadorCPF :=Trim(self.FContadorCPF);
   if frmValidadorDeDocumentos.CPF_Valido(self.FContadorCPF) then
      result := vVDD_DocumentoFormatado;
end;

procedure TEmpresa.setFContadorCPF(const Value: String);
begin
  FContadorCPF  := Copy(SoNumeros(Value),1,11);
end;

function TEmpresa.getFContadorTelefone1: String;
begin
   Result := frmValidadorDeDocumentos.formataTelCel(self.FContadorTelefone1);
end;

procedure TEmpresa.setFContadorTelefone1(const Value: String);
begin
  FContadorTelefone1  := Copy(SoNumeros(Value),1,40);
end;

function TEmpresa.getFContadorTelefone2: String;
begin
   Result := frmValidadorDeDocumentos.formataTelCel(self.FContadorTelefone2);
end;

procedure TEmpresa.setFContadorTelefone2(const Value: String);
begin
  FContadorTelefone2  := Copy(SoNumeros(Value),1,40);
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
   Result := FrmValidadorDeDocumentos.formataTelCel(self.FContadorCelular1);
end;

procedure TEmpresa.setFContadorCelular1(const Value: String);
begin
   FContadorCelular1  := Copy(SoNumeros(Value),1,40);
end;

function TEmpresa.getFContadorCelular2: String;
begin
   Result := frmValidadorDeDocumentos.formataTelCel(self.FContadorCelular2);
end;

procedure TEmpresa.setFContadorCelular2(const Value: String);
begin
   FContadorCelular2  := Copy(SoNumeros(Value),1,40);
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

