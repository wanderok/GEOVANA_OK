unit funcoes_T53;

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
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_funcoes_T53 = class(TForm)
    gdProds: TcxGrid;
    tbView: TcxGridDBTableView;
    gdProdsLevel1: TcxGridLevel;
    Label1: TLabel;
    edFiltro: TEdit;
    DataSource1: TDataSource;
    TS_CODIGO: TcxGridDBColumn;
    TS_NOMECURTO: TcxGridDBColumn;
    TS_DESCRICAO: TcxGridDBColumn;
    qLocal: TFDQuery;
    lbNomeDaTela: TLabel;
    Label24: TLabel;
    procedure edFiltroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
  frm_funcoes_T53: Tfrm_funcoes_T53;
  vfrm_funcoes_T53:String;

implementation

{$R *.dfm}

uses FuncoesSMC;
     //cadastro_produto_T40;

procedure Tfrm_funcoes_T53.Abrir_Cadastro_de_Produtos;
begin
{   if Assigned(frm_cadastro_produto_T40) then
   begin
      close;
      exit;
   end;
   frm_cadastro_produto_T40 := Tfrm_cadastro_produto_T40.Create(nil);
   if not qLocal.eof then
      frm_cadastro_produto_T40.edCodigo.Text := qLocal.fieldbyname('PROD_CODIGO').AsString;
   frm_cadastro_produto_T40.showmodal;
   frm_cadastro_produto_T40.free;
}
end;

procedure Tfrm_funcoes_T53.edFiltroChange(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_funcoes_T53.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
     if not edFiltro.focused then
     begin
        vfrm_funcoes_T53 := qLocal.FieldByName('TS_CODIGO').AsString;
        Close;
     end;
  end;
//  if key = VK_F2 then
//     Abrir_Cadastro_de_Produtos;
end;

procedure Tfrm_funcoes_T53.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
     begin
        Key := #0;
        if gdProds.Focused then
        begin
           vfrm_funcoes_T53:=qLocal.FieLdByName('TS_CODIGO').AsString;
        end;

        Perform(WM_NEXTDLGCTL, 0, 0);
        exit;
     end;
     if Key = #27 then
     begin
        Key := #0;
        vfrm_funcoes_T53:='';
        close;
        exit;
     end;

end;

procedure Tfrm_funcoes_T53.FormShow(Sender: TObject);
begin
  Pesquisar;
  vfrm_funcoes_T53 := '';
  edFiltro.SetFocus;
end;

procedure Tfrm_funcoes_T53.Pesquisar;
begin
   qlocal.Close;
   qlocal.sql.clear;
   qlocal.sql.add('SELECT * FROM TELAS_SISTEMA_TS');

   if edFiltro.Text <> '' then
   begin
      qlocal.sql.add(' WHERE TS_CODIGO = TS_CODIGO           ');
      qlocal.sql.add('   AND (                               ');
      qlocal.sql.add('            (TS_CODIGO    LIKE :FILTRO) ');
      qlocal.sql.add('         OR (TS_NOMECURTO LIKE :FILTRO) ');
      qlocal.sql.add('         OR (TS_DESCRICAO LIKE :FILTRO) ');
      qlocal.sql.add('       )                               ');
      qlocal.ParamByName('FILTRO').AsString := '%'+edFiltro.Text+'%';
   end;
   qlocal.sql.add('ORDER BY TS_DESCRICAO');
   qlocal.Open;
end;

procedure Tfrm_funcoes_T53.PreencherDetalhesDoProduto;
begin
end;

procedure Tfrm_funcoes_T53.PreencherEAN13;
begin
end;

end.


