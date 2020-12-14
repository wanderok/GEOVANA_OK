unit LimpaBaseDeDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxButtons;

type
  TFrmLimpaBaseDeDados = class(TForm)
    Image1: TImage;
    cxButton2: TcxButton;
    cbCliente: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    edSenha: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Panel2: TPanel;
    cbArquivosFiscaisSMC: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure ApagarClientes(pFazer:Boolean);
    procedure ApagarArquivosFiscaisSMC(pFazer:Boolean);

  public
    { Public declarations }
  end;

var
  FrmLimpaBaseDeDados: TFrmLimpaBaseDeDados;

implementation

{$R *.dfm}

uses funcoes;

procedure TFrmLimpaBaseDeDados.ApagarArquivosFiscaisSMC(pFazer: Boolean);
begin
   if not pFazer then exit;
   Executar('TRUNCATE TABLE ARQUIVOS_FISCAIS_AF');
end;

procedure TFrmLimpaBaseDeDados.ApagarClientes(pFazer: Boolean);
begin
   if not pFazer then exit;
   Executar('TRUNCATE TABLE CLIENTE_CLI');
   Executar('TRUNCATE TABLE CLIENTE_CONTATO_CLIC');
   Executar('TRUNCATE TABLE CLIENTE_DETALHE_CLID');
   Executar('TRUNCATE TABLE CLIENTE_ENDERECO_CLIE');
   Executar('TRUNCATE TABLE CLIENTE_HISTORICO_BLOQUEIOS_CHB');
   Executar('TRUNCATE TABLE CLIENTE_OBS_CLIOBS');
   Executar('TRUNCATE TABLE CLIENTE_BLOQUEIOS_CLIB');
end;

procedure TFrmLimpaBaseDeDados.cxButton2Click(Sender: TObject);
begin
   if edSenha.text = '' then
   begin
     Avisos.Avisar('Informe a senha');
     exit;
   end;
   if edSenha.text <> '321' then
   begin
     Avisos.SenhaInvalida;
     exit;
   end;

   ApagarClientes(cbCliente.checked);
   ApagarArquivosFiscaisSMC(cbArquivosFiscaisSMC.checked);

   ShowMessage('OK!');
end;

end.
