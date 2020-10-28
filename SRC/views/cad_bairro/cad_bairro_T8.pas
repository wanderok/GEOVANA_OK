unit cad_bairro_T8;

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
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab;

type
  Tfrm_cad_bairro_T8 = class(TForm)
    Label5: TLabel;
    edFiltro: TEdit;
    DBGrid2: TDBGrid;
    bGravar: TcxButton;
    cxButton2: TcxButton;
    ACBrEnterTab1: TACBrEnterTab;
    qLocal: TFDQuery;
    DataSource1: TDataSource;
    lbNomeDaTela: TLabel;
    procedure edFiltroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton2Click(Sender: TObject);
    procedure bGravarClick(Sender: TObject);
  private
    { Private declarations }
    procedure pesquisar;
    procedure selecionar;
  public
    { Public declarations }
  end;

var
  frm_cad_bairro_T8: Tfrm_cad_bairro_T8;
  vfrm_cad_bairro: String;

implementation

{$R *.dfm}

uses Dados, Funcoes;

procedure Tfrm_cad_bairro_T8.bGravarClick(Sender: TObject);
begin
   if Trim(edFiltro.Text) = '' then
      exit;

   dm.query1.Close;
   dm.query1.Close;
   dm.query1.SQL.Clear;
   dm.query1.Sql.Add('SELECT *                              ');
   dm.query1.Sql.Add('  FROM BAIRRO_BAI                     ');
   dm.query1.Sql.Add(' WHERE BAI_DESCRICAO = :BAI_DESCRICAO ');
   dm.query1.Sql.Add(' ORDER BY BAI_DESCRICAO               ');
   dm.query1.ParamByName('BAI_DESCRICAO').AsString := Trim(edFiltro.Text);
   dm.query1.Open;
   if NOT dm.query1.EOF then
   begin
      edFiltro.setfocus;
      exit
   end;
   dm.query1.Close;
   dm.query1.SQL.Clear;
   dm.query1.Sql.Add('INSERT INTO BAIRRO_BAI');
   dm.query1.Sql.Add('     ( BAI_CODIGO,    ');
   dm.query1.Sql.Add('       BAI_DESCRICAO) ');
   dm.query1.Sql.Add('VALUES                ');
   dm.query1.Sql.Add('     (:BAI_CODIGO,    ');
   dm.query1.Sql.Add('      :BAI_DESCRICAO) ');
   dm.query1.ParamByName('BAI_CODIGO'   ).AsString := ProximoBAI_CODIGO;
   dm.query1.ParamByName('BAI_DESCRICAO').AsString := Trim(edFiltro.Text);
   dm.query1.ExecSql;
   edFiltro.setfocus;
   Pesquisar;
end;

procedure Tfrm_cad_bairro_T8.cxButton2Click(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_cad_bairro_T8.DBGrid2DblClick(Sender: TObject);
begin
   Selecionar;
end;

procedure Tfrm_cad_bairro_T8.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
     Selecionar;
end;

procedure Tfrm_cad_bairro_T8.edFiltroChange(Sender: TObject);
begin
   pesquisar;
end;

procedure Tfrm_cad_bairro_T8.FormShow(Sender: TObject);
begin
   vfrm_cad_bairro := '';
end;

procedure Tfrm_cad_bairro_T8.pesquisar;
begin
   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('SELECT *                                 ');
   qLocal.Sql.Add('  FROM BAIRRO_BAI                        ');
   qLocal.Sql.Add(' WHERE BAI_DESCRICAO LIKE :BAI_DESCRICAO ');
   qLocal.Sql.Add(' ORDER BY BAI_DESCRICAO                  ');
   qLocal.ParamByName('BAI_DESCRICAO').AsString := '%'+Trim(edFiltro.Text)+'%';
   qLocal.Open;
end;

procedure Tfrm_cad_bairro_T8.selecionar;
begin
   vfrm_cad_bairro := qLocal.FieldByName('BAI_CODIGO').AsString;
   close;
end;

end.
