unit cad_cliente_SMC_T35;

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
  dxSkinXmas2008Blue, cxButtons,

  Classe_Cliente,
  Classe_Contador,
  Classe_Consultor,

  ACBrBase, ACBrEnterTab;

type
  TFrm_cad_cliente_SMC_T35 = class(TForm)
    lbNomeDaTela: TLabel;
    Label1: TLabel;
    edContador: TEdit;
    bPesqRamoAtividade: TcxButton;
    edContadorNome: TEdit;
    Label2: TLabel;
    edConsultor: TEdit;
    cxButton1: TcxButton;
    edConsultorNome: TEdit;
    cxButton28: TcxButton;
    cxButton21: TcxButton;
    ACBrEnterTab1: TACBrEnterTab;
    procedure edContadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bPesqRamoAtividadeClick(Sender: TObject);
    procedure edConsultorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton28Click(Sender: TObject);
    procedure cxButton21Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edConsultorExit(Sender: TObject);
    procedure edContadorExit(Sender: TObject);
  private
    { Private declarations }
    procedure ConsultarContador;
    procedure PesquisarContador;
    procedure ConsultarConsultor;
    procedure PesquisarConsultor;

  public
    { Public declarations }
  end;

var
  Frm_cad_cliente_SMC_T35: TFrm_cad_cliente_SMC_T35;
  Contador    : TContador;
  Consultor   : TConsultor;
  Cliente_T35 : TCliente;

implementation

{$R *.dfm}

uses consulta_T7;

procedure TFrm_cad_cliente_SMC_T35.bPesqRamoAtividadeClick(Sender: TObject);
begin
   ConsultarContador;
end;

procedure TFrm_cad_cliente_SMC_T35.ConsultarConsultor;
begin
    frm_consulta_T7 := Tfrm_consulta_T7.Create(nil);
    frm_consulta_T7.rgConsultar.itemindex := 2; //Consultor
    frm_consulta_T7.showmodal;
    edConsultor.Text:= vfrm_consulta_T7_Codigo;
    frm_consulta_T7.Free;
    PesquisarConsultor;
end;

procedure TFrm_cad_cliente_SMC_T35.ConsultarContador;
begin
    frm_consulta_T7 := Tfrm_consulta_T7.Create(nil);
    frm_consulta_T7.rgConsultar.itemindex := 3; //Contador
    frm_consulta_T7.showmodal;
    edContador.Text:= vfrm_consulta_T7_Codigo;
    frm_consulta_T7.Free;
    PesquisarContador;
end;

procedure TFrm_cad_cliente_SMC_T35.cxButton21Click(Sender: TObject);
begin
   Cliente_T35.Detalhes.Contador  := edContador.Text;
   Cliente_T35.Detalhes.Consultor := edConsultor.Text;
   Cliente_T35.Gravar;
   close;
end;

procedure TFrm_cad_cliente_SMC_T35.cxButton28Click(Sender: TObject);
begin
   close;
end;

procedure TFrm_cad_cliente_SMC_T35.edConsultorExit(Sender: TObject);
begin
   PesquisarConsultor;
end;

procedure TFrm_cad_cliente_SMC_T35.edConsultorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_F1 then
     ConsultarConsultor;
end;

procedure TFrm_cad_cliente_SMC_T35.edContadorExit(Sender: TObject);
begin
   PesquisarContador;
end;

procedure TFrm_cad_cliente_SMC_T35.edContadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_F1 then
     ConsultarContador;
end;

procedure TFrm_cad_cliente_SMC_T35.FormCreate(Sender: TObject);
begin
   Cliente_T35 := TCliente.Create;
   Contador    := TContador.Create;
   Consultor   := TConsultor.Create;
end;

procedure TFrm_cad_cliente_SMC_T35.FormShow(Sender: TObject);
begin
   edContador.Text  := '';
   edConsultor.Text := '';
   edContadorNome.Text  := '';
   edConsultorNome.Text := '';

   if not Cliente_T35.Existe then
      exit;

   edContador.Text  := Cliente_T35.Detalhes.Contador;
   edConsultor.Text := Cliente_T35.Detalhes.Consultor;
   PesquisarContador;
   PesquisarConsultor;
end;

procedure TFrm_cad_cliente_SMC_T35.PesquisarConsultor;
begin
   edConsultorNome.Text := '';
   if edConsultor.Text = '' then
      exit;

   Consultor.Codigo := edConsultor.Text;
   Consultor.Abrir;
   if not Consultor.Existe then
   begin
     ShowMessage('Consultor Inexistente');
     edConsultor.SetFocus;
     exit;
   end;
   edConsultorNome.Text := Consultor.NomeFantasia;
end;

procedure TFrm_cad_cliente_SMC_T35.PesquisarContador;
begin
   edContadorNome.Text := '';
   if edContador.Text = '' then
      exit;

   Contador.Codigo := edContador.Text;
   Contador.Abrir;
   if not Contador.Existe then
   begin
     ShowMessage('Contador Inexistente');
     edContador.SetFocus;
     exit;
   end;
   edContadorNome.Text := Contador.NomeFantasia;
end;

end.
