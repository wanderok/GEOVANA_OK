unit aviso_campos_sugeridos;

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
  Tfrm_aviso_campos_sugeridos = class(TForm)
    Image1: TImage;
    cxButton1: TcxButton;
    Label3: TLabel;
    cxButton2: TcxButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frm_aviso_campos_sugeridos: Tfrm_aviso_campos_sugeridos;
  vfrm_aviso_campos_sugeridosResposta:Boolean;

implementation

{$R *.dfm}

procedure Tfrm_aviso_campos_sugeridos.cxButton1Click(Sender: TObject);
begin
  vfrm_aviso_campos_sugeridosResposta:=False;
  Close;
end;

procedure Tfrm_aviso_campos_sugeridos.cxButton2Click(Sender: TObject);
begin
   vfrm_aviso_campos_sugeridosResposta := True;
   Close;
end;

procedure Tfrm_aviso_campos_sugeridos.FormShow(Sender: TObject);
begin
   vfrm_aviso_campos_sugeridosResposta:=True;
end;

end.
