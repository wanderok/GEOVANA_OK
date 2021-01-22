unit tributacao_produto_ICMSST_T59;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxLabel, Vcl.Menus, cxButtonEdit, cxDBEdit,
  cxMemo, Vcl.StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  Tfrm_tributacao_produto_ICMSST_T59 = class(TForm)
    Panel14: TPanel;
    Label77: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit17: TEdit;
    cxButton3: TcxButton;
    edCSOSNNome: TEdit;
    edCEST_NCM: TEdit;
    cxButton7: TcxButton;
    edCEST_NCMNome: TEdit;
    edCEST_CEST: TEdit;
    edCEST_CESTNome: TEdit;
    mmDESCRICAO: TcxMemo;
    cxButton8: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbNomeDaTela: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Edit12: TEdit;
    Edit11: TEdit;
    Label21: TLabel;
    Label23: TLabel;
    Edit14: TEdit;
    Edit13: TEdit;
    Label32: TLabel;
    Label25: TLabel;
    Edit16: TEdit;
    Edit20: TEdit;
    Label24: TLabel;
    Label31: TLabel;
    Edit19: TEdit;
    Edit15: TEdit;
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frm_tributacao_produto_ICMSST_T59: Tfrm_tributacao_produto_ICMSST_T59;

implementation

{$R *.dfm}

procedure Tfrm_tributacao_produto_ICMSST_T59.cxButton2Click(Sender: TObject);
begin
   Close;
end;

end.

