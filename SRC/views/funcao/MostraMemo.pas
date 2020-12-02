unit MostraMemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
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
  dxSkinXmas2008Blue, cxButtons;

type
  TfrmMostraMemo = class(TForm)
    Memo: TMemo;
    Panel1: TPanel;
    cxButton21: TcxButton;
    cxButton28: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton21Click(Sender: TObject);
    procedure cxButton28Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMostraMemo: TfrmMostraMemo;
  vfrmMostraMemo_Gravar,
  vPodeFechar:Boolean;
  vMemoAntes:TMemo;

implementation

{$R *.dfm}

procedure TfrmMostraMemo.cxButton21Click(Sender: TObject);
begin
   vfrmMostraMemo_Gravar:=True;
   vPodeFechar:=True;
   close;
end;

procedure TfrmMostraMemo.cxButton28Click(Sender: TObject);
begin
   if Memo.Text <> vMemoAntes.text then
   begin
     if MessageDlg('Deseja sair sem gravar?',mtinformation,[mbyes,mbno],1) = mrno then
     begin
       Memo.SetFocus;
       exit;
     end;
   end;
   vfrmMostraMemo_Gravar:=False;
   vPodeFechar:=True;
   close;
end;

procedure TfrmMostraMemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(vMemoAntes);
end;

procedure TfrmMostraMemo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   //canClose := vPodeFechar;
end;

procedure TfrmMostraMemo.FormCreate(Sender: TObject);
begin
   vPodeFechar := false;
   vfrmMostraMemo_Gravar:=false;
   try
     if vMemoAntes = nil then
        vMemoAntes:=TMemo.Create(frmMostraMemo)
     else
     begin
        vMemoAntes.Free;
        vMemoAntes:=TMemo.Create(frmMostraMemo);
     end;
   except
     vMemoAntes.Free;
     try
        vMemoAntes:=TMemo.Create(frmMostraMemo);
     except
        vPodeFechar:=True;
        Close;
     end;
   vMemoAntes.Parent := Memo.Parent;
   vMemoAntes.Height:= 442;
   vMemoAntes.Width := 968;
   vMemoAntes.WordWrap:=true;
   vMemoAntes.font.size := 16;
   vMemoAntes.font.Name := 'Tahoma';
   vMemoAntes.font.Style := [fsBold];
   vMemoAntes.Visible := false;
   end;
end;

procedure TfrmMostraMemo.FormShow(Sender: TObject);
begin
   vMemoAntes.text := Memo.Text;
end;

end.
