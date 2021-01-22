{ v 14.10.20 16:03pm }
unit cad_regiao_T11;
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.DBGrids, Vcl.DBCtrls, Vcl.ComCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxMaskEdit, cxDropDownEdit, cxDBEdit,
  cxButtons, cxTextEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.Client, cxClasses, Vcl.Grids, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, Vcl.ExtCtrls;

type
  Tfrm_cad_regiao_T11 = class(TForm)
    Descrição: TLabel;
    edFiltro: TEdit;
    DBGrid1: TDBGrid;
    bGravar: TcxButton;
    cxButton28: TcxButton;
    ACBrEnterTab1: TACBrEnterTab;
    qLocal: TFDQuery;
    DataSource1: TDataSource;
    Panel4: TPanel;
    procedure bGravarClick(Sender: TObject);
    procedure cxButton28Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edFiltroChange(Sender: TObject);

  private
    { Private declarations }
    procedure pesquisar;
    procedure selecionar;

  public
    { Public declarations }
  end;

var
  frm_cad_regiao_T11: Tfrm_cad_regiao_T11;
  vfrm_cad_regiao:String;

implementation

{$R *.dfm}

uses DadosSMC, FuncoesSMC;

{ TFrm_regiao }

procedure Tfrm_cad_regiao_T11.bGravarClick(Sender: TObject);
begin
   if Trim(edFiltro.Text) = '' then
      exit;
   dm.query1.Close;
   dm.query1.Close;
   dm.query1.SQL.Clear;
   dm.query1.Sql.Add('SELECT *                              ');
   dm.query1.Sql.Add('  FROM REGIAO_REG                     ');
   dm.query1.Sql.Add(' WHERE REG_DESCRICAO = :REG_DESCRICAO ');
   dm.query1.Sql.Add(' ORDER BY REG_DESCRICAO               ');
   dm.query1.ParamByName('REG_DESCRICAO').AsString := Trim(edFiltro.Text);
   dm.query1.Open;
   if NOT dm.query1.EOF then
   begin
      edFiltro.setfocus;
      exit
   end;
   dm.query1.Close;
   dm.query1.SQL.Clear;
   dm.query1.Sql.Add('INSERT INTO REGIAO_REG');
   dm.query1.Sql.Add('     ( REG_CODIGO,    ');
   dm.query1.Sql.Add('       REG_DESCRICAO) ');
   dm.query1.Sql.Add('VALUES                ');
   dm.query1.Sql.Add('     (:REG_CODIGO,    ');
   dm.query1.Sql.Add('      :REG_DESCRICAO) ');
   dm.query1.ParamByName('REG_CODIGO'   ).AsString := ProximoREG_CODIGO;
   dm.query1.ParamByName('REG_DESCRICAO').AsString := Trim(edFiltro.Text);
   dm.query1.ExecSql;
   edFiltro.setfocus;
   Pesquisar;
end;

procedure Tfrm_cad_regiao_T11.cxButton28Click(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_cad_regiao_T11.DBGrid1DblClick(Sender: TObject);
begin
   Selecionar;
end;

procedure Tfrm_cad_regiao_T11.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
     Selecionar;
end;

procedure Tfrm_cad_regiao_T11.edFiltroChange(Sender: TObject);
begin
   pesquisar;
end;

procedure Tfrm_cad_regiao_T11.FormShow(Sender: TObject);
begin
   vfrm_cad_regiao := '';
end;

procedure Tfrm_cad_regiao_T11.pesquisar;
begin
   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('SELECT *                                 ');
   qLocal.Sql.Add('  FROM REGIAO_REG                        ');
   qLocal.Sql.Add(' WHERE REG_DESCRICAO LIKE :REG_DESCRICAO ');
   qLocal.Sql.Add(' ORDER BY REG_DESCRICAO                  ');
   qLocal.ParamByName('REG_DESCRICAO').AsString := '%'+Trim(edFiltro.Text)+'%';
   qLocal.Open;
end;

procedure Tfrm_cad_regiao_T11.selecionar;
begin
   vfrm_cad_regiao := qLocal.FieldByName('REG_CODIGO').AsString;
   close;
end;

end.
