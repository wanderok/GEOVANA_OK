unit tributacao_produto_Combustivel_T62;

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
  Tfrm_tributacao_produto_Combustivel_T62 = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbNomeDaTela: TLabel;
    Panel14: TPanel;
    Label77: TLabel;
    Edit17: TEdit;
    cxButton3: TcxButton;
    edCSOSNNome: TEdit;
    mmDESCRICAO: TcxMemo;
    Label6: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    Label10: TLabel;
    Edit7: TEdit;
    procedure cxButton7Click(Sender: TObject);
    procedure edCEST_NCMExit(Sender: TObject);
    procedure edCEST_CESTExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  frm_tributacao_produto_Combustivel_T62: Tfrm_tributacao_produto_Combustivel_T62;

implementation

{CSOS X CST
O primeiro passo � saber qual o regime de tributa��o da empresa,
os impostos e todo assunto fiscal poss�vel,
incluindo o c�digo CSOSN ou CST para emiss�o da NFe.

Tabela CSOSN
A defini��o de C�digo de Regime Tribut�rio � simples,
o contribuinte precisa apenas indicar se � optante pelo
Simples Nacional (1), ou Regime Normal (3).

Se tiver passado o sublimite da receita bruta fixado pelo estado,
deve utilizar o c�digo 2
}
uses
  DadosSMC, FuncoeSSMC, NCMSH_CEST_T44;

{$R *.dfm}

procedure Tfrm_tributacao_produto_Combustivel_T62.cxButton2Click(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_tributacao_produto_Combustivel_T62.cxButton7Click(Sender: TObject);
begin
   Pesquisa_CEST_NCM;
end;

procedure Tfrm_tributacao_produto_Combustivel_T62.edCEST_CESTExit(Sender: TObject);
begin
   Mostra_CEST;
end;

procedure Tfrm_tributacao_produto_Combustivel_T62.edCEST_NCMExit(Sender: TObject);
begin
   Mostra_NCM;
end;

procedure Tfrm_tributacao_produto_Combustivel_T62.edCSOSNNomeClick(Sender: TObject);
begin
   mmDESCRICAO.Text := edCSOSNNome.Text;
end;

procedure Tfrm_tributacao_produto_Combustivel_T62.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f1 then
   begin
   end;
end;

procedure Tfrm_tributacao_produto_Combustivel_T62.Mostra_CEST;
begin
   mmDESCRICAO.Lines.Clear;

   DM.Query1.close;
   DM.Query1.sql.clear;
   DM.Query1.sql.add('SELECT * FROM CEST_CEST      ');
   DM.Query1.sql.add(' WHERE CEST_CEST = :CEST_CEST');
//   DM.Query1.ParamByName('CEST_CEST').AsString := edCEST_CEST.text;
   DM.Query1.Open;
   if DM.Query1.Eof then
   begin
      fAvisar('CEST n�o encontrado');
//      edCEST_CEST.SetFocus;
      exit;
   end;
//   edCEST_CESTNome.Text := DM.Query1.FieldByName('CEST_DESCRICAO').AsString;
   mmDESCRICAO.Lines.Add(DM.Query1.FieldByName('CEST_DESCRICAO').AsString);
end;

procedure Tfrm_tributacao_produto_Combustivel_T62.Mostra_NCM;
begin
end;

procedure Tfrm_tributacao_produto_Combustivel_T62.Pesquisa_CEST_NCM;
begin
end;

end.

