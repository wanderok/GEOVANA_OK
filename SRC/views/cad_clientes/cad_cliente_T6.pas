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
    PageControl1: TPageControl;
    tsPessoaFisica: TTabSheet;
    Label25: TLabel;
    Label6: TLabel;
    Label30: TLabel;
    Label28: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    edRG: TEdit;
    edORGAO_EMISSOR: TEdit;
    edNOME: TEdit;
    edCPF: TMaskEdit;
    edDATA_NASCIMENTO: TMaskEdit;
    cbSexo: TComboBox;
    MaskEdit4: TMaskEdit;
    tsPessoaJuridica: TTabSheet;
    lbl3: TLabel;
    lbl7: TLabel;
    lbl4: TLabel;
    lbl2: TLabel;
    edCNPJ: TMaskEdit;
    edNomeFantasia: TEdit;
    edRazaoSocial: TEdit;
    edINSCRICAO_ESTADUAL_PJ: TEdit;
    cxButton3: TcxButton;
    cxButton1: TcxButton;
    grpEndereco: TGroupBox;
    Label22: TLabel;
    Label9: TLabel;
    Label26: TLabel;
    DBEdit76: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit77: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit79: TDBEdit;
    cxButton5: TcxButton;
    DBEdit78: TDBEdit;
    btn_cep: TcxButton;
    DBEdit2: TDBEdit;
    cxButton4: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
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
    Edit4: TEdit;
    cxButton2: TcxButton;
    Label1: TLabel;
    cxButton9: TcxButton;
    Label2: TLabel;
    Edit5: TEdit;
    rgStatus: TRadioGroup;
    Label3: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    lbNomeDaTela: TLabel;
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
    procedure PrepararCamposdaTela;
    procedure cxButton21Click(Sender: TObject);
    function DadosCorretos:Boolean;
    function Gravar_Cliente:Boolean;
    procedure Pesquisar;
    procedure Consultar;
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
begin
   result := false;

   if NaoPreencheuCamposObrigatoriosOuImportantes(frm_cad_cliente_T6) then
      exit;

   result := true;
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

function Tfrm_cad_cliente_T6.Gravar_Cliente: Boolean;
begin
    Result := False;
    try
        Cliente.Codigo                      := edCodigo.Text;
        Cliente.NomeFantasia                := edNome.Text;  //edFantasia.Text;
        Cliente.RazaoSocial                 := edRazaoSocial.Text;
        //Cliente.Detalhes.
        result := Cliente.Gravar;
    Except

    end;
end;

procedure Tfrm_cad_cliente_T6.Inicio;
begin
   InicioPadraoDeTodasAsTelasDoSistema;
   PrepararCamposdaTela;
   Limpar_os_campos_da_Tela(frm_cad_cliente_T6);
   Cliente := TCliente.Create;
   edCodigo.SetFocus;
end;

procedure Tfrm_cad_cliente_T6.Preencher_Campos_da_Tela;
begin
   Limpar_os_campos_da_Tela(frm_cad_cliente_T6);

   edCodigo.Text                      := Cliente.Codigo;
   rgStatus.ItemIndex                 := StatusCadastralToInt(Cliente.Status);
   edNome.Text                        := Cliente.NomeFantasia;
   edNomeFantasia.Text                := Cliente.NomeFantasia;
   edRazaoSocial.Text                 := Cliente.RazaoSocial;
   edDataCadastro.Text                := Cliente.Detalhes.DataCadastroString;
end;

procedure Tfrm_cad_cliente_T6.PrepararCamposdaTela;
begin
//
end;

end.
