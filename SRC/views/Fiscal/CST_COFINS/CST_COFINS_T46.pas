//Verificado automaticamente em 16/06/2020 09:28
unit CST_COFINS_T46;
{
================================================================================
|   DATA   |DESENVOLVEDOR|HISTORICO DA ALTERACAO DO CODIGO                     |
|----------|-------------|-----------------------------------------------------|
===============================================================================
}

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms,
  cxMemo, Vcl.StdCtrls, cxGroupBox, Vcl.Menus, cxButtons,
  Data.DB, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxDropDownEdit,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxRadioGroup, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxControls,
  cxContainer, cxEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, cxClasses, cxGridCustomView, cxMaskEdit, cxTextEdit,
  Vcl.DBCtrls, Vcl.ExtCtrls;

type
  Tfrm_CST_COFINS_T46 = class(TForm)
    SQL_COFINS: TFDQuery;
    DS_COFINS: TDataSource;
    grNatOP: TcxGroupBox;
    edFiltro: TEdit;
    gdNat: TcxGrid;
    tbView: TcxGridDBTableView;
    gdNatLevel1: TcxGridLevel;
    Label1: TLabel;
    tbViewColumn1: TcxGridDBColumn;
    tbViewColumn2: TcxGridDBColumn;
    Label4: TLabel;
    cxGroupBox2: TcxGroupBox;
    SQL_COFINSCOFINS_CODIGO: TStringField;
    SQL_COFINSCOFINS_DESCRICAO: TStringField;
    DBMemo2: TDBMemo;
    Panel2: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFiltroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  frm_CST_COFINS_T46: Tfrm_CST_COFINS_T46;

implementation

{$R *.dfm}

procedure Tfrm_CST_COFINS_T46.Pesquisar;
begin
  SQL_COFINS.Close;
  SQL_COFINS.sql.clear;
  SQL_COFINS.sql.add('SELECT *                            ');
  SQL_COFINS.sql.add('  FROM CST_COFINS                   ');
  SQL_COFINS.sql.add(' WHERE COFINS_CODIGO = COFINS_CODIGO');
  if edFiltro.text <> '' then
  begin
     SQL_COFINS.sql.add(' AND (    (COFINS_DESCRICAO  LIKE :FILTRO1) ');
     SQL_COFINS.sql.add('       OR (COFINS_CODIGO     LIKE :FILTRO1) ');
     SQL_COFINS.sql.add('     )                               ');
     SQL_COFINS.ParamByName('FILTRO1').AsString := '%'+edFiltro.text+'%';
  end;
  SQL_COFINS.sql.add('ORDER BY COFINS_CODIGO');
  SQL_COFINS.Open;
end;

procedure Tfrm_CST_COFINS_T46.edFiltroChange(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_CST_COFINS_T46.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
  Self := nil;
end;

procedure Tfrm_CST_COFINS_T46.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_escape then
    close;
end;

procedure Tfrm_CST_COFINS_T46.FormShow(Sender: TObject);
begin
   edFiltro.SetFocus;
end;

end.
