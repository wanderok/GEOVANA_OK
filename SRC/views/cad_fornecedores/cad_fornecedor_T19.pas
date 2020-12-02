{ v 13.10.20 09:30am }
unit cad_fornecedor_T19;

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

  Classe_Fornecedor, ACBrBase, ACBrSocket, ACBrCEP, Vcl.Grids;

type
  Tfrm_cad_fornecedor_T19 = class(TForm)
    gpData: TGroupBox;
    Label13: TLabel;
    lbInativo: TLabel;
    Label14: TLabel;
    btDetalhesBloqueio: TcxButton;
    edDataCadastro: TMaskEdit;
    edDataBloqueio: TMaskEdit;
    edDataInativo: TMaskEdit;
    Label16: TLabel;
    Label10: TLabel;
    edCodigo: TEdit;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    edUSU: TEdit;
    edDT: TMaskEdit;
    edHR: TEdit;
    edEstacao: TEdit;
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
    edCPF: TEdit;
    edDataNascimento: TMaskEdit;
    cbSexo: TComboBox;
    edRG_DataEmissao: TMaskEdit;
    tsPessoaJuridica: TTabSheet;
    lbl3: TLabel;
    lbl7: TLabel;
    lbl4: TLabel;
    lbl2: TLabel;
    edCNPJ: TEdit;
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
    edCidade: TEdit;
    edEnderecoUF: TEdit;
    edEnderecoUFIBGE: TEdit;
    edZona: TEdit;
    edZonaDescricao: TEdit;
    edRegiao: TEdit;
    edRegiaoDescricao: TEdit;
    cxButton2: TcxButton;
    ACBrCEP1: TACBrCEP;
    GroupBox1: TGroupBox;
    mmObservacoes: TMemo;
    cbProdutorRural: TCheckBox;
    procedure bPesqZonaClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure bPesqBairroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Inicio;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCodigoExit(Sender: TObject);
    procedure Preencher_Campos_da_Tela;
    procedure Preencher_Dados_Pessoa;
    procedure Preencher_Dados_Pessoa_Fisica;
    procedure Preencher_Dados_Pessoa_Juridica;
    procedure Preencher_Dados_Comuns;
    procedure Preencher_Endereco;
    procedure Preencher_Contato;
    procedure Preencher_Historicos;
    procedure Preencher_Observacoes;
    procedure Preparar_Campos_da_Tela;
    procedure cxButton21Click(Sender: TObject);
    function DadosCorretos:Boolean;
    function Gravar_Fornecedor:Boolean;
    procedure Pesquisar;
    procedure Consultar;
    procedure pesquisar_CNPJ_na_SEFAZ;
    procedure pesquisar_CPF_na_SEFAZ;
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
    procedure PesquisaBairro;
    procedure edEnderecoMunicipioIBGEExit(Sender: TObject);
    procedure edCEPExit(Sender: TObject);
    procedure edCEPKeyPress(Sender: TObject; var Key: Char);
    procedure edCPFKeyPress(Sender: TObject; var Key: Char);
    procedure edCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure edFone2KeyPress(Sender: TObject; var Key: Char);
    procedure edCelKeyPress(Sender: TObject; var Key: Char);
    procedure edWhatsAppKeyPress(Sender: TObject; var Key: Char);
    procedure edBairroExit(Sender: TObject);
    procedure edNOMEExit(Sender: TObject);
    function SelectMunicipio(pMunicipio:String;pMunicipioNome:TEdit):Boolean;
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
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    Procedure Preencher_Tela_Com_Dados_da_Consulta_CNPJ;
    procedure edCNPJEnter(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure edIEExit(Sender: TObject);
    function FormataIE: Boolean;
    procedure edRGExit(Sender: TObject);
    procedure btDetalhesBloqueioClick(Sender: TObject);
    procedure bHistoricoAlteracoesClick(Sender: TObject);
    procedure edCidadeExit(Sender: TObject);
    procedure TrataCidade;
    procedure edNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure edIEKeyPress(Sender: TObject; var Key: Char);
    procedure mmObservacoesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frm_cad_fornecedor_T19: Tfrm_cad_fornecedor_T19;
  Fornecedor        : TFornecedor;
  vPodeFechar       : Boolean;
  vMemoLocal        : TMemo;
implementation

uses
  Funcoes,
  TiposDeDados,
  ValidadorDeDocumentos,
  U_Municipio_T5,
  consulta_T7,
  //cad_bairro_T8,
  cad_ramo_atividade_T9,
  auditoria_T10,
  cad_regiao_T11,
  cad_zona_T12,
  ConsultaCNPJ_T13,
  ConsultaCPF_T14,
  FORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18,
  Dados,
  Classe_Nuvem;

{$R *.dfm}

procedure Tfrm_cad_fornecedor_T19.cxButton1Click(Sender: TObject);
begin
    pesquisar_CNPJ_na_SEFAZ;
end;

procedure Tfrm_cad_fornecedor_T19.pesquisar_CNPJ_na_SEFAZ;
begin
    frmConsultaCNPJ_T13 := TfrmConsultaCNPJ_T13.CREATE(Application);
    frmConsultaCNPJ_T13.EditCNPJ.Text := edCNPJ.Text;
    frmConsultaCNPJ_T13.ShowModal;
    Preencher_Tela_Com_Dados_da_Consulta_CNPJ;
    frmConsultaCNPJ_T13.Free;
end;

procedure Tfrm_cad_fornecedor_T19.cxButton21Click(Sender: TObject);
var vNuvem: TNuvem;
begin
   if not DadosCorretos then
      exit;

   if not Gravar_Fornecedor then
     exit;

   {
   vNuvem:= TNuvem.Create;
   vNuvem.uploadCliente(Cliente);
   FreeAndNil(vNuvem);
   }

   Fornecedor.Free;
   Inicio;
end;

procedure Tfrm_cad_fornecedor_T19.cxButton28Click(Sender: TObject);
begin
   vPodeFechar:=True;
   Close;
end;

procedure Tfrm_cad_fornecedor_T19.cxButton2Click(Sender: TObject);
begin
   pesquisar_CPF_na_SEFAZ;
end;

procedure Tfrm_cad_fornecedor_T19.pesquisar_CPF_na_SEFAZ;
begin
  if trim(edCPF.text) = '' then
  begin
     if edDataNascimento.text = '  /  /  ' then
        Avisos.Avisar('Informe o CPF e a Data de Nascimento para pesquisar na SEFAZ')
     else
        Avisos.Avisar('Informe o CPF para pesquisar na SEFAZ');
    edCPF.Setfocus;
    exit;
  end;
  if edDataNascimento.text = '  /  /  ' then
  begin
    Avisos.Avisar('Informe a Data de Nascimento para pesquisar na SEFAZ');
    edDataNascimento.Setfocus;
    exit;
  end;
  frmConsulta_CPFT14:= TfrmConsulta_CPFT14.Create(NIL);
  frmConsulta_CPFT14.EditCNPJ.text := SoNumeros(edCPF.Text);
  if strtoint(COPY(edDataNascimento.text,7,2)) < 21 then
     frmConsulta_CPFT14.EditDtNasc.Text:=COPY(edDataNascimento.text,1,6)+'20'+COPY(edDataNascimento.text,7,2)
  else
     frmConsulta_CPFT14.EditDtNasc.Text:=COPY(edDataNascimento.text,1,6)+'19'+COPY(edDataNascimento.text,7,2);
  frmConsulta_CPFT14.ShowModal;
  edNome.Text := frmConsulta_CPFT14.EditRazaoSocial.text;
  frmConsulta_CPFT14.Free;
end;

procedure Tfrm_cad_fornecedor_T19.bPesqMunicipioClick(Sender: TObject);
begin
   PesquisaMunicipio;
end;

procedure Tfrm_cad_fornecedor_T19.cxButton4Click(Sender: TObject);
begin
    PesquisaRegiao;
end;

procedure Tfrm_cad_fornecedor_T19.cxButton8Click(Sender: TObject);
begin
  Consultar;
end;

procedure Tfrm_cad_fornecedor_T19.PesquisaRegiao;
Begin
    if fPesquisarRegiao(edRegiao,edRegiaoDescricao) then
       edRegiaoExit(nil)
    else
       edRegiao.SetFocus;
    {
    frm_cad_regiao_T11 := Tfrm_cad_regiao_T11.Create(nil);
    frm_cad_regiao_T11.showmodal;
    edRegiao.Text := vfrm_cad_regiao;
    frm_cad_regiao_T11.Free;
    edRegiao.SetFocus;
    edRegiaoExit(nil);
    }
end;

procedure Tfrm_cad_fornecedor_T19.PesquisaZona;
begin
    if fPesquisarZona(edZona,edZonaDescricao) then
       edZonaExit(nil)
    else
       edZona.SetFocus;

    {
    frm_cad_zona_T12 := Tfrm_cad_zona_T12.Create(nil);
    frm_cad_zona_T12.showmodal;
    edZona.Text := vfrm_cad_zona;
    frm_cad_zona_T12.Free;
    edZona.SetFocus;
    edZonaExit(nil); }
end;

procedure Tfrm_cad_fornecedor_T19.ACBrCEP1BuscaEfetuada(Sender: TObject);
var xBairro, vProximoBAI_CODIGO:String;
begin
  if ACBrCEP1.Enderecos.Count = 0 then
     exit;
  try
    // edCEP.Text          := ACBrCEP1.Enderecos[0].CEP;
     edRua.Text          := RemoveAcento(ACBrCEP1.Enderecos[0].Logradouro);
     edRua.Text          := RemoverObsCorreios(edRua.Text);
     edComplemento.Text  := RemoveAcento(ACBrCEP1.Enderecos[0].Complemento);
     edCidade.Text       := RemoveAcento(ACBrCEP1.Enderecos[0].Municipio);
     edEnderecoUF.Text   := ACBrCEP1.Enderecos[0].UF;
     xBairro             := RemoveAcento(ACBrCEP1.Enderecos[0].Bairro);

     TrataCidade;

     DM.Query1.close;
     DM.Query1.sql.clear;
     DM.Query1.sql.add('SELECT BAI_CODIGO                    ');
     DM.Query1.sql.add('  FROM BAIRRO_BAI                    ');
     DM.Query1.sql.add(' WHERE BAI_DESCRICAO = :BAI_DESCRICAO');
     DM.Query1.ParamByName('BAI_DESCRICAO').AsString := xBairro;
     DM.Query1.Open;
     if not DM.Query1.Eof then
     begin
       edBairro.Text:= DM.Query1.FieldByName('BAI_CODIGO').AsString;
       exit;
     end;

     vProximoBAI_CODIGO := ProximoBAI_CODIGO;
     DM.Query1.Close;
     DM.Query1.SQL.Clear;
     DM.Query1.Sql.Add('INSERT INTO BAIRRO_BAI');
     DM.Query1.Sql.Add('     ( BAI_CODIGO,    ');
     DM.Query1.Sql.Add('       BAI_DESCRICAO) ');
     DM.Query1.Sql.Add('VALUES                ');
     DM.Query1.Sql.Add('     (:BAI_CODIGO,    ');
     DM.Query1.Sql.Add('      :BAI_DESCRICAO) ');
     DM.Query1.ParamByName('BAI_CODIGO'   ).AsString := vProximoBAI_CODIGO;
     DM.Query1.ParamByName('BAI_DESCRICAO').AsString := xBairro;
     DM.Query1.ExecSql;

     edBairro.Text:=vProximoBAI_CODIGO;
  except

  end;
end;

procedure Tfrm_cad_fornecedor_T19.bHistoricoAlteracoesClick(Sender: TObject);
begin
   if trim(edCodigo.Text) = '' then
      exit;

   frm_auditoria_T10 := Tfrm_auditoria_T10.Create(nil);
   with frm_auditoria_T10.FDQuery1 do
   begin
     Close;
     SQL.Clear;
     SQL.Add('select * from log_log                 ');
     SQL.Add(' where log_historico like :Fornecedor ');
     ParamByName('Fornecedor').AsString := '%' + 'Fornecedor ' + edCodigo.Text + '%';
     SQL.Add('ORDER BY LOG_DATA DESC, LOG_HORA DESC  ');
     Open;
   end;
   vPesquisaExterna := True; // Informa a frm_autitoria que ela não está sendo chamada
                             // pelo menu e sim por um rotina externa (ao menu)
   frm_auditoria_T10.showmodal;
   frm_auditoria_T10.Free;
end;

procedure Tfrm_cad_fornecedor_T19.bPesqBairroClick(Sender: TObject);
begin
    PesquisaBairro;
end;

procedure Tfrm_cad_fornecedor_T19.bPesqZonaClick(Sender: TObject);
begin
   PesquisaZona;
end;

procedure Tfrm_cad_fornecedor_T19.btDetalhesBloqueioClick(Sender: TObject);
begin
    if trim(edCodigo.Text) = '' then
       exit;

    // Mostra detalhes do bloqueio...
    // Data, hora, usuário e estação onde ocorreu o bloqueio do Fornecedor
    // ----------------------------------------------------------------------------
    frmFORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18 :=  TfrmFORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18.Create(Self);
    with frmFORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18.sql_FORNECEDOR_HISTORICO_BLOQUEIOS_FHB do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT *                                        ');
      Sql.Add('  FROM FORNECEDOR_HISTORICO_BLOQUEIOS_FHB       ');
      Sql.Add(' WHERE FHB_FORNECEDOR = :FHB_FORNECEDOR         ');
      Sql.Add(' ORDER BY  FHB_DTEVENTO DESC, FHB_HREVENTO DESC ');
      ParamByName('FHB_FORNECEDOR').AsString := edCODIGO.text;
      Open;
    end;
    frmFORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18.ShowModal;
    frmFORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18.Free;
end;

procedure Tfrm_cad_fornecedor_T19.Consultar;
begin
    frm_consulta_T7 := Tfrm_consulta_T7.Create(nil);
    frm_consulta_T7.rgConsultar.itemindex := 1; //Fornecedor
    frm_consulta_T7.showmodal;
    edCodigo.Text:= vfrm_consulta_T7_Codigo;
    frm_consulta_T7.Free;
    Pesquisar;
end;

function Tfrm_cad_fornecedor_T19.DadosCorretos: Boolean;
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

   if NaoPreencheuCamposObrigatoriosOuImportantes(frm_cad_fornecedor_T19) then
      exit;

   if not FormataIE then
   begin
      edIE.SetFocus;
      exit;
   end;

   result := true;
end;

function Tfrm_cad_fornecedor_T19.FormataIE: Boolean;
begin
   result := true;
   if edIE.Text = '' then exit;
   if edIE.Text = 'ISENTO' then exit;

   if not frmValidadorDeDocumentos.IE_Valida(edIE.Text,edEnderecoUF.Text) then
   begin
      result := False;
      exit;
   end;
   edIE.Text := vVDD_DocumentoFormatado;
end;

procedure Tfrm_cad_fornecedor_T19.edBairroExit(Sender: TObject);
begin
   if not SelectBairro(edBairro.Text,edBairroDescricao) then
   begin
      Avisos.Avisar('Bairro inexistente...');
      edBairro.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_fornecedor_T19.edCEPExit(Sender: TObject);
var vQtdeEnderecos:integer;
begin
   edRua.Text           := '';
   edNumero.Text        := '';
   edComplemento.Text   := '';
   edCidade.Text        := '';
   edEnderecoUF.Text    := '';
   edEnderecoUFIBGE.Text:= '';
   edBairro.Text        := '';
   edBairroDescricao.Text:='';
   edEnderecoMunicipioIBGE.text := '';


   if edCEP.Text = '' then
      exit;
   if not frmValidadorDeDocumentos.CEP_Valido(edCEP.Text) then
   begin
      edCEP.SetFocus;
      exit;
   end;
   ACBRCEP1.WebService := wsRepublicaVirtual;
   vQtdeEnderecos:=ACBrCEP1.BuscarPorCEP(edCEP.Text);
   if vQtdeEnderecos = 0 then
      exit;
   edCEP.Text := vVDD_DocumentoFormatado;
       //edTipo.Text         := ACBrCEP.Enderecos[0].Tipo_Logradouro;
{
   if not selectCEP(edCEP,edRua,edBairro,edCidade,edEnderecoUF) then
      exit;
}
   SelectBairro(edBairro.Text,edBairroDescricao);
end;

procedure Tfrm_cad_fornecedor_T19.edCEPKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_fornecedor_T19.edCidadeExit(Sender: TObject);
begin
   TrataCidade;
end;

procedure Tfrm_cad_fornecedor_T19.edCNPJEnter(Sender: TObject);
begin
   (Sender as TEdit).Text := SoNumerosOuISENTO((Sender as TEdit).Text);
end;

procedure Tfrm_cad_fornecedor_T19.edCNPJExit(Sender: TObject);
begin
   (Sender as TEdit).Text := Trim((Sender as TEdit).Text);

   if (Sender as TEdit).Text = '' then
      exit;

   if not fCNPJValido((Sender as TEdit)) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;

   if Existe_Outro_FORNECEDOR_Com_Este_CNPJ((Sender as TEdit).Text,edCodigo.Text) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;

   if trim(edRazaoSocial.text) = '' then
      pesquisar_CNPJ_na_SEFAZ;
end;

procedure Tfrm_cad_fornecedor_T19.edCNPJKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_fornecedor_T19.edCodigoExit(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_cad_fornecedor_T19.edCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_F1 then
     Consultar;
end;

procedure Tfrm_cad_fornecedor_T19.edCPFExit(Sender: TObject);
begin
   if not fCPFValido((Sender as TEdit)) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;

   if Existe_Outro_FORNECEDOR_Com_Este_CPF((Sender as TEdit).Text,edCodigo.Text) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_fornecedor_T19.edCPFKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_fornecedor_T19.edDataNascimentoExit(Sender: TObject);
begin
   if DataNoFuturo((Sender as TMaskEdit)) then
      (Sender as TEdit).SetFocus;
end;

procedure Tfrm_cad_fornecedor_T19.edEmail1Exit(Sender: TObject);
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

procedure Tfrm_cad_fornecedor_T19.edEnderecoMunicipioIBGEExit(Sender: TObject);
begin
    SelectMunicipio(edEnderecoMunicipioIBGE.text,edCidade);
end;

function Tfrm_cad_fornecedor_T19.SelectMunicipio(pMunicipio:String;pMunicipioNome:TEdit):Boolean;
begin
  if bPesqMunicipio.Focused then
     exit;
  pMunicipioNome.Text  := Trim(pMunicipioNome.Text);
  edCidade.text        := '';
  edEnderecoUF.text    := '';
  edEnderecoUFIBGE.text:= '';

  if pMunicipio = '' then
     exit;

  dm.Query1.Close;
  dm.Query1.Sql.Clear;
  dm.Query1.Sql.Add('SELECT *                  ');
  dm.Query1.Sql.Add('  FROM CIDADE_CID,        ');
  dm.Query1.Sql.Add('       UF_UF              ');
  dm.Query1.Sql.Add(' WHERE UF_CODIGO  = CID_UF');
  dm.Query1.Sql.Add('   AND CID_CODIGO = :COD  ');
  dm.Query1.ParamByName('COD').AsString := pMunicipio;
  dm.Query1.Open;
  if dm.Query1.Eof Then
  Begin
     Avisos.Avisar('Município inexistente...');
     edEnderecoMunicipioIBGE.SetFocus;
     Exit;
  End;
  pMunicipioNome.Text   := dm.Query1.FieldByName('CID_NOME').AsString;
  edEnderecoUFIBGE.text := dm.Query1.FieldByName('CID_UF'  ).AsString;
  edEnderecoUF.text     := dm.Query1.FieldByName('UF_SIGLA').AsString;
end;

procedure Tfrm_cad_fornecedor_T19.edIEExit(Sender: TObject);
begin
   edIE.text := UpperCase(Trim(edIE.text));
   if edIE.Text = 'ISENTO' then
      exit;
   if edIE.Text = '' then
   begin
     Avisos.Avisar('Use a palavra "ISENTO" para Pessoa Jurídica isenta de Iscrição Estadual');
     exit;
   end;
   edIE.text := SoNumeros(edIE.text);
   if Existe_Outro_FORNECEDOR_Com_Esta_IE((Sender as TEdit).Text,edCodigo.Text) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end
end;

procedure Tfrm_cad_fornecedor_T19.edIEKeyPress(Sender: TObject; var Key: Char);
begin
   if UpperCase(key) = 'I' then
   begin
      key:=#0;
      (Sender as TEdit).Text := 'ISENTO';
   end;
end;

procedure Tfrm_cad_fornecedor_T19.edCelKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_fornecedor_T19.edFone1Exit(Sender: TObject);
begin
   if not TelValido((Sender as TEdit)) then
      (Sender as TEdit).SetFocus;
end;

procedure Tfrm_cad_fornecedor_T19.edFone2KeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_fornecedor_T19.edWhatsAppKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_fornecedor_T19.edZonaExit(Sender: TObject);
begin
//   if not PesquisaF1.ExisteCodigo('ZONA_ZON',edZona.Text) then

   if not SelectZona(edZona.Text,edZonaDescricao) then
   begin
      Avisos.Avisar('Zona inexistente...');
      edZona.SetFocus;
      exit;
   end
end;

procedure Tfrm_cad_fornecedor_T19.edNOMEExit(Sender: TObject);
begin
   if Sender is TEdit then
   begin
      (Sender as TEdit).Text := fSemAcentos(Trim((Sender as TEdit).Text));
   end;
end;

procedure Tfrm_cad_fornecedor_T19.edNOMEKeyPress(Sender: TObject; var Key: Char);
begin
   key := fSemAcentos(key);
end;

procedure Tfrm_cad_fornecedor_T19.edNumeroKeyPress(Sender: TObject; var Key: Char);
begin
     key := fLetrasENumeros(key);
end;

procedure Tfrm_cad_fornecedor_T19.edRegiaoExit(Sender: TObject);
begin
   if not SelectRegiao(edRegiao.Text,edRegiaoDescricao) then
   begin
      Avisos.Avisar('Região inexistente...');
      edRegiao.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_fornecedor_T19.edRGExit(Sender: TObject);
begin
   edRG.text := UpperCase(Trim(edRG.text));
   if edRG.Text = 'ISENTO' then
      exit;
   if edRG.Text = '' then
   begin
     Avisos.Avisar('Use a palavra "ISENTO" para Pessoa Física isenta de RG');
     exit;
   end;
   edRG.text := SoNumerosOuISENTO(edRG.text);
   if Existe_Outro_FORNECEDOR_Com_Este_RG((Sender as TEdit).Text,edCodigo.Text) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end
end;

procedure Tfrm_cad_fornecedor_T19.edRG_DataEmissaoExit(Sender: TObject);
begin
   if DataNoFuturo((Sender as TMaskEdit)) then
      (Sender as TEdit).SetFocus;
end;

procedure Tfrm_cad_fornecedor_T19.PesquisaBairro;
begin
    if fPesquisarBairro(edBairro,edBairroDescricao) then
       edBairroExit(nil)
    else
       edBairro.SetFocus;
    {frm_cad_bairro_T8 := Tfrm_cad_bairro_T8.Create(nil);
    frm_cad_bairro_T8.showmodal;
    edBairro.TEXT := vfrm_cad_bairro;
    frm_cad_bairro_T8.Free;
    edBairro.SetFocus;
    edBairroExit(nil);
    }
end;

procedure Tfrm_cad_fornecedor_T19.PesquisaMunicipio;
begin
    Frm_Municipio_T5 := TFrm_Municipio_T5.Create(nil);
    Frm_Municipio_T5.Edit1.Text := Empresa.EnderecoMunicipio;
    Frm_Municipio_T5.showmodal;
    edEnderecoMunicipioIBGE.TEXT := vFrm_Municipio;
    Frm_Municipio_T5.Free;
    edEnderecoMunicipioIBGE.SetFocus;
    edEnderecoMunicipioIBGEExit(nil);
end;

procedure Tfrm_cad_fornecedor_T19.Pesquisar;
var vCodigo:String;
begin
   if edCodigo.Text = '' then
   begin
      Limpar_os_campos_da_Tela(frm_cad_fornecedor_T19);
      //rgStatus.SetFocus;
      exit;
   end;
   Fornecedor.Codigo := edCodigo.Text;
   Fornecedor.Abrir;
   if Fornecedor.Existe then
      Preencher_Campos_da_Tela
   else
   begin
      vCodigo := edCodigo.Text;
      Limpar_os_campos_da_Tela(frm_cad_fornecedor_T19);
      edCodigo.Text := vCodigo;
      //rgStatus.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_fornecedor_T19.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(vMemoLocal);
   Fornecedor.Free;
end;

procedure Tfrm_cad_fornecedor_T19.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   //CanClose := vPodeFechar;
end;

procedure Tfrm_cad_fornecedor_T19.FormCreate(Sender: TObject);
begin
   try
     if vMemoLocal = nil then
        vMemoLocal:=TMemo.Create(frm_cad_fornecedor_T19)
     else
     begin
        vMemoLocal.Free;
        vMemoLocal:=TMemo.Create(frm_cad_fornecedor_T19);
     end;
   except
     vMemoLocal.Free;
     try
        vMemoLocal:=TMemo.Create(frm_cad_fornecedor_T19);
     except
        vPodeFechar:=True;
        Close;
     end;
   end;
   vMemoLocal.Parent := mmObservacoes.Parent;
   vMemoLocal.Height:= 442;
   vMemoLocal.Width := 968;
   vMemoLocal.WordWrap:=true;
   vMemoLocal.font.size := 16;
   vMemoLocal.font.Name := 'Tahoma';
   vMemoLocal.font.Style := [fsBold];
   vMemoLocal.Visible := false;
   vPodeFechar:=False;
end;

procedure Tfrm_cad_fornecedor_T19.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f1 Then
   begin
           if edEnderecoMunicipioIBGE.Focused then PesquisaMunicipio
      else if edZona.Focused                  then PesquisaZona
      else if edRegiao.Focused                then PesquisaRegiao;
   end;
end;

procedure Tfrm_cad_fornecedor_T19.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
        if (not mmObservacoes.focused) then
        begin
          Key := #0;
          Perform(WM_NEXTDLGCTL, 0, 0);
          exit;
        end;
     end;
end;

procedure Tfrm_cad_fornecedor_T19.FormShow(Sender: TObject);
begin
   Inicio;
end;

function Tfrm_cad_fornecedor_T19.fPessoaFisica: Boolean;
begin
   result := (fTipoPessoa_JF = 'F');
end;

function Tfrm_cad_fornecedor_T19.fPessoaJuridica: Boolean;
begin
   result := (fTipoPessoa_JF = 'J');
end;

function Tfrm_cad_fornecedor_T19.fPreencheu_Algum_Campo_Pessoa_Fisica: Boolean;
begin
   Result := false;
   if (Trim(edNome.Text)            <> '') or
      (Trim(edCPF.Text)             <> '') or
      (Trim(edRG.Text)              <> '') or
      (Trim(edRG_OrgaoEmissor.Text) <> '') then Result := True;
end;

function Tfrm_cad_fornecedor_T19.fPreencheu_Algum_Campo_Pessoa_Juridica: Boolean;
begin
   Result := false;
   if (Trim(edRazaoSocial.Text)     <> '') or
      (Trim(edNomeFantasia.Text)    <> '') or
      (Trim(edCNPJ.Text)            <> '') or
      (Trim(edIE.Text)              <> '') then Result := True;
end;

function Tfrm_cad_fornecedor_T19.fTipoPessoa_JF: String;
begin
    Result := '';
    if fPreencheu_Algum_Campo_Pessoa_Juridica then
    begin
       if fPreencheu_Algum_Campo_Pessoa_Fisica then
       begin
         Avisos.Avisar('Há campos preenchidos tanto de Pessoa Fisica quanto de Pessoa Jurídica.'+#13+#13+
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
         Avisos.Avisar('Não preencheu os campos de Pessoa Fisica ou de Pessoa Jurídica.');
         exit;
       end;
    end;
end;

function Tfrm_cad_fornecedor_T19.Gravar_Fornecedor: Boolean;
var Lista : TStringList;
    i     : integer;
begin
    Result := False;
    try
        Fornecedor.Codigo                      := edCodigo.Text;
        if fPessoaFisica then
        begin
           Fornecedor.NomeFantasia             := edNome.Text;
           Fornecedor.RazaoSocial              := '';
           with Fornecedor.Detalhes.PessoaFisica do
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
           Fornecedor.NomeFantasia             := edNomeFantasia.Text;
           Fornecedor.RazaoSocial              := edRazaoSocial.Text;
           with Fornecedor.Detalhes.PessoaFisica do
           begin
              RG             := '';
              RG_OrgaoEmissor:= '';
              RG_DataEmissao := '  /  /  ';
              DataNascimento := '  /  /  ';
              Sexo           := -1;
           end;
           with Fornecedor.Detalhes.PessoaJuridica do
           begin
              CNPJ           := edCNPJ.Text;
              IE             := edIE.Text;
           end;

        end;
        Fornecedor.Status                        := IntToStatusCadastral(rgStatus.ItemIndex);
        Fornecedor.Detalhes.TipoPessoa           := StringToTipoPessoa(fTipoPessoa_JF);
        if rgStatus.ItemIndex = -1 then
           rgStatus.ItemIndex := 0;

        if rgStatus.ItemIndex = 1 then
           Fornecedor.Alteracao.DataBloqueio     := sDataServidor
        else
           Fornecedor.Alteracao.DataBloqueio     := '  /  /  ';
        if rgStatus.ItemIndex = 2 then
           Fornecedor.Alteracao.DataInativo    := sDataServidor
        else
           Fornecedor.Alteracao.DataInativo    := '  /  /  ';

        Fornecedor.Detalhes.Regiao               := edRegiao.Text;
        Fornecedor.Detalhes.Zona                 := edZona.Text;
        Fornecedor.Detalhes.Endereco.Rua         := edRua.Text;
        Fornecedor.Detalhes.Endereco.Numero      := edNumero.Text;
        Fornecedor.Detalhes.Endereco.Bairro      := edBairro.Text;
        Fornecedor.Detalhes.Endereco.Complemento := edComplemento.Text;
        Fornecedor.Detalhes.Endereco.Cidade      := edEnderecoMunicipioIBGE.Text;
        Fornecedor.Detalhes.Endereco.CEP         := edCEP.Text;

        Fornecedor.Detalhes.Contato.Fone1        := edFone1.Text;
        Fornecedor.Detalhes.Contato.Fone2        := edFone2.Text;
        Fornecedor.Detalhes.Contato.Nome         := edNomeContato.Text;
        Fornecedor.Detalhes.Contato.Cel          := edCel.Text;
        Fornecedor.Detalhes.Contato.WhatsApp     := edWhatsApp.Text;
        Fornecedor.Detalhes.Contato.Email1       := edEmail1.Text;
        Fornecedor.Detalhes.Contato.Email2       := edEmail2.Text;

        if cbProdutorRural.checked then
           Fornecedor.Detalhes.ProdutorRural     := snSim
        else
           Fornecedor.Detalhes.ProdutorRural     := snNao;

        Lista := TStringList.Create;
        for i := 0 to vMemoLocal.lines.count-1 do
            Lista.Add(vMemoLocal.lines[i]);

        Fornecedor.Observacao                    := Lista;
        result := Fornecedor.Gravar;
    Except

    end;
end;

procedure Tfrm_cad_fornecedor_T19.Inicio;
begin
   Preparar_Campos_da_Tela;
   Limpar_os_campos_da_Tela(frm_cad_fornecedor_T19);
   Fornecedor := TFornecedor.Create;
   edCodigo.SetFocus;
end;

procedure Tfrm_cad_fornecedor_T19.mmObservacoesClick(Sender: TObject);
begin
   vMemoLocal.Text := mmObservacoes.text;
   MostrarMemo(vMemoLocal);
   mmObservacoes.text :=vMemoLocal.Text;
end;

procedure Tfrm_cad_fornecedor_T19.Preencher_Campos_da_Tela;
begin
   Limpar_os_campos_da_Tela(frm_cad_fornecedor_T19);

   edCodigo.Text      := Fornecedor.Codigo;
   rgStatus.ItemIndex := StatusCadastralToInt(Fornecedor.Status);

   Preencher_Dados_Pessoa;
   Preencher_Dados_Comuns;
   FormataIE;
end;

procedure Tfrm_cad_fornecedor_T19.Preencher_Contato;
begin
   edFone1.Text             := Fornecedor.Detalhes.Contato.Fone1;
   edFone2.Text             := Fornecedor.Detalhes.Contato.Fone2;
   edNomeContato.Text       := Fornecedor.Detalhes.Contato.Nome;
   edCel.Text               := Fornecedor.Detalhes.Contato.Cel;
   edWhatsApp.Text          := Fornecedor.Detalhes.Contato.WhatsApp;
   edEmail1.Text            := Fornecedor.Detalhes.Contato.Email1;
   edEmail2.Text            := Fornecedor.Detalhes.Contato.Email2;
end;

procedure Tfrm_cad_fornecedor_T19.Preencher_Dados_Comuns;
begin
   Preencher_Endereco;
   Preencher_Contato;
   Preencher_Historicos;
   Preencher_Observacoes;
end;

procedure Tfrm_cad_fornecedor_T19.Preencher_Dados_Pessoa;
begin
   if Fornecedor.Detalhes.TipoPessoa = tpFisica then
      Preencher_Dados_Pessoa_Fisica
   else
      Preencher_Dados_Pessoa_Juridica;
   cbProdutorRural.checked := (Fornecedor.Detalhes.ProdutorRural = snSim);
end;

procedure Tfrm_cad_fornecedor_T19.Preencher_Dados_Pessoa_Fisica;
begin
   pgControlPessoa.ActivePage := tsPessoaFisica;
   edNome.Text                := Fornecedor.NomeFantasia;
   edCPF.Text                 := Fornecedor.Detalhes.PessoaFisica.CPF;
   edRG.Text                  := Fornecedor.Detalhes.PessoaFisica.RG;
   edRG_OrgaoEmissor.Text     := Fornecedor.Detalhes.PessoaFisica.RG_OrgaoEmissor;
   edRG_DataEmissao.Text      := Fornecedor.Detalhes.PessoaFisica.RG_DataEmissao;
   edDataNascimento.Text      := Fornecedor.Detalhes.PessoaFisica.DataNascimento;
   cbSexo.ItemIndex           := Fornecedor.Detalhes.PessoaFisica.Sexo;
end;

procedure Tfrm_cad_fornecedor_T19.Preencher_Dados_Pessoa_Juridica;
begin
   pgControlPessoa.ActivePage := tsPessoaJuridica;
   edCNPJ.Text                := Fornecedor.Detalhes.PessoaJuridica.CNPJ;
   edIE.Text                  := Fornecedor.Detalhes.PessoaJuridica.IE;
   edNomeFantasia.Text        := Fornecedor.NomeFantasia;
   edRazaoSocial.Text         := Fornecedor.RazaoSocial;
end;

procedure Tfrm_cad_fornecedor_T19.Preencher_Endereco;
begin
   edRegiao.Text                      := Fornecedor.Detalhes.Regiao;
   edZona.Text                        := Fornecedor.Detalhes.Zona;
   edRua.Text                         := Fornecedor.Detalhes.Endereco.Rua;
   edNumero.Text                      := Fornecedor.Detalhes.Endereco.Numero;
   edBairro.Text                      := Fornecedor.Detalhes.Endereco.Bairro;
   edComplemento.Text                 := Fornecedor.Detalhes.Endereco.Complemento;
   edEnderecoMunicipioIBGE.Text       := Fornecedor.Detalhes.Endereco.Cidade;
   edCEP.Text                         := Fornecedor.Detalhes.Endereco.CEP;

   SelectBairro(edBairro.Text,edBairroDescricao);
   SelectRegiao(edRegiao.Text,edRegiaoDescricao);
   SelectZona(edZona.Text,edZonaDescricao);
   SelectMunicipio(edEnderecoMunicipioIBGE.Text,edCidade);
end;

procedure Tfrm_cad_fornecedor_T19.Preencher_Historicos;
begin
   edDataCadastro.Text := Fornecedor.Detalhes.DataCadastroString;
   edDataBloqueio.Text := Fornecedor.Alteracao.DataBloqueio;
   edDataInativo.Text  := Fornecedor.Alteracao.DataInativo;
   edUSU.Text          := Fornecedor.Alteracao.Usuario;
   edDT.Text           := Fornecedor.Alteracao.Data;
   edHR.Text           := Fornecedor.Alteracao.Hora;
   edEstacao.Text      := Fornecedor.Alteracao.Estacao;
end;

procedure Tfrm_cad_fornecedor_T19.Preencher_Observacoes;
var i     : Integer;
  ScrollMessage: TWMVScroll;
begin
   mmObservacoes.lines.clear;
   for i := 0 to Fornecedor.Observacao.count-1 do
       mmObservacoes.lines.add(Fornecedor.Observacao[i]);

  ScrollMessage.Msg := WM_VSCROLL;
  mmObservacoes.Lines.BeginUpdate;
  try
    for I := 0 to mmObservacoes.Lines.Count do
    begin
     ScrollMessage.ScrollCode := SB_LINEUP;
     ScrollMessage.Pos := 0;
     mmObservacoes.Dispatch(ScrollMessage);
    end;
  finally
    mmObservacoes.Lines.EndUpdate;
  end;

end;

procedure Tfrm_cad_fornecedor_T19.Preencher_Tela_Com_Dados_da_Consulta_CNPJ;
begin
    edCNPJ.Text                  := frmConsultaCNPJ_T13.EditCNPJ.Text;
    edRazaoSocial.Text           := frmConsultaCNPJ_T13.EditRazaoSocial.Text;
    edNomeFantasia.Text          := fSemAcentos(frmConsultaCNPJ_T13.EditFantasia.Text);
    edRua.Text                   := fSemAcentos(frmConsultaCNPJ_T13.EditEndereco.Text);
    edNumero.Text                := fSemAcentos(frmConsultaCNPJ_T13.EditNumero.Text);
    edComplemento.Text           := RetiraExcessoDeEspacos(fSemAcentos(frmConsultaCNPJ_T13.EditComplemento.Text));
    edBairro.Text                := CadastraBairro(fSemAcentos(frmConsultaCNPJ_T13.EditBairro.Text));
    edCEP.Text                   := frmConsultaCNPJ_T13.EditCEP.Text;
    edEnderecoMunicipioIBGE.Text := CadastrarMunicipio(fSemAcentos(frmConsultaCNPJ_T13.EditCidade.Text),fSemAcentos(frmConsultaCNPJ_T13.EditUF.Text));

    selectBairro(edBairro.Text,edBairroDescricao);
    SelectMunicipio(edEnderecoMunicipioIBGE.Text,edCidade);
end;

procedure Tfrm_cad_fornecedor_T19.Preparar_Campos_da_Tela;
begin
   edCodigo.MaxLength          := 10;

   edNome.MaxLength            := 50;
   edRazaoSocial.MaxLength     := 50;

   edCPF.MaxLength             := 11;
   edRG.MaxLength              := 20;

   edCEP.MaxLength             := 8;
   edCEP.TabOrder              := 0;
   edCEP.Tag                   := 100;

   edRua.MaxLength             := 50;
   edRua.TabOrder              := 1;
   edRua.Tag                   := 100;

   edNumero.MaxLength          := 10;
   edNumero.TabOrder           := 2;
   edNumero.Tag                := 100;

   edBairro.MaxLength          := 10;
   edBairro.TabOrder           := 3;
   edBairro.Tag                := 100;

end;

procedure Tfrm_cad_fornecedor_T19.TrataCidade;
var vCidadeIBGE: String;
begin
  edEnderecoMunicipioIBGE.Text := '';
  edEnderecoUFIBGE.text        := '';
  edEnderecoUF.text            := '';

  edCidade.Text :=Trim(edCidade.text);
  if edCidade.Text = '' then
     exit;
  dm.Query1.Close;
  dm.Query1.SQL.Clear;
  dm.Query1.SQL.Add('SELECT * FROM CIDADE_CID'   );
  dm.Query1.SQL.Add(' WHERE CID_NOME = :CID_NOME');
  dm.Query1.ParamByName('CID_NOME').AsString := edCidade.Text;
  dm.Query1.Open;
  if dm.Query1.eof then
  begin
    Avisos.Avisar('Cidade não encontrada');
    edCidade.SetFocus;
    exit;
  end;
  if dm.Query1.RecordCount > 1 then
  begin
    Frm_Municipio_T5 := TFrm_Municipio_T5.Create(nil);
    Frm_Municipio_T5.Edit1.Text := edCidade.Text;
    Frm_Municipio_T5.showmodal;
    vCidadeIBGE := vFrm_Municipio;
    Frm_Municipio_T5.Free;
  end
  else
    vCidadeIBGE := dm.Query1.FieldByName('CID_CODIGO').AsString;

  dm.Query1.Close;
  dm.Query1.SQL.Clear;
  dm.Query1.SQL.Add('SELECT *                       ');
  dm.Query1.SQL.Add('  FROM CIDADE_CID,             ');
  dm.Query1.SQL.Add('       UF_UF                   ');
  dm.Query1.SQL.Add(' WHERE UF_CODIGO = CID_UF      ');
  dm.Query1.SQL.Add('   AND CID_CODIGO = :CID_CODIGO');
  dm.Query1.ParamByName('CID_CODIGO').AsString := vCidadeIBGE;
  dm.Query1.Open;
  if dm.Query1.eof then
  begin
    Avisos.Avisar('Cidade não encontrada');
    edCidade.SetFocus;
    exit;
  end;
  edEnderecoMunicipioIBGE.Text := dm.Query1.FieldByName('CID_CODIGO').AsString;
  edEnderecoUF.Text            := dm.Query1.FieldByName('UF_SIGLA'  ).AsString;
  edEnderecoUFIBGE.Text        := dm.Query1.FieldByName('UF_CODIGO' ).AsString;
end;

end.
