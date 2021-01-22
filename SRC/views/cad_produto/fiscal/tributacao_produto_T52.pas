unit tributacao_produto_T52;

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
  Tfrm_tributacao_produto_T52 = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    GroupBox1: TGroupBox;
    Label29: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit7: TEdit;
    pnNomeDoProduto: TPanel;
    CheckBox1: TCheckBox;
    Edit3: TEdit;
    cxButton15: TcxButton;
    Edit34: TEdit;
    Panel2: TPanel;
    mmDESCRICAO: TcxMemo;
    chk_monofasico: TcxCheckBox;
    Label8: TLabel;
    Label11: TLabel;
    edPRODF_NFE_104_I05_CEST: TEdit;
    edPRODF_NFE_104_I05_NCM: TEdit;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    edPRODF_NFE_104_I05_CESTNome: TEdit;
    edPRODF_NFE_104_I05_NCMNome: TEdit;
    Panel1: TPanel;
    Label77: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit8: TEdit;
    edCSOSNNome: TEdit;
    edPRODF_NFE_107_I08_CFOP: TEdit;
    edPRODF_NFE_107_I08_CFOPNome: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    cxButton11: TcxButton;
    Edit1: TEdit;
    GroupBox23: TGroupBox;
    Label52: TLabel;
    Label1: TLabel;
    Label14: TLabel;
    Label53: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    aliq_icms: TEdit;
    REDUCAO_ICMS_ST: TEdit;
    Edit2: TEdit;
    Edit15: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit16: TEdit;
    Edit18: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label31: TLabel;
    Edit17: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Label32: TLabel;
    Label4: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Edit28: TEdit;
    procedure cxButton4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCSOSNNomeClick(Sender: TObject);
    procedure edPRODF_NFE_104_I05_NCMNomeClick(Sender: TObject);
    procedure edPRODF_NFE_104_I05_CESTNomeClick(Sender: TObject);
    procedure edPRODF_NFE_104_I05_CESTExit(Sender: TObject);
    procedure edPRODF_NFE_104_I05_NCMExit(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton10Click(Sender: TObject);
    procedure edPRODF_NFE_107_I08_CFOPExit(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisa_CFOP;
    procedure Pesquisa_CEST_NCM;
    procedure Mostra_CFOP;
    procedure Mostra_CEST;
    procedure Mostra_NCM;

  public
    { Public declarations }
  end;

var
  frm_tributacao_produto_T52: Tfrm_tributacao_produto_T52;
  Produto_T52 : TProduto;

implementation

uses
  DadosSMC, FuncoeSSMC,
  natureza_operacao_cfop_T43,
  NCMSH_CEST_T44;

{$R *.dfm}

procedure Tfrm_tributacao_produto_T52.cxButton10Click(Sender: TObject);
begin
   Pesquisa_CFOP;
end;

procedure Tfrm_tributacao_produto_T52.cxButton1Click(Sender: TObject);
begin
   Produto_T52.Tributacao.NFE_104_I05_NCM  := edPRODF_NFE_104_I05_NCM.Text;
   Produto_T52.Tributacao.NFE_104_I05_CEST := edPRODF_NFE_104_I05_CEST.Text;

   Produto_T52.Gravar;
   Close;
end;

procedure Tfrm_tributacao_produto_T52.cxButton2Click(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_tributacao_produto_T52.cxButton4Click(Sender: TObject);
begin
  //Frm_unidade := TFrm_unidade.CREATE(Application);
  //Frm_unidade.ShowModal;
end;

procedure Tfrm_tributacao_produto_T52.cxButton7Click(Sender: TObject);
begin
   Pesquisa_CEST_NCM;
end;

procedure Tfrm_tributacao_produto_T52.cxButton8Click(Sender: TObject);
begin
   Pesquisa_CEST_NCM;
end;

procedure Tfrm_tributacao_produto_T52.edPRODF_NFE_104_I05_CESTExit(Sender: TObject);
begin
   Mostra_CEST;
end;

procedure Tfrm_tributacao_produto_T52.edPRODF_NFE_104_I05_CESTNomeClick(Sender: TObject);
begin
   mmDESCRICAO.Text := edPRODF_NFE_104_I05_CESTNome.Text;
end;

procedure Tfrm_tributacao_produto_T52.edPRODF_NFE_104_I05_NCMExit(Sender: TObject);
begin
   Mostra_NCM;
end;

procedure Tfrm_tributacao_produto_T52.edPRODF_NFE_104_I05_NCMNomeClick(Sender: TObject);
begin
   mmDESCRICAO.Text := edPRODF_NFE_104_I05_NCMNome.Text;
end;

procedure Tfrm_tributacao_produto_T52.edCSOSNNomeClick(Sender: TObject);
begin
   mmDESCRICAO.Text := edCSOSNNome.Text;
end;

procedure Tfrm_tributacao_produto_T52.edPRODF_NFE_107_I08_CFOPExit(Sender: TObject);
begin
   Mostra_CFOP
end;

procedure Tfrm_tributacao_produto_T52.FormCreate(Sender: TObject);
begin
   Produto_T52 := TProduto.Create;
end;

procedure Tfrm_tributacao_produto_T52.FormDestroy(Sender: TObject);
begin
   FreeAndNil(Produto_T52);
end;

procedure Tfrm_tributacao_produto_T52.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f1 then
   begin
      if (edPRODF_NFE_104_I05_NCM.Focused ) or
         (edPRODF_NFE_104_I05_CEST.Focused) then
      begin
         Pesquisa_CEST_NCM;
         exit
      end;
   end;
end;

procedure Tfrm_tributacao_produto_T52.FormShow(Sender: TObject);
begin
   Produto_T52.Abrir;
   pnNomeDoProduto.Caption       := Produto_T52.Nome;
   edPRODF_NFE_107_I08_CFOP.Text := Produto_T52.Tributacao.NFE_107_I08_CFOP;
   edPRODF_NFE_104_I05_NCM.Text  := Produto_T52.Tributacao.NFE_104_I05_NCM;
   edPRODF_NFE_104_I05_CEST.Text := Produto_T52.Tributacao.NFE_104_I05_CEST;

   Mostra_CFOP;
   Mostra_NCM;
   Mostra_CEST;

   edPRODF_NFE_107_I08_CFOP.SetFocus;

end;

procedure Tfrm_tributacao_produto_T52.Mostra_CEST;
begin
   mmDESCRICAO.Lines.Clear;
   edPRODF_NFE_104_I05_CESTNome.Text := '';
   if edPRODF_NFE_104_I05_CEST.text = '' then
      exit;

   DM.Query1.close;
   DM.Query1.sql.clear;
   DM.Query1.sql.add('SELECT * FROM CEST_CEST      ');
   DM.Query1.sql.add(' WHERE CEST_CEST = :CEST_CEST');
   DM.Query1.ParamByName('CEST_CEST').AsString := edPRODF_NFE_104_I05_CEST.text;
   DM.Query1.Open;
   if DM.Query1.Eof then
   begin
      fAvisar('CEST não encontrado');
      edPRODF_NFE_104_I05_CEST.SetFocus;
      exit;
   end;
   edPRODF_NFE_104_I05_CESTNome.Text := DM.Query1.FieldByName('CEST_DESCRICAO').AsString;
   mmDESCRICAO.Lines.Add(DM.Query1.FieldByName('CEST_DESCRICAO').AsString);
end;

procedure Tfrm_tributacao_produto_T52.Mostra_CFOP;
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

procedure Tfrm_tributacao_produto_T52.Mostra_NCM;
begin
   mmDESCRICAO.Lines.Clear;
   edPRODF_NFE_104_I05_NCMNome.Text := '';
   if edPRODF_NFE_104_I05_NCM.text = '' then
      exit;

   DM.Query1.close;
   DM.Query1.sql.clear;
   DM.Query1.sql.add('SELECT * FROM CEST_CEST    ');
   DM.Query1.sql.add(' WHERE CEST_NCM = :CEST_NCM');
   DM.Query1.ParamByName('CEST_NCM').AsString := edPRODF_NFE_104_I05_NCM.text;
   DM.Query1.Open;
   if DM.Query1.Eof then
   begin
      fAvisar('CEST não encontrado');
      edPRODF_NFE_104_I05_NCM.SetFocus;
      exit;
   end;
   edPRODF_NFE_104_I05_NCMNome.Text := DM.Query1.FieldByName('CEST_DESCRICAO').AsString;
   mmDESCRICAO.Lines.Add(DM.Query1.FieldByName('CEST_DESCRICAO').AsString);
end;

procedure Tfrm_tributacao_produto_T52.Pesquisa_CEST_NCM;
begin
   frm_NCMSH_CEST_T44:= Tfrm_NCMSH_CEST_T44.Create(self);
   frm_NCMSH_CEST_T44.ShowModal;
   edPRODF_NFE_104_I05_CEST.Text := T44_CEST_CEST;
   edPRODF_NFE_104_I05_NCM.Text  := T44_CEST_NCM;
   frm_NCMSH_CEST_T44.Free;
   Mostra_CEST;
   Mostra_NCM;
end;

procedure Tfrm_tributacao_produto_T52.Pesquisa_CFOP;
begin
   frm_natureza_operacao_cfop_T43:= Tfrm_natureza_operacao_cfop_T43.Create(self);
   frm_natureza_operacao_cfop_T43.ShowModal;
   edPRODF_NFE_107_I08_CFOP.Text := T43_CODIGO;
   frm_natureza_operacao_cfop_T43.Free;
   Mostra_CFOP;
end;

end.
