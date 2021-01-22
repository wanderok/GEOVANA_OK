unit cad_ContaContabil_T50;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, cxButtons, ACBrBase, ACBrEnterTab, Vcl.ExtCtrls,

  Classe_ContaContabil, Classe_Avisos;

type
  Tfrm_Cad_ContaContabil_T50 = class(TForm)
    bConsulta: TcxButton;
    bGravar: TcxButton;
    bSair: TcxButton;
    Label5: TLabel;
    Label1: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    ACBrEnterTab1: TACBrEnterTab;
    Label2: TLabel;
    edReduzido: TEdit;
    rgTipo: TRadioGroup;
    rgNatureza: TRadioGroup;
    rgStatus: TRadioGroup;
    Label3: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    procedure bSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure bGravarClick(Sender: TObject);
    procedure bConsultaClick(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure MostrarDados;
    function DadosCorretos:Boolean;
    procedure AtribuirDados;
    procedure GravarDados;
    procedure LimparTela;
    procedure Consultar;

  public
    { Public declarations }
  end;

var
  frm_Cad_ContaContabil_T50: Tfrm_Cad_ContaContabil_T50;
  Conta : TContaContabil;

implementation

{$R *.dfm}

uses DadosSMC, FuncoesSMC, ConsultaPlanoDeContas_T51;

procedure Tfrm_Cad_ContaContabil_T50.AtribuirDados;
begin
   Conta.Codigo   := edCodigo.Text;
   Conta.Reduzido := edReduzido.Text;
   Conta.Nome     := edNome.Text;
   Conta.Tipo     := rgTipo.ItemIndex;
   Conta.Natureza := rgNatureza.ItemIndex;
   Conta.Ativo    := (rgStatus.ItemIndex <> 1);
end;

procedure Tfrm_Cad_ContaContabil_T50.bConsultaClick(Sender: TObject);
begin
   Consultar;
end;

procedure Tfrm_Cad_ContaContabil_T50.bGravarClick(Sender: TObject);
begin
   if not DadosCorretos then
      exit;

   AtribuirDados;
   GravarDados;
   LimparTela;
   edCodigo.SetFocus;
end;

procedure Tfrm_Cad_ContaContabil_T50.bSairClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Cad_ContaContabil_T50.Consultar;
begin
   frm_ConsultaPlanoDeContas_T51:= Tfrm_ConsultaPlanoDeContas_T51.Create(nil);
   frm_ConsultaPlanoDeContas_T51.ShowModal;
   frm_ConsultaPlanoDeContas_T51.Free;
end;

function Tfrm_Cad_ContaContabil_T50.DadosCorretos: Boolean;
begin
   result := false;

   edCODIGO.Tag               := Campo_Obrigatorio;
   edNOME.Tag                 := Campo_Obrigatorio;

   if NaoPreencheuCamposObrigatoriosOuImportantes(frm_Cad_ContaContabil_T50) then
      exit;

   if rgTipo.Itemindex = -1 then
   begin
     Avisos.Avisar('Informe o tipo');
     rgTipo.SetFocus;
     exit;
   end;

   if rgNatureza.Itemindex = -1 then
   begin
     Avisos.Avisar('Informe a Natureza');
     rgNatureza.SetFocus;
     exit;
   end;

   result := true;
end;

procedure Tfrm_Cad_ContaContabil_T50.edCodigoExit(Sender: TObject);
begin
   if bConsulta.focused then exit;
   if bSair.focused     then exit;

   if edCodigo.text = '' then
   begin
     Avisos.Avisar('Informe o Código');
     edCodigo.Setfocus;
     exit;
   end;
   Conta.Codigo := edCodigo.text;
   if Conta.Existe then
      MostrarDados;

end;

procedure Tfrm_Cad_ContaContabil_T50.edCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_F1 then
     Consultar;
end;

procedure Tfrm_Cad_ContaContabil_T50.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if Conta <> nil then
      FreeAndNil(Conta);
end;

procedure Tfrm_Cad_ContaContabil_T50.FormCreate(Sender: TObject);
begin
   Conta := TContaContabil.Create;
end;

procedure Tfrm_Cad_ContaContabil_T50.GravarDados;
begin
   Conta.Gravar;
end;

procedure Tfrm_Cad_ContaContabil_T50.LimparTela;
begin
   Limpar_os_campos_da_Tela(frm_Cad_ContaContabil_T50);
end;

procedure Tfrm_Cad_ContaContabil_T50.MostrarDados;
begin
   edCodigo.Text        := Conta.Codigo;
   edReduzido.Text      := Conta.Reduzido;
   edNome.Text          := Conta.Nome;
   rgTipo.ItemIndex     := Conta.Tipo;
   rgNatureza.ItemIndex := Conta.Natureza;
   if Conta.Ativo then
      rgStatus.ItemIndex:= 0
   else
      rgStatus.ItemIndex:= 1;
end;

end.
