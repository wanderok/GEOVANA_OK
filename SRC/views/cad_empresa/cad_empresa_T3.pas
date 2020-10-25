unit cad_empresa_T3;

interface

uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, cxControls, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, cxCheckBox,
  cxButtons, config_nfce, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.ExtCtrls, Vcl.ExtDlgs, ACBrBase, ACBrEnterTab,
  ACBrValidador;

type
  Tfrm_cad_empresa_T3 = class(TForm)
    BtnGravar: TcxButton;
    grpConfig: TGroupBox;
    BtnCertificado: TcxButton;
    BtnEmail: TcxButton;
    BtnNFE: TcxButton;
    BtnNFCE: TcxButton;
    BtnNFSE: TcxButton;
    BtnMDE: TcxButton;
    cxButton4: TcxButton;
    gbContador: TGroupBox;
    grpLogo: TGroupBox;
    TL_colab: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    grpDadosEmpresa: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    BTNbase_dados: TcxButton;
    BtnRelatorio: TcxButton;
    Label22: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    GroupBox4: TGroupBox;
    cxButton3: TcxButton;
    cxButton7: TcxButton;
    Label12: TLabel;
    cxButton8: TcxButton;
    grpEndereco: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label26: TLabel;
    cxButton5: TcxButton;
    cxButton10: TcxButton;
    edRazaoSocial: TEdit;
    edNomeFantasia: TEdit;
    edCNAE: TEdit;
    edSUFRAMA: TEdit;
    edInscricaoEstadual: TEdit;
    edCNPJ: TEdit;
    edInscricaoMunicipal: TEdit;
    edNIRE: TEdit;
    edEnderecoMunicipioIBGE: TEdit;
    edEnderecoComplemento: TEdit;
    edEnderecoNumero: TEdit;
    edEnderecoRua: TEdit;
    edEnderecoMunicipio: TEdit;
    edEnderecoBairro: TEdit;
    edEnderecoUF: TEdit;
    edEnderecoUFIBGE: TEdit;
    edEnderecoCEP: TEdit;
    GroupBox5: TGroupBox;
    edResponsavelNome: TEdit;
    edResponsavelCelular: TEdit;
    edResponsavelWhatsApp: TEdit;
    edResponsavelEmail: TEdit;
    edContadorEmpresa: TEdit;
    edContadorResponsavel: TEdit;
    edContadorCNPJ: TEdit;
    edContadorCRC: TEdit;
    edContadorCelular1: TEdit;
    edContadorEmail: TEdit;
    edContadorTelefone1: TEdit;
    edContadorCPF: TEdit;
    edContadorTeleFone2: TEdit;
    edContadorCelular2: TEdit;
    edDataInicioAtividades: TMaskEdit;
    grpOutras: TGroupBox;
    Label13: TLabel;
    edCodigoUniSystem: TEdit;
    edDataCadastro: TMaskEdit;
    grpContatos: TGroupBox;
    edTelefone: TEdit;
    edCelular: TEdit;
    edWhatsApp: TEdit;
    edEmail: TEdit;
    OpenPictureDialog1: TOpenPictureDialog;
    imgLogoMarca: TImage;
    imgAssinatura: TImage;
    lbNomeDaTela: TLabel;
    cxButton6: TcxButton;
    procedure BtnCertificadoClick(Sender: TObject);
    procedure BtnEmailClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure BtnNFEClick(Sender: TObject);
    procedure BtnNFSEClick(Sender: TObject);
    procedure BtnMDEClick(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure BTNbase_dadosClick(Sender: TObject);
    procedure BtnNFCEClick(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton11Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edRazaoSocialExit(Sender: TObject);
    procedure edCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure edResponsavelNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edPISAliquotaExit(Sender: TObject);
    procedure edCOFINSAliquotaExit(Sender: TObject);
    procedure edISSAliquotaExit(Sender: TObject);
    procedure edPISAliquotaKeyPress(Sender: TObject; var Key: Char);
    procedure edEnderecoMunicipioIBGEExit(Sender: TObject);
    procedure edEnderecoMunicipioIBGEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCNPJExit(Sender: TObject);
    procedure edContadorCNPJExit(Sender: TObject);
    procedure edInscricaoEstadualExit(Sender: TObject);
    procedure edSUFRAMAExit(Sender: TObject);
    procedure edEmailExit(Sender: TObject);
    procedure edResponsavelEmailExit(Sender: TObject);
    procedure edContadorEmailExit(Sender: TObject);
    procedure edEnderecoCEPExit(Sender: TObject);
    procedure edContadorCPFExit(Sender: TObject);
    procedure edDataInicioAtividadesExit(Sender: TObject);
    procedure edDataCadastroExit(Sender: TObject);
    procedure edContadorTelefone1Exit(Sender: TObject);
    procedure edContadorTeleFone2Exit(Sender: TObject);
    procedure edTelefoneExit(Sender: TObject);
    procedure edCelularExit(Sender: TObject);
    procedure edResponsavelCelularExit(Sender: TObject);
    procedure edContadorCelular1Exit(Sender: TObject);
    procedure edContadorCelular2Exit(Sender: TObject);
    procedure edWhatsAppExit(Sender: TObject);
    procedure edResponsavelWhatsAppExit(Sender: TObject);
  private
    { Private declarations }
    function DadosCorretos:Boolean;
    function Gravar_Empresa:Boolean;
    procedure PesquisaMunicipio;
    procedure Preencher_Campos_da_Tela;
    procedure PrepararCamposdaTela;
  public
    { Public declarations }
  end;

var
  frm_cad_empresa_T3: Tfrm_cad_empresa_T3;

  vAssinatura,
  vLogoMarca        : String;

implementation

uses
   Dados,
   funcoes,
   ValidadorDeDocumentos,
   reg_tributario_T4,
   U_Municipio_T5,

   config_certificado, config_email,
   config_nfe, config_mde, config_nfs,
   email_arquivos_fiscais,
   integracao_outros_bancos, config_mdfe, cad_bairro,
   cad_regiao, cad_zona;

{$R *.dfm}

procedure Tfrm_cad_empresa_T3.BTNbase_dadosClick(Sender: TObject);
begin
    frm_intagracao_outras_base_dados := Tfrm_intagracao_outras_base_dados.Create(nil);
    frm_intagracao_outras_base_dados.showmodal;
end;

procedure Tfrm_cad_empresa_T3.BtnCertificadoClick(Sender: TObject);
begin
    frm_config_certificado := Tfrm_config_certificado.Create(nil);
    frm_config_certificado.showmodal;
end;

procedure Tfrm_cad_empresa_T3.BtnEmailClick(Sender: TObject);
begin
    frm_config_email := Tfrm_config_email.Create(nil);
    frm_config_email.showmodal;
end;

procedure Tfrm_cad_empresa_T3.BtnGravarClick(Sender: TObject);
begin
     if not DadosCorretos then
        exit;

     if not Gravar_Empresa then
        exit;

     Close;
end;

procedure Tfrm_cad_empresa_T3.BtnMDEClick(Sender: TObject);
begin
    Frm_Conf_mde := TFrm_Conf_mde.Create(nil);
    Frm_Conf_mde.showmodal;
end;

procedure Tfrm_cad_empresa_T3.BtnNFCEClick(Sender: TObject);
begin
    Frm_Conf_Nfce := TFrm_Conf_Nfce.Create(nil);
    Frm_Conf_Nfce.showmodal;
end;

procedure Tfrm_cad_empresa_T3.BtnNFEClick(Sender: TObject);
begin
    Frmconfig_NFe := TFrmconfig_NFe.Create(nil);
    Frmconfig_NFe.showmodal;
end;

procedure Tfrm_cad_empresa_T3.BtnNFSEClick(Sender: TObject);
begin
    frm_confi_nfs := Tfrm_confi_nfs.Create(nil);
    frm_confi_nfs.showmodal;
end;

procedure Tfrm_cad_empresa_T3.cxButton10Click(Sender: TObject);
begin
   PesquisaMunicipio;
end;

procedure Tfrm_cad_empresa_T3.PesquisaMunicipio;
begin
    Frm_Municipio_T5 := TFrm_Municipio_T5.Create(nil);
    Frm_Municipio_T5.showmodal;
    edEnderecoMunicipioIBGE.TEXT := vFrm_Municipio;
    Frm_Municipio_T5.Free;
    edEnderecoMunicipioIBGE.SetFocus;
    edEnderecoMunicipioIBGEExit(nil);
end;

procedure Tfrm_cad_empresa_T3.cxButton11Click(Sender: TObject);
begin
    FRM_cad_zona := TFRM_cad_zona.Create(nil);
    FRM_cad_zona.showmodal;
end;

procedure Tfrm_cad_empresa_T3.cxButton1Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    TL_colab.visible := false;
    imgLogoMarca.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Arquivos\Imagens\') then
      forceDirectories(StringToOleStr(ExtractFilePath(Application.ExeName) + 'Arquivos\Imagens\'));
    vLogoMarca := ExtractFilePath(Application.ExeName) + 'Arquivos\Imagens\' + ExtractFileName(OpenPictureDialog1.FileName);
    imgLogoMarca.Picture.SaveToFile(vLogoMarca);
  end;
end;

procedure Tfrm_cad_empresa_T3.cxButton2Click(Sender: TObject);
begin
  //DeleteFile(vLogoMarca);
  imgLogoMarca.Picture := nil;
  TL_colab.Show;
end;

procedure Tfrm_cad_empresa_T3.cxButton3Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    TL_colab.visible := false;
    imgAssinatura.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Arquivos\Imagens\') then
      forceDirectories(StringToOleStr(ExtractFilePath(Application.ExeName) + 'Arquivos\Imagens\'));
    vAssinatura := ExtractFilePath(Application.ExeName) + 'Arquivos\Imagens\' + ExtractFileName(OpenPictureDialog1.FileName);
    imgAssinatura.Picture.SaveToFile(vAssinatura);
  end;
end;

procedure Tfrm_cad_empresa_T3.cxButton4Click(Sender: TObject);
begin
    frm_config_email_fiscais := Tfrm_config_email_fiscais.Create(nil);
    frm_config_email_fiscais.showmodal;
end;

procedure Tfrm_cad_empresa_T3.cxButton5Click(Sender: TObject);
begin
    frm_cad_bairro := Tfrm_cad_bairro.Create(nil);
    frm_cad_bairro.showmodal;
end;

procedure Tfrm_cad_empresa_T3.cxButton6Click(Sender: TObject);
begin
    frm_reg_tributario_T4 := Tfrm_reg_tributario_T4.Create(nil);
    frm_reg_tributario_T4.showmodal;
    frm_reg_tributario_T4.Free;
end;

procedure Tfrm_cad_empresa_T3.cxButton7Click(Sender: TObject);
begin
  //DeleteFile(vAssinatura);
  imgAssinatura.Picture := nil;
  TL_colab.Show;
end;

procedure Tfrm_cad_empresa_T3.cxButton8Click(Sender: TObject);
begin
    Frm_config_MDFe := TFrm_config_MDFe.Create(nil);
    Frm_config_MDFe.showmodal;
end;

procedure Tfrm_cad_empresa_T3.cxButton9Click(Sender: TObject);
begin
    Frm_regiao := TFrm_regiao.Create(nil);
    Frm_regiao.showmodal;
end;

function Tfrm_cad_empresa_T3.DadosCorretos: Boolean;
begin
   result := false;

   if NaoPreencheuCamposObrigatoriosOuImportantes(frm_cad_empresa_T3) then
      exit;

   if not frmValidadorDeDocumentos.CNPJ_Valido(edCNPJ.Text) then
   begin
      edCNPJ.SetFocus;
      exit;
   end;
   edCNPJ.Text := vVDD_DocumentoFormatado;
   {
   edInscricaoEstadual.Text :=Trim(edInscricaoEstadual.Text);
   if not frmValidadorDeDocumentos.IE_Valida(edInscricaoEstadual.Text,edEnderecoUF.Text) then
   begin
      edInscricaoEstadual.SetFocus;
      exit;
   end;
   edInscricaoEstadual.Text := vVDD_DocumentoFormatado;
   }

   if not frmValidadorDeDocumentos.SUFRAMA_Valido(edSUFRAMA.Text) then
   begin
      edSUFRAMA.SetFocus;
      exit;
   end;
   edSUFRAMA.Text := vVDD_DocumentoFormatado;

   if not frmValidadorDeDocumentos.CNPJ_Valido(edContadorCNPJ.Text) then
   begin
      edContadorCNPJ.SetFocus;
      exit;
   end;
   edContadorCNPJ.Text := vVDD_DocumentoFormatado;

   {if edPISAliquota.Text = '' then
      edPISAliquota.Text := '0'
   else
      if not PercentualValido(edPISAliquota.Text) then
         exit;
   if edCOFINSAliquota.Text = '' then
      edCOFINSAliquota.Text := '0'
   else
      if not PercentualValido(edCOFINSAliquota.Text) then
         exit;
   if edISSAliquota.Text = '' then
      edISSAliquota.Text := '0'
   else
      if not PercentualValido(edISSAliquota.Text) then
         exit;
   }
   result := true;
end;

procedure Tfrm_cad_empresa_T3.edCelularExit(Sender: TObject);
begin
   edCelular.text := frmValidadorDeDocumentos.formataTelCel(edCelular.text);
end;

procedure Tfrm_cad_empresa_T3.edCNPJExit(Sender: TObject);
begin
   if edCNPJ.Text = '' then
      exit;
   edCNPJ.Text :=Trim(edCNPJ.Text);
   if not frmValidadorDeDocumentos.CNPJ_Valido(edCNPJ.Text) then
   begin
      edCNPJ.SetFocus;
      exit;
   end;
   edCNPJ.Text := vVDD_DocumentoFormatado;
end;

procedure Tfrm_cad_empresa_T3.edCNPJKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_empresa_T3.edCOFINSAliquotaExit(Sender: TObject);
var valor : Real;
begin
    {//WANDER_REGIMETRIBUTARIO
    try
      if edCOFINSAliquota.Text = '' then
         edCOFINSAliquota.Text := '0';
      valor := StrToFloat(MascToStr(edCOFINSAliquota.Text));
      edCOFINSAliquota.Text := FormatFloat('#,##0.00',valor);
      if (valor < 0)
      or (valor >=100) then
      begin
        ShowMessage('Valor inválido');
        edCOFINSAliquota.SetFocus;
      end;
    Except
      ShowMessage('Valor inválido');
      edCOFINSAliquota.SetFocus;
    end;
    }
end;

procedure Tfrm_cad_empresa_T3.edContadorCelular1Exit(Sender: TObject);
begin
    edContadorCelular1.text := frmValidadorDeDocumentos.formataTelCel(edContadorCelular1.text);
end;

procedure Tfrm_cad_empresa_T3.edContadorCelular2Exit(Sender: TObject);
begin
    edContadorCelular2.text := frmValidadorDeDocumentos.formataTelCel(edContadorCelular2.text);
end;

procedure Tfrm_cad_empresa_T3.edContadorCNPJExit(Sender: TObject);
begin
   if edContadorCNPJ.Text = '' then
      exit;
   edContadorCNPJ.Text :=Trim(edContadorCNPJ.Text);
   if not frmValidadorDeDocumentos.CNPJ_Valido(edContadorCNPJ.Text) then
   begin
      edContadorCNPJ.SetFocus;
      exit;
   end;
   edContadorCNPJ.Text := vVDD_DocumentoFormatado;
end;

procedure Tfrm_cad_empresa_T3.edContadorCPFExit(Sender: TObject);
begin
   if edContadorCPF.Text = '' then
      exit;
   edContadorCPF.Text :=Trim(edContadorCPF.Text);
   if not frmValidadorDeDocumentos.CPF_Valido(edContadorCPF.Text) then
   begin
      edContadorCPF.SetFocus;
      exit;
   end;
   edContadorCPF.Text := vVDD_DocumentoFormatado;
end;

procedure Tfrm_cad_empresa_T3.edContadorEmailExit(Sender: TObject);
begin
   if edContadorEmail.Text = '' then
      exit;
   if not frmValidadorDeDocumentos.Email_Valido(edContadorEmail.Text) then
   begin
      edContadorEmail.SetFocus;
      exit;
   end;
   edContadorEmail.Text := vVDD_DocumentoFormatado;
end;

procedure Tfrm_cad_empresa_T3.edContadorTelefone1Exit(Sender: TObject);
begin
   edContadorTelefone1.text := frmValidadorDeDocumentos.formataTelCel(edContadorTelefone1.text);
end;

procedure Tfrm_cad_empresa_T3.edContadorTeleFone2Exit(Sender: TObject);
begin
   edContadorTelefone2.text := frmValidadorDeDocumentos.formataTelCel(edContadorTelefone2.text);
end;

procedure Tfrm_cad_empresa_T3.edDataCadastroExit(Sender: TObject);
begin
   if DataNoFuturo(edDataCadastro.Text) then
   begin
      edDataCadastro.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_empresa_T3.edDataInicioAtividadesExit(Sender: TObject);
begin
   if DataNoFuturo(edDataInicioAtividades.Text) then
   begin
      edDataInicioAtividades.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_empresa_T3.edEmailExit(Sender: TObject);
begin
   if edEmail.Text = '' then
      exit;
   if not frmValidadorDeDocumentos.Email_Valido(edEmail.Text) then
   begin
      edEmail.SetFocus;
      exit;
   end;
   edEmail.Text := vVDD_DocumentoFormatado;
end;

procedure Tfrm_cad_empresa_T3.edEnderecoCEPExit(Sender: TObject);
begin
   if edEnderecoCEP.Text = '' then
      exit;
   if not frmValidadorDeDocumentos.CEP_Valido(edEnderecoCEP.Text) then
   begin
      edEnderecoCEP.SetFocus;
      exit;
   end;
   edEnderecoCEP.Text := vVDD_DocumentoFormatado;
end;

procedure Tfrm_cad_empresa_T3.edEnderecoMunicipioIBGEExit(Sender: TObject);
begin
  if cxButton10.Focused then
     exit;
  edEnderecoMunicipioIBGE.Text := Trim(edEnderecoMunicipioIBGE.Text);
  edEnderecoMunicipio.text     := '';
  edEnderecoUF.text            := '';
  edEnderecoUFIBGE.text        := '';

  if edEnderecoMunicipioIBGE.text = '' then
     exit;

  dm.Query1.Close;
  dm.Query1.Sql.Clear;
  dm.Query1.Sql.Add('SELECT *                  ');
  dm.Query1.Sql.Add('  FROM CIDADE_CID,        ');
  dm.Query1.Sql.Add('       UF_UF              ');
  dm.Query1.Sql.Add(' WHERE UF_CODIGO  = CID_UF');
  dm.Query1.Sql.Add('   AND CID_CODIGO = :COD  ');
  dm.Query1.ParamByName('COD').AsString := edEnderecoMunicipioIBGE.Text;
  dm.Query1.Open;
  if dm.Query1.Eof Then
  Begin
     ShowMessage('Município inexistente...');
     edEnderecoMunicipioIBGE.SetFocus;
     Exit;
  End;
  edEnderecoMunicipio.Text  := dm.Query1.FieldByName('CID_NOME').AsString;
  edEnderecoUFIBGE.text     := dm.Query1.FieldByName('CID_UF'  ).AsString;
  edEnderecoUF.text         := dm.Query1.FieldByName('UF_SIGLA').AsString;
  //WANDER_REGIMETRIBUTARIO
  //cbContribuinteIPI.SetFocus;
end;

procedure Tfrm_cad_empresa_T3.edEnderecoMunicipioIBGEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f1 Then
      PesquisaMunicipio;
end;

procedure Tfrm_cad_empresa_T3.edInscricaoEstadualExit(Sender: TObject);
begin
{   if edInscricaoEstadual.Text = '' then
      exit;
   edInscricaoEstadual.Text :=Trim(edInscricaoEstadual.Text);
   if not frmValidadorDeDocumentos.IE_Valida(edInscricaoEstadual.Text,edEnderecoUF.Text) then
   begin
      edInscricaoEstadual.SetFocus;
      exit;
   end;
   edInscricaoEstadual.Text := vVDD_DocumentoFormatado;
}
end;

procedure Tfrm_cad_empresa_T3.edISSAliquotaExit(Sender: TObject);
var valor : Real;
begin
    //WANDER_REGIMETRIBUTARIO
    {
    try
      if edISSAliquota.Text = '' then
         edISSAliquota.Text := '0';
      valor := StrToFloat(MascToStr(edISSAliquota.Text));
      edISSAliquota.Text := FormatFloat('#,##0.00',valor);
      if (valor < 0)
      or (valor >=100) then
      begin
        ShowMessage('Valor inválido');
        edISSAliquota.SetFocus;
      end;
    Except
      ShowMessage('Valor inválido');
      edISSAliquota.SetFocus;
    end;
    }
end;

procedure Tfrm_cad_empresa_T3.edPISAliquotaExit(Sender: TObject);
var valor : Real;
begin
    //WANDER_REGIMETRIBUTARIO
    {
    try
      if edPISAliquota.Text = '' then
         edPISAliquota.Text := '0';
      valor := StrToFloat(MascToStr(edPISAliquota.Text));
      edPISAliquota.Text := FormatFloat('#,##0.00',valor);
      if (valor < 0)
      or (valor >=100) then
      begin
        ShowMessage('Valor inválido');
        edPISAliquota.SetFocus;
      end;
    Except
      ShowMessage('Valor inválido');
      edPISAliquota.SetFocus;
    end;
    }
end;

procedure Tfrm_cad_empresa_T3.edPISAliquotaKeyPress(Sender: TObject;
  var Key: Char);
begin
     key := SoValor(key);
end;

procedure Tfrm_cad_empresa_T3.edRazaoSocialExit(Sender: TObject);
begin
   if Sender is TEdit then
   begin
      (Sender as TEdit).Text := Trim((Sender as TEdit).Text);
   end;
end;

procedure Tfrm_cad_empresa_T3.edResponsavelEmailExit(Sender: TObject);
begin
   if edResponsavelEmail.Text = '' then
      exit;
   if not frmValidadorDeDocumentos.Email_Valido(edResponsavelEmail.Text) then
   begin
      edResponsavelEmail.SetFocus;
      exit;
   end;
   edResponsavelEmail.Text := vVDD_DocumentoFormatado;
end;

procedure Tfrm_cad_empresa_T3.edResponsavelNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key := SoLetra(key);
end;

procedure Tfrm_cad_empresa_T3.edResponsavelWhatsAppExit(Sender: TObject);
begin
    edResponsavelWhatsApp.text := frmValidadorDeDocumentos.formataTelCel(edResponsavelWhatsApp.text);
end;

procedure Tfrm_cad_empresa_T3.edResponsavelCelularExit(Sender: TObject);
begin
   edResponsavelCelular.text := frmValidadorDeDocumentos.formataTelCel(edResponsavelCelular.text);
end;

procedure Tfrm_cad_empresa_T3.edSUFRAMAExit(Sender: TObject);
begin
   if edSUFRAMA.Text = '' then
      exit;
   edSUFRAMA.Text :=Trim(edSUFRAMA.Text);
   if not frmValidadorDeDocumentos.SUFRAMA_Valido(edSUFRAMA.Text) then
   begin
      edSUFRAMA.SetFocus;
      exit;
   end;
   edCNPJ.Text := vVDD_DocumentoFormatado;
end;

procedure Tfrm_cad_empresa_T3.edTelefoneExit(Sender: TObject);
begin
   edTelefone.text := frmValidadorDeDocumentos.formataTelCel(edTelefone.text);
end;

procedure Tfrm_cad_empresa_T3.edWhatsAppExit(Sender: TObject);
begin
    edWhatsApp.text := frmValidadorDeDocumentos.formataTelCel(edWhatsApp.text);
end;

procedure Tfrm_cad_empresa_T3.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
        exit;
     end;
    // key := fSemAcentos(key);
end;

procedure Tfrm_cad_empresa_T3.FormShow(Sender: TObject);
begin
   InicioPadraoDeTodasAsTelasDoSistema;
   PrepararCamposdaTela;
   Preencher_Campos_da_Tela;
   edRazaoSocial.SetFocus;
end;

function Tfrm_cad_empresa_T3.Gravar_Empresa:Boolean;
begin
    Result := False;
    try
        Empresa.PessoaJuridica              := True;
        Empresa.NomeFantasia                := edNomeFantasia.Text;
        Empresa.RazaoSocial                 := edRazaoSocial.Text;
        Empresa.DataInicioAtividades        := StrToDate(edDataInicioAtividades.text);
        Empresa.InscricaoEstadual           := edInscricaoEstadual.Text;
        Empresa.SUFRAMA                     := edSUFRAMA.Text;
        Empresa.CNAE                        := edCNAE.Text;
        Empresa.CNPJ                        := edCNPJ.Text;
        Empresa.InscricaoMunicipal          := edInscricaoMunicipal.Text;
        Empresa.NIRE                        := edNIRE.Text;
        Empresa.EnderecoRua                 := edEnderecoRua.Text;
        Empresa.EnderecoCEP                 := edEnderecoCEP.Text;
        Empresa.EnderecoNumero              := edEnderecoNumero.Text;
        Empresa.EnderecoBairro              := edEnderecoBairro.Text;
        Empresa.EnderecoComplemento         := edEnderecoComplemento.Text;
        Empresa.EnderecoMunicipio           := edEnderecoMunicipio.Text;
        Empresa.EnderecoMunicipioIBGE       := edEnderecoMunicipioIBGE.Text;
        Empresa.EnderecoUF                  := edEnderecoUF.Text;
        Empresa.EnderecoUFIBGE              := edEnderecoUFIBGE.Text;
        Empresa.Telefone                    := edTelefone.Text;
        Empresa.Celular                     := edCelular.Text;
        Empresa.WhatsApp                    := edWhatsApp.Text;
        Empresa.Email                       := edEmail.Text;
        //WANDER_REGIMETRIBUTARIO
        //Empresa.ContribuinteIPI             := cbContribuinteIPI.Checked;
        //Empresa.TratarICMS_Diferimento      := cbTratarICMS_Diferimento.Checked;
        Empresa.ResponsavelNome             := edResponsavelNome.Text;
        Empresa.ResponsavelWhatsApp         := edResponsavelWhatsApp.Text;
        Empresa.ResponsavelCelular          := edResponsavelCelular.Text;
        Empresa.ResponsavelEmail            := edResponsavelEmail.Text;
        Empresa.ContadorEmpresa             := edContadorEmpresa.Text;
        Empresa.ContadorResponsavel         := edContadorResponsavel.Text;
        Empresa.ContadorCNPJ                := edContadorCNPJ.Text;
        Empresa.ContadorCPF                 := edContadorCPF.Text;
        Empresa.ContadorTelefone1           := edContadorTelefone1.Text;
        Empresa.ContadorTelefone2           := edContadorTelefone2.Text;
        Empresa.ContadorCRC                 := edContadorCRC.Text;
        Empresa.ContadorCelular1            := edContadorCelular1.Text;
        Empresa.ContadorCelular2            := edContadorCelular2.Text;
        Empresa.ContadorEmail               := edContadorEmail.Text;
        Empresa.Logomarca                   := vLogoMarca;
        Empresa.Assinatura                  := vAssinatura;
        //Tributacao
        //----------------------------------------------------------------------
        //WANDER_REGIMETRIBUTARIO
        {
        Empresa.Tributacao.PIS.Cumulativo   :=(rgPISCumulativo.ItemIndex = 1);
        if edPISAliquota.Text = '' then
           edPISAliquota.Text := '0';
        Empresa.Tributacao.PIS.Aliquota     := StrToFloat(MascToStr(edPISAliquota.Text));

        Empresa.Tributacao.COFINS.Cumulativo:=(rgPISCumulativo.ItemIndex = 1);
        if edCOFINSAliquota.Text = '' then
           edCOFINSAliquota.Text := '0';
        Empresa.Tributacao.COFINS.Aliquota  := StrToFloat(MascToStr(edCOFINSAliquota.Text));

        if edISSAliquota.Text = '' then
           edISSAliquota.Text := '0';
        Empresa.Tributacao.ISS.Aliquota  := StrToFloat(MascToStr(edISSAliquota.Text));
        }
        // UNISYSTEM
        //----------------------------------------------------------------------
        if edDataCadastro.text <> '  /  /  ' then
           Empresa.DataCadastro                := StrToDate(edDataCadastro.text)
        else
           Empresa.DataCadastro := 0;
        Empresa.CodigoUniSystem             := edCodigoUniSystem.Text;


        result := Empresa.Gravar;
    Except

    end;
end;

procedure Tfrm_cad_empresa_T3.Preencher_Campos_da_Tela;
begin
   Limpar_os_campos_da_Tela(frm_cad_empresa_T3);

   Empresa.Abrir;

   edRazaoSocial.Text                 := Empresa.RazaoSocial;
   edNomeFantasia.Text                := Empresa.NomeFantasia;
   edDataInicioAtividades.Text        := Empresa.DataInicioAtividadesString;
   edInscricaoEstadual.Text           := Empresa.InscricaoEstadual;
   edSUFRAMA.Text                     := Empresa.SUFRAMA;
   edCNAE.Text                        := Empresa.CNAE;
   edCNPJ.Text                        := Empresa.CNPJ;
   edInscricaoMunicipal.Text          := Empresa.InscricaoMunicipal;
   edNIRE.Text                        := Empresa.NIRE;
   edEnderecoRua.Text                 := Empresa.EnderecoRua;
   edEnderecoCEP.Text                 := Empresa.EnderecoCEP;
   edEnderecoNumero.Text              := Empresa.EnderecoNumero;
   edEnderecoBairro.Text              := Empresa.EnderecoBairro;
   edEnderecoComplemento.Text         := Empresa.EnderecoComplemento;
   edEnderecoMunicipio.Text           := Empresa.EnderecoMunicipio;
   edEnderecoMunicipioIBGE.Text       := Empresa.EnderecoMunicipioIBGE;
   edEnderecoUF.Text                  := Empresa.EnderecoUF;
   edEnderecoUFIBGE.Text              := Empresa.EnderecoUFIBGE;
   edTelefone.Text                    := Empresa.Telefone;
   edCelular.Text                     := Empresa.Celular;
   edWhatsApp.Text                    := Empresa.WhatsApp;
   edEmail.Text                       := Empresa.Email;
   //WANDER_REGIMETRIBUTARIO
   //cbContribuinteIPI.Checked          := Empresa.ContribuinteIPI;
   //cbTratarICMS_Diferimento.Checked   := Empresa.TratarICMS_Diferimento;
   edResponsavelNome.Text             := Empresa.ResponsavelNome;
   edResponsavelWhatsApp.Text         := Empresa.ResponsavelWhatsApp;
   edResponsavelCelular.Text          := Empresa.ResponsavelCelular;
   edResponsavelEmail.Text            := Empresa.ResponsavelEmail;
   edContadorEmpresa.Text             := Empresa.ContadorEmpresa;
   edContadorResponsavel.Text         := Empresa.ContadorResponsavel;
   edContadorCNPJ.Text                := Empresa.ContadorCNPJ;
   edContadorCPF.Text                 := Empresa.ContadorCPF;
   edContadorTelefone1.Text           := Empresa.ContadorTelefone1;
   edContadorTelefone2.Text           := Empresa.ContadorTelefone2;
   edContadorCRC.Text                 := Empresa.ContadorCRC;
   edContadorCelular1.Text            := Empresa.ContadorCelular1;
   edContadorCelular2.Text            := Empresa.ContadorCelular2;
   edContadorEmail.Text               := Empresa.ContadorEmail;

   vLogoMarca                         := Empresa.Logomarca;
   if vLogoMarca <> '' then
    if FileExists(vLogoMarca, True) then
    begin
      imgLogoMarca.Picture.LoadFromFile(vLogoMarca);
      TL_colab.Hide;
    end;

   vAssinatura                        := Empresa.Assinatura;
   if vAssinatura <> '' then
    if FileExists(vAssinatura, True) then
    begin
      imgAssinatura.Picture.LoadFromFile(vAssinatura);
      TL_colab.Hide;
    end;

   //WANDER_REGIMETRIBUTARIO
   {
   rgPISCumulativo.ItemIndex          := f0ou1(Empresa.Tributacao.PIS.Cumulativo);
   edPISAliquota.Text                 := FormatFloat('#.00',Empresa.Tributacao.PIS.Aliquota);
   edCOFINSAliquota.Text              := FormatFloat('#.00',Empresa.Tributacao.COFINS.Aliquota);
   edISSAliquota.Text                 := FormatFloat('#.00',Empresa.Tributacao.ISS.Aliquota);
   }
   //
   edDataCadastro.Text                := Empresa.DataCadastroString;
   edCodigoUniSystem.Text             := Empresa.CodigoUniSystem;
//PASSO 9 :)

end;

procedure Tfrm_cad_empresa_T3.PrepararCamposdaTela;
begin

end;

end.
