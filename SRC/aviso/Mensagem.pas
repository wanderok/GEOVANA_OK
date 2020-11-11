unit Mensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, cxButtons, dxSkinOffice2007Silver, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  Tfrm_Mensagem = class(TForm)
    Image1: TImage;
    cxButton2: TcxButton;
    Memo1: TMemo;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Mensagem: Tfrm_Mensagem;

implementation

{$R *.dfm}

procedure Tfrm_Mensagem.cxButton1Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_Mensagem.FormCreate(Sender: TObject);
begin
     Memo1.lines.clear;
end;

procedure Tfrm_Mensagem.FormShow(Sender: TObject);
var Tamanho : Integer;
begin
     Tamanho := Length(Memo1.lines.Text);
     if Tamanho <= 50 then
        Memo1.font.size := 30
   else if Tamanho <= 100 then
        Memo1.font.size := 25
   else if Tamanho <= 150 then
        Memo1.font.size := 20
   else if Tamanho <= 200 then
        Memo1.font.size := 15
   else if Tamanho <= 250 then
        Memo1.font.size := 10
   else if Tamanho <= 300 then
        Memo1.font.size := 8;
end;

end.
