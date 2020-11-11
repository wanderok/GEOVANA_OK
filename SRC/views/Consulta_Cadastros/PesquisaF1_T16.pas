unit PesquisaF1_T16;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, Vcl.Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, cxButtons,
  Vcl.Grids, Vcl.DBGrids, cxTextEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckBox, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, Vcl.Buttons;

type
  Tfrm_PesquisaF1_T16 = class(TForm)
    edFiltro: TEdit;
    DBGrid2: TDBGrid;
    bGravar: TcxButton;
    cxButton2: TcxButton;
    ACBrEnterTab1: TACBrEnterTab;
    qLocal: TFDQuery;
    DataSource1: TDataSource;
    lbNomeDaTela: TLabel;
    edCodigo: TEdit;
    SpeedButton1: TSpeedButton;
    procedure edFiltroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton2Click(Sender: TObject);
    procedure bGravarClick(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edFiltroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure pesquisar;
    procedure selecionar;
  public
    { Public declarations }
  end;

var
  frm_PesquisaF1_T16: Tfrm_PesquisaF1_T16;
  vfrm_PesquisaF1_T16,
  vfrm_PesquisaF1_T16Tabela         : String;

implementation

{$R *.dfm}

uses Dados, Funcoes;

procedure Tfrm_PesquisaF1_T16.bGravarClick(Sender: TObject);
begin
   if Trim(edFiltro.Text) = '' then
      exit;

   PesquisaF1.Codigo    := edCodigo.Text;
   PesquisaF1.Descricao := edFiltro.Text;
   PesquisaF1.Gravar;

   edFiltro.setfocus;
   Pesquisar;
end;

procedure Tfrm_PesquisaF1_T16.cxButton2Click(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_PesquisaF1_T16.DBGrid2DblClick(Sender: TObject);
begin
   Selecionar;
end;

procedure Tfrm_PesquisaF1_T16.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
     Selecionar;
end;

procedure Tfrm_PesquisaF1_T16.edCodigoExit(Sender: TObject);
begin
     if bGravar.Focused then
        exit;
     edFiltro.Text;
     if not PesquisaF1.ExisteCodigo(vfrm_PesquisaF1_T16Tabela,edCodigo.Text) then
        exit;
     edFiltro.text:=PesquisaF1.Descricao;
end;

procedure Tfrm_PesquisaF1_T16.edFiltroChange(Sender: TObject);
begin
   pesquisar;
end;

procedure Tfrm_PesquisaF1_T16.edFiltroKeyPress(Sender: TObject; var Key: Char);
begin
   key := fSemAcentos(key);
end;

procedure Tfrm_PesquisaF1_T16.FormShow(Sender: TObject);
begin
   vfrm_PesquisaF1_T16 := '';
end;

procedure Tfrm_PesquisaF1_T16.pesquisar;
begin
    PesquisaF1.ExisteDescricao(vfrm_PesquisaF1_T16Tabela,
                               edFiltro.Text,
                               qLocal);
end;

procedure Tfrm_PesquisaF1_T16.selecionar;
begin
   vfrm_PesquisaF1_T16 := qLocal.FieldByName('CODIGO').AsString;
   close;
end;

procedure Tfrm_PesquisaF1_T16.SpeedButton1Click(Sender: TObject);
begin
     edCodigo.Text := qLocal.FieldByName('CODIGO'   ).AsString;
     edFiltro.Text := qLocal.FieldByName('DESCRICAO').AsString;
end;

end.
