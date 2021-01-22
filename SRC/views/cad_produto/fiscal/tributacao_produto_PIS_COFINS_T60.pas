unit tributacao_produto_PIS_COFINS_T60;

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
  Tfrm_tributacao_produto_PIS_COFINS_T60 = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbNomeDaTela: TLabel;
    Panel1: TPanel;
    Label77: TLabel;
    Edit17: TEdit;
    cxButton3: TcxButton;
    edCSOSNNome: TEdit;
    Label16: TLabel;
    edCEST_NCM: TEdit;
    cxButton7: TcxButton;
    edCEST_NCMNome: TEdit;
    mmDESCRICAO: TcxMemo;
    procedure cxButton7Click(Sender: TObject);
    procedure edCEST_NCMExit(Sender: TObject);
    procedure edCEST_CESTExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCEST_NCMNomeClick(Sender: TObject);
    procedure edCSOSNNomeClick(Sender: TObject);
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
  frm_tributacao_produto_PIS_COFINS_T60: Tfrm_tributacao_produto_PIS_COFINS_T60;

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

procedure Tfrm_tributacao_produto_PIS_COFINS_T60.cxButton2Click(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_tributacao_produto_PIS_COFINS_T60.cxButton7Click(Sender: TObject);
begin
   Pesquisa_CEST_NCM;
end;

procedure Tfrm_tributacao_produto_PIS_COFINS_T60.edCEST_CESTExit(Sender: TObject);
begin
   Mostra_CEST;
end;

procedure Tfrm_tributacao_produto_PIS_COFINS_T60.edCEST_NCMExit(Sender: TObject);
begin
   Mostra_NCM;
end;

procedure Tfrm_tributacao_produto_PIS_COFINS_T60.edCEST_NCMNomeClick(
  Sender: TObject);
begin
   mmDESCRICAO.Text := edCEST_NCMNome.Text;
end;

procedure Tfrm_tributacao_produto_PIS_COFINS_T60.edCSOSNNomeClick(Sender: TObject);
begin
   mmDESCRICAO.Text := edCSOSNNome.Text;
end;

procedure Tfrm_tributacao_produto_PIS_COFINS_T60.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f1 then
   begin
      if edCEST_NCM.Focused then
      begin
         Pesquisa_CEST_NCM;
         exit
      end;
   end;
end;

procedure Tfrm_tributacao_produto_PIS_COFINS_T60.Mostra_CEST;
begin
end;

procedure Tfrm_tributacao_produto_PIS_COFINS_T60.Mostra_NCM;
begin
   mmDESCRICAO.Lines.Clear;
   edCEST_NCMNome.Text := '';
   if edCEST_NCM.text = '' then
      exit;

   DM.Query1.close;
   DM.Query1.sql.clear;
   DM.Query1.sql.add('SELECT * FROM CEST_CEST    ');
   DM.Query1.sql.add(' WHERE CEST_NCM = :CEST_NCM');
   DM.Query1.ParamByName('CEST_NCM').AsString := edCEST_NCM.text;
   DM.Query1.Open;
   if DM.Query1.Eof then
   begin
      fAvisar('CEST não encontrado');
      edCEST_NCM.SetFocus;
      exit;
   end;
   edCEST_NCMNome.Text := DM.Query1.FieldByName('CEST_DESCRICAO').AsString;
   mmDESCRICAO.Lines.Add(DM.Query1.FieldByName('CEST_DESCRICAO').AsString);
end;

procedure Tfrm_tributacao_produto_PIS_COFINS_T60.Pesquisa_CEST_NCM;
begin
   frm_NCMSH_CEST_T44:= Tfrm_NCMSH_CEST_T44.Create(self);
   frm_NCMSH_CEST_T44.ShowModal;
   edCEST_NCM.Text  := T44_CEST_NCM;
   frm_NCMSH_CEST_T44.Free;
   Mostra_CEST;
   Mostra_NCM;
end;

end.

