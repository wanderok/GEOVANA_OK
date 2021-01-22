unit cad_servico_T49;

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
  Tfrm_cad_servico_T49 = class(TForm)
    Label5: TLabel;
    edREG_DESCRICAO: TEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    edCCustos: TEdit;
    btn_marca: TcxButton;
    edCCustosDescricao: TEdit;
    Edit3: TEdit;
    cxButton3: TcxButton;
    Edit4: TEdit;
    RadioGroup1: TRadioGroup;
    ACBrEnterTab1: TACBrEnterTab;
    Label6: TLabel;
    edUnidade: TEdit;
    cxButton4: TcxButton;
    edUnidadeDescricao: TEdit;
    cxButton8: TcxButton;
    Panel2: TPanel;
    procedure cxButton2Click(Sender: TObject);
    procedure edUnidadeExit(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCCustosExit(Sender: TObject);
    procedure btn_marcaClick(Sender: TObject);
  private
    { Private declarations }
    procedure PesquisaUnidade;
    procedure PesquisaCentroDeCustos;
  public
    { Public declarations }
  end;

var
  frm_cad_servico_T49: Tfrm_cad_servico_T49;

implementation

uses
   FuncoesSMC,
   TiposDeDados,
   consulta_T7;

{$R *.dfm}

procedure Tfrm_cad_servico_T49.btn_marcaClick(Sender: TObject);
begin
   PesquisaCentroDeCustos;
end;

procedure Tfrm_cad_servico_T49.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cad_servico_T49.cxButton4Click(Sender: TObject);
begin
   PesquisaUnidade;
end;

procedure Tfrm_cad_servico_T49.edCCustosExit(Sender: TObject);
begin
   if not SelectCentroDeCustos(edCCustos.Text,edCCustosDescricao) then
   begin
      Avisos.Avisar('Centro de Custos inexistente...');
      edCCustos.SetFocus;
      exit;
   end;
end;

procedure Tfrm_cad_servico_T49.edUnidadeExit(Sender: TObject);
begin
   if not SelectUnidade(edUnidade.Text,edUnidadeDescricao) then
   begin
      Avisos.Avisar('Unidade de medida inexistente...');
      edUnidade.SetFocus;
      exit;
   end;

end;

procedure Tfrm_cad_servico_T49.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_f1 Then
   begin
           if edCCustos.Focused       then PesquisaCentroDeCustos
      else if edUnidade.Focused       then PesquisaUnidade
   end;

end;

procedure Tfrm_cad_servico_T49.PesquisaCentroDeCustos;
begin
    if fPesquisarCentroDeCustos(edCCustos,edCCustosDescricao) then
       edCCustosExit(nil)
    else
       edCCustos.SetFocus;
end;

procedure Tfrm_cad_servico_T49.PesquisaUnidade;
begin
    if fPesquisarUnidade(edUnidade,edUnidadeDescricao) then
       edUnidadeExit(nil)
    else
       edUnidade.SetFocus;
end;

end.

