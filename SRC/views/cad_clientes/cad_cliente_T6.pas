
{ v 13.10.20 09:30am }
unit cad_cliente_T6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxLabel,
  cxTextEdit, cxContainer, Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Mask, cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.DBCtrls, Vcl.StdCtrls,
  cxButtons, cxMaskEdit, cxCheckBox, dxGDIPlusClasses, Vcl.ExtCtrls, cxGroupBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxPC, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxSkinsCore, dxSkinscxPCPainter, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue,

  Classe_Cliente;

type
  Tfrm_cad_cliente_T6 = class(TForm)
    gpData: TGroupBox;
    Label13: TLabel;
    lbInativo: TLabel;
    Label14: TLabel;
    btDetalhesBloqueio: TcxButton;
    edDataCadastro: TMaskEdit;
    edDataBloqueio: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label16: TLabel;
    Label10: TLabel;
    edCodigo: TEdit;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    edUSU: TEdit;
    edDT: TMaskEdit;
    edHR: TEdit;
    edEstacao: TMaskEdit;
    bHistoricoAlteracoes: TcxButton;
    pgControlPessoa: TPageControl;
    tsPessoaFisica: TTabSheet;
    Label25: TLabel;
    Label6: TLabel;
    Label30: TLabel;
    Label28: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    edRG: TEdit;
    edRG_OrgaoEmissor: TEdit;
    edNOME: TEdit;
    edCPF: TMaskEdit;
    edDataNascimento: TMaskEdit;
    cbSexo: TComboBox;
    edRG_DataEmissao: TMaskEdit;
    tsPessoaJuridica: TTabSheet;
    lbl3: TLabel;
    lbl7: TLabel;
    lbl4: TLabel;
    lbl2: TLabel;
    edCNPJ: TMaskEdit;
    edNomeFantasia: TEdit;
    edRazaoSocial: TEdit;
    edIE: TEdit;
    cxButton1: TcxButton;
    grpEndereco: TGroupBox;
    Label22: TLabel;
    Label9: TLabel;
    Label26: TLabel;
    bPesqBairro: TcxButton;
    bPesqCEP: TcxButton;
    cxButton4: TcxButton;
    bPesqMunicipio: TcxButton;
    bPesqZona: TcxButton;
    cxButton8: TcxButton;
    cxButton21: TcxButton;
    cxButton28: TcxButton;
    GroupBox3: TGroupBox;
    GroupBox8: TGroupBox;
    edFone1: TEdit;
    edCel: TEdit;
    edWhatsApp: TEdit;
    edEmail1: TEdit;
    edFone2: TEdit;
    edNomeContato: TEdit;
    edEmail2: TEdit;
    rgStatus: TRadioGroup;
    Label3: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    lbNomeDaTela: TLabel;
    edRua: TEdit;
    edCEP: TEdit;
    edNumero: TEdit;
    edBairro: TEdit;
    edBairroDescricao: TEdit;
    edComplemento: TEdit;
    edEnderecoMunicipioIBGE: TEdit;
    edEnderecoMunicipio: TEdit;
    edEnderecoUF: TEdit;
    edEnderecoUFIBGE: TEdit;
    edZona: TEdit;
    edZonaDescricao: TEdit;
    edRegiao: TEdit;
    edRegiaoDescricao: TEdit;
    Label1: TLabel;
    edAtividadeCodigo: TEdit;
    bPesqRamoAtividade: TcxButton;
    edAtividadeCodigoNome: TEdit;
    procedure bPesqZonaClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure bPesqBairroClick(Sender: TObject);
    procedure bPesqRamoAtividadeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Inicio;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCodigoExit(Sender: TObject);
    procedure Preencher_Campos_da_Tela;
    procedure Preencher_Dados_Pessoa;
    procedure Preencher_Dados_Pessoa_Fisica;
    procedure Preencher_Dados_Pessoa_Juridica;
    procedure Preencher_Endereco;
    procedure Preencher_Contato;
    procedure Preencher_Historicos;
    procedure Preparar_Campos_da_Tela;
    procedure cxButton21Click(Sender: TObject);
    function DadosCorretos:Boolean;
    function Gravar_Cliente:Boolean;
    procedure Pesquisar;
    procedure Consultar;
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton28Click(Sender: TObject);
    function  fTipoPessoa_JF:String;
    function  fPreencheu_Algum_Campo_Pessoa_Juridica:Boolean;
    function  fPreencheu_Algum_Campo_Pessoa_Fisica:Boolean;
    function  fPessoaFisica:Boolean;
    function  fPessoaJuridica:Boolean;
    procedure edCPFExit(Sender: TObject);
    procedure edCNPJExit(Sender: TObject);
    procedure bPesqMunicipioClick(Sender: TObject);
    procedure PesquisaMunicipio;
    procedure PesquisaAtividade;
    procedure PesquisaBairro;
    procedure TrazerAtividade;
    procedure edEnderecoMunicipioIBGEExit(Sender: TObject);
    procedure edAtividadeCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAtividadeCodigoExit(Sender: TObject);
    procedure edCEPExit(Sender: TObject);
    procedure edCEPKeyPress(Sender: TObject; var Key: Char);
    procedure edCPFKeyPress(Sender: TObject; var Key: Char);
    procedure edRGKeyPress(Sender: TObject; var Key: Char);
    procedure edCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure edIEKeyPress(Sender: TObject; var Key: Char);
    procedure edFone2KeyPress(Sender: TObject; var Key: Char);
    procedure edCelKeyPress(Sender: TObject; var Key: Char);
    procedure edWhatsAppKeyPress(Sender: TObject; var Key: Char);
    procedure edBairroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edBairroExit(Sender: TObject);
    procedure edNOMEExit(Sender: TObject);
    procedure RecuperaMunicipio;
    procedure PesquisaRegiao;
    procedure PesquisaZona;
    procedure edRegiaoExit(Sender: TObject);
    procedure edZonaExit(Sender: TObject);
    procedure edNOMEKeyPress(Sender: TObject; var Key: Char);
    procedure edFone1Exit(Sender: TObject);
    procedure edRG_DataEmissaoExit(Sender: TObject);
    procedure edDataNascimentoExit(Sender: TObject);
    procedure edEmail1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    { Public declarations }
  end;

var
  frm_cad_cliente_T6: Tfrm_cad_cliente_T6;
  Cliente           : TCliente;

implementation

uses
  Funcoes,
  TiposDeDados,
  ValidadorDeDocumentos,
  U_Municipio_T5,
  consulta_T7,
  cad_bairro_T8,
  cad_ramo_atividade_T9,
  cad_regiao_T11,
  cad_zona_T12,
  Dados;

{$R *.dfm}

procedure Tfrm_cad_cliente_T6.cxButton21Click(Sender: TObject);
begin
   if not DadosCorretos then
      exit;

   if not Gravar_Cliente then
     exit;

   Cliente.Free;
   Inicio;
end;

procedure Tfrm_cad_cliente_T6.cxButton28Click(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_cad_cliente_T6.bPesqMunicipioClick(Sender: TObject);
begin
   PesquisaMunicipio;
end;

procedure Tfrm_cad_cliente_T6.bPesqRamoAtividadeClick(Sender: TObject);
begin
   PesquisaAtividade;
end;

procedure Tfrm_cad_cliente_T6.cxButton4Click(Sender: TObject);
begin
    PesquisaRegiao;
end;

procedure Tfrm_cad_cliente_T6.PesquisaRegiao;
Begin
    frm_cad_regiao_T11 := Tfrm_cad_regiao_T11.Create(nil);
    frm_cad_regiao_T11.showmodal;
    edRegiao.Text := vfrm_cad_regiao;
    frm_cad_regiao_T11.Free;
    edRegiao.SetFocus;
    edRegiaoExit(nil);
end;

procedure Tfrm_cad_cliente_T6.PesquisaZona;
begin
    frm_cad_zona_T12 := Tfrm_cad_zona_T12.Create(nil);
    frm_cad_zona_T12.showmodal;
    edZona.Text := vfrm_cad_zona;
    frm_cad_zona_T12.Free;
    edZona.SetFocus;
    edZonaExit(nil);
end;

procedure Tfrm_cad_cliente_T6.bPesqBairroClick(Sender: TObject);
begin
    PesquisaBairro;
end;

procedure Tfrm_cad_cliente_T6.bPesqZonaClick(Sender: TObject);
begin
   PesquisaZona;
end;

procedure Tfrm_cad_cliente_T6.Consultar;
begin
    frm_consulta_T7 := Tfrm_consulta_T7.Create(nil);
    frm_consulta_T7.rgConsultar.itemindex := 0; //Cliente
    frm_consulta_T7.showmodal;
    edCodigo.Text:= vfrm_consulta_T7_Codigo;
    frm_consulta_T7.Free;
    Pesquisar;
end;

function Tfrm_cad_cliente_T6.DadosCorretos: Boolean;
const Campo_Obrigatorio     = 100;
      Campo_Nao_Obrigatorio =   0;
begin
   result := false;

   if fTipoPessoa_JF = '' then
      exit;

   if fPessoaFisica then
   begin
      // PESSOA FÍSICA
      pgControlPessoa.ActivePage := tsPessoaFisica;
      edNOME.Tag                 := Campo_Obrigatorio;
      edCPF.Tag                  := Campo_Obrigatorio;
      edRG.Tag                   := Campo_Obrigatorio;
      edRG_OrgaoEmissor.Tag      := Campo_Obrigatorio;
      //
      edRazaoSocial.Tag          := Campo_Nao_Obrigatorio;
      edNomeFantasia.Tag         := Campo_Nao_Obrigatorio;
      edCNPJ.Tag                 := Campo_Nao_Obrigatorio;
      edIE.Tag                   := Campo_Nao_Obrigatorio;
   end
   else
   begin
      // PESSOA JURÍDICA
      pgControlPessoa.ActivePage := tsPessoaJuridica;
      edNOME.Tag                 := Campo_Nao_Obrigatorio;
      edCPF.Tag                  := Campo_Nao_Obrigatorio;
      edRG.Tag                   := Campo_Nao_Obrigatorio;
      edRG_OrgaoEmissor.Tag      := Campo_Nao_Obrigatorio;
      //
      edRazaoSocial.Tag          := Campo_Obrigatorio;
      edNomeFantasia.Tag         := Campo_Obrigatorio;
      edCNPJ.Tag                 := Campo_Obrigatorio;
      edIE.Tag                   := Campo_Obrigatorio;
   end;

   if NaoPreencheuCamposObrigatoriosOuImportantes(frm_cad_cliente_T6) then
      exit;

   result := true;
end;

procedure Tfrm_cad_cliente_T6.edAtividadeCodigoExit(Sender: TObject);
begin
  TrazerAtividade;
end;

procedure Tfrm_cad_cliente_T6.edAtividadeCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f1 Then
      PesquisaMunicipio;
end;

procedure Tfrm_cad_cliente_T6.edBairroExit(Sender: TObject);
begin
   if not SelectBairro(edBairro.Text,edBairroDescricao) then
   begin
      edBairro.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_cliente_T6.edBairroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f1 Then
      PesquisaBairro;
end;

procedure Tfrm_cad_cliente_T6.edCEPExit(Sender: TObject);
begin
   if edCEP.Text = '' then
      exit;
   if not frmValidadorDeDocumentos.CEP_Valido(edCEP.Text) then
   begin
      edCEP.SetFocus;
      exit;
   end;
   edCEP.Text := vVDD_DocumentoFormatado;
end;

procedure Tfrm_cad_cliente_T6.edCEPKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_cliente_T6.edCNPJExit(Sender: TObject);
begin
   if not CNPJValido((Sender as TEdit)) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_cliente_T6.edCNPJKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_cliente_T6.edCodigoExit(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_cad_cliente_T6.edCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_F1 then
     Consultar;
end;

procedure Tfrm_cad_cliente_T6.edCPFExit(Sender: TObject);
begin
   if not CPFValido((Sender as TEdit)) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_cliente_T6.edCPFKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_cliente_T6.edDataNascimentoExit(Sender: TObject);
begin
   if DataNoFuturo((Sender as TEdit).Text) then
      (Sender as TEdit).SetFocus;

end;

procedure Tfrm_cad_cliente_T6.edEmail1Exit(Sender: TObject);
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

procedure Tfrm_cad_cliente_T6.edEnderecoMunicipioIBGEExit(Sender: TObject);
begin
  RecuperaMunicipio;
end;

procedure Tfrm_cad_cliente_T6.RecuperaMunicipio;
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
  dm.Query1.ParamByName('COD').AsString := edEnderecoMunicipioIBGE.text;
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
end;

procedure Tfrm_cad_cliente_T6.edIEKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_cliente_T6.edCelKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_cliente_T6.edFone1Exit(Sender: TObject);
begin
   if not TelValido((Sender as TEdit)) then
      (Sender as TEdit).SetFocus;
end;

procedure Tfrm_cad_cliente_T6.edFone2KeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_cliente_T6.edWhatsAppKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_cliente_T6.edZonaExit(Sender: TObject);
begin
   if not SelectZona(edZona.Text,edZonaDescricao) then
   begin
      edZona.SetFocus;
      exit;
   end
end;

procedure Tfrm_cad_cliente_T6.edNOMEExit(Sender: TObject);
begin
   if Sender is TEdit then
   begin
      (Sender as TEdit).Text := fSemAcentos(Trim((Sender as TEdit).Text));
   end;
end;

procedure Tfrm_cad_cliente_T6.edNOMEKeyPress(Sender: TObject; var Key: Char);
begin
     key := fSemAcentos(key);
end;

procedure Tfrm_cad_cliente_T6.edRegiaoExit(Sender: TObject);
begin
   if not SelectRegiao(edRegiao.Text,edRegiaoDescricao) then
   begin
      edRegiao.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_cliente_T6.edRGKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_cliente_T6.edRG_DataEmissaoExit(Sender: TObject);
begin
   if DataNoFuturo((Sender as TEdit).Text) then
      (Sender as TEdit).SetFocus;
end;

procedure Tfrm_cad_cliente_T6.PesquisaAtividade;
begin
    FRM_cad_ramo_atividade_T9 := TFRM_cad_ramo_atividade_T9.Create(nil);
    FRM_cad_ramo_atividade_T9.showmodal;
    edAtividadeCodigo.TEXT := vFRM_cad_ramo_atividade;
    FRM_cad_ramo_atividade_T9.Free;
    edAtividadeCodigo.SetFocus;
    edAtividadeCodigoExit(nil);
end;

procedure Tfrm_cad_cliente_T6.PesquisaBairro;
begin
    frm_cad_bairro_T8 := Tfrm_cad_bairro_T8.Create(nil);
    frm_cad_bairro_T8.showmodal;
    edBairro.TEXT := vfrm_cad_bairro;
    frm_cad_bairro_T8.Free;
    edBairro.SetFocus;
    edBairroExit(nil);
end;

procedure Tfrm_cad_cliente_T6.PesquisaMunicipio;
begin
    Frm_Municipio_T5 := TFrm_Municipio_T5.Create(nil);
    Frm_Municipio_T5.showmodal;
    edEnderecoMunicipioIBGE.TEXT := vFrm_Municipio;
    Frm_Municipio_T5.Free;
    edEnderecoMunicipioIBGE.SetFocus;
    edEnderecoMunicipioIBGEExit(nil);
end;

procedure Tfrm_cad_cliente_T6.Pesquisar;
var vCodigo:String;
begin
   if edCodigo.Text = '' then
   begin
      Limpar_os_campos_da_Tela(frm_cad_cliente_T6);
      rgStatus.SetFocus;
      exit;
   end;
   Cliente.Codigo := edCodigo.Text;
   Cliente.Abrir;
   if Cliente.Existe then
      Preencher_Campos_da_Tela
   else
   begin
      vCodigo := edCodigo.Text;
      Limpar_os_campos_da_Tela(frm_cad_cliente_T6);
      edCodigo.Text := vCodigo;
      rgStatus.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_cliente_T6.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Cliente.Free;
end;

procedure Tfrm_cad_cliente_T6.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f1 Then
   begin
           if edEnderecoMunicipioIBGE.Focused then PesquisaMunicipio
      else if edZona.Focused                  then PesquisaZona
      else if edRegiao.Focused                then PesquisaRegiao
      else if edAtividadeCodigo.Focused       then PesquisaAtividade;
   end;
end;

procedure Tfrm_cad_cliente_T6.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
        exit;
     end;
end;

procedure Tfrm_cad_cliente_T6.FormShow(Sender: TObject);
begin
   Inicio;
end;

function Tfrm_cad_cliente_T6.fPessoaFisica: Boolean;
begin
   result := (fTipoPessoa_JF = 'F');
end;

function Tfrm_cad_cliente_T6.fPessoaJuridica: Boolean;
begin
   result := (fTipoPessoa_JF = 'J');
end;

function Tfrm_cad_cliente_T6.fPreencheu_Algum_Campo_Pessoa_Fisica: Boolean;
begin
   Result := false;
   if (Trim(edNome.Text)            <> '') or
      (Trim(edCPF.Text)             <> '') or
      (Trim(edRG.Text)              <> '') or
      (Trim(edRG_OrgaoEmissor.Text) <> '') then Result := True;
end;

function Tfrm_cad_cliente_T6.fPreencheu_Algum_Campo_Pessoa_Juridica: Boolean;
begin
   Result := false;
   if (Trim(edRazaoSocial.Text)     <> '') or
      (Trim(edNomeFantasia.Text)    <> '') or
      (Trim(edCNPJ.Text)            <> '') or
      (Trim(edIE.Text)              <> '') then Result := True;
end;

function Tfrm_cad_cliente_T6.fTipoPessoa_JF: String;
begin
    Result := '';
    if fPreencheu_Algum_Campo_Pessoa_Juridica then
    begin
       if fPreencheu_Algum_Campo_Pessoa_Fisica then
       begin
         ShowMessage('Há campos preenchidos tanto de Pessoa Fisica quanto de Pessoa Jurídica.'+#13+#13+
                     'Preencha apenas dados de Pessoa Fisica ou de Pessoa Jurídica');
         exit;
       end
       else
       begin
         Result := 'J';
       end;
    end
    else
    begin
       if fPreencheu_Algum_Campo_Pessoa_Fisica then
       begin
          Result := 'F';
       end
       else
       begin
         ShowMessage('Não os campos de Pessoa Fisica ou de Pessoa Jurídica.');
         exit;
       end;
    end;
end;

function Tfrm_cad_cliente_T6.Gravar_Cliente: Boolean;
begin
    Result := False;
    try
        Cliente.Codigo                      := edCodigo.Text;
        if fPessoaFisica then
        begin
           Cliente.NomeFantasia             := edNome.Text;
           Cliente.RazaoSocial              := '';
           with Cliente.Detalhes.PessoaFisica do
           begin
              CPF            := edCPF.Text;
              RG             := edRG.Text;
              RG_OrgaoEmissor:= edRG_OrgaoEmissor.Text;
              RG_DataEmissao := edRG_DataEmissao.Text;
              DataNascimento := edDataNascimento.Text;
              Sexo           := cbSexo.ItemIndex;
           end;
        end
        else
        begin
           Cliente.NomeFantasia             := edNomeFantasia.Text;
           Cliente.RazaoSocial              := edRazaoSocial.Text;
           with Cliente.Detalhes.PessoaFisica do
           begin
              CPF            := '';
              RG             := '';
              RG_OrgaoEmissor:= '';
              RG_DataEmissao := '';
              DataNascimento := '';
              Sexo           := -1;
           end;

        end;
        Cliente.Status                        := IntToStatusCadastral(rgStatus.ItemIndex);
        Cliente.Detalhes.TipoPessoa           := StringToTipoPessoa(fTipoPessoa_JF);
        if rgStatus.ItemIndex = 1 then
           Cliente.Alteracao.DataBloqueio     := sDataServidor
        else
           Cliente.Alteracao.DataBloqueio     := '  /  /  ';
        Cliente.Detalhes.RamoAtividade        := edAtividadeCodigo.Text;
        Cliente.Detalhes.Regiao               := edRegiao.Text;
        Cliente.Detalhes.Zona                 := edZona.Text;
        Cliente.Detalhes.Endereco.Rua         := edRua.Text;
        Cliente.Detalhes.Endereco.Numero      := edNumero.Text;
        Cliente.Detalhes.Endereco.Bairro      := edBairro.Text;
        Cliente.Detalhes.Endereco.Complemento := edComplemento.Text;
        Cliente.Detalhes.Endereco.Cidade      := edEnderecoMunicipioIBGE.Text;
        Cliente.Detalhes.Endereco.CEP         := edCEP.Text;

        Cliente.Detalhes.Contato.Fone1        := edFone1.Text;
        Cliente.Detalhes.Contato.Fone2        := edFone2.Text;
        Cliente.Detalhes.Contato.Nome         := edNomeContato.Text;
        Cliente.Detalhes.Contato.Cel          := edCel.Text;
        Cliente.Detalhes.Contato.WhatsApp     := edWhatsApp.Text;
        Cliente.Detalhes.Contato.Email1       := edEmail1.Text;
        Cliente.Detalhes.Contato.Email2       := edEmail2.Text;

        result := Cliente.Gravar;
    Except

    end;
end;

procedure Tfrm_cad_cliente_T6.Inicio;
begin
   Preparar_Campos_da_Tela;
   Limpar_os_campos_da_Tela(frm_cad_cliente_T6);
   Cliente := TCliente.Create;
   edCodigo.SetFocus;
end;

procedure Tfrm_cad_cliente_T6.Preencher_Campos_da_Tela;
begin
   Limpar_os_campos_da_Tela(frm_cad_cliente_T6);
   Preencher_Dados_Pessoa;
   Preencher_Endereco;
   Preencher_Contato;
   Preencher_Historicos;
end;

procedure Tfrm_cad_cliente_T6.Preencher_Contato;
begin
   edFone1.Text             := Cliente.Detalhes.Contato.Fone1;
   edFone2.Text             := Cliente.Detalhes.Contato.Fone2;
   edNomeContato.Text       := Cliente.Detalhes.Contato.Nome;
   edCel.Text               := Cliente.Detalhes.Contato.Cel;
   edWhatsApp.Text          := Cliente.Detalhes.Contato.WhatsApp;
   edEmail1.Text            := Cliente.Detalhes.Contato.Email1;
   edEmail2.Text            := Cliente.Detalhes.Contato.Email2;
end;

procedure Tfrm_cad_cliente_T6.Preencher_Dados_Pessoa;
begin
   edCodigo.Text                      := Cliente.Codigo;
   rgStatus.ItemIndex                 := StatusCadastralToInt(Cliente.Status);
   if Cliente.Detalhes.TipoPessoa = tpFisica then
      Preencher_Dados_Pessoa_Fisica
   else
      Preencher_Dados_Pessoa_Juridica;
   edAtividadeCodigo.Text             := Cliente.Detalhes.RamoAtividade;
   edRegiao.Text                      := Cliente.Detalhes.Regiao;
   edZona.Text                        := Cliente.Detalhes.Zona;
   edRua.Text                         := Cliente.Detalhes.Endereco.Rua;
   edNumero.Text                      := Cliente.Detalhes.Endereco.Numero;
   edBairro.Text                      := Cliente.Detalhes.Endereco.Bairro;
   edComplemento.Text                 := Cliente.Detalhes.Endereco.Complemento;
   edEnderecoMunicipioIBGE.Text       := Cliente.Detalhes.Endereco.Cidade;
   edCEP.Text                         := Cliente.Detalhes.Endereco.CEP;
   TrazerAtividade;
   SelectBairro(edBairro.Text,edBairroDescricao);
   SelectRegiao(edRegiao.Text,edRegiaoDescricao);
   SelectZona(edZona.Text,edZonaDescricao);
   RecuperaMunicipio;
end;

procedure Tfrm_cad_cliente_T6.Preencher_Dados_Pessoa_Fisica;
begin
   pgControlPessoa.ActivePage := tsPessoaFisica;
   edNome.Text                := Cliente.NomeFantasia;
   edCPF.Text                 := Cliente.Detalhes.PessoaFisica.CPF;
   edRG.Text                  := Cliente.Detalhes.PessoaFisica.RG;
   edRG_OrgaoEmissor.Text     := Cliente.Detalhes.PessoaFisica.RG_OrgaoEmissor;
   edRG_DataEmissao.Text      := Cliente.Detalhes.PessoaFisica.RG_DataEmissao;
   edDataNascimento.Text      := Cliente.Detalhes.PessoaFisica.DataNascimento;
   cbSexo.ItemIndex           := Cliente.Detalhes.PessoaFisica.Sexo;
end;

procedure Tfrm_cad_cliente_T6.Preencher_Dados_Pessoa_Juridica;
begin
   pgControlPessoa.ActivePage := tsPessoaJuridica;
   edNomeFantasia.Text        := Cliente.NomeFantasia;
   edRazaoSocial.Text         := Cliente.RazaoSocial;
end;

procedure Tfrm_cad_cliente_T6.Preencher_Endereco;
begin
//
end;

procedure Tfrm_cad_cliente_T6.Preencher_Historicos;
begin
   edDataCadastro.Text := Cliente.Detalhes.DataCadastroString;
   edDataBloqueio.Text := Cliente.Alteracao.DataBloqueio;
   edUSU.Text          := Cliente.Alteracao.Usuario;
   edDT.Text           := Cliente.Alteracao.Data;
   edHR.Text           := Cliente.Alteracao.Hora;
   edEstacao.Text      := Cliente.Alteracao.Estacao;
end;

procedure Tfrm_cad_cliente_T6.Preparar_Campos_da_Tela;
begin
   edCodigo.MaxLength      := 10;

   edNome.MaxLength        := 50;
   edRazaoSocial.MaxLength := 50;
   edCPF.MaxLength             := 11;
   edRG.MaxLength              := 20;
   edAtividadeCodigo.MaxLength := 10;

   edRua.MaxLength             := 50;
   edRua.TabOrder              := 0;
   edRua.Tag                   := 100;

   edCEP.MaxLength             := 8;
   edCEP.TabOrder              := 1;
   edCEP.Tag                   := 100;

   edNumero.MaxLength          := 10;
   edNumero.TabOrder           := 2;
   edNumero.Tag                := 200;

   edBairro.MaxLength          := 10;
   edBairro.TabOrder           := 3;
   edBairro.Tag                := 200;

end;

procedure Tfrm_cad_cliente_T6.TrazerAtividade;
begin
  edAtividadeCodigoNome.text     := '';
  if bPesqRamoAtividade.Focused then
     exit;
  edAtividadeCodigo.Text := Trim(edAtividadeCodigo.Text);

  if edAtividadeCodigo.text = '' then
     exit;

  dm.Query1.Close;
  dm.Query1.Sql.Clear;
  dm.Query1.Sql.Add('SELECT *                         ');
  dm.Query1.Sql.Add('  FROM RAMOATIVIDADE_RAMO        ');
  dm.Query1.Sql.Add(' WHERE RAMO_CODIGO = :RAMO_CODIGO');
  dm.Query1.ParamByName('RAMO_CODIGO').AsString := edAtividadeCodigo.text;
  dm.Query1.Open;
  if dm.Query1.Eof Then
  Begin
     ShowMessage('Ramo de Atividade inexistente...');
     edAtividadeCodigo.SetFocus;
     Exit;
  End;
  edAtividadeCodigoNome.Text := dm.Query1.FieldByName('RAMO_DESCRICAO').AsString;
end;

end.
