unit cad_comissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, Vcl.StdCtrls, cxButtons,
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
  dxSkinXmas2008Blue,

  Classe_Comissao;

type
  Tfrm_cad_comissoes = class(TForm)
    GroupBox12: TGroupBox;
    GroupBox20: TGroupBox;
    GroupBox7: TGroupBox;
    Label73: TLabel;
    Label74: TLabel;
    GroupBox13: TGroupBox;
    edSERVICOS: TEdit;
    edHORATECNICA: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    edBALCAO: TEdit;
    edEXTERNA: TEdit;
    cxButton21: TcxButton;
    cxButton28: TcxButton;
    procedure cxButton28Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxButton21Click(Sender: TObject);
  private
    { Private declarations }
    procedure Inicio;
    procedure Preenche_Tela;
    function DadosCorretos:Boolean;
    procedure Gravar_Comissao;
  public
    { Public declarations }
  end;

var
  frm_cad_comissoes: Tfrm_cad_comissoes;
  vPodeFechar      : Boolean;
  Comissao         : TComissao;

implementation

{$R *.dfm}

uses TiposDeDados, Funcoes;

procedure Tfrm_cad_comissoes.cxButton21Click(Sender: TObject);
begin
     if not DadosCorretos then
        exit;

     Gravar_Comissao;
end;

procedure Tfrm_cad_comissoes.cxButton28Click(Sender: TObject);
begin
   vPodeFechar:=True;
   Close;
end;

function Tfrm_cad_comissoes.DadosCorretos: Boolean;
begin
  result := false;

  if not PercentualValido(edSERVICOS.Text)    then exit;
  if not PercentualValido(edHORATECNICA.Text) then exit;
  if not PercentualValido(edBALCAO.Text)      then exit;
  if not PercentualValido(edEXTERNA.Text)     then exit;

  result := true;
end;

procedure Tfrm_cad_comissoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FreeAndNil(Comissao);
end;

procedure Tfrm_cad_comissoes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := vPodeFechar;
end;

procedure Tfrm_cad_comissoes.FormCreate(Sender: TObject);
begin
   vPodeFechar:=False;
   Comissao := TComissao.Create;
end;

procedure Tfrm_cad_comissoes.FormShow(Sender: TObject);
begin
   Inicio;
end;

procedure Tfrm_cad_comissoes.Gravar_Comissao;
begin
   Comissao.Servico.Servico     := StrToFloat(MascToStr(edSERVICOS.Text));
   Comissao.Servico.HoraTecnica := StrToFloat(MascToStr(edHORATECNICA.Text));
   Comissao.Venda.Balcao        := StrToFloat(MascToStr(edBALCAO.Text));
   Comissao.Venda.Externa       := StrToFloat(MascToStr(edEXTERNA.Text));
   if not Comissao.Gravar then
   begin
     ShowMessage('Não foi possivel gravar dados de comissão');
     exit;
   end;
   vPodeFechar:=True;
   close;
end;

procedure Tfrm_cad_comissoes.Inicio;
begin
   Limpar_os_campos_da_Tela(frm_cad_comissoes);
   if Comissao.Existe then
      Preenche_Tela;
   edSERVICOS.SetFocus;
end;

procedure Tfrm_cad_comissoes.Preenche_Tela;
begin
   edSERVICOS.Text    := FormatFloat('#,#0.00',Comissao.Servico.Servico);
   edHORATECNICA.Text := FormatFloat('#,#0.00',Comissao.Servico.HoraTecnica);

   edBALCAO.Text      := FormatFloat('#,#0.00',Comissao.Venda.Balcao);
   edEXTERNA.Text     := FormatFloat('#,#0.00',Comissao.Venda.Externa);
end;

end.
