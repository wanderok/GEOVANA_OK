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
    cbColaboradores: TCheckBox;
    CheckBox3: TCheckBox;
    Panel2: TPanel;
    cbArquivosFiscaisSMC: TCheckBox;
    cbContadores: TCheckBox;
    cbBairros: TCheckBox;
    cbRamosdeAtividade: TCheckBox;
    cbZonas: TCheckBox;
    cbConsultores: TCheckBox;
    cbRegioes: TCheckBox;
    CheckBox11: TCheckBox;
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure ApagarClientes(pFazer:Boolean);
    procedure ApagarArquivosFiscaisSMC(pFazer:Boolean);
    procedure ApagarContadores(pFazer:Boolean);
    procedure ApagarColaboradores(pFazer:Boolean);
    procedure ApagarConsultores(pFazer:Boolean);
    procedure ApagarBairros(pFazer:Boolean);
    procedure ApagarRamosdeAtividade(pFazer:Boolean);
    procedure ApagarZonas(pFazer:Boolean);
    procedure ApagarRegioes(pFazer:Boolean);
  public
    { Public declarations }
  end;

var
  FrmLimpaBaseDeDados: TFrmLimpaBaseDeDados;

implementation

{$R *.dfm}

uses FuncoesSMC;

procedure TFrmLimpaBaseDeDados.ApagarArquivosFiscaisSMC(pFazer: Boolean);
begin
   if not pFazer then exit;
   Executar('TRUNCATE TABLE ARQUIVOS_FISCAIS_AF');
   cbArquivosFiscaisSMC.checked := False;
end;

procedure TFrmLimpaBaseDeDados.ApagarBairros(pFazer: Boolean);
begin
   if not pFazer then exit;
   Executar('TRUNCATE TABLE BAIRRO_BAI');
   cbBairros.checked := False;
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
   cbCliente.checked := False;
end;

procedure TFrmLimpaBaseDeDados.ApagarColaboradores(pFazer: Boolean);
begin
   if not pFazer then exit;
   Executar('TRUNCATE TABLE COLABORADOR_COL');
   Executar('TRUNCATE TABLE COLABORADOR_CONTATO_COLC');
   Executar('TRUNCATE TABLE COLABORADOR_DETALHE_COLD');
   Executar('TRUNCATE TABLE COLABORADOR_ENDERECO_COLE');
   Executar('TRUNCATE TABLE COLABORADOR_HISTORICO_BLOQUEIOS_COLHB');
   Executar('TRUNCATE TABLE COLABORADOR_OBS_COLOBS');
   Executar('TRUNCATE TABLE OLABORADOR_BLOQUEIOS_COLB');
   cbColaboradores.checked := False;
end;

procedure TFrmLimpaBaseDeDados.ApagarConsultores(pFazer: Boolean);
begin
   if not pFazer then exit;
   Executar('TRUNCATE TABLE CONSULTOR_CON');
   Executar('TRUNCATE TABLE CONSULTOR_CONTATO_CONC');
   Executar('TRUNCATE TABLE CONSULTOR_DETALHE_COND');
   Executar('TRUNCATE TABLE CONSULTOR_ENDERECO_CONE');
   Executar('TRUNCATE TABLE CONSULTOR_HISTORICO_BLOQUEIOS_CHB');
   Executar('TRUNCATE TABLE CONSULTOR_OBS_CONOBS');
   Executar('TRUNCATE TABLE CONSULTOR_BLOQUEIOS_CONB');
   Executar('TRUNCATE TABLE CONSULTOR_BANCO_COMISSAO_CONBC');
   cbConsultores.Checked := False;
end;

procedure TFrmLimpaBaseDeDados.ApagarContadores(pFazer: Boolean);
begin
   if not pFazer then exit;
   Executar('TRUNCATE TABLE CONTADOR_CONT');
   Executar('TRUNCATE TABLE CONTADOR_CONTATO_CONTC');
   Executar('TRUNCATE TABLE CONTADOR_DETALHE_CONTD');
   Executar('TRUNCATE TABLE CONTADOR_ENDERECO_CONTE');
   Executar('TRUNCATE TABLE CONTADOR_HISTORICO_BLOQUEIOS_CONTHB');
   Executar('TRUNCATE TABLE CONTADOR_OBS_CONTOBS');
   Executar('TRUNCATE TABLE CONTADOR_BLOQUEIOS_CONTB');
   cbContadores.checked := False;
end;

procedure TFrmLimpaBaseDeDados.ApagarRamosdeAtividade(pFazer: Boolean);
begin
    if not pFazer then exit;
    Executar('TRUNCATE TABLE RAMOATIVIDADE_RAMO');
    cbRamosdeAtividade.checked := False;
end;

procedure TFrmLimpaBaseDeDados.ApagarRegioes(pFazer: Boolean);
begin
    if not pFazer then exit;
    Executar('TRUNCATE TABLE REGIAO_REG');
    cbRegioes.Checked := False;
end;

procedure TFrmLimpaBaseDeDados.ApagarZonas(pFazer: Boolean);
begin
    if not pFazer then exit;
    Executar('TRUNCATE TABLE ZONA_ZON');
    cbZonas.Checked := False;
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
   ApagarColaboradores(cbColaboradores.checked);
   ApagarContadores(cbContadores.checked);
   ApagarBairros(cbBairros.checked);
   ApagarRamosdeAtividade(cbRamosdeAtividade.checked);
   ApagarZonas(cbZonas.Checked);
   ApagarRegioes(cbRegioes.Checked);
   ApagarConsultores(cbConsultores.Checked);
   ShowMessage('OK!');
end;

end.
