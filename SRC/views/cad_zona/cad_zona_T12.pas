unit cad_zona_T12;

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
  Tfrm_cad_zona_T12 = class(TForm)
    Label5: TLabel;
    edFiltro: TEdit;
    DBGrid2: TDBGrid;
    bGravar: TcxButton;
    cxButton2: TcxButton;
    lbNomeDaTela: TLabel;
    DataSource1: TDataSource;
    qLocal: TFDQuery;
    ACBrEnterTab1: TACBrEnterTab;
    procedure edFiltroChange(Sender: TObject);
    procedure bGravarClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure pesquisar;
    procedure selecionar;
  public
    { Public declarations }
  end;

var
  frm_cad_zona_T12: Tfrm_cad_zona_T12;
  vfrm_cad_zona:String;

implementation

{$R *.dfm}uses Dados, Funcoes;

procedure Tfrm_cad_zona_T12.Pesquisar;
begin
   qLocal.Close;
   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('SELECT *                                 ');
   qLocal.Sql.Add('  FROM ZONA_ZON                          ');
   qLocal.Sql.Add(' WHERE ZON_DESCRICAO LIKE :ZON_DESCRICAO ');
   qLocal.Sql.Add(' ORDER BY ZON_DESCRICAO                  ');
   qLocal.ParamByName('ZON_DESCRICAO').AsString := '%'+Trim(edFiltro.Text)+'%';
   qLocal.Open;
end;

procedure Tfrm_cad_zona_T12.Selecionar;
begin
   vfrm_cad_ZONA := qLocal.FieldByName('ZON_CODIGO').AsString;
   close;
end;

procedure Tfrm_cad_zona_T12.bGravarClick(Sender: TObject);
begin
   if Trim(edFiltro.Text) = '' then
      exit;
   dm.query1.Close;
   dm.query1.Close;
   dm.query1.SQL.Clear;
   dm.query1.Sql.Add('SELECT *                              ');
   dm.query1.Sql.Add('  FROM ZONA_ZON                       ');
   dm.query1.Sql.Add(' WHERE ZON_DESCRICAO = :ZON_DESCRICAO ');
   dm.query1.Sql.Add(' ORDER BY ZON_DESCRICAO               ');
   dm.query1.ParamByName('ZON_DESCRICAO').AsString := Trim(edFiltro.Text);
   dm.query1.Open;
   if NOT dm.query1.EOF then
   begin
      edFiltro.setfocus;
      exit
   end;
   dm.query1.Close;
   dm.query1.SQL.Clear;
   dm.query1.Sql.Add('INSERT INTO ZONA_ZON');
   dm.query1.Sql.Add('     ( ZON_CODIGO,    ');
   dm.query1.Sql.Add('       ZON_DESCRICAO) ');
   dm.query1.Sql.Add('VALUES                ');
   dm.query1.Sql.Add('     (:ZON_CODIGO,    ');
   dm.query1.Sql.Add('      :ZON_DESCRICAO) ');
   dm.query1.ParamByName('ZON_CODIGO'   ).AsString := ProximoZON_CODIGO;
   dm.query1.ParamByName('ZON_DESCRICAO').AsString := Trim(edFiltro.Text);
   dm.query1.ExecSql;
   edFiltro.setfocus;
   Pesquisar;
end;

procedure Tfrm_cad_zona_T12.cxButton2Click(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_cad_zona_T12.DBGrid2DblClick(Sender: TObject);
begin
   Selecionar;
end;

procedure Tfrm_cad_zona_T12.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
     Selecionar;
end;

procedure Tfrm_cad_zona_T12.edFiltroChange(Sender: TObject);
begin
     Pesquisar;
end;

procedure Tfrm_cad_zona_T12.FormShow(Sender: TObject);
begin
   vfrm_cad_zona:='';
end;

end.

