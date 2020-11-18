{ v 13.10.20 09:30am }
unit cad_colaborador_T20;

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

  Classe_Colaborador, ACBrBase, ACBrSocket, ACBrCEP, Vcl.Grids;

type
  Tfrm_cad_colaborador_T20 = class(TForm)
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
    bComissoes: TcxButton;
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
    function Gravar_Colaborador:Boolean;
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
    procedure bComissoesClick(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frm_cad_colaborador_T20: Tfrm_cad_colaborador_T20;
  Colaborador       : TColaborador;
  vPodeFechar       : Boolean;
  vMemoLocal        : TMemo;

implementation

uses
  Funcoes,
  TiposDeDados,
  ValidadorDeDocumentos,
  U_Municipio_T5,
  consulta_T7,
  auditoria_T10,
  cad_regiao_T11,
  cad_zona_T12,
  ConsultaCNPJ_T13,
  ConsultaCPF_T14,
  COLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22,
  Dados,
  Classe_Nuvem,
  cad_comissoes;

{$R *.dfm}

procedure Tfrm_cad_colaborador_T20.cxButton1Click(Sender: TObject);
begin
    pesquisar_CNPJ_na_SEFAZ;
end;

procedure Tfrm_cad_colaborador_T20.pesquisar_CNPJ_na_SEFAZ;
begin
    frmConsultaCNPJ_T13 := TfrmConsultaCNPJ_T13.CREATE(Application);
    frmConsultaCNPJ_T13.EditCNPJ.Text := edCNPJ.Text;
    frmConsultaCNPJ_T13.ShowModal;
    Preencher_Tela_Com_Dados_da_Consulta_CNPJ;
    frmConsultaCNPJ_T13.Free;
end;

procedure Tfrm_cad_colaborador_T20.cxButton21Click(Sender: TObject);
var vNuvem: TNuvem;
begin
   if not DadosCorretos then
      exit;

   if not Gravar_Colaborador then
     exit;
   {
   vNuvem:= TNuvem.Create;
   vNuvem.uploadColaborador(Colaborador);
   FreeAndNil(vNuvem);
   }
   Colaborador.Free;
   Inicio;
end;

procedure Tfrm_cad_colaborador_T20.cxButton28Click(Sender: TObject);
begin
   vPodeFechar:=True;
   Close;
end;

procedure Tfrm_cad_colaborador_T20.cxButton2Click(Sender: TObject);
begin
   pesquisar_CPF_na_SEFAZ;
end;

procedure Tfrm_cad_colaborador_T20.pesquisar_CPF_na_SEFAZ;
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

procedure Tfrm_cad_colaborador_T20.bPesqMunicipioClick(Sender: TObject);
begin
   PesquisaMunicipio;
end;

procedure Tfrm_cad_colaborador_T20.cxButton4Click(Sender: TObject);
begin
    PesquisaRegiao;
end;

procedure Tfrm_cad_colaborador_T20.cxButton8Click(Sender: TObject);
begin
  Consultar;
end;

procedure Tfrm_cad_colaborador_T20.bComissoesClick(Sender: TObject);
begin
   if not DadosCorretos then
      exit;
   if not Gravar_Colaborador then
      exit;

   frm_cad_comissoes:= Tfrm_cad_comissoes.Create(nil);

   Comissao.TipoComissao := tcColaborador;
   Comissao.Codigo       := Colaborador.Codigo;

   frm_cad_comissoes.ShowModal;
   frm_cad_comissoes.Free;
end;

procedure Tfrm_cad_colaborador_T20.PesquisaRegiao;
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

procedure Tfrm_cad_colaborador_T20.PesquisaZona;
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

procedure Tfrm_cad_colaborador_T20.ACBrCEP1BuscaEfetuada(Sender: TObject);
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

procedure Tfrm_cad_colaborador_T20.bHistoricoAlteracoesClick(Sender: TObject);
begin
   if trim(edCodigo.Text) = '' then
      exit;

   frm_auditoria_T10 := Tfrm_auditoria_T10.Create(nil);
   with frm_auditoria_T10.FDQuery1 do
   begin
     Close;
     SQL.Clear;
     SQL.Add('select * from log_log                  ');
     SQL.Add(' where log_historico like :Colaborador ');
     ParamByName('Colaborador').AsString := '%' + 'colaborador ' + edCodigo.Text + '%';
     SQL.Add('ORDER BY LOG_DATA DESC, LOG_HORA DESC  ');
     Open;
   end;
   vPesquisaExterna := True; // Informa a frm_autitoria que ela não está sendo chamada
                             // pelo menu e sim por um rotina externa (ao menu)
   frm_auditoria_T10.showmodal;
   frm_auditoria_T10.Free;
end;

procedure Tfrm_cad_colaborador_T20.bPesqBairroClick(Sender: TObject);
begin
    PesquisaBairro;
end;

procedure Tfrm_cad_colaborador_T20.bPesqZonaClick(Sender: TObject);
begin
   PesquisaZona;
end;

procedure Tfrm_cad_colaborador_T20.btDetalhesBloqueioClick(Sender: TObject);
begin
    if trim(edCodigo.Text) = '' then
       exit;

    // Mostra detalhes do bloqueio...
    // Data, hora, usuário e estação onde ocorreu o bloqueio do colaborador
    // ----------------------------------------------------------------------------
    frmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22 :=  TfrmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22.Create(Self);
    with frmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22.sql_COLABORADOR_HISTORICO_BLOQUEIOS_COLHB do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT *                                            ');
      Sql.Add('  FROM COLABORADOR_HISTORICO_BLOQUEIOS_COLHB        ');
      Sql.Add(' WHERE COLHB_COLABORADOR = :COLHB_COLABORADOR       ');
      Sql.Add(' ORDER BY  COLHB_DTEVENTO DESC, COLHB_HREVENTO DESC ');
      ParamByName('COLHB_COLABORADOR').AsString := edCODIGO.text;
      Open;
    end;
    frmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22.ShowModal;
    frmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22.Free;
end;

procedure Tfrm_cad_colaborador_T20.Consultar;
begin
    frm_consulta_T7 := Tfrm_consulta_T7.Create(nil);
    frm_consulta_T7.rgConsultar.itemindex := 5; //Colaborador
    frm_consulta_T7.showmodal;
    edCodigo.Text:= vfrm_consulta_T7_Codigo;
    frm_consulta_T7.Free;
    Pesquisar;
end;

function Tfrm_cad_colaborador_T20.DadosCorretos: Boolean;
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

   if NaoPreencheuCamposObrigatoriosOuImportantes(frm_cad_colaborador_T20) then
      exit;

   if not FormataIE then
   begin
      edIE.SetFocus;
      exit;
   end;

   result := true;
end;

function Tfrm_cad_colaborador_T20.FormataIE: Boolean;
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

procedure Tfrm_cad_colaborador_T20.edBairroExit(Sender: TObject);
begin
   if not SelectBairro(edBairro.Text,edBairroDescricao) then
   begin
      Avisos.Avisar('Bairro inexistente...');
      edBairro.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_colaborador_T20.edCEPExit(Sender: TObject);
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

procedure Tfrm_cad_colaborador_T20.edCEPKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_colaborador_T20.edCidadeExit(Sender: TObject);
begin
   TrataCidade;
end;

procedure Tfrm_cad_colaborador_T20.edCNPJEnter(Sender: TObject);
begin
   (Sender as TEdit).Text := SoNumerosOuISENTO((Sender as TEdit).Text);
end;

procedure Tfrm_cad_colaborador_T20.edCNPJExit(Sender: TObject);
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

procedure Tfrm_cad_colaborador_T20.edCNPJKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_colaborador_T20.edCodigoExit(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_cad_colaborador_T20.edCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_F1 then
     Consultar;
end;

procedure Tfrm_cad_colaborador_T20.edCPFExit(Sender: TObject);
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

procedure Tfrm_cad_colaborador_T20.edCPFKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_colaborador_T20.edDataNascimentoExit(Sender: TObject);
begin
   if DataNoFuturo((Sender as TMaskEdit)) then
      (Sender as TEdit).SetFocus;
   if edNome.Text = '' then
      pesquisar_CPF_na_SEFAZ;
end;

procedure Tfrm_cad_colaborador_T20.edEmail1Exit(Sender: TObject);
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

procedure Tfrm_cad_colaborador_T20.edEnderecoMunicipioIBGEExit(Sender: TObject);
begin
    SelectMunicipio(edEnderecoMunicipioIBGE.text,edCidade);
end;

function Tfrm_cad_colaborador_T20.SelectMunicipio(pMunicipio:String;pMunicipioNome:TEdit):Boolean;
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

procedure Tfrm_cad_colaborador_T20.edIEExit(Sender: TObject);
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

procedure Tfrm_cad_colaborador_T20.edIEKeyPress(Sender: TObject; var Key: Char);
begin
   if UpperCase(key) = 'I' then
   begin
      key:=#0;
      (Sender as TEdit).Text := 'ISENTO';
   end;
end;

procedure Tfrm_cad_colaborador_T20.edCelKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_colaborador_T20.edFone1Exit(Sender: TObject);
begin
   if not TelValido((Sender as TEdit)) then
      (Sender as TEdit).SetFocus;
end;

procedure Tfrm_cad_colaborador_T20.edFone2KeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_colaborador_T20.edWhatsAppKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure Tfrm_cad_colaborador_T20.edZonaExit(Sender: TObject);
begin
//   if not PesquisaF1.ExisteCodigo('ZONA_ZON',edZona.Text) then

   if not SelectZona(edZona.Text,edZonaDescricao) then
   begin
      Avisos.Avisar('Zona inexistente...');
      edZona.SetFocus;
      exit;
   end
end;

procedure Tfrm_cad_colaborador_T20.edNOMEExit(Sender: TObject);
begin
   if Sender is TEdit then
   begin
      (Sender as TEdit).Text := fSemAcentos(Trim((Sender as TEdit).Text));
   end;
end;

procedure Tfrm_cad_colaborador_T20.edNOMEKeyPress(Sender: TObject; var Key: Char);
begin
   key := fSemAcentos(key);
end;

procedure Tfrm_cad_colaborador_T20.edNumeroKeyPress(Sender: TObject; var Key: Char);
begin
     key := fLetrasENumeros(key);
end;

procedure Tfrm_cad_colaborador_T20.edRegiaoExit(Sender: TObject);
begin
   if not SelectRegiao(edRegiao.Text,edRegiaoDescricao) then
   begin
      Avisos.Avisar('Região inexistente...');
      edRegiao.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_colaborador_T20.edRGExit(Sender: TObject);
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

procedure Tfrm_cad_colaborador_T20.edRG_DataEmissaoExit(Sender: TObject);
begin
   if DataNoFuturo((Sender as TMaskEdit)) then
      (Sender as TEdit).SetFocus;
end;

procedure Tfrm_cad_colaborador_T20.PesquisaBairro;
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

procedure Tfrm_cad_colaborador_T20.PesquisaMunicipio;
begin
    Frm_Municipio_T5 := TFrm_Municipio_T5.Create(nil);
    Frm_Municipio_T5.Edit1.Text := Empresa.EnderecoMunicipio;
    Frm_Municipio_T5.showmodal;
    edEnderecoMunicipioIBGE.TEXT := vFrm_Municipio;
    Frm_Municipio_T5.Free;
    edEnderecoMunicipioIBGE.SetFocus;
    edEnderecoMunicipioIBGEExit(nil);
end;

procedure Tfrm_cad_colaborador_T20.Pesquisar;
var vCodigo:String;
begin
   if edCodigo.Text = '' then
   begin
      Limpar_os_campos_da_Tela(frm_cad_colaborador_T20);
      //rgStatus.SetFocus;
      exit;
   end;
   Colaborador.Codigo := edCodigo.Text;
   Colaborador.Abrir;
   if Colaborador.Existe then
      Preencher_Campos_da_Tela
   else
   begin
      vCodigo := edCodigo.Text;
      Limpar_os_campos_da_Tela(frm_cad_colaborador_T20);
      edCodigo.Text := vCodigo;
      //rgStatus.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_colaborador_T20.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(vMemoLocal);
   Colaborador.Free;
end;

procedure Tfrm_cad_colaborador_T20.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := vPodeFechar;
end;

procedure Tfrm_cad_colaborador_T20.FormCreate(Sender: TObject);
begin
   try
     if vMemoLocal = nil then
        vMemoLocal:=TMemo.Create(frm_cad_colaborador_T20)
     else
     begin
        vMemoLocal.Free;
        vMemoLocal:=TMemo.Create(frm_cad_colaborador_T20);
     end;
   except
     vMemoLocal.Free;
     try
        vMemoLocal:=TMemo.Create(frm_cad_colaborador_T20);
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

procedure Tfrm_cad_colaborador_T20.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f1 Then
   begin
           if edEnderecoMunicipioIBGE.Focused then PesquisaMunicipio
      else if edZona.Focused                  then PesquisaZona
      else if edRegiao.Focused                then PesquisaRegiao;
   end;
end;

procedure Tfrm_cad_colaborador_T20.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrm_cad_colaborador_T20.FormShow(Sender: TObject);
begin
   Inicio;
end;

function Tfrm_cad_colaborador_T20.fPessoaFisica: Boolean;
begin
   result := (fTipoPessoa_JF = 'F');
end;

function Tfrm_cad_colaborador_T20.fPessoaJuridica: Boolean;
begin
   result := (fTipoPessoa_JF = 'J');
end;

function Tfrm_cad_colaborador_T20.fPreencheu_Algum_Campo_Pessoa_Fisica: Boolean;
begin
   Result := false;
   if (Trim(edNome.Text)            <> '') or
      (Trim(edCPF.Text)             <> '') or
      (Trim(edRG.Text)              <> '') or
      (Trim(edRG_OrgaoEmissor.Text) <> '') then Result := True;
end;

function Tfrm_cad_colaborador_T20.fPreencheu_Algum_Campo_Pessoa_Juridica: Boolean;
begin
   Result := false;
   if (Trim(edRazaoSocial.Text)     <> '') or
      (Trim(edNomeFantasia.Text)    <> '') or
      (Trim(edCNPJ.Text)            <> '') or
      (Trim(edIE.Text)              <> '') then Result := True;
end;

function Tfrm_cad_colaborador_T20.fTipoPessoa_JF: String;
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

function Tfrm_cad_colaborador_T20.Gravar_Colaborador: Boolean;
var Lista : TStringList;
    i     : integer;
begin
    Result := False;
    try
        Colaborador.Codigo                      := edCodigo.Text;
        if fPessoaFisica then
        begin
           Colaborador.NomeFantasia             := edNome.Text;
           Colaborador.RazaoSocial              := '';
           with Colaborador.Detalhes.PessoaFisica do
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
           Colaborador.NomeFantasia             := edNomeFantasia.Text;
           Colaborador.RazaoSocial              := edRazaoSocial.Text;
           with Colaborador.Detalhes.PessoaFisica do
           begin
              RG             := '';
              RG_OrgaoEmissor:= '';
              RG_DataEmissao := '  /  /  ';
              DataNascimento := '  /  /  ';
              Sexo           := -1;
           end;
           with Colaborador.Detalhes.PessoaJuridica do
           begin
              CNPJ           := edCNPJ.Text;
              IE             := edIE.Text;
           end;

        end;
        Colaborador.Status                        := IntToStatusCadastral(rgStatus.ItemIndex);
        Colaborador.Detalhes.TipoPessoa           := StringToTipoPessoa(fTipoPessoa_JF);
        if rgStatus.ItemIndex = -1 then
           rgStatus.ItemIndex := 0;

        if rgStatus.ItemIndex = 1 then
           Colaborador.Alteracao.DataBloqueio     := sDataServidor
        else
           Colaborador.Alteracao.DataBloqueio     := '  /  /  ';
        if rgStatus.ItemIndex = 2 then
           Colaborador.Alteracao.DataInativo    := sDataServidor
        else
           Colaborador.Alteracao.DataInativo    := '  /  /  ';

        Colaborador.Detalhes.Regiao               := edRegiao.Text;
        Colaborador.Detalhes.Zona                 := edZona.Text;
        Colaborador.Detalhes.Endereco.Rua         := edRua.Text;
        Colaborador.Detalhes.Endereco.Numero      := edNumero.Text;
        Colaborador.Detalhes.Endereco.Bairro      := edBairro.Text;
        Colaborador.Detalhes.Endereco.Complemento := edComplemento.Text;
        Colaborador.Detalhes.Endereco.Cidade      := edEnderecoMunicipioIBGE.Text;
        Colaborador.Detalhes.Endereco.CEP         := edCEP.Text;

        Colaborador.Detalhes.Contato.Fone1        := edFone1.Text;
        Colaborador.Detalhes.Contato.Fone2        := edFone2.Text;
        Colaborador.Detalhes.Contato.Nome         := edNomeContato.Text;
        Colaborador.Detalhes.Contato.Cel          := edCel.Text;
        Colaborador.Detalhes.Contato.WhatsApp     := edWhatsApp.Text;
        Colaborador.Detalhes.Contato.Email1       := edEmail1.Text;
        Colaborador.Detalhes.Contato.Email2       := edEmail2.Text;

        Lista := TStringList.Create;
        for i := 0 to vMemoLocal.lines.count-1 do
            Lista.Add(vMemoLocal.lines[i]);

        Colaborador.Observacao                    := Lista;
        result := Colaborador.Gravar;
    Except

    end;
end;

procedure Tfrm_cad_colaborador_T20.Inicio;
begin
   Preparar_Campos_da_Tela;
   Limpar_os_campos_da_Tela(frm_cad_colaborador_T20);
   Colaborador := TColaborador.Create;
   edCodigo.SetFocus;
end;

procedure Tfrm_cad_colaborador_T20.mmObservacoesClick(Sender: TObject);
begin
   vMemoLocal.Text := mmObservacoes.text;
   MostrarMemo(vMemoLocal);
   mmObservacoes.text :=vMemoLocal.Text;
end;

procedure Tfrm_cad_colaborador_T20.Preencher_Campos_da_Tela;
begin
   Limpar_os_campos_da_Tela(frm_cad_colaborador_T20);

   edCodigo.Text      := Colaborador.Codigo;
   rgStatus.ItemIndex := StatusCadastralToInt(Colaborador.Status);

   Preencher_Dados_Pessoa;
   Preencher_Dados_Comuns;
   FormataIE;
end;

procedure Tfrm_cad_colaborador_T20.Preencher_Contato;
begin
   edFone1.Text             := Colaborador.Detalhes.Contato.Fone1;
   edFone2.Text             := Colaborador.Detalhes.Contato.Fone2;
   edNomeContato.Text       := Colaborador.Detalhes.Contato.Nome;
   edCel.Text               := Colaborador.Detalhes.Contato.Cel;
   edWhatsApp.Text          := Colaborador.Detalhes.Contato.WhatsApp;
   edEmail1.Text            := Colaborador.Detalhes.Contato.Email1;
   edEmail2.Text            := Colaborador.Detalhes.Contato.Email2;
end;

procedure Tfrm_cad_colaborador_T20.Preencher_Dados_Comuns;
begin
   Preencher_Endereco;
   Preencher_Contato;
   Preencher_Historicos;
   Preencher_Observacoes;
end;

procedure Tfrm_cad_colaborador_T20.Preencher_Dados_Pessoa;
begin
   if Colaborador.Detalhes.TipoPessoa = tpFisica then
      Preencher_Dados_Pessoa_Fisica
   else
      Preencher_Dados_Pessoa_Juridica;
end;

procedure Tfrm_cad_colaborador_T20.Preencher_Dados_Pessoa_Fisica;
begin
   pgControlPessoa.ActivePage := tsPessoaFisica;
   edNome.Text                := Colaborador.NomeFantasia;
   edCPF.Text                 := Colaborador.Detalhes.PessoaFisica.CPF;
   edRG.Text                  := Colaborador.Detalhes.PessoaFisica.RG;
   edRG_OrgaoEmissor.Text     := Colaborador.Detalhes.PessoaFisica.RG_OrgaoEmissor;
   edRG_DataEmissao.Text      := Colaborador.Detalhes.PessoaFisica.RG_DataEmissao;
   edDataNascimento.Text      := Colaborador.Detalhes.PessoaFisica.DataNascimento;
   cbSexo.ItemIndex           := Colaborador.Detalhes.PessoaFisica.Sexo;
end;

procedure Tfrm_cad_colaborador_T20.Preencher_Dados_Pessoa_Juridica;
begin
   pgControlPessoa.ActivePage := tsPessoaJuridica;
   edCNPJ.Text                := Colaborador.Detalhes.PessoaJuridica.CNPJ;
   edIE.Text                  := Colaborador.Detalhes.PessoaJuridica.IE;
   edNomeFantasia.Text        := Colaborador.NomeFantasia;
   edRazaoSocial.Text         := Colaborador.RazaoSocial;
end;

procedure Tfrm_cad_colaborador_T20.Preencher_Endereco;
begin
   edRegiao.Text                      := Colaborador.Detalhes.Regiao;
   edZona.Text                        := Colaborador.Detalhes.Zona;
   edRua.Text                         := Colaborador.Detalhes.Endereco.Rua;
   edNumero.Text                      := Colaborador.Detalhes.Endereco.Numero;
   edBairro.Text                      := Colaborador.Detalhes.Endereco.Bairro;
   edComplemento.Text                 := Colaborador.Detalhes.Endereco.Complemento;
   edEnderecoMunicipioIBGE.Text       := Colaborador.Detalhes.Endereco.Cidade;
   edCEP.Text                         := Colaborador.Detalhes.Endereco.CEP;

   SelectBairro(edBairro.Text,edBairroDescricao);
   SelectRegiao(edRegiao.Text,edRegiaoDescricao);
   SelectZona(edZona.Text,edZonaDescricao);
   SelectMunicipio(edEnderecoMunicipioIBGE.Text,edCidade);
end;

procedure Tfrm_cad_colaborador_T20.Preencher_Historicos;
begin
   edDataCadastro.Text := Colaborador.Detalhes.DataCadastroString;
   edDataBloqueio.Text := Colaborador.Alteracao.DataBloqueio;
   edDataInativo.Text  := Colaborador.Alteracao.DataInativo;
   edUSU.Text          := Colaborador.Alteracao.Usuario;
   edDT.Text           := Colaborador.Alteracao.Data;
   edHR.Text           := Colaborador.Alteracao.Hora;
   edEstacao.Text      := Colaborador.Alteracao.Estacao;
end;

procedure Tfrm_cad_colaborador_T20.Preencher_Observacoes;
var i     : Integer;
  ScrollMessage: TWMVScroll;
begin
   mmObservacoes.lines.clear;
   for i := 0 to Colaborador.Observacao.count-1 do
       mmObservacoes.lines.add(Colaborador.Observacao[i]);

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

procedure Tfrm_cad_colaborador_T20.Preencher_Tela_Com_Dados_da_Consulta_CNPJ;
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

procedure Tfrm_cad_colaborador_T20.Preparar_Campos_da_Tela;
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

procedure Tfrm_cad_colaborador_T20.TrataCidade;
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
