{ v 13.10.20 8:08am }

unit cadastro_produto;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, cxGraphics,
  cxPC,
  cxEdit, cxDropDownEdit, cxDBEdit, Vcl.Menus,
  cxCheckBox, cxButtons, cxMemo,
  cxGroupBox,
  Vcl.DBGrids, FireDAC.Stan.Param,
  Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxDBLookupComboBox,
  Vcl.ExtCtrls,
  dialogs,  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, System.math, strutils, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters,
   cxContainer, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxLabel, cxCurrencyEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.Grids, cxButtonEdit, cxCalendar, dxGDIPlusClasses,
  cxLookupEdit, cxDBLookupEdit,
  cxTextEdit, cxMaskEdit,
  cxClasses, cxGridCustomView, cxCheckComboBox, dxSkinsCore, dxSkinscxPCPainter,
  dxBarBuiltInMenu, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab;

type
  TFrm_Produto = class(TForm)
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    A: TLabel;
    Label5: TLabel;
    Label37: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    lbl2: TLabel;
    Label18: TLabel;
    btn_sub: TcxButton;
    btn_marca: TcxButton;
    DESCRICAO_PRODUTO: TEdit;
    REFERENCIA_FABRICANTE: TEdit;
    SUBGRUPO: TEdit;
    edMarca: TEdit;
    CODIGO_BARRAS: TEdit;
    dbedt_codigo: TEdit;
    DBEdit3: TEdit;
    cxGroupBox1: TcxGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    DBEdit1: TEdit;
    DBEdit2: TEdit;
    DBEdit4: TEdit;
    cxLabel1: TcxLabel;
    chk_ativocadastro: TcxCheckBox;
    Panel1: TPanel;
    cxButton9: TcxButton;
    cxButton11: TcxButton;
    cxButton12: TcxButton;
    cxButton16: TcxButton;
    cxButton17: TcxButton;
    cxButton18: TcxButton;
    cxButton3: TcxButton;
    cxButton1: TcxButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Memo1: TMemo;
    cxButton21: TcxButton;
    cxButton28: TcxButton;
    cxButton8: TcxButton;
    edMarcaDescricao: TEdit;
    cxButton2: TcxButton;
    edUnidade: TEdit;
    edUnidadeDescricao: TEdit;
    Label2: TLabel;
    edFamilia: TEdit;
    cxButton4: TcxButton;
    edFamiliaDescricao: TEdit;
    edGrupo: TEdit;
    cxButton5: TcxButton;
    edGrupoDescricao: TEdit;
    Label36: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    procedure cxButton11Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton16Click(Sender: TObject);
    procedure cxButton17Click(Sender: TObject);
    procedure cxButton19Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton12Click(Sender: TObject);
    procedure btn_grupoClick(Sender: TObject);
    procedure btn_subClick(Sender: TObject);
    procedure btn_undClick(Sender: TObject);
    procedure btn_familiaClick(Sender: TObject);
    procedure btn_marcaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure edMarcaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edUnidadeExit(Sender: TObject);
    procedure edGrupoExit(Sender: TObject);
    procedure edFamiliaExit(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);

  private
    { Private declarations }
    procedure PesquisaMarca;
    procedure PesquisaUnidade;
    procedure PesquisaFamilia;
    procedure PesquisaGrupo;


  public
    { Public declarations }

  protected
    { Protected declarations }

  end;

var
  Frm_Produto: TFrm_Produto;

implementation

{$R *.dfm}

uses Funcoes;
{cadastro_familia, cadastro_sub_grupo, cad_marca,
  cadastro_grupo, cadastro_unidade,  vw_etiquetas,
  dados_adicionais, vw_produto_precos, vw_preco_promocional, vw_preco_faixa, vw_composicao_preco, vw_estoque_opcoes,
  vw_comissao_produtos, vw_balanca, cadastro_fornecedor, cad_veiculos, consulta_produto, tributacao_produto;
}

procedure TFrm_Produto.cxButton11Click(Sender: TObject);
begin
  //frm_estoque_opcoes := tfrm_estoque_opcoes.CREATE(Application);
  //frm_estoque_opcoes.ShowModal;
end;

procedure TFrm_Produto.cxButton12Click(Sender: TObject);
begin
  //frm_dados_produtos := Tfrm_dados_produtos.CREATE(Application);
  //frm_dados_produtos.ShowModal;
end;

procedure TFrm_Produto.cxButton16Click(Sender: TObject);
begin
  //frm_balanca := Tfrm_balanca.CREATE(Application);
  //frm_balanca.ShowModal;
end;

procedure TFrm_Produto.cxButton17Click(Sender: TObject);
begin
  //frm_etiquetas := Tfrm_etiquetas.CREATE(Application);
  //frm_etiquetas.ShowModal;
end;

procedure TFrm_Produto.cxButton19Click(Sender: TObject);
begin
  //Frm_fornecedor := TFrm_fornecedor.CREATE(Application);
  //Frm_fornecedor.ShowModal;
end;

procedure TFrm_Produto.cxButton1Click(Sender: TObject);
begin
  //frm_tributacao_produto := Tfrm_tributacao_produto.CREATE(Application);
  //frm_tributacao_produto.ShowModal;
end;

procedure TFrm_Produto.cxButton2Click(Sender: TObject);
begin
   PesquisaUnidade;
end;

procedure TFrm_Produto.cxButton3Click(Sender: TObject);
begin
  //frm_produto_precos := tfrm_produto_precos.CREATE(Application);
  //frm_produto_precos.ShowModal;
end;

procedure TFrm_Produto.cxButton4Click(Sender: TObject);
begin
   PesquisaFamilia;
end;

procedure TFrm_Produto.cxButton5Click(Sender: TObject);
begin
   PesquisaGrupo;
end;

procedure TFrm_Produto.cxButton8Click(Sender: TObject);
begin
  //frm_consulta_produto := Tfrm_consulta_produto.CREATE(Application);
  //frm_consulta_produto.ShowModal
end;

procedure TFrm_Produto.cxButton9Click(Sender: TObject);
begin
  //frm_comissoes := Tfrm_comissoes.CREATE(Application);
  //frm_comissoes.ShowModal;
end;


procedure TFrm_Produto.edUnidadeExit(Sender: TObject);
begin
   if not SelectUnidade(edUnidade.Text,edUnidadeDescricao) then
   begin
      Avisos.Avisar('Unidade de medida inexistente...');
      edUnidade.SetFocus;
      exit;
   end;
end;

procedure TFrm_Produto.edFamiliaExit(Sender: TObject);
begin
    if not SelectFamilia(edFamilia.Text,edFamiliaDescricao) then
   begin
      Avisos.Avisar('Familia inexistente...');
      edFamilia.SetFocus;
      exit;
   end;
end;

procedure TFrm_Produto.edGrupoExit(Sender: TObject);
begin
   if not SelectGrupo(edGrupo.Text,edGrupoDescricao) then
   begin
      Avisos.Avisar('Grupo inexistente...');
      edGrupo.SetFocus;
      exit;
   end;
end;

procedure TFrm_Produto.edMarcaExit(Sender: TObject);
begin
   if not SelectMarca(edMarca.Text,edMarcaDescricao) then
   begin
      Avisos.Avisar('Marca inexistente...');
      edMarca.SetFocus;
      exit;
   end;
end;

procedure TFrm_Produto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
  self := nil;
end;

procedure TFrm_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f1 Then
   begin
           if edMarca.Focused         then PesquisaMarca
      else if edUnidade.Focused       then PesquisaUnidade
      else if edGrupo.Focused         then PesquisaGrupo
      else if edFamilia.Focused       then PesquisaFamilia;
   end;
end;

procedure TFrm_Produto.PesquisaFamilia;
begin
   if fPesquisarFamilia(edFamilia,edFamiliaDescricao) then
       edMarcaExit(nil)
    else
       edMarca.SetFocus;
end;

procedure TFrm_Produto.PesquisaGrupo;
begin
    if fPesquisarGrupo(edGrupo,edGrupoDescricao) then
       edGrupoExit(nil)
    else
       edGrupo.SetFocus;
end;

procedure TFrm_Produto.PesquisaMarca;
begin
    if fPesquisarMarca(edMarca,edMarcaDescricao) then
       edMarcaExit(nil)
    else
       edMarca.SetFocus;
end;

procedure TFrm_Produto.PesquisaUnidade;
begin
    if fPesquisarUnidade(edUnidade,edUnidadeDescricao) then
       edUnidadeExit(nil)
    else
       edUnidade.SetFocus;
end;

procedure TFrm_Produto.btn_undClick(Sender: TObject);
begin
  //Frm_unidade := TFrm_unidade.CREATE(Application);
  //Frm_unidade.ShowModal;
end;

procedure TFrm_Produto.btn_marcaClick(Sender: TObject);
begin
  PesquisaMarca;
  //Frm_Marca := TFrm_Marca.CREATE(Application);
  //Frm_Marca.ShowModal;
end;

procedure TFrm_Produto.btn_familiaClick(Sender: TObject);
begin
  //Frm_Familia := TFrm_Familia.CREATE(Application);
  //Frm_Familia.ShowModal;
  //SUBGRUPO.SetFocus;
end;

procedure TFrm_Produto.btn_grupoClick(Sender: TObject);
begin
  //Frm_Grupo := TFrm_Grupo.CREATE(Application);
  //Frm_Grupo.ShowModal;
end;

procedure TFrm_Produto.btn_subClick(Sender: TObject);
begin
  //Frm_SubGrupo := TFrm_SubGrupo.CREATE(Application);
  //Frm_SubGrupo.ShowModal;
end;

end.
