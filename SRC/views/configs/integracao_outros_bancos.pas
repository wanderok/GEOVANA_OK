unit integracao_outros_bancos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, Vcl.StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxGroupBox, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, Vcl.ExtCtrls;

type
  Tfrm_intagracao_outras_base_dados = class(TForm)
    cxButton1: TcxButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    cxGroupBox2: TcxGroupBox;
    RadioGroup1: TRadioGroup;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_intagracao_outras_base_dados: Tfrm_intagracao_outras_base_dados;

implementation

{$R *.dfm}

uses Dados, Funcoes;

procedure Tfrm_intagracao_outras_base_dados.cxButton1Click(Sender: TObject);
begin
    if not fTemAcesso('CONFNUVEM') then
       exit;

    DM.Query1.Close;
    DM.Query1.Sql.Clear;
    DM.Query1.Sql.Add('UPDATE CONFIG_CFG                        ');
    DM.Query1.Sql.Add('   SET CFG_TRATA_NUVEM = :CFG_TRATA_NUVEM');
    DM.Query1.ParamByName('CFG_TRATA_NUVEM').AsInteger := RadioGroup1.ItemIndex;
    DM.Query1.ExecSql;

    Close;
end;

procedure Tfrm_intagracao_outras_base_dados.FormShow(Sender: TObject);
begin
    DM.Query1.Close;
    DM.Query1.Sql.Clear;
    DM.Query1.Sql.Add('SELECT CFG_TRATA_NUVEM');
    DM.Query1.Sql.Add('  FROM CONFIG_CFG     ');
    DM.Query1.Open;
    RadioGroup1.ItemIndex := DM.Query1.FieldByName('CFG_TRATA_NUVEM').AsInteger;
end;

end.
