unit cad_ramo_atividade_T9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.DBGrids, Vcl.ComCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, cxMaskEdit,
  cxDropDownEdit, cxDBEdit,
  cxButtons, cxTextEdit, dxGDIPlusClasses, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt,
  cxClasses, dxSkinsForm, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Grids, Vcl.Mask, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  Tfrm_cad_ramo_atividade_T9 = class(TForm)
    Label5: TLabel;
    edFiltro: TEdit;
    DBGrid2: TDBGrid;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ACBrEnterTab1: TACBrEnterTab;
    qLocal: TFDQuery;
    DataSource1: TDataSource;
    lbNomeDaTela: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edFiltroChange(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Selecionar;
  public
    { Public declarations }
  end;

var
  frm_cad_ramo_atividade_T9: Tfrm_cad_ramo_atividade_T9;
  vFRM_cad_ramo_atividade:String;

implementation

{$R *.dfm}

{ TFRM_cad_ramo_atividade }

procedure Tfrm_cad_ramo_atividade_T9.DBGrid2DblClick(Sender: TObject);
begin
   Selecionar;
end;

procedure Tfrm_cad_ramo_atividade_T9.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
     Selecionar;
end;

procedure Tfrm_cad_ramo_atividade_T9.edFiltroChange(Sender: TObject);
begin
   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('SELECT *                                ');
   qLocal.Sql.Add('  FROM RAMOATIVIDADE_RAMO               ');
   qLocal.Sql.Add(' WHERE RAMO_DESCRICAO  = :RAMO_DESCRICAO');
   qLocal.Sql.Add(' ORDER BY RAMO_DESCRICAO                ');
   qLocal.ParamByName('RAMO_DESCRICAO').AsString := '%'+Trim(edFiltro.Text)+'%';
   qLocal.Open;
end;

procedure Tfrm_cad_ramo_atividade_T9.FormShow(Sender: TObject);
begin
   vFRM_cad_ramo_atividade := '';
end;

procedure Tfrm_cad_ramo_atividade_T9.Selecionar;
begin
   vFRM_cad_ramo_atividade := qLocal.FieldByName('RAMO_CODIGO').AsString;
   close;
end;

end.

