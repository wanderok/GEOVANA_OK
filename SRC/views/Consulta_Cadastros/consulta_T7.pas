unit consulta_T7;

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
    lv: TcxGridLevel;
    btn_relatorios_cli: TcxButton;
    edArgumentoDePesquisa: TEdit;
    Label24: TLabel;
    Label45: TLabel;
    cxButton21: TcxButton;
    lbNomeDaTela: TLabel;
    qLocal: TFDQuery;
    DataSource1: TDataSource;
    rgConsultar: TRadioGroup;
    cbQualquerParteDoNome: TCheckBox;
    procedure cxButton21Click(Sender: TObject);
    procedure edArgumentoDePesquisaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbQualquerParteDoNomeClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
    procedure Pesquisar_Clientes;
    procedure Pesquisar_Fornecedor;
    procedure Pesquisar_Consultor;
    procedure Pesquisar_Contador;
    procedure Pesquisar_Motorista;
    procedure Pesquisar_Colaborador;
    procedure Pesquisar_Transportadora;
  public
    { Public declarations }
  end;

var
  frm_consulta_T7: Tfrm_consulta_T7;
  vfrm_consulta_T7_Codigo:String;

implementation

{$R *.dfm}

procedure Tfrm_consulta_T7.cbQualquerParteDoNomeClick(Sender: TObject);
begin
   Pesquisar_Clientes;
end;

procedure Tfrm_consulta_T7.cxButton21Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_consulta_T7.edArgumentoDePesquisaChange(Sender: TObject);
begin
     Pesquisar;
end;

procedure Tfrm_consulta_T7.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
     if not edArgumentoDePesquisa.focused then
     begin
        vfrm_consulta_T7_Codigo := qLocal.FieldByName('Codigo').AsString;
        Close;
     end;
  end;
end;

procedure Tfrm_consulta_T7.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
        Key := #0;
        Perform(WM_NEXTDLGCTL, 0, 0);
        exit;
     end;
end;

procedure Tfrm_consulta_T7.FormShow(Sender: TObject);
var vTitulo:String;
begin
   vTitulo := rgConsultar.Items[rgConsultar.itemindex];
   vTitulo := Copy(vTitulo,3,length(vTitulo));
   vTitulo := 'Procurar | '+ vTitulo;
   Caption := vTitulo;
   vfrm_consulta_T7_Codigo := '';
   edArgumentoDePesquisa.SetFocus;
end;

procedure Tfrm_consulta_T7.Pesquisar;
begin
    Case rgConsultar.itemindex of

       0 : Pesquisar_Clientes;
       1 : Pesquisar_Fornecedor;
       2 : Pesquisar_Consultor;
       3 : Pesquisar_Contador;
       4 : Pesquisar_Motorista;
       5 : Pesquisar_Colaborador;
       6 : Pesquisar_Transportadora;
    End;
end;

procedure Tfrm_consulta_T7.Pesquisar_Clientes;
begin
   qLocal.Close;
   qLocal.sql.Clear;
   qLocal.SQL.Add('SELECT CLID_PESSOA_FJ    AS pessoa_tipo,     ');
   qLocal.SQL.Add('       CLI_CODIGO        AS codigo,          ');
   qLocal.SQL.Add('       CLI_RAZAO_SOCIAL  AS razao_social,    ');
   qLocal.SQL.Add('       CLI_NOME_FANTASIA AS fantasia,        ');
   qLocal.SQL.Add('       CLID_CNPJ         AS cnpj,            ');
   qLocal.SQL.Add('       CLID_CPF          AS cpf              ');
   qLocal.SQL.Add('  FROM CLIENTE_CLI                           ');
   qLocal.SQL.Add('INNER JOIN CLIENTE_DETALHE_CLID              ');
   qLocal.SQL.Add('        ON CLID_CODIGO = CLI_CODIGO          ');
   qLocal.SQL.Add(' WHERE CLI_CODIGO        LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR CLI_RAZAO_SOCIAL  LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR CLI_NOME_FANTASIA LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR CLID_CPF          LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR CLID_CNPJ         LIKE :ARGUMENTO     ');
   qLocal.SQL.Add(' ORDER BY CLI_NOME_FANTASIA                  ');
   if cbQualquerParteDoNome.Checked then
      qLocal.ParamByName('ARGUMENTO').AsString := '%'+edArgumentoDePesquisa.Text + '%'
   else
      qLocal.ParamByName('ARGUMENTO').AsString := edArgumentoDePesquisa.Text + '%';
   qLocal.open;
   //Label2.Caption := FormatFloat('#,##0',qLocal.RecordCount);
end;

procedure Tfrm_consulta_T7.Pesquisar_Colaborador;
begin
   qLocal.Close;
   qLocal.sql.Clear;
   qLocal.SQL.Add('SELECT COLD_PESSOA_FJ    AS pessoa_tipo,     ');
   qLocal.SQL.Add('       COL_CODIGO        AS codigo,          ');
   qLocal.SQL.Add('       COL_RAZAO_SOCIAL  AS razao_social,    ');
   qLocal.SQL.Add('       COL_NOME_FANTASIA AS fantasia,        ');
   qLocal.SQL.Add('       COLD_CNPJ         AS cnpj,            ');
   qLocal.SQL.Add('       COLD_CPF          AS cpf              ');
   qLocal.SQL.Add('  FROM COLABORADOR_COL                       ');
   qLocal.SQL.Add('INNER JOIN COLABORADOR_DETALHE_COLD          ');
   qLocal.SQL.Add('        ON COLD_CODIGO = COL_CODIGO          ');
   qLocal.SQL.Add(' WHERE COL_CODIGO        LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR COL_RAZAO_SOCIAL  LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR COL_NOME_FANTASIA LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR COLD_CPF          LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR COLD_CNPJ         LIKE :ARGUMENTO     ');
   qLocal.SQL.Add(' ORDER BY COL_NOME_FANTASIA                  ');
   if cbQualquerParteDoNome.Checked then
      qLocal.ParamByName('ARGUMENTO').AsString := '%'+edArgumentoDePesquisa.Text + '%'
   else
      qLocal.ParamByName('ARGUMENTO').AsString := edArgumentoDePesquisa.Text + '%';
   qLocal.open;
end;

procedure Tfrm_consulta_T7.Pesquisar_Consultor;
begin
   qLocal.Close;
   qLocal.sql.Clear;
   qLocal.SQL.Add('SELECT COND_PESSOA_FJ    AS pessoa_tipo,     ');
   qLocal.SQL.Add('       CON_CODIGO        AS codigo,          ');
   qLocal.SQL.Add('       CON_RAZAO_SOCIAL  AS razao_social,    ');
   qLocal.SQL.Add('       CON_NOME_FANTASIA AS fantasia,        ');
   qLocal.SQL.Add('       COND_CNPJ         AS cnpj,            ');
   qLocal.SQL.Add('       COND_CPF          AS cpf              ');
   qLocal.SQL.Add('  FROM CONSULTOR_CON                       ');
   qLocal.SQL.Add('INNER JOIN CONSULTOR_DETALHE_COND          ');
   qLocal.SQL.Add('        ON COND_CODIGO = CON_CODIGO          ');
   qLocal.SQL.Add(' WHERE CON_CODIGO        LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR CON_RAZAO_SOCIAL  LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR CON_NOME_FANTASIA LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR COND_CPF          LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR COND_CNPJ         LIKE :ARGUMENTO     ');
   qLocal.SQL.Add(' ORDER BY CON_NOME_FANTASIA                  ');
   if cbQualquerParteDoNome.Checked then
      qLocal.ParamByName('ARGUMENTO').AsString := '%'+edArgumentoDePesquisa.Text + '%'
   else
      qLocal.ParamByName('ARGUMENTO').AsString := edArgumentoDePesquisa.Text + '%';
   qLocal.open;
end;

procedure Tfrm_consulta_T7.Pesquisar_Contador;
begin
   qLocal.Close;
   qLocal.sql.Clear;
   qLocal.SQL.Add('SELECT CONTD_PESSOA_FJ    AS pessoa_tipo,     ');
   qLocal.SQL.Add('       CONT_CODIGO        AS codigo,          ');
   qLocal.SQL.Add('       CONT_RAZAO_SOCIAL  AS razao_social,    ');
   qLocal.SQL.Add('       CONT_NOME_FANTASIA AS fantasia,        ');
   qLocal.SQL.Add('       CONTD_CNPJ         AS cnpj,            ');
   qLocal.SQL.Add('       CONTD_CPF          AS cpf              ');
   qLocal.SQL.Add('  FROM CONTADOR_CONT                       ');
   qLocal.SQL.Add('INNER JOIN CONTADOR_DETALHE_CONTD          ');
   qLocal.SQL.Add('        ON CONTD_CODIGO = CONT_CODIGO          ');
   qLocal.SQL.Add(' WHERE CONT_CODIGO        LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR CONT_RAZAO_SOCIAL  LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR CONT_NOME_FANTASIA LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR CONTD_CPF          LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR CONTD_CNPJ         LIKE :ARGUMENTO     ');
   qLocal.SQL.Add(' ORDER BY CONT_NOME_FANTASIA                  ');
   if cbQualquerParteDoNome.Checked then
      qLocal.ParamByName('ARGUMENTO').AsString := '%'+edArgumentoDePesquisa.Text + '%'
   else
      qLocal.ParamByName('ARGUMENTO').AsString := edArgumentoDePesquisa.Text + '%';
   qLocal.open;
end;

procedure Tfrm_consulta_T7.Pesquisar_Fornecedor;
begin
   qLocal.Close;
   qLocal.sql.Clear;
   qLocal.SQL.Add('SELECT FORD_PESSOA_FJ    AS pessoa_tipo,     ');
   qLocal.SQL.Add('       FOR_CODIGO        AS codigo,          ');
   qLocal.SQL.Add('       FOR_RAZAO_SOCIAL  AS razao_social,    ');
   qLocal.SQL.Add('       FOR_NOME_FANTASIA AS fantasia,        ');
   qLocal.SQL.Add('       FORD_CNPJ         AS cnpj,            ');
   qLocal.SQL.Add('       FORD_CPF          AS cpf              ');
   qLocal.SQL.Add('  FROM FORNECEDOR_FOR                        ');
   qLocal.SQL.Add('INNER JOIN FORNECEDOR_DETALHE_FORD           ');
   qLocal.SQL.Add('        ON FORD_CODIGO = FOR_CODIGO          ');
   qLocal.SQL.Add(' WHERE FOR_CODIGO        LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR FOR_RAZAO_SOCIAL  LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR FOR_NOME_FANTASIA LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR FORD_CPF          LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR FORD_CNPJ         LIKE :ARGUMENTO     ');
   qLocal.SQL.Add(' ORDER BY FOR_NOME_FANTASIA                  ');
   if cbQualquerParteDoNome.Checked then
      qLocal.ParamByName('ARGUMENTO').AsString := '%'+edArgumentoDePesquisa.Text + '%'
   else
      qLocal.ParamByName('ARGUMENTO').AsString := edArgumentoDePesquisa.Text + '%';
   qLocal.open;
   //Label2.Caption := FormatFloat('#,##0',qLocal.RecordCount);
end;

procedure Tfrm_consulta_T7.Pesquisar_Motorista;
begin
   qLocal.Close;
   qLocal.sql.Clear;
   qLocal.SQL.Add('SELECT MOTD_PESSOA_FJ    AS pessoa_tipo,     ');
   qLocal.SQL.Add('       MOT_CODIGO        AS codigo,          ');
   qLocal.SQL.Add('       MOT_RAZAO_SOCIAL  AS razao_social,    ');
   qLocal.SQL.Add('       MOT_NOME_FANTASIA AS fantasia,        ');
   qLocal.SQL.Add('       MOTD_CNPJ         AS cnpj,            ');
   qLocal.SQL.Add('       MOTD_CPF          AS cpf              ');
   qLocal.SQL.Add('  FROM MOTORISTA_MOT                        ');
   qLocal.SQL.Add('INNER JOIN MOTORISTA_DETALHE_MOTD           ');
   qLocal.SQL.Add('        ON MOTD_CODIGO = MOT_CODIGO          ');
   qLocal.SQL.Add(' WHERE MOT_CODIGO        LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR MOT_RAZAO_SOCIAL  LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR MOT_NOME_FANTASIA LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR MOTD_CPF          LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR MOTD_CNPJ         LIKE :ARGUMENTO     ');
   qLocal.SQL.Add(' ORDER BY MOT_NOME_FANTASIA                  ');
   if cbQualquerParteDoNome.Checked then
      qLocal.ParamByName('ARGUMENTO').AsString := '%'+edArgumentoDePesquisa.Text + '%'
   else
      qLocal.ParamByName('ARGUMENTO').AsString := edArgumentoDePesquisa.Text + '%';
   qLocal.open;
   //Label2.Caption := FormatFloat('#,##0',qLocal.RecordCount);
end;

procedure Tfrm_consulta_T7.Pesquisar_Transportadora;
begin
   qLocal.Close;
   qLocal.sql.Clear;
   qLocal.SQL.Add('SELECT TRAD_PESSOA_FJ    AS pessoa_tipo,     ');
   qLocal.SQL.Add('       TRA_CODIGO        AS codigo,          ');
   qLocal.SQL.Add('       TRA_RAZAO_SOCIAL  AS razao_social,    ');
   qLocal.SQL.Add('       TRA_NOME_FANTASIA AS fantasia,        ');
   qLocal.SQL.Add('       TRAD_CNPJ         AS cnpj,            ');
   qLocal.SQL.Add('       TRAD_CPF          AS cpf              ');
   qLocal.SQL.Add('  FROM TRANSPORTADORA_TRA                    ');
   qLocal.SQL.Add('INNER JOIN TRANSPORTADORA_DETALHE_TRAD F       ');
   qLocal.SQL.Add('        ON TRAD_CODIGO = TRA_CODIGO          ');
   qLocal.SQL.Add(' WHERE TRA_CODIGO        LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR TRA_RAZAO_SOCIAL  LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR TRA_NOME_FANTASIA LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR TRAD_CPF          LIKE :ARGUMENTO     ');
   qLocal.SQL.Add('    OR TRAD_CNPJ         LIKE :ARGUMENTO     ');
   qLocal.SQL.Add(' ORDER BY TRA_NOME_FANTASIA                  ');
   if cbQualquerParteDoNome.Checked then
      qLocal.ParamByName('ARGUMENTO').AsString := '%'+edArgumentoDePesquisa.Text + '%'
   else
      qLocal.ParamByName('ARGUMENTO').AsString := edArgumentoDePesquisa.Text + '%';
   qLocal.open;
   //Label2.Caption := FormatFloat('#,##0',qLocal.RecordCount);
end;

end.
