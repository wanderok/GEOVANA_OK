unit Grupo_Tributario_T63;

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
  dxSkinXmas2008Blue, Vcl.ExtCtrls,

  Classe_Produto;

type
  Tfrm_Grupo_Tributario_T63 = class(TForm)
    GroupBox23: TGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label31: TLabel;
    Edit12: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit19: TEdit;
    Label52: TLabel;
    aliq_icms: TEdit;
    REDUCAO_ICMS_ST: TEdit;
    Panel1: TPanel;
    Label77: TLabel;
    Edit1: TEdit;
    cxButton4: TcxButton;
    edCSOSNNome: TEdit;
    Label12: TLabel;
    Edit8: TEdit;
    cxButton3: TcxButton;
    Edit9: TEdit;
    pnNomeDoProduto: TPanel;
    Edit26: TEdit;
    cxButton12: TcxButton;
    Edit27: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Edit17: TEdit;
    cxButton5: TcxButton;
    cxButton13: TcxButton;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Panel2: TPanel;
    mmDESCRICAO: TcxMemo;
    Label1: TLabel;
    Label53: TLabel;
    Label5: TLabel;
    Edit22: TEdit;
    cxButton16: TcxButton;
    Edit23: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Label15: TLabel;
    Edit37: TEdit;
    cxButton17: TcxButton;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Label14: TLabel;
    Edit2: TEdit;
    cxButton6: TcxButton;
    Edit18: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Label3: TLabel;
    edPRODF_NFE_107_I08_CFOP: TEdit;
    cxButton10: TcxButton;
    edPRODF_NFE_107_I08_CFOPNome: TEdit;
    Label2: TLabel;
    Edit10: TEdit;
    cxButton9: TcxButton;
    Edit21: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    cxButton7: TcxButton;
    Edit4: TEdit;
    procedure cxButton4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCSOSNNomeClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton10Click(Sender: TObject);
    procedure edPRODF_NFE_107_I08_CFOPExit(Sender: TObject);
    procedure edPRODF_NFE_107_I08_CFOPNomeClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisa_CFOP;
    procedure Mostra_CFOP;

  public
    { Public declarations }
  end;

var
  frm_Grupo_Tributario_T63: Tfrm_Grupo_Tributario_T63;
  Produto_T52 : TProduto;

implementation

uses
  DadosSMC, FuncoeSSMC,
  natureza_operacao_cfop_T43,
  NCMSH_CEST_T44;

{$R *.dfm}

procedure Tfrm_Grupo_Tributario_T63.cxButton10Click(Sender: TObject);
begin
   Pesquisa_CFOP;
end;

procedure Tfrm_Grupo_Tributario_T63.cxButton1Click(Sender: TObject);
begin
   Produto_T52.Tributacao.NFE_107_I08_CFOP := edPRODF_NFE_107_I08_CFOP.Text;

   Produto_T52.Gravar;
   Close;
end;

procedure Tfrm_Grupo_Tributario_T63.cxButton2Click(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Grupo_Tributario_T63.cxButton4Click(Sender: TObject);
begin
  //Frm_unidade := TFrm_unidade.CREATE(Application);
  //Frm_unidade.ShowModal;
end;

procedure Tfrm_Grupo_Tributario_T63.edCSOSNNomeClick(Sender: TObject);
begin
   mmDESCRICAO.Text := edCSOSNNome.Text;
end;

procedure Tfrm_Grupo_Tributario_T63.edPRODF_NFE_107_I08_CFOPExit(Sender: TObject);
begin
   Mostra_CFOP
end;

procedure Tfrm_Grupo_Tributario_T63.edPRODF_NFE_107_I08_CFOPNomeClick(Sender: TObject);
begin
   mmDESCRICAO.Text := edPRODF_NFE_107_I08_CFOPNome.Text;
end;

procedure Tfrm_Grupo_Tributario_T63.FormCreate(Sender: TObject);
begin
   Produto_T52 := TProduto.Create;
end;

procedure Tfrm_Grupo_Tributario_T63.FormDestroy(Sender: TObject);
begin
   FreeAndNil(Produto_T52);
end;

procedure Tfrm_Grupo_Tributario_T63.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f1 then
   begin
      if edPRODF_NFE_107_I08_CFOP.Focused then
      begin
         Pesquisa_CFOP;
         exit
      end;
   end;
end;

procedure Tfrm_Grupo_Tributario_T63.FormShow(Sender: TObject);
begin
   Produto_T52.Abrir;
   pnNomeDoProduto.Caption       := Produto_T52.Nome;
   edPRODF_NFE_107_I08_CFOP.Text := Produto_T52.Tributacao.NFE_107_I08_CFOP;

   Mostra_CFOP;

   edPRODF_NFE_107_I08_CFOP.SetFocus;

end;

procedure Tfrm_Grupo_Tributario_T63.Mostra_CFOP;
begin
   mmDESCRICAO.Lines.Clear;
   edPRODF_NFE_107_I08_CFOPNome.Text := '';
   if edPRODF_NFE_107_I08_CFOP.text = '' then
      exit;

   DM.Query1.close;
   DM.Query1.sql.clear;
   DM.Query1.sql.add('SELECT * FROM NATUREZADEOPERACAO_NATOP    ');
   DM.Query1.sql.add(' WHERE CODIGO = :CODIGO');
   DM.Query1.ParamByName('CODIGO').AsString := edPRODF_NFE_107_I08_CFOP.text;
   DM.Query1.Open;
   if DM.Query1.Eof then
   begin
      fAvisar('CFOP não encontrado');
      edPRODF_NFE_107_I08_CFOP.SetFocus;
      exit;
   end;
   edPRODF_NFE_107_I08_CFOPNome.Text := DM.Query1.FieldByName('DESCRICAO').AsString;
   mmDESCRICAO.Lines.Add(DM.Query1.FieldByName('DESCRICAO').AsString+' '+
                         DM.Query1.FieldByName('DESCRICAO2').AsString);
end;

procedure Tfrm_Grupo_Tributario_T63.Pesquisa_CFOP;
begin
   frm_natureza_operacao_cfop_T43:= Tfrm_natureza_operacao_cfop_T43.Create(self);
   frm_natureza_operacao_cfop_T43.ShowModal;
   edPRODF_NFE_107_I08_CFOP.Text := T43_CODIGO;
   frm_natureza_operacao_cfop_T43.Free;
   Mostra_CFOP;
end;

end.
