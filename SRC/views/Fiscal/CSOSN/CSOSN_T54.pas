//Verificado automaticamente em 16/06/2020 09:28
unit CSOSN_T54;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinOffice2013LightGray,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, cxTextEdit, cxMemo, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGrid, Vcl.Menus, cxButtons, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, cxGridDBTableView,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGroupBox;

type
  Tfrm_CSOSN_T54 = class(TForm)
    qLocal: TFDQuery;
    DS_CEST: TDataSource;
    gdNat: TcxGrid;
    tbView: TcxGridDBTableView;
    CSOSN_CODIGO: TcxGridDBColumn;
    gdNatLevel1: TcxGridLevel;
    CSOSN_DESCRICAO: TcxGridDBColumn;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edFiltro: TEdit;
    lbNomeDaTela: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edFiltroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  frm_CSOSN_T54: Tfrm_CSOSN_T54;

implementation

{$R *.dfm}

procedure Tfrm_CSOSN_T54.cxButton1Click(Sender: TObject);
begin
 If Application.MessageBox('Deseja baixar nova tabela?','Atualização de Tabela NCM | CEST',MB_YESNO +
                           MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
end;

procedure Tfrm_CSOSN_T54.cxButton2Click(Sender: TObject);
begin
 If Application.MessageBox('Deseja realizar a importação e atualização de NCM E CEST?','Atualização de Tabela NCM | CEST',MB_YESNO +
                           MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
end;

procedure Tfrm_CSOSN_T54.cxButton6Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_CSOSN_T54.edFiltroChange(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_CSOSN_T54.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
  self := nil;
end;

procedure Tfrm_CSOSN_T54.FormShow(Sender: TObject);
begin
     edFiltro.SetFocus;
end;

procedure Tfrm_CSOSN_T54.Pesquisar;
begin
  qLocal.Close;
  qLocal.sql.clear;
  qLocal.sql.add('SELECT *                     ');
  qLocal.sql.add('  FROM TABELA_CSOSN          ');
  qLocal.sql.add(' WHERE CSOSN_CODIGO = CSOSN_CODIGO ');
  if edFiltro.text <> '' then
  begin
     qLocal.sql.add(' AND (    (CSOSN_CODIGO    LIKE :FILTRO1) ');
     qLocal.sql.add('       OR (CSOSN_DESCRICAO LIKE :FILTRO1) ');
     qLocal.sql.add('     )                                    ');
     qLocal.ParamByName('FILTRO1').AsString := '%'+edFiltro.text+'%';
  end;
  qLocal.sql.add('ORDER BY CSOSN_CODIGO');
  qLocal.Open;
end;

end.
