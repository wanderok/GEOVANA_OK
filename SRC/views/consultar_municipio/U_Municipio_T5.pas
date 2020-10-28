{ 15.10.20 09:13pm }
unit U_Municipio_T5;
interface

uses
  Winapi.Windows, System.Variants, System.SysUtils,
  System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, cxButtons, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Param,
  Data.DB,
  FireDAC.Comp.Client, Vcl.DBCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  ACBrBase, ACBrEnterTab;

type
  TFrm_Municipio_T5 = class(TForm)
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    qLocal: TFDQuery;
    DataSource1: TDataSource;
    ACBrEnterTab1: TACBrEnterTab;
    lbNomeDaTela: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Selecionar;
  public
    { Public declarations }
  end;

var
  Frm_Municipio_T5: TFrm_Municipio_T5;
  vFrm_Municipio:String;

implementation

{$R *.dfm}

uses dados;

procedure TFrm_Municipio_T5.DBGrid1DblClick(Sender: TObject);
begin
   Selecionar;
end;

procedure TFrm_Municipio_T5.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
     Selecionar;
end;

procedure TFrm_Municipio_T5.Edit1Change(Sender: TObject);
begin
   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('SELECT *                      ');
   qLocal.Sql.Add('  FROM CIDADE_CID,            ');
   qLocal.Sql.Add('       UF_UF                  ');
   qLocal.Sql.Add(' WHERE UF_CODIGO  = CID_UF    ');
   qLocal.Sql.Add('   AND CID_NOME LIKE :CID_NOME');
   qLocal.Sql.Add(' ORDER BY CID_NOME, UF_SIGLA  ');
   qLocal.ParamByName('CID_NOME').AsString := '%'+Trim(edit1.Text)+'%';
   qLocal.Open;
end;

procedure TFrm_Municipio_T5.FormShow(Sender: TObject);
begin
   vFrm_Municipio:='';
end;

procedure TFrm_Municipio_T5.Selecionar;
begin
   vFrm_Municipio := qLocal.FieldByName('CID_CODIGO').AsString;
   Close;
end;

end.



