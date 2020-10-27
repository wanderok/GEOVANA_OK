
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
    edDTBLOQUEIO: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label16: TLabel;
    Label10: TLabel;
    edCodigo: TEdit;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    edUSUALTEROU: TEdit;
    edDTALTEROU: TMaskEdit;
    edHRALTEROU: TEdit;
    edMAQALTEROU: TMaskEdit;
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
    cxButton5: TcxButton;
    btn_cep: TcxButton;
    cxButton4: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton21: TcxButton;
    cxButton28: TcxButton;
    GroupBox3: TGroupBox;
    GroupBox8: TGroupBox;
    Edit20: TEdit;
    Edit18: TEdit;
    Edit3: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    rgStatus: TRadioGroup;
    Label3: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    lbNomeDaTela: TLabel;
    edEndereco: TEdit;
    edCEP: TEdit;
    Edit6: TEdit;
    Edit9: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit19: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Label1: TLabel;
    Edit4: TEdit;
    cxButton2: TcxButton;
    Edit23: TEdit;
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
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
  consulta_T7,
  cad_ramo_atividade, cad_zona, cad_regiao, cad_bairro;

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

procedure Tfrm_cad_cliente_T6.cxButton2Click(Sender: TObject);
begin
    FRM_cad_ramo_atividade := TFRM_cad_ramo_atividade.Create(nil);
    FRM_cad_ramo_atividade.showmodal;
end;

procedure Tfrm_cad_cliente_T6.cxButton4Click(Sender: TObject);
begin
    Frm_regiao := TFrm_regiao.Create(nil);
    Frm_regiao.showmodal;
end;

procedure Tfrm_cad_cliente_T6.cxButton5Click(Sender: TObject);
begin
    frm_cad_bairro := Tfrm_cad_bairro.Create(nil);
    frm_cad_bairro.showmodal;
end;

procedure Tfrm_cad_cliente_T6.cxButton7Click(Sender: TObject);
begin
    FRM_cad_zona := TFRM_cad_zona.Create(nil);
    FRM_cad_zona.showmodal;
end;


procedure Tfrm_cad_cliente_T6.cxButton8Click(Sender: TObject);
begin
   Consultar;
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

procedure Tfrm_cad_cliente_T6.cxButton9Click(Sender: TObject);
begin
    FRM_cad_ramo_atividade := TFRM_cad_ramo_atividade.Create(nil);
    FRM_cad_ramo_atividade.showmodal;

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

procedure Tfrm_cad_cliente_T6.edCNPJExit(Sender: TObject);
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
   if edCPF.Text = '' then
      exit;
   edCPF.Text :=Trim(edCPF.Text);
   if not frmValidadorDeDocumentos.CPF_Valido(edCPF.Text) then
   begin
      edCPF.SetFocus;
      exit;
   end;
   edCPF.Text := vVDD_DocumentoFormatado;
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
        Cliente.Status                      := IntToStatusCadastral(rgStatus.ItemIndex);
        Cliente.Detalhes.TipoPessoa         := StringToTipoPessoa(fTipoPessoa_JF);
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
//
end;

procedure Tfrm_cad_cliente_T6.Preencher_Dados_Pessoa;
begin
   edCodigo.Text                      := Cliente.Codigo;
   rgStatus.ItemIndex                 := StatusCadastralToInt(Cliente.Status);
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
end;

procedure Tfrm_cad_cliente_T6.Preparar_Campos_da_Tela;
begin
   edCodigo.MaxLength      := 10;
   edNome.MaxLength        := 50;
   edRazaoSocial.MaxLength := 50;

   edCPF.MaxLength    := 11;
   edRG.MaxLength     := 20;


end;

end.
