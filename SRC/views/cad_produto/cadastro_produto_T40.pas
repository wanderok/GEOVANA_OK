{ v 13.10.20 8:08am }

unit cadastro_produto_T40;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils, System.Variants,
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
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab,

  Classe_Produto,
  Classe_Nuvem;

type
  Tfrm_cadastro_produto_T40 = class(TForm)
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    A: TLabel;
    Label5: TLabel;
    Label37: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    lbl2: TLabel;
    btn_sub: TcxButton;
    btn_marca: TcxButton;
    edNome: TEdit;
    REFERENCIA_FABRICANTE: TEdit;
    edMarca: TEdit;
    edCodigo: TEdit;
    cxGroupBox1: TcxGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    edVarejo: TEdit;
    edDistribuidor: TEdit;
    edAtacado: TEdit;
    Panel1: TPanel;
    cxButton9: TcxButton;
    cxButton11: TcxButton;
    cxButton12: TcxButton;
    cxButton16: TcxButton;
    cxButton17: TcxButton;
    cxButton18: TcxButton;
    cxButton3: TcxButton;
    cxButton1: TcxButton;
    mmObservacoes: TMemo;
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
    rgStatus: TRadioGroup;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    qPRODUTO_EAN13_PRODE: TFDQuery;
    dsPRODUTO_EAN13_PRODE: TDataSource;
    DBGrid1: TDBGrid;
    edPRODE_EAN13: TEdit;
    cxButton6: TcxButton;
    edSubGrupo: TEdit;
    edSubGrupoDescricao: TEdit;
    cxButton28: TcxButton;
    cxButton21: TcxButton;
    cxButton8: TcxButton;
    Label3: TLabel;
    Label14: TLabel;
    edTipoProduto: TEdit;
    cxButton7: TcxButton;
    edTipoProdutoDescricao: TEdit;
    edImpressora: TEdit;
    cxButton10: TcxButton;
    edImpressoraDescricao: TEdit;
    Panel2: TPanel;
    procedure cxButton11Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton16Click(Sender: TObject);
    procedure cxButton17Click(Sender: TObject);
    procedure cxButton19Click(Sender: TObject);
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
    procedure edCodigoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton28Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton21Click(Sender: TObject);
    procedure edSubGrupoExit(Sender: TObject);
    procedure edTipoProdutoExit(Sender: TObject);
    procedure edImpressoraExit(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton10Click(Sender: TObject);

  private
    { Private declarations }
    procedure PesquisaMarca;
    procedure PesquisaUnidade;
    procedure PesquisaFamilia;
    procedure PesquisaGrupo;
    procedure PesquisaSubGrupo;
    procedure PesquisaTipoProduto;
    procedure PesquisaImpressora;
    procedure Pesquisar;
    procedure PreencherEAN13;
    procedure Preparar_Campos_da_Tela;
    procedure Preencher_Campos_da_Tela;
    procedure Inicio;
    function DadosCorretos:Boolean;
    function Gravar_Produto:Boolean;
    procedure Preencher_Observacoes;
    procedure Consultar;
  public
    { Public declarations }

  protected
    { Protected declarations }

  end;

var
  frm_cadastro_produto_T40: Tfrm_cadastro_produto_T40;
  Produto    : TProduto;
  vMemoLocal : TMemo;

implementation

{$R *.dfm}

uses FuncoesSMC,
     TiposDeDados,
     consulta_produto_T41,
     tributacao_produto_T52;
{cadastro_familia, cadastro_sub_grupo, cad_marca,
  cadastro_grupo, cadastro_unidade,  vw_etiquetas,
  dados_adicionais, vw_produto_precos, vw_preco_promocional, vw_preco_faixa, vw_composicao_preco, vw_estoque_opcoes,
  vw_comissao_produtos, vw_balanca, cadastro_fornecedor, cad_veiculos, consulta_produto, tributacao_produto;
}

procedure Tfrm_cadastro_produto_T40.cxButton10Click(Sender: TObject);
begin
   PesquisaImpressora;
end;

procedure Tfrm_cadastro_produto_T40.cxButton11Click(Sender: TObject);
begin
  //frm_estoque_opcoes := tfrm_estoque_opcoes.CREATE(Application);
  //frm_estoque_opcoes.ShowModal;
end;

procedure Tfrm_cadastro_produto_T40.cxButton12Click(Sender: TObject);
begin
  //frm_dados_produtos := Tfrm_dados_produtos.CREATE(Application);
  //frm_dados_produtos.ShowModal;
end;

procedure Tfrm_cadastro_produto_T40.cxButton16Click(Sender: TObject);
begin
  //frm_balanca := Tfrm_balanca.CREATE(Application);
  //frm_balanca.ShowModal;
end;

procedure Tfrm_cadastro_produto_T40.cxButton17Click(Sender: TObject);
begin
  //frm_etiquetas := Tfrm_etiquetas.CREATE(Application);
  //frm_etiquetas.ShowModal;
end;

procedure Tfrm_cadastro_produto_T40.cxButton19Click(Sender: TObject);
begin
  //Frm_fornecedor := TFrm_fornecedor.CREATE(Application);
  //Frm_fornecedor.ShowModal;
end;

procedure Tfrm_cadastro_produto_T40.cxButton1Click(Sender: TObject);
begin
  if edCodigo.Text = '' then
  begin
     edCodigo.SetFocus;
     exit;
  end;

  frm_tributacao_produto_T52 := Tfrm_tributacao_produto_T52.CREATE(Application);
  Produto_T52.Codigo := Produto.Codigo;
  frm_tributacao_produto_T52.ShowModal;
  Produto.Abrir;
  frm_tributacao_produto_T52.Free;
end;

procedure Tfrm_cadastro_produto_T40.cxButton21Click(Sender: TObject);
var vNuvem: TNuvem;
begin
   if Produto.Existe then
   begin
      if not fTemAcesso(Usuario.Codigo,'ALTPROD') then
          exit;
   end
   else
      if not fTemAcesso(Usuario.Codigo,'CADPROD') then
          exit;

   if not DadosCorretos then
      exit;

   if not Gravar_Produto then
     exit;

   vNuvem:= TNuvem.Create;
   vNuvem.uploadProduto(Produto);
   FreeAndNil(vNuvem);

   Inicio;

end;

procedure Tfrm_cadastro_produto_T40.cxButton28Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_cadastro_produto_T40.cxButton2Click(Sender: TObject);
begin
   PesquisaUnidade;
end;

procedure Tfrm_cadastro_produto_T40.cxButton4Click(Sender: TObject);
begin
   PesquisaFamilia;
end;

procedure Tfrm_cadastro_produto_T40.cxButton5Click(Sender: TObject);
begin
   PesquisaGrupo;
end;

procedure Tfrm_cadastro_produto_T40.cxButton6Click(Sender: TObject);
begin
   if not DadosCorretos then
      exit;

   if not Gravar_Produto then
     exit;

   if not fTemAcesso('CADEAN') then
      exit;
   if ((Length(edPRODE_EAN13.Text) <>  8)  and
       (Length(edPRODE_EAN13.Text) <> 13)) then
   begin
      Avisos.Avisar('Código de Barras inválido');
      exit;
   end;
   Incluir_EAN13('T40',edCodigo.Text,edPRODE_EAN13.Text);
   PreencherEAN13;
   edPRODE_EAN13.Text:='';
   try
     edPRODE_EAN13.SetFocus;
   except
   end;
end;

procedure Tfrm_cadastro_produto_T40.cxButton7Click(Sender: TObject);
begin
   PesquisaTipoProduto;
end;

procedure Tfrm_cadastro_produto_T40.cxButton8Click(Sender: TObject);
begin
  Consultar;
end;

procedure Tfrm_cadastro_produto_T40.Consultar;
begin
  frm_consulta_produto_T41 := Tfrm_consulta_produto_T41.CREATE(Application);
  frm_consulta_produto_T41.ShowModal;
  edCodigo.Text := vfrm_consulta_produto_T41;
  frm_consulta_produto_T41.Free;
  Pesquisar;
end;

procedure Tfrm_cadastro_produto_T40.cxButton9Click(Sender: TObject);
begin
  //frm_comissoes := Tfrm_comissoes.CREATE(Application);
  //frm_comissoes.ShowModal;
end;


function Tfrm_cadastro_produto_T40.DadosCorretos: Boolean;
begin
   result := false;

   edNOME.Tag                 := Campo_Obrigatorio;
   edUnidade.Tag               := Campo_Obrigatorio;

   if NaoPreencheuCamposObrigatoriosOuImportantes(frm_cadastro_produto_T40) then
      exit;

   result := true;
end;

procedure Tfrm_cadastro_produto_T40.DBGrid1DblClick(Sender: TObject);
begin
   if qPRODUTO_EAN13_PRODE.eof then
      exit;
   if not fTemAcesso('CADEAN') then
      exit;
   edPRODE_EAN13.Text := qPRODUTO_EAN13_PRODE.FieldByName('PRODE_EAN13').AsString;
   Excluir_EAN13('T40',edCodigo.Text,edPRODE_EAN13.Text);
   PreencherEAN13;
   try
      edPRODE_EAN13.SetFocus;
   except
   end;
end;

procedure Tfrm_cadastro_produto_T40.edCodigoExit(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_cadastro_produto_T40.edUnidadeExit(Sender: TObject);
begin
   if not SelectUnidade(edUnidade.Text,edUnidadeDescricao) then
   begin
      Avisos.Avisar('Unidade de medida inexistente...');
      try
        edUnidade.SetFocus;
      except
      end;
      exit;
   end;
end;

procedure Tfrm_cadastro_produto_T40.edFamiliaExit(Sender: TObject);
begin
    if not SelectFamilia(edFamilia.Text,edFamiliaDescricao) then
   begin
      Avisos.Avisar('Familia inexistente...');
      try
         edFamilia.SetFocus;
      except
      end;
      exit;
   end;
end;

procedure Tfrm_cadastro_produto_T40.edGrupoExit(Sender: TObject);
begin
   if not SelectGrupo(edGrupo.Text,edGrupoDescricao) then
   begin
      Avisos.Avisar('Grupo inexistente...');
      try
         edGrupo.SetFocus;
      except
      end;
      exit;
   end;
end;

procedure Tfrm_cadastro_produto_T40.edImpressoraExit(Sender: TObject);
begin
   if not SelectImpressora(edImpressora.Text,edImpressoraDescricao) then
   begin
      Avisos.Avisar('Impressora inexistente...');
      try
         edImpressora.SetFocus;
      except
      end;
      exit;
   end;
end;

procedure Tfrm_cadastro_produto_T40.edMarcaExit(Sender: TObject);
begin
   if not SelectMarca(edMarca.Text,edMarcaDescricao) then
   begin
      Avisos.Avisar('Marca inexistente...');
      try
         edMarca.SetFocus;
      except
      end;
      exit;
   end;
end;

procedure Tfrm_cadastro_produto_T40.edSubGrupoExit(Sender: TObject);
begin
   edSubGrupoDescricao.Text := '';
   if edSubGrupo.Text = '' then
      exit;

   if edGrupo.Text = '' then
   begin
      edSubGrupo.Text := '';
      Avisos.Avisar('Informe o Grupo');
      try
         edGrupo.SetFocus;
      except
      end;
      exit;
   end;

   if not SelectSubGrupo(edGrupo.Text,edSubGrupo.Text,edSubGrupoDescricao) then
   begin
      Avisos.Avisar('Subgrupo inexistente...');
      try
         edSubGrupo.SetFocus;
      except
      end;
      exit;
   end;
end;

procedure Tfrm_cadastro_produto_T40.edTipoProdutoExit(Sender: TObject);
begin
   if not SelectTipoProduto(edTipoProduto.Text,edTipoProdutoDescricao) then
   begin
      Avisos.Avisar('Tipo de Produto inexistente...');
      try
        edTipoProduto.SetFocus;
      except
      end;
      exit;
   end;
end;

procedure Tfrm_cadastro_produto_T40.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(vMemoLocal);
  FreeAndNil(Produto);
  Action := cafree;
  self := nil;
end;

procedure Tfrm_cadastro_produto_T40.FormCreate(Sender: TObject);
begin
   Produto := TProduto.Create;
   try
     if vMemoLocal = nil then
        vMemoLocal:=TMemo.Create(frm_cadastro_produto_T40)
     else
     begin
        vMemoLocal.Free;
        vMemoLocal:=TMemo.Create(frm_cadastro_produto_T40);
     end;
   except
     vMemoLocal.Free;
     try
        vMemoLocal:=TMemo.Create(frm_cadastro_produto_T40);
     except
        //vPodeFechar:=True;
        Close;
     end;
   end;
   vMemoLocal.Parent := mmObservacoes.Parent;
   vMemoLocal.Height := 442;
   vMemoLocal.Width  := 968;
   vMemoLocal.WordWrap:=true;
   vMemoLocal.font.size  := 16;
   vMemoLocal.font.Name  := 'Tahoma';
   vMemoLocal.font.Style := [fsBold];
   vMemoLocal.Visible    := false;
   //vPodeFechar:=False;
end;

procedure Tfrm_cadastro_produto_T40.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f1 Then
   begin
           if edMarca.Focused         then PesquisaMarca
      else if edUnidade.Focused       then PesquisaUnidade
      else if edGrupo.Focused         then PesquisaGrupo
      else if edFamilia.Focused       then PesquisaFamilia
      else if edSubGrupo.Focused      then PesquisaSubGrupo
      else if edTipoProduto.Focused   then PesquisaTipoProduto
      else if edImpressora.Focused    then PesquisaImpressora;
   end;
end;

procedure Tfrm_cadastro_produto_T40.FormShow(Sender: TObject);
begin
   Inicio;
end;

function Tfrm_cadastro_produto_T40.Gravar_Produto: Boolean;
var Lista : TStringList;
    i     : integer;
begin
    Result := False;
    try
        Produto.Codigo                      := edCodigo.Text;
        Produto.Nome                        := edNome.Text;
        Produto.Unidade                     := edUnidade.Text;
        Produto.Status                      := IntToStatusCadastral(rgStatus.ItemIndex);

        Produto.Detalhes.Marca              := edMarca.Text;
        Produto.Detalhes.Familia            := edFamilia.Text;
        Produto.Detalhes.Grupo              := edGrupo.Text;
        Produto.Detalhes.SubGrupo           := edSubGrupo.Text;
        Produto.Detalhes.Tipo               := edTipoProduto.Text;
        Produto.Detalhes.Impressora         := edImpressora.Text;

        Produto.Precos.Varejo       := ZeroSeValorInvalido(edVarejo.Text);
        Produto.Precos.Distribuidor := ZeroSeValorInvalido(edDistribuidor.Text);
        Produto.Precos.Atacado      := ZeroSeValorInvalido(edAtacado.Text);

        Lista := TStringList.Create;
        for i := 0 to mmObservacoes.lines.count-1 do
            Lista.Add(mmObservacoes.lines[i]);

        Produto.Observacao := Lista;
        result := Produto.Gravar;
    Except

    end;
end;

procedure Tfrm_cadastro_produto_T40.Inicio;
begin
   Preparar_Campos_da_Tela;
   Limpar_os_campos_da_Tela(frm_cadastro_produto_T40);
   try
     edCodigo.SetFocus;
   except
   end;
end;

procedure Tfrm_cadastro_produto_T40.PesquisaFamilia;
begin
   if fPesquisarFamilia(edFamilia,edFamiliaDescricao) then
       edFamiliaExit(nil)
    else
       try
          edFamilia.SetFocus;
       except
       end;
end;

procedure Tfrm_cadastro_produto_T40.PesquisaGrupo;
begin
    if fPesquisarGrupo(edGrupo,edGrupoDescricao) then
       edGrupoExit(nil)
    else
       try
          edGrupo.SetFocus;
       except
       end;
end;

procedure Tfrm_cadastro_produto_T40.PesquisaImpressora;
begin
    if fPesquisarImpressora(edImpressora,edImpressoraDescricao) then
       edImpressoraExit(nil)
    else
       try
          edImpressora.SetFocus;
       except
       end;
end;

procedure Tfrm_cadastro_produto_T40.PesquisaMarca;
begin
    if fPesquisarMarca(edMarca,edMarcaDescricao) then
       edMarcaExit(nil)
    else
       try
          edMarca.SetFocus;
       except
       end;
end;

procedure Tfrm_cadastro_produto_T40.Pesquisar;
var vCodigo:String;
begin
   if edCodigo.Text = '' then
   begin
      Limpar_os_campos_da_Tela(frm_cadastro_produto_T40);
      try
         rgStatus.SetFocus;
      except
      end;
      exit;
   end;
   Produto.Codigo := edCodigo.Text;
   Produto.Abrir;
   if Produto.Existe then
      Preencher_Campos_da_Tela
   else
   begin
      vCodigo := edCodigo.Text;
      Limpar_os_campos_da_Tela(frm_cadastro_produto_T40);
      edCodigo.Text := vCodigo;
      try
         rgStatus.SetFocus;
      except
      end;
      exit;
   end;

end;

procedure Tfrm_cadastro_produto_T40.PesquisaSubGrupo;
begin
    if fPesquisarSubGrupo(edGrupo,edSubGrupo,edGrupoDescricao) then
       edSubGrupoExit(nil)
    else
       try
          edSubGrupo.SetFocus;
       except
       end;
end;

procedure Tfrm_cadastro_produto_T40.PesquisaTipoProduto;
begin
    if fPesquisarTipoProduto(edTipoProduto,edTipoProdutoDescricao) then
       edTipoProdutoExit(nil)
    else
       try
          edTipoProduto.SetFocus;
       except
       end;
end;

procedure Tfrm_cadastro_produto_T40.PesquisaUnidade;
begin
    if fPesquisarUnidade(edUnidade,edUnidadeDescricao) then
       edUnidadeExit(nil)
    else
       try
          edUnidade.SetFocus;
       except
       end;
end;

procedure Tfrm_cadastro_produto_T40.PreencherEAN13;
begin
    qPRODUTO_EAN13_PRODE.Close;
    qPRODUTO_EAN13_PRODE.Sql.Clear;
    qPRODUTO_EAN13_PRODE.Sql.Add('SELECT * FROM PRODUTO_EAN13_PRODE   ');
    qPRODUTO_EAN13_PRODE.Sql.Add(' WHERE PRODE_CODIGO = :PRODE_CODIGO ');
    qPRODUTO_EAN13_PRODE.ParamByName('PRODE_CODIGO').AsString := edCodigo.Text;
    qPRODUTO_EAN13_PRODE.Sql.Add(' ORDER BY PRODE_EAN13               ');
    qPRODUTO_EAN13_PRODE.Open;
end;

procedure Tfrm_cadastro_produto_T40.Preencher_Campos_da_Tela;
begin
   if not fTemAcesso('CONPROD') then
      exit;

   Limpar_os_campos_da_Tela(frm_cadastro_produto_T40);

   edCodigo.Text      := Produto.Codigo;
   edNome.Text        := Produto.Nome;

   edUnidade.Text     := Produto.Unidade;
   SelectUnidade(edUnidade.Text,edUnidadeDescricao);

   rgStatus.ItemIndex := StatusCadastralToInt(Produto.Status);

   edVarejo.Text       := FormatFloat('#,##0.00',Produto.Precos.Varejo);
   edDistribuidor.Text := FormatFloat('#,##0.00',Produto.Precos.Distribuidor);
   edAtacado.Text      := FormatFloat('#,##0.00',Produto.Precos.Atacado);


   edMarca.Text       := Produto.Detalhes.Marca;
   SelectMarca(edMarca.Text,edMarcaDescricao);

   edFamilia.Text     := Produto.Detalhes.Familia;
   SelectFamilia(edFamilia.Text,edFamiliaDescricao);

   edGrupo.Text       := Produto.Detalhes.Grupo;
   SelectGrupo(edGrupo.Text,edGrupoDescricao);

   edSubGrupo.Text    := Produto.Detalhes.SubGrupo;
   SelectSubGrupo(edGrupo.Text,edSubGrupo.Text,edSubGrupoDescricao);

   edTipoProduto.Text := Produto.Detalhes.Tipo;
   SelectTipoProduto(edTipoProduto.Text,edTipoProdutoDescricao);

   edImpressora.Text := Produto.Detalhes.Impressora;
   SelectImpressora(edImpressora.Text,edImpressoraDescricao);

   Preencher_Observacoes;
   PreencherEAN13;
end;

procedure Tfrm_cadastro_produto_T40.Preencher_Observacoes;
var i     : Integer;
  ScrollMessage: TWMVScroll; //uses Winapi.Messages
begin
   mmObservacoes.lines.clear;
   for i := 0 to Produto.Observacao.count-1 do
       mmObservacoes.lines.add(Produto.Observacao[i]);

  ScrollMessage.Msg := WM_VSCROLL;
  mmObservacoes.Lines.BeginUpdate;
  try
    for I := 0 to mmObservacoes.Lines.Count do
    begin
     ScrollMessage.ScrollCode := SB_LINEUP;
     ScrollMessage.Pos := 0;
     mmObservacoes.Dispatch(ScrollMessage);
    end;
  finally
    mmObservacoes.Lines.EndUpdate;
  end;
end;

procedure Tfrm_cadastro_produto_T40.Preparar_Campos_da_Tela;
begin
   edCodigo.MaxLength          := 20;
   edNome.MaxLength            := 100;
end;

procedure Tfrm_cadastro_produto_T40.btn_undClick(Sender: TObject);
begin
  //Frm_unidade := TFrm_unidade.CREATE(Application);
  //Frm_unidade.ShowModal;
end;

procedure Tfrm_cadastro_produto_T40.btn_marcaClick(Sender: TObject);
begin
  PesquisaMarca;
  //Frm_Marca := TFrm_Marca.CREATE(Application);
  //Frm_Marca.ShowModal;
end;

procedure Tfrm_cadastro_produto_T40.btn_familiaClick(Sender: TObject);
begin
  //Frm_Familia := TFrm_Familia.CREATE(Application);
  //Frm_Familia.ShowModal;
  //SUBGRUPO.SetFocus;
end;

procedure Tfrm_cadastro_produto_T40.btn_grupoClick(Sender: TObject);
begin
  //Frm_Grupo := TFrm_Grupo.CREATE(Application);
  //Frm_Grupo.ShowModal;
end;

procedure Tfrm_cadastro_produto_T40.btn_subClick(Sender: TObject);
begin
  PesquisaSubGrupo;
end;

end.
