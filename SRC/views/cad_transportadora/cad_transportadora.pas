{ v 13.10.20 11:58am }
unit cad_transportadora;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants,
  System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,


  cxCheckBox, cxButtons,

  FireDAC.Stan.Param,

  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, cxPC,
  Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,dxBarBuiltInMenu, cxContainer, cxEdit,
  Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, dxGDIPlusClasses,
  dxSkinsCore, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxLabel, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit,
  cxDropDownEdit, cxCalendar, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue;

type
  TFrm_transportadora = class(TForm)
    Edit8: TEdit;
    Label10: TLabel;
    edCODIGO: TEdit;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label7: TLabel;
    rd_ativo: TRadioButton;
    rd_inativo: TRadioButton;
    gpData: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edDATA_CADASTRO: TMaskEdit;
    MaskEdit2: TMaskEdit;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    edUSUALTEROU: TEdit;
    edDTALTEROU: TMaskEdit;
    edHRALTEROU: TEdit;
    edMAQALTEROU: TMaskEdit;
    bHistoricoAlteracoes: TcxButton;
    GroupBox1: TGroupBox;
    GroupBox8: TGroupBox;
    Edit20: TEdit;
    Edit18: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit2: TEdit;
    Edit7: TEdit;
    PageControl1: TPageControl;
    tsPessoaFisica: TTabSheet;
    Label25: TLabel;
    Label6: TLabel;
    Label30: TLabel;
    Label28: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    edRG: TEdit;
    edORGAO_EMISSOR: TEdit;
    edNOME: TEdit;
    edCPF: TMaskEdit;
    edDATA_NASCIMENTO: TMaskEdit;
    cbSexo: TComboBox;
    MaskEdit1: TMaskEdit;
    tsPessoaJuridica: TTabSheet;
    lbl3: TLabel;
    lbl7: TLabel;
    lbl4: TLabel;
    lbl2: TLabel;
    edCNPJ: TMaskEdit;
    edFANTASIA: TEdit;
    edRAZAO_SOCIAL: TEdit;
    edINSCRICAO_ESTADUAL_PJ: TEdit;
    cxButton3: TcxButton;
    cxButton2: TcxButton;
    grpEndereco: TGroupBox;
    Label22: TLabel;
    Label2: TLabel;
    Label26: TLabel;
    DBEdit76: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit77: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit79: TDBEdit;
    cxButton5: TcxButton;
    DBEdit78: TDBEdit;
    btn_cep: TcxButton;
    DBEdit2: TDBEdit;
    cxButton4: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    cxButton1: TcxButton;
    cxButton21: TcxButton;
    cxButton28: TcxButton;
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_transportadora: TFrm_transportadora;

implementation

uses
  consulta_T7,
  cad_bairro_T8,
  cad_regiao_T11,
  cad_zona_T12;

{$R *.dfm}

procedure TFrm_transportadora.cxButton1Click(Sender: TObject);
begin
    frm_consulta_T7 := Tfrm_consulta_T7.Create(nil);
    frm_consulta_T7.showmodal;
end;

procedure TFrm_transportadora.cxButton4Click(Sender: TObject);
begin
    frm_cad_regiao_T11 := Tfrm_cad_regiao_T11.Create(nil);
    frm_cad_regiao_T11.showmodal;
    frm_cad_regiao_T11.Free;
end;

procedure TFrm_transportadora.cxButton5Click(Sender: TObject);
begin
    frm_cad_bairro_T8 := Tfrm_cad_bairro_T8.Create(nil);
    frm_cad_bairro_T8.showmodal;
    frm_cad_bairro_T8.Free;
end;

procedure TFrm_transportadora.cxButton7Click(Sender: TObject);
begin
    FRM_cad_zona_T12 := TFRM_cad_zona_T12.Create(nil);
    FRM_cad_zona_T12.showmodal;
    FRM_cad_zona_T12.Free;
end;

end.
