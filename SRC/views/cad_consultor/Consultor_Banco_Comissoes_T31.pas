unit Consultor_Banco_Comissoes_T31;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxLabel, cxMaskEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Mask, Vcl.DBCtrls, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue;

type
  TfrmConsultor_Banco_Comissoes_T31 = class(TForm)
    gpBanco: TGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDB_ID: TcxGridDBColumn;
    cxGridDB_BANCO: TcxGridDBColumn;
    cxGridDB_AGENCIA: TcxGridDBColumn;
    cxGridDB_AG_DIGITO: TcxGridDBColumn;
    cxGridDB_OP: TcxGridDBColumn;
    cxGridDB_CONTA: TcxGridDBColumn;
    cxGridDB_DIGITO: TcxGridDBColumn;
    cxGridDB_COMISSOES: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxButton21: TcxButton;
    cxButton28: TcxButton;
    Label1: TLabel;
    edBanco: TEdit;
    Edit1: TEdit;
    edDigitoAgencia: TEdit;
    edOperacao: TEdit;
    edConta: TEdit;
    edDigitoConta: TEdit;
    edComissao: TEdit;
    lbNomeDaTela: TLabel;
    procedure cxButton28Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton21Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultor_Banco_Comissoes_T31: TfrmConsultor_Banco_Comissoes_T31;
  vPodeFechar : Boolean;

implementation

{$R *.dfm}

procedure TfrmConsultor_Banco_Comissoes_T31.cxButton21Click(Sender: TObject);
begin
   vPodeFechar := True;
   Close;
end;

procedure TfrmConsultor_Banco_Comissoes_T31.cxButton28Click(Sender: TObject);
begin
  vPodeFechar:=True;
  Close;
end;

procedure TfrmConsultor_Banco_Comissoes_T31.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := vPodeFechar;
end;

procedure TfrmConsultor_Banco_Comissoes_T31.FormCreate(Sender: TObject);
begin
   vPodeFechar := False;
end;

end.
