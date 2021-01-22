{ v 18.10.16 10:09 }
unit tipo_colaborador_T8;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls,

  cxDBEdit,
  cxButtons,
  FireDAC.Stan.Param,
  Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  DadosSMC,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Mask, cxTextEdit,
  Vcl.ExtCtrls;

type
  TFrm_tipo_colaborador_T8 = class(TForm)
    Label5: TLabel;
    edFiltro: TEdit;
    DBGrid2: TDBGrid;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    qLocal: TFDQuery;
    DataSource1: TDataSource;
    Panel4: TPanel;
    procedure edFiltroChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
    procedure Selecionar;
  public
    { Public declarations }
  end;

var
  Frm_tipo_colaborador_T8: TFrm_tipo_colaborador_T8;
  vFrm_tipo_colaborador_T8:String;

implementation

{$R *.dfm}

uses FuncoesSMC;

procedure TFrm_tipo_colaborador_T8.cxButton1Click(Sender: TObject);
begin
   if Trim(edFiltro.Text) = '' then
      exit;
   dm.query1.Close;
   dm.query1.Close;
   dm.query1.SQL.Clear;
   dm.query1.Sql.Add('SELECT *                        ');
   dm.query1.Sql.Add('  FROM TIPOCOLABORADOR_TPCOL    ');
   dm.query1.Sql.Add(' WHERE TPCOL_NOME = :TPCOL_NOME ');
   dm.query1.Sql.Add(' ORDER BY TPCOL_NOME            ');
   dm.query1.ParamByName('TPCOL_NOME').AsString := Trim(edFiltro.Text);
   dm.query1.Open;
   if NOT dm.query1.EOF then
   begin
      edFiltro.setfocus;
      exit
   end;
   dm.query1.Close;
   dm.query1.SQL.Clear;
   dm.query1.Sql.Add('INSERT INTO TIPOCOLABORADOR_TPCOL');
   dm.query1.Sql.Add('     ( TPCOL_CODIGO,             ');
   dm.query1.Sql.Add('       TPCOL_NOME)               ');
   dm.query1.Sql.Add('VALUES                           ');
   dm.query1.Sql.Add('     (:TPCOL_CODIGO,             ');
   dm.query1.Sql.Add('      :TPCOL_NOME)               ');
   dm.query1.ParamByName('TPCOL_CODIGO').AsString := ProximoTPCOL_CODIGO;
   dm.query1.ParamByName('TPCOL_NOME'  ).AsString := Trim(edFiltro.Text);
   dm.query1.ExecSql;
   edFiltro.setfocus;
   Pesquisar;
end;

procedure TFrm_tipo_colaborador_T8.cxButton2Click(Sender: TObject);
begin
   Close;
end;

procedure TFrm_tipo_colaborador_T8.DBGrid2DblClick(Sender: TObject);
begin
   Selecionar;
end;

procedure TFrm_tipo_colaborador_T8.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
     Selecionar;
end;

procedure TFrm_tipo_colaborador_T8.edFiltroChange(Sender: TObject);
begin
   Pesquisar;
end;

procedure TFrm_tipo_colaborador_T8.FormShow(Sender: TObject);
begin
  vFrm_tipo_colaborador_T8 := '';
end;

procedure TFrm_tipo_colaborador_T8.Pesquisar;
begin
    PesquisaF1.ExisteDescricao('TIPOCOLABORADOR_TPCOL',
                               edFiltro.Text,
                               qLocal);
end;

procedure TFrm_tipo_colaborador_T8.Selecionar;
begin
   vFrm_tipo_colaborador_T8 := qLocal.FieldByName('ZON_CODIGO').AsString;
   close;
end;

end.
