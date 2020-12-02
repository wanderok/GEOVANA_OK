unit aviso_certificado_digital;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, cxButtons, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue;


type
  Tfrm_aviso_certificado_vencido = class(TForm)
    Label6: TLabel;
    Image1: TImage;
    lbDias: TLabel;
    cxButton1: TcxButton;
    Label3: TLabel;
    lbData: TLabel;
    Timer1: TTimer;
    cbCiente: TCheckBox;
    procedure cxButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_aviso_certificado_vencido: Tfrm_aviso_certificado_vencido;
  vPodeFechar: Boolean;
implementation

{$R *.dfm}

uses funcoes;


procedure Tfrm_aviso_certificado_vencido.cxButton1Click(Sender: TObject);
begin
   if not cbCiente.Checked then
   begin
     Avisos.Avisar('Por favor, marque que "está ciente".');
     exit;
   end;
   vPodeFechar:=True;
   Close;
end;

procedure Tfrm_aviso_certificado_vencido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   //CanClose := vPodeFechar;
end;

procedure Tfrm_aviso_certificado_vencido.FormCreate(Sender: TObject);
begin
   vPodeFechar:=False;
end;

procedure Tfrm_aviso_certificado_vencido.Timer1Timer(Sender: TObject);
begin
     lbDias.Visible := not lbDias.Visible;
end;

end.
