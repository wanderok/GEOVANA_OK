unit cad_empresa_T3;

interface

uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, cxControls, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, cxCheckBox,
  cxButtons, config_nfce_T34, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
    bPesqBairro: TcxButton;
    bPesqMunicipio: TcxButton;
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
    cxButton6: TcxButton;
    Panel4: TPanel;
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
    procedure bPesqBairroClick(Sender: TObject);
    procedure bPesqMunicipioClick(Sender: TObject);
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
    procedure edEnderecoCEPExit(Sender: TObject);
    procedure edContadorCPFExit(Sender: TObject);
    procedure edDataInicioAtividadesExit(Sender: TObject);
    procedure edDataCadastroExit(Sender: TObject);
    procedure edTelefoneExit(Sender: TObject);
    procedure edWhatsAppExit(Sender: TObject);
    procedure edRazaoSocialKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function DadosCorretos:Boolean;
    function Gravar_Empresa:Boolean;
    procedure PesquisaMunicipio;
    procedure Preencher_Campos_da_Tela;
    procedure Preparar_Campos_da_Tela;
  public
    { Public declarations }
  end;

var
  frm_cad_empresa_T3: Tfrm_cad_empresa_T3;

  vAssinatura,
  vLogoMarca        : String;

implementation

uses
   DadosSMC,
   FuncoesSMC,
   ValidadorDeDocumentos,
   reg_tributario_T4,
   U_Municipio_T5,
   //cad_bairro_T8,
   cad_regiao_T11,
   cad_zona_T12,
   config_certificado_T33,
   config_integracao_lojas_T42,
   config_email,
   config_nfe_T32, config_mde, config_nfs,
   email_arquivos_fiscais,
   config_mdfe;


{$R *.dfm}

procedure Tfrm_cad_empresa_T3.BTNbase_dadosClick(Sender: TObject);
begin
    frm_config_integracao_lojas_T42 := Tfrm_config_integracao_lojas_T42.Create(nil);
    frm_config_integracao_lojas_T42.showmodal;
    frm_config_integracao_lojas_T42.Free;
end;

procedure Tfrm_cad_empresa_T3.BtnCertificadoClick(Sender: TObject);
begin
    frm_config_certificado_T33 := Tfrm_config_certificado_T33.Create(nil);
    frm_config_certificado_T33.showmodal;
    frm_config_certificado_T33.Free;
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
    Frm_config_nfce_T34 := TFrm_config_nfce_T34.Create(nil);
    Frm_config_nfce_T34.showmodal;
    Frm_config_nfce_T34.Free;
end;

procedure Tfrm_cad_empresa_T3.BtnNFEClick(Sender: TObject);
begin
    FrmConfig_nfe_T32 := TFrmConfig_nfe_T32.Create(nil);
    FrmConfig_nfe_T32.showmodal;
    FrmConfig_nfe_T32.Free;
end;

procedure Tfrm_cad_empresa_T3.BtnNFSEClick(Sender: TObject);
begin
    frm_confi_nfs := Tfrm_confi_nfs.Create(nil);
    frm_confi_nfs.showmodal;
end;

procedure Tfrm_cad_empresa_T3.bPesqMunicipioClick(Sender: TObject);
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
    FRM_cad_zona_T12 := TFRM_cad_zona_T12.Create(nil);
    FRM_cad_zona_T12.showmodal;
    FRM_cad_zona_T12.Free;
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
  vLogoMarca := '';
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

procedure Tfrm_cad_empresa_T3.bPesqBairroClick(Sender: TObject);
begin
    {frm_cad_bairro_T8 := Tfrm_cad_bairro_T8.Create(nil);
    frm_cad_bairro_T8.showmodal;
    frm_cad_bairro_T8.Free;}
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
  vAssinatura := '';
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
    frm_cad_regiao_T11 := Tfrm_cad_regiao_T11.Create(nil);
    frm_cad_regiao_T11.showmodal;
    frm_cad_regiao_T11.Free;
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

procedure Tfrm_cad_empresa_T3.edCNPJExit(Sender: TObject);
begin
   if not fCNPJValido((Sender as TEdit)) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;
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
        ShowMessage('Valor inv�lido');
        edCOFINSAliquota.SetFocus;
      end;
    Except
      ShowMessage('Valor inv�lido');
      edCOFINSAliquota.SetFocus;
    end;
    }
end;

procedure Tfrm_cad_empresa_T3.edContadorCNPJExit(Sender: TObject);
begin
   if not fCNPJValido((Sender as TEdit)) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_empresa_T3.edContadorCPFExit(Sender: TObject);
begin
   if not fCPFValido((Sender as TEdit)) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_empresa_T3.edDataCadastroExit(Sender: TObject);
begin
   if DataNoFuturo((Sender as TMaskEdit)) then
   begin
      (Sender as TMaskEdit).SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_empresa_T3.edDataInicioAtividadesExit(Sender: TObject);
begin
   if DataNoFuturo((Sender as TMaskEdit)) then
   begin
      (Sender as TMaskEdit).SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_empresa_T3.edEmailExit(Sender: TObject);
begin
   if (sender as TEdit).Text = '' then
      exit;
   if not frmValidadorDeDocumentos.Email_Valido((sender as TEdit).Text) then
   begin
      (sender as TEdit).SetFocus;
      exit;
   end;
   (sender as TEdit).Text := vVDD_DocumentoFormatado;
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
  if bPesqMunicipio.Focused then
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
     ShowMessage('Munic�pio inexistente...');
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
   if edInscricaoEstadual.Text = '' then
      exit;
   edInscricaoEstadual.Text :=Trim(edInscricaoEstadual.Text);
   if not frmValidadorDeDocumentos.IE_Valida(edInscricaoEstadual.Text,edEnderecoUF.Text) then
   begin
      edInscricaoEstadual.SetFocus;
      exit;
   end;
   edInscricaoEstadual.Text := vVDD_DocumentoFormatado;
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
        ShowMessage('Valor inv�lido');
        edISSAliquota.SetFocus;
      end;
    Except
      ShowMessage('Valor inv�lido');
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
        ShowMessage('Valor inv�lido');
        edPISAliquota.SetFocus;
      end;
    Except
      ShowMessage('Valor inv�lido');
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
      (Sender as TEdit).Text := fSemAcentos(Trim((Sender as TEdit).Text));
   end;
end;

procedure Tfrm_cad_empresa_T3.edRazaoSocialKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := fSemAcentos(key);
end;

procedure Tfrm_cad_empresa_T3.edResponsavelNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key := SoLetra(key);
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
   if not TelValido((Sender as TEdit)) then
      (Sender as TEdit).SetFocus;
end;

procedure Tfrm_cad_empresa_T3.edWhatsAppExit(Sender: TObject);
begin
   if not TelValido((Sender as TEdit)) then
      (Sender as TEdit).SetFocus;
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
   Inicio_Padrao_De_Todas_As_Telas_Do_Sistema;
   Preparar_Campos_da_Tela;
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

   if not fTemAcesso('CONEMPRESA') then
      exit;


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

procedure Tfrm_cad_empresa_T3.Preparar_Campos_da_Tela;
begin
//
end;

end.
