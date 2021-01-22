unit tributacao_produto_FCP_T61;

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
  Tfrm_tributacao_produto_FCP_T61 = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbNomeDaTela: TLabel;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Label4: TLabel;
    Edit2: TEdit;
    procedure cxButton7Click(Sender: TObject);
    procedure edCEST_NCMExit(Sender: TObject);
    procedure edCEST_CESTExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisa_CEST_NCM;
    procedure Mostra_CEST;
    procedure Mostra_NCM;

  public
    { Public declarations }
  end;

var
  frm_tributacao_produto_FCP_T61: Tfrm_tributacao_produto_FCP_T61;

implementation

{CSOS X CST
O primeiro passo é saber qual o regime de tributação da empresa,
os impostos e todo assunto fiscal possível,
incluindo o código CSOSN ou CST para emissão da NFe.

Tabela CSOSN
A definição de Código de Regime Tributário é simples,
o contribuinte precisa apenas indicar se é optante pelo
Simples Nacional (1), ou Regime Normal (3).

Se tiver passado o sublimite da receita bruta fixado pelo estado,
deve utilizar o código 2
}
uses
  DadosSMC, FuncoeSSMC, NCMSH_CEST_T44;

{$R *.dfm}

procedure Tfrm_tributacao_produto_FCP_T61.cxButton2Click(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_tributacao_produto_FCP_T61.cxButton7Click(Sender: TObject);
begin
   Pesquisa_CEST_NCM;
end;

procedure Tfrm_tributacao_produto_FCP_T61.edCEST_CESTExit(Sender: TObject);
begin
   Mostra_CEST;
end;

procedure Tfrm_tributacao_produto_FCP_T61.edCEST_NCMExit(Sender: TObject);
begin
   Mostra_NCM;
end;

procedure Tfrm_tributacao_produto_FCP_T61.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f1 then
   begin
   end;
end;

procedure Tfrm_tributacao_produto_FCP_T61.Mostra_CEST;
begin
end;

procedure Tfrm_tributacao_produto_FCP_T61.Mostra_NCM;
begin
end;

procedure Tfrm_tributacao_produto_FCP_T61.Pesquisa_CEST_NCM;
begin
end;

end.

