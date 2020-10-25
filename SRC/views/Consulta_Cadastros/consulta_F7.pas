unit consulta_F7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxLabel, cxTextEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfrm_consulta_T7 = class(TForm)
    gd: TcxGrid;
    tb: TcxGridDBTableView;
    tbpessoa_tipo: TcxGridDBColumn;
    tbcodigo: TcxGridDBColumn;
    tbrazao_social: TcxGridDBColumn;
    tbfantasia: TcxGridDBColumn;
    tbcnpj: TcxGridDBColumn;
    tbcpf: TcxGridDBColumn;
    tbstatus_cadastral: TcxGridDBColumn;
    tbtelefone: TcxGridDBColumn;
    tbcelular: TcxGridDBColumn;
    tbemail: TcxGridDBColumn;
    tbmunicipio: TcxGridDBColumn;
    tbestado: TcxGridDBColumn;
    lv: TcxGridLevel;
    btn_relatorios_cli: TcxButton;
    edArgumentoDePesquisa: TEdit;
    Label24: TLabel;
    Label45: TLabel;
    cxButton21: TcxButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbNomeDaTela: TLabel;
    qLocal: TFDQuery;
    DataSource1: TDataSource;
    rgConsultar: TRadioGroup;
    procedure cxButton21Click(Sender: TObject);
    procedure edArgumentoDePesquisaChange(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
    procedure Pesquisar_Clientes;
    procedure Pesquisar_Fornecedor;
    procedure Pesquisar_Consultor;
    procedure Pesquisar_Contador;
    procedure Pesquisar_Motorista;
    procedure Pesquisar_Coaborador;
  public
    { Public declarations }
  end;

var
  frm_consulta_T7: Tfrm_consulta_T7;

implementation

{$R *.dfm}

procedure Tfrm_consulta_T7.cxButton21Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_consulta_T7.edArgumentoDePesquisaChange(Sender: TObject);
begin
     Pesquisar;
end;

procedure Tfrm_consulta_T7.Pesquisar;
begin
    Case rgConsultar.itemindex of
       0 : Pesquisar_Clientes;
       1 : Pesquisar_Fornecedor;
       2 : Pesquisar_Consultor;
       3 : Pesquisar_Contador;
       4 : Pesquisar_Motorista;
       5 : Pesquisar_Coaborador;
    End;
end;

procedure Tfrm_consulta_T7.Pesquisar_Clientes;
begin
   qLocal.Close;
   qLocal.sql.Clear;
   qLocal.SQL.Add('SELECT ''J''             AS pessoa_tipo,     ');
   qLocal.SQL.Add('       CLI_CODIGO        AS codigo,          ');
   qLocal.SQL.Add('       CLI_RAZAO_SOCIAL  AS razao_social,    ');
   qLocal.SQL.Add('       CLI_NOME_FANTASIA AS fantasia,        ');
   qLocal.SQL.Add('       ''''              AS cnpj,            ');
   qLocal.SQL.Add('       ''''              AS cpf,             ');
   qLocal.SQL.Add('       0                 AS status_cadastral,');
   qLocal.SQL.Add('       ''''              AS telefone,        ');
   qLocal.SQL.Add('       ''''              AS celular,         ');
   qLocal.SQL.Add('       ''''              AS email,           ');
   qLocal.SQL.Add('       ''''              AS municipio,       ');
   qLocal.SQL.Add('       ''''              AS estado           ');
   qLocal.SQL.Add('  FROM CLIENTE_CLI                           ');
   qLocal.open;

end;

procedure Tfrm_consulta_T7.Pesquisar_Coaborador;
begin
//
end;

procedure Tfrm_consulta_T7.Pesquisar_Consultor;
begin
//
end;

procedure Tfrm_consulta_T7.Pesquisar_Contador;
begin
//
end;

procedure Tfrm_consulta_T7.Pesquisar_Fornecedor;
begin
//
end;

procedure Tfrm_consulta_T7.Pesquisar_Motorista;
begin
//
end;

end.
