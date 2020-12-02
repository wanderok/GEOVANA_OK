
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

  Classe_Cliente, ACBrBase, ACBrSocket, ACBrCEP, Vcl.Grids;

type
  Tfrm_cad_cliente_T6 = class(TForm)
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
    Label1: TLabel;
    edAtividadeCodigo: TEdit;
    bPesqRamoAtividade: TcxButton;
    edAtividadeNome: TEdit;
    cxButton2: TcxButton;
    ACBrCEP1: TACBrCEP;
    GroupBox1: TGroupBox;
    mmObservacoes: TMemo;
    bSMC: TcxButton;
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
    procedure Preencher_Dados_Comuns;
    procedure Preencher_Endereco;
    procedure Preencher_Contato;
    procedure Preencher_Historicos;
    procedure Preencher_Observacoes;
    procedure Preparar_Campos_da_Tela;
    procedure cxButton21Click(Sender: TObject);
    function DadosCorretos:Boolean;
    function Gravar_Cliente:Boolean;
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
    procedure PesquisaAtividade;
    procedure PesquisaBairro;
    procedure TrazerAtividade;
    procedure edEnderecoMunicipioIBGEExit(Sender: TObject);
    procedure edAtividadeCodigoExit(Sender: TObject);
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
    procedure bSMCClick(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frm_cad_cliente_T6: Tfrm_cad_cliente_T6;
  Cliente           : TCliente;
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
  CLIENTE_HISTORICO_BLOQUEIOS_CHB_T17,
  cad_cliente_SMC_T35,
  Dados,
  Classe_Nuvem;

{$R *.dfm}

procedure Tfrm_cad_cliente_T6.cxButton1Click(Sender: TObject);
begin
    pesquisar_CNPJ_na_SEFAZ;
end;

procedure Tfrm_cad_cliente_T6.pesquisar_CNPJ_na_SEFAZ;
begin
    frmConsultaCNPJ_T13 := TfrmConsultaCNPJ_T13.CREATE(Application);
    frmConsultaCNPJ_T13.EditCNPJ.Text := edCNPJ.Text;
    frmConsultaCNPJ_T13.ShowModal;
    Preencher_Tela_Com_Dados_da_Consulta_CNPJ;
    frmConsultaCNPJ_T13.Free;
end;

procedure Tfrm_cad_cliente_T6.cxButton21Click(Sender: TObject);
var vNuvem: TNuvem;
begin
   if not DadosCorretos then
      exit;

   if not Gravar_Cliente then
     exit;

   vNuvem:= TNuvem.Create;
   vNuvem.uploadCliente(Cliente);
   FreeAndNil(vNuvem);

   Cliente.Free;
   Inicio;
end;

procedure Tfrm_cad_cliente_T6.cxButton28Click(Sender: TObject);
begin
   vPodeFechar:=True;
   Close;
end;

procedure Tfrm_cad_cliente_T6.cxButton2Click(Sender: TObject);
begin
   pesquisar_CPF_na_SEFAZ;
end;

procedure Tfrm_cad_cliente_T6.pesquisar_CPF_na_SEFAZ;
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

procedure Tfrm_cad_cliente_T6.cxButton8Click(Sender: TObject);
begin
  Consultar;
end;

procedure Tfrm_cad_cliente_T6.PesquisaRegiao;
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

procedure Tfrm_cad_cliente_T6.PesquisaZona;
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

procedure Tfrm_cad_cliente_T6.ACBrCEP1BuscaEfetuada(Sender: TObject);
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

procedure Tfrm_cad_cliente_T6.bHistoricoAlteracoesClick(Sender: TObject);
begin
   if trim(edCodigo.Text) = '' then
      exit;

   frm_auditoria_T10 := Tfrm_auditoria_T10.Create(nil);
   with frm_auditoria_T10.FDQuery1 do
   begin
     Close;
     SQL.Clear;
     SQL.Add('select * from log_log              ');
     SQL.Add(' where log_historico like :Cliente ');
     ParamByName('Cliente').AsString := '%' + 'cliente ' + edCodigo.Text + '%';
     SQL.Add('ORDER BY LOG_DATA DESC, LOG_HORA DESC  ');
     Open;
   end;
   vPesquisaExterna := True; // Informa a frm_autitoria que ela não está sendo chamada
                             // pelo menu e sim por um rotina externa (ao menu)
   frm_auditoria_T10.showmodal;
   frm_auditoria_T10.Free;
end;

procedure Tfrm_cad_cliente_T6.bPesqBairroClick(Sender: TObject);
begin
    PesquisaBairro;
end;

procedure Tfrm_cad_cliente_T6.bPesqZonaClick(Sender: TObject);
begin
   PesquisaZona;
end;

procedure Tfrm_cad_cliente_T6.bSMCClick(Sender: TObject);
begin
   if not DadosCorretos then
      exit;

   if not Gravar_Cliente then
     exit;

   Frm_cad_cliente_SMC_T35 := TFrm_cad_cliente_SMC_T35.Create(nil);
   Cliente_T35.Codigo := Cliente.Codigo;
   Cliente_T35.Abrir;
   Frm_cad_cliente_SMC_T35.ShowModal;
   Frm_cad_cliente_SMC_T35.Free;
   Cliente.Abrir;
     //Cliente.Detalhes.Contador  := Cliente_T35.Detalhes.Contador;
     //Cliente.Detalhes.Consultor := Cliente_T35.Detalhes.Consultor;
     //Cliente.Gravar;
     //Cliente_T35.Free;
end;

procedure Tfrm_cad_cliente_T6.btDetalhesBloqueioClick(Sender: TObject);
begin
    if trim(edCodigo.Text) = '' then
       exit;

    // Mostra detalhes do bloqueio...
    // Data, hora, usuário e estação onde ocorreu o bloqueio do cliente
    // ----------------------------------------------------------------------------
    frmCLIENTE_HISTORICO_BLOQUEIOS_CHB_T17 :=  TfrmCLIENTE_HISTORICO_BLOQUEIOS_CHB_T17.Create(Self);
    with frmCLIENTE_HISTORICO_BLOQUEIOS_CHB_T17.sql_CLIENTE_HISTORICO_BLOQUEIOS_CHB do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT *                               ');
      Sql.Add('  FROM CLIENTE_HISTORICO_BLOQUEIOS_CHB ');
      Sql.Add(' WHERE CHB_CLIENTE = :CHB_CLIENTE      ');
      Sql.Add(' ORDER BY  CHB_DTEVENTO DESC, CHB_HREVENTO DESC ');
      ParamByName('CHB_CLIENTE').AsString := edCODIGO.text;
      Open;
    end;
    frmCLIENTE_HISTORICO_BLOQUEIOS_CHB_T17.ShowModal;
    frmCLIENTE_HISTORICO_BLOQUEIOS_CHB_T17.Free;
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

   if not FormataIE then
   begin
      edIE.SetFocus;
      exit;
   end;

   result := true;
end;

function Tfrm_cad_cliente_T6.FormataIE: Boolean;
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

procedure Tfrm_cad_cliente_T6.edAtividadeCodigoExit(Sender: TObject);
begin
  TrazerAtividade;
end;

procedure Tfrm_cad_cliente_T6.edBairroExit(Sender: TObject);
begin
   if not SelectBairro(edBairro.Text,edBairroDescricao) then
   begin
      Avisos.Avisar('Bairro inexistente...');
      edBairro.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_cliente_T6.edCEPExit(Sender: TObject);
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

procedure Tfrm_cad_cliente_T6.edCEPKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_cliente_T6.edCidadeExit(Sender: TObject);
begin
   TrataCidade;
end;

procedure Tfrm_cad_cliente_T6.edCNPJEnter(Sender: TObject);
begin
   (Sender as TEdit).Text := SoNumerosOuISENTO((Sender as TEdit).Text);
end;

procedure Tfrm_cad_cliente_T6.edCNPJExit(Sender: TObject);
begin
   (Sender as TEdit).Text := Trim((Sender as TEdit).Text);

   if (Sender as TEdit).Text = '' then
      exit;

   if not fCNPJValido((Sender as TEdit)) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;

   if Existe_Outro_CLIENTE_Com_Este_CNPJ((Sender as TEdit).Text,edCodigo.Text) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;

   if trim(edRazaoSocial.text) = '' then
      pesquisar_CNPJ_na_SEFAZ;
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
   if not fCPFValido((Sender as TEdit)) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end;

   if Existe_Outro_CLIENTE_Com_Este_CPF((Sender as TEdit).Text,edCodigo.Text) then
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
   if DataNoFuturo((Sender as TMaskEdit)) then
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
    SelectMunicipio(edEnderecoMunicipioIBGE.text,edCidade);
end;

function Tfrm_cad_cliente_T6.SelectMunicipio(pMunicipio:String;pMunicipioNome:TEdit):Boolean;
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

procedure Tfrm_cad_cliente_T6.edIEExit(Sender: TObject);
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
   if Existe_Outro_CLIENTE_Com_Esta_IE((Sender as TEdit).Text,edCodigo.Text) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end
end;

procedure Tfrm_cad_cliente_T6.edIEKeyPress(Sender: TObject; var Key: Char);
begin
   if UpperCase(key) = 'I' then
   begin
      key:=#0;
      (Sender as TEdit).Text := 'ISENTO';
   end;
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
//   if not PesquisaF1.ExisteCodigo('ZONA_ZON',edZona.Text) then

   if not SelectZona(edZona.Text,edZonaDescricao) then
   begin
      Avisos.Avisar('Zona inexistente...');
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

procedure Tfrm_cad_cliente_T6.edNumeroKeyPress(Sender: TObject; var Key: Char);
begin
     key := fLetrasENumeros(key);
end;

procedure Tfrm_cad_cliente_T6.edRegiaoExit(Sender: TObject);
begin
   if not SelectRegiao(edRegiao.Text,edRegiaoDescricao) then
   begin
      Avisos.Avisar('Região inexistente...');
      edRegiao.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_cliente_T6.edRGExit(Sender: TObject);
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
   if Existe_Outro_CLIENTE_Com_Este_RG((Sender as TEdit).Text,edCodigo.Text) then
   begin
      (Sender as TEdit).SetFocus;
      exit;
   end
end;

procedure Tfrm_cad_cliente_T6.edRG_DataEmissaoExit(Sender: TObject);
begin
   if DataNoFuturo((Sender as TMaskEdit)) then
      (Sender as TEdit).SetFocus;
end;

procedure Tfrm_cad_cliente_T6.PesquisaAtividade;
begin

    if fPesquisarAtividade(edAtividadeCodigo,edAtividadeNome) then
       edAtividadeCodigoExit(nil)
    else
       edAtividadeCodigo.SetFocus;
{
    FRM_cad_ramo_atividade_T9 := TFRM_cad_ramo_atividade_T9.Create(nil);
    FRM_cad_ramo_atividade_T9.showmodal;
    edAtividadeCodigo.TEXT := vFRM_cad_ramo_atividade;
    FRM_cad_ramo_atividade_T9.Free;
    edAtividadeCodigo.SetFocus;
    edAtividadeCodigoExit(nil);
 }
end;

procedure Tfrm_cad_cliente_T6.PesquisaBairro;
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

procedure Tfrm_cad_cliente_T6.PesquisaMunicipio;
begin
    Frm_Municipio_T5 := TFrm_Municipio_T5.Create(nil);
    Frm_Municipio_T5.Edit1.Text := Empresa.EnderecoMunicipio;
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
      //rgStatus.SetFocus;
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
      //rgStatus.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_cliente_T6.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(vMemoLocal);
   Cliente.Free;
end;

procedure Tfrm_cad_cliente_T6.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   //CanClose := vPodeFechar;
end;

procedure Tfrm_cad_cliente_T6.FormCreate(Sender: TObject);
begin
   try
     if vMemoLocal = nil then
        vMemoLocal:=TMemo.Create(frm_cad_cliente_T6)
     else
     begin
        vMemoLocal.Free;
        vMemoLocal:=TMemo.Create(frm_cad_cliente_T6);
     end;
   except
     vMemoLocal.Free;
     try
        vMemoLocal:=TMemo.Create(frm_cad_cliente_T6);
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
        if (not mmObservacoes.focused) then
        begin
          Key := #0;
          Perform(WM_NEXTDLGCTL, 0, 0);
          exit;
        end;
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

function Tfrm_cad_cliente_T6.Gravar_Cliente: Boolean;
var Lista : TStringList;
    i     : integer;
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
              RG             := '';
              RG_OrgaoEmissor:= '';
              RG_DataEmissao := '  /  /  ';
              DataNascimento := '  /  /  ';
              Sexo           := -1;
           end;
           with Cliente.Detalhes.PessoaJuridica do
           begin
              CNPJ           := edCNPJ.Text;
              IE             := edIE.Text;
           end;

        end;
        Cliente.Status                        := IntToStatusCadastral(rgStatus.ItemIndex);
        Cliente.Detalhes.TipoPessoa           := StringToTipoPessoa(fTipoPessoa_JF);
        if rgStatus.ItemIndex = -1 then
           rgStatus.ItemIndex := 0;

        if rgStatus.ItemIndex = 1 then
           Cliente.Alteracao.DataBloqueio     := sDataServidor
        else
           Cliente.Alteracao.DataBloqueio     := '  /  /  ';
        if rgStatus.ItemIndex = 2 then
           Cliente.Alteracao.DataInativo    := sDataServidor
        else
           Cliente.Alteracao.DataInativo    := '  /  /  ';


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


        Lista := TStringList.Create;
        for i := 0 to vMemoLocal.lines.count-1 do
            Lista.Add(vMemoLocal.lines[i]);

        Cliente.Observacao                    := Lista;
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

procedure Tfrm_cad_cliente_T6.mmObservacoesClick(Sender: TObject);
begin
   vMemoLocal.Text := mmObservacoes.text;
   MostrarMemo(vMemoLocal);
   mmObservacoes.text :=vMemoLocal.Text;
end;

procedure Tfrm_cad_cliente_T6.Preencher_Campos_da_Tela;
begin
   Limpar_os_campos_da_Tela(frm_cad_cliente_T6);

   edCodigo.Text      := Cliente.Codigo;
   rgStatus.ItemIndex := StatusCadastralToInt(Cliente.Status);

   Preencher_Dados_Pessoa;
   Preencher_Dados_Comuns;
   FormataIE;
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

procedure Tfrm_cad_cliente_T6.Preencher_Dados_Comuns;
begin
   edAtividadeCodigo.Text             := Cliente.Detalhes.RamoAtividade;
   TrazerAtividade;
   Preencher_Endereco;
   Preencher_Contato;
   Preencher_Historicos;
   Preencher_Observacoes;
end;

procedure Tfrm_cad_cliente_T6.Preencher_Dados_Pessoa;
begin
   if Cliente.Detalhes.TipoPessoa = tpFisica then
      Preencher_Dados_Pessoa_Fisica
   else
      Preencher_Dados_Pessoa_Juridica;
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
   edCNPJ.Text                := Cliente.Detalhes.PessoaJuridica.CNPJ;
   edIE.Text                  := Cliente.Detalhes.PessoaJuridica.IE;
   edNomeFantasia.Text        := Cliente.NomeFantasia;
   edRazaoSocial.Text         := Cliente.RazaoSocial;
end;

procedure Tfrm_cad_cliente_T6.Preencher_Endereco;
begin
   edRegiao.Text                      := Cliente.Detalhes.Regiao;
   edZona.Text                        := Cliente.Detalhes.Zona;
   edRua.Text                         := Cliente.Detalhes.Endereco.Rua;
   edNumero.Text                      := Cliente.Detalhes.Endereco.Numero;
   edBairro.Text                      := Cliente.Detalhes.Endereco.Bairro;
   edComplemento.Text                 := Cliente.Detalhes.Endereco.Complemento;
   edEnderecoMunicipioIBGE.Text       := Cliente.Detalhes.Endereco.Cidade;
   edCEP.Text                         := Cliente.Detalhes.Endereco.CEP;

   SelectBairro(edBairro.Text,edBairroDescricao);
   SelectRegiao(edRegiao.Text,edRegiaoDescricao);
   SelectZona(edZona.Text,edZonaDescricao);
   SelectMunicipio(edEnderecoMunicipioIBGE.Text,edCidade);
end;

procedure Tfrm_cad_cliente_T6.Preencher_Historicos;
begin
   edDataCadastro.Text := Cliente.Detalhes.DataCadastroString;
   edDataBloqueio.Text := Cliente.Alteracao.DataBloqueio;
   edDataInativo.Text  := Cliente.Alteracao.DataInativo;
   edUSU.Text          := Cliente.Alteracao.Usuario;
   edDT.Text           := Cliente.Alteracao.Data;
   edHR.Text           := Cliente.Alteracao.Hora;
   edEstacao.Text      := Cliente.Alteracao.Estacao;
end;

procedure Tfrm_cad_cliente_T6.Preencher_Observacoes;
var i     : Integer;
  ScrollMessage: TWMVScroll;
begin
   mmObservacoes.lines.clear;
   for i := 0 to Cliente.Observacao.count-1 do
       mmObservacoes.lines.add(Cliente.Observacao[i]);

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

procedure Tfrm_cad_cliente_T6.Preencher_Tela_Com_Dados_da_Consulta_CNPJ;
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

procedure Tfrm_cad_cliente_T6.Preparar_Campos_da_Tela;
begin
   edCodigo.MaxLength          := 10;

   edNome.MaxLength            := 50;
   edRazaoSocial.MaxLength     := 50;

   edCPF.MaxLength             := 11;
   edRG.MaxLength              := 20;
   edAtividadeCodigo.MaxLength := 10;

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

   bSMC.Visible := UniSystem;

end;

procedure Tfrm_cad_cliente_T6.TrataCidade;
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

procedure Tfrm_cad_cliente_T6.TrazerAtividade;
begin
{  if edAtividadeCodigo.text = '' then
     exit;

  if not PesquisaF1.ExisteCodigo('RAMOATIVIDADE_RAMO', edAtividadeCodigo.text) then
  Begin
     ShowMessage('Ramo de Atividade inexistente...');
     edAtividadeCodigo.SetFocus;
     Exit;
  End;
  edAtividadeNome.Text := PesquisaF1.Descricao;

}
  edAtividadeNome.text     := '';
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
     Avisos.Avisar('Ramo de Atividade inexistente...');
     edAtividadeCodigo.SetFocus;
     Exit;
  End;
  edAtividadeNome.Text := dm.Query1.FieldByName('RAMO_DESCRICAO').AsString;
end;


{ ESTAVA NO SMS LIGHT ORIGINAL COM TITULO "SINTEGRA"
  begin
    ShellExecute(GetDesktopWindow, 'open',
      pchar('https://portalcontribuinte.sefin.ro.gov.br/Publico/parametropublica.jsp'),
      nil, nil, sw_ShowNormal);
  end;
}
end.
