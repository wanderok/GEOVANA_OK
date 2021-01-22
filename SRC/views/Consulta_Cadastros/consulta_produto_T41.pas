unit consulta_produto_T41;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxLabel, cxCurrencyEdit, cxContainer, Vcl.StdCtrls, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, cxButtons,
  dxSkinOffice2007Silver, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  Tfrm_consulta_produto_T41 = class(TForm)
    gdProds: TcxGrid;
    tbView: TcxGridDBTableView;
    gdProdsLevel1: TcxGridLevel;
    chk_diff_estoque: TcxCheckBox;
    Label58: TLabel;
    Label63: TLabel;
    Label68: TLabel;
    Label35: TLabel;
    Label51: TLabel;
    QtdeItens: TLabel;
    lblprodcads: TLabel;
    Label1: TLabel;
    edFiltro: TEdit;
    Label24: TLabel;
    btn_relatorios_cli: TcxButton;
    qLocal: TFDQuery;
    DataSource1: TDataSource;
    tbViewPROD_CODIGO: TcxGridDBColumn;
    tbViewPROD_DESCRICAO: TcxGridDBColumn;
    tbViewColumn1: TcxGridDBColumn;
    tbViewColumn2: TcxGridDBColumn;
    tbViewColumn3: TcxGridDBColumn;
    qLocalPROD_CODIGO: TStringField;
    qLocalPROD_DESCRICAO: TStringField;
    qLocalPROD_STATUS: TIntegerField;
    qLocalPROD_PRECO_VAREJO: TFloatField;
    qLocalPROD_PRECO_DISTRIBUIDOR: TFloatField;
    qLocalPROD_PRECO_ATACADO: TFloatField;
    qLocalPROD_CDUM: TStringField;
    mmObservacoes: TMemo;
    qPRODUTO_OBS_PRODOBS: TFDQuery;
    qPRODUTO_EAN13_PRODE: TFDQuery;
    dsPRODUTO_EAN13_PRODE: TDataSource;
    DBGrid1: TDBGrid;
    Label14: TLabel;
    edPRODE_EAN13: TEdit;
    cxButton6: TcxButton;
    bCadastro: TcxButton;
    Panel2: TPanel;
    procedure edFiltroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure qLocalAfterScroll(DataSet: TDataSet);
    procedure cxButton6Click(Sender: TObject);
    procedure bCadastroClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Pesquisar;
    procedure PreencherDetalhesDoProduto;
    Procedure PreencherEAN13;
    Procedure Abrir_Cadastro_de_Produtos;
  public
    { Public declarations }
  end;

var
  frm_consulta_produto_T41: Tfrm_consulta_produto_T41;
  vfrm_consulta_produto_T41:String;

implementation

{$R *.dfm}

uses FuncoesSMC,
     cadastro_produto_T40;

procedure Tfrm_consulta_produto_T41.Abrir_Cadastro_de_Produtos;
begin
   if Assigned(frm_cadastro_produto_T40) then
   begin
      close;
      exit;
   end;
   frm_cadastro_produto_T40 := Tfrm_cadastro_produto_T40.Create(nil);
   if not qLocal.eof then
      frm_cadastro_produto_T40.edCodigo.Text := qLocal.fieldbyname('PROD_CODIGO').AsString;
   frm_cadastro_produto_T40.showmodal;
   frm_cadastro_produto_T40.free;
end;

procedure Tfrm_consulta_produto_T41.cxButton6Click(Sender: TObject);
begin
   if qLocal.eof then
      exit;
   if not fTemAcesso('CADEAN') then
      exit;
   if ((Length(edPRODE_EAN13.Text) <>  8)  and
       (Length(edPRODE_EAN13.Text) <> 13)) then
   begin
      Avisos.Avisar('Código de Barras inválido');
      exit;
   end;
   Incluir_EAN13('T41',
                 qLocal.fieldbyname('PROD_CODIGO').AsString,
                 edPRODE_EAN13.Text);
   PreencherEAN13;
end;

procedure Tfrm_consulta_produto_T41.bCadastroClick(Sender: TObject);
begin
   Abrir_Cadastro_de_Produtos;
end;

procedure Tfrm_consulta_produto_T41.edFiltroChange(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_consulta_produto_T41.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
     if not edFiltro.focused then
     begin
        vfrm_consulta_produto_T41 := qLocal.FieldByName('PROD_CODIGO').AsString;
        Close;
     end;
  end;
  if key = VK_F2 then
     Abrir_Cadastro_de_Produtos;
end;

procedure Tfrm_consulta_produto_T41.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
     begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
        exit;
     end;
end;

procedure Tfrm_consulta_produto_T41.FormShow(Sender: TObject);
begin
  vfrm_consulta_produto_T41 := '';
  edFiltro.SetFocus;
end;

procedure Tfrm_consulta_produto_T41.Pesquisar;
begin
   qlocal.Close;
   qlocal.sql.clear;
   qlocal.sql.add('SELECT * FROM PRODUTO_PROD');
   if edFiltro.Text <> '' then
   begin
      qlocal.sql.add(' WHERE PROD_CODIGO = PROD_CODIGO                               ');
      qlocal.sql.add('   AND (                                                       ');
      qlocal.sql.add('            (PROD_CODIGO    =    :FILTRO1)                     ');
      qlocal.sql.add('         OR (PROD_DESCRICAO LIKE :FILTRO2)                     ');
      qlocal.sql.add('         OR (PROD_CODIGO IN (SELECT PRODE_CODIGO               ');
      qlocal.sql.add('                               FROM PRODUTO_EAN13_PRODE        ');
      qlocal.sql.add('                              WHERE PRODE_EAN13 LIKE :FILTRO2))');
      qlocal.sql.add('       )                                                       ');
      qlocal.ParamByName('FILTRO1').AsString := edFiltro.Text;
      qlocal.ParamByName('FILTRO2').AsString := '%'+edFiltro.Text+'%';
   end;
   qlocal.sql.add('ORDER BY PROD_DESCRICAO');
   qlocal.Open;
end;

procedure Tfrm_consulta_produto_T41.PreencherDetalhesDoProduto;
var i:integer;
    ScrollMessage: TWMVScroll; //uses Winapi.Messages
begin
   mmObservacoes.Lines.Clear;
   if qLocal.eof then
      exit;
   qPRODUTO_OBS_PRODOBS.Close;
   qPRODUTO_OBS_PRODOBS.Sql.Clear;
   qPRODUTO_OBS_PRODOBS.Sql.Add('SELECT PRODOBS_TEXTO          ');
   qPRODUTO_OBS_PRODOBS.Sql.Add('  FROM PRODUTO_OBS_PRODOBS    ');
   qPRODUTO_OBS_PRODOBS.Sql.Add(' WHERE PRODOBS_CODIGO = :COD  ');
   qPRODUTO_OBS_PRODOBS.Sql.Add(' ORDER BY PRODOBS_LINHA       ');
   qPRODUTO_OBS_PRODOBS.ParamByName('COD').AsString := qLocal.fieldbyname('PROD_CODIGO').AsString;
   qPRODUTO_OBS_PRODOBS.Open;
   while not qPRODUTO_OBS_PRODOBS.eof do
   begin
     mmObservacoes.Lines.add(qPRODUTO_OBS_PRODOBS.fieldbyname('PRODOBS_TEXTO').AsString);
     qPRODUTO_OBS_PRODOBS.Next;
   end;
  ScrollMessage.Msg := WM_VSCROLL;
  mmObservacoes.Lines.BeginUpdate;
  try
    for i := 0 to mmObservacoes.Lines.Count do
    begin
     ScrollMessage.ScrollCode := SB_LINEUP;
     ScrollMessage.Pos := 0;
     mmObservacoes.Dispatch(ScrollMessage);
    end;
  finally
    mmObservacoes.Lines.EndUpdate;
  end;
end;

procedure Tfrm_consulta_produto_T41.PreencherEAN13;
begin
    qPRODUTO_EAN13_PRODE.Close;
    if qLocal.eof then
      exit;
    qPRODUTO_EAN13_PRODE.Sql.Clear;
    qPRODUTO_EAN13_PRODE.Sql.Add('SELECT * FROM PRODUTO_EAN13_PRODE   ');
    qPRODUTO_EAN13_PRODE.Sql.Add(' WHERE PRODE_CODIGO = :PRODE_CODIGO ');
    qPRODUTO_EAN13_PRODE.ParamByName('PRODE_CODIGO').AsString := qLocal.fieldbyname('PROD_CODIGO').AsString;
    qPRODUTO_EAN13_PRODE.Sql.Add(' ORDER BY PRODE_EAN13               ');
    qPRODUTO_EAN13_PRODE.Open;
end;

procedure Tfrm_consulta_produto_T41.qLocalAfterScroll(DataSet: TDataSet);
begin
    PreencherDetalhesDoProduto;
    PreencherEAN13;
end;


end.


