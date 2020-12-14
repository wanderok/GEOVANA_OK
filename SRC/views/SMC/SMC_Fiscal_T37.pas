unit SMC_Fiscal_T37;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dxGDIPlusClasses,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinXmas2008Blue, cxTextEdit, cxDBEdit, dxGaugeControl, frxGaugePanel,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, VCLTee.DBChart, Vcl.Mask, Vcl.Menus, cxButtons, ACBrBase,
  ACBrEnterTab;

type
  Tfrm_SMC_Fiscal_T37 = class(TForm)
    lbNomeDaTela: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Image2: TImage;
    Panel3: TPanel;
    Panel4: TPanel;
    Image6: TImage;
    Panel5: TPanel;
    Panel6: TPanel;
    Image1: TImage;
    Panel7: TPanel;
    Panel8: TPanel;
    Image7: TImage;
    Panel9: TPanel;
    Panel10: TPanel;
    Image3: TImage;
    Panel11: TPanel;
    Label21: TLabel;
    Edit21: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Label22: TLabel;
    Edit22: TEdit;
    Label9: TLabel;
    Edit9: TEdit;
    Label10: TLabel;
    Edit10: TEdit;
    Label11: TLabel;
    Edit11: TEdit;
    Label12: TLabel;
    Edit12: TEdit;
    Label13: TLabel;
    Edit13: TEdit;
    Label14: TLabel;
    Edit14: TEdit;
    Label15: TLabel;
    Edit15: TEdit;
    Label16: TLabel;
    Edit16: TEdit;
    Label17: TLabel;
    Edit17: TEdit;
    Label18: TLabel;
    Edit18: TEdit;
    Label19: TLabel;
    Edit19: TEdit;
    Label20: TLabel;
    Edit20: TEdit;
    Label23: TLabel;
    Edit23: TEdit;
    Label24: TLabel;
    Edit24: TEdit;
    Label25: TLabel;
    Edit25: TEdit;
    Panel12: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Panel13: TPanel;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    qCLIENTE_CLI: TFDQuery;
    qGRID: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label32: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    Label31: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label37: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label38: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    Label40: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    Label41: TLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    Query1: TFDQuery;
    Label42: TLabel;
    rgSistema: TRadioGroup;
    DBChart1: TDBChart;
    Series1: TPieSeries;
    tbGRAFICOARQUIVOSFISCAIS_GAF: TFDTable;
    TeeGDIPlus1: TTeeGDIPlus;
    edDe: TMaskEdit;
    Label36: TLabel;
    Label39: TLabel;
    edAte: TMaskEdit;
    Label43: TLabel;
    edCliente: TEdit;
    bPesqCliente: TcxButton;
    edClienteNome: TEdit;
    Label44: TLabel;
    edTecnico: TEdit;
    bPesqTecnico: TcxButton;
    edTecnicoNome: TEdit;
    rgStatus: TRadioGroup;
    Label35: TLabel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    edOBS: TEdit;
    edAF_OBS_USU: TcxDBTextEdit;
    edAF_OBS_DT: TcxDBTextEdit;
    edAF_OBS_HR: TcxDBTextEdit;
    Query2: TFDQuery;
    tbGRAFICOUSUARQUIVOSFISCAIS_GUAF: TFDTable;
    DBChart2: TDBChart;
    Series2: TBarSeries;
    Label33: TLabel;
    edMes: TEdit;
    Label34: TLabel;
    edAno: TEdit;
    bListar: TButton;
    ACBrEnterTab1: TACBrEnterTab;
    pnQtdeClientes: TPanel;
    rgSistemaFiltro: TRadioGroup;
    btn_relatorios_cli: TcxButton;
    bGraficoSistemas: TcxButton;
    bGraficoContador: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bListarClick(Sender: TObject);
    procedure edMesChange(Sender: TObject);
    procedure edAnoChange(Sender: TObject);
    procedure edClienteExit(Sender: TObject);
    procedure edClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTecnicoExit(Sender: TObject);
    procedure bPesqClienteClick(Sender: TObject);
    procedure edOBSExit(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure Panel16Click(Sender: TObject);
    procedure qGRIDAfterScroll(DataSet: TDataSet);
    procedure edOBSChange(Sender: TObject);
    procedure DBChart2Click(Sender: TObject);
    procedure rgSistemaFiltroClick(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
    procedure bGraficoContadorClick(Sender: TObject);
    procedure bGraficoSistemasClick(Sender: TObject);
  private
    { Private declarations}
    procedure Listar;
    procedure PreparaGrid;

    function Existe_ArquivoFiscalParaCliente(pCLIENTE:String;pMes,pAno:Integer):Boolean;
    procedure Incluir_ArquivoFiscalParaCliente(pCLIENTE:String;pMes,pAno:Integer);

    procedure AtualizaGrid;
    procedure AbrirProcedimentosFiscaisNoCliente;
    procedure AbrirSMC;
    procedure AbrirSMCPLUS;
    procedure AbrirMERCHANT;
    procedure AbrirGETRANSPORTE;
    procedure AbrirMDE;

    procedure PausarProcedimentosFiscaisNoCliente;
    procedure PausarSMC;
    procedure PausarSMCPLUS;
    procedure PausarMERCHANT;
    procedure PausarGETRANSPORTE;
    procedure PausarMDE;

    procedure FecharProcedimentosFiscaisNoCliente;
    procedure FecharSMC;
    procedure FecharSMCPLUS;
    procedure FecharMERCHANT;
    procedure FecharGETRANSPORTE;
    procedure FecharMDE;

    procedure PesquisarCliente;

    //function AutomaticoManual(pTipo:Integer):String;

    procedure ContaGrid;
    procedure ContaSistemas;
    procedure ContaProdutividade;
    procedure ContaContadores;

    procedure Gravar_Observacao;
  public
    { Public declarations }
  end;

const _CorAberto  = clBlue;
      _CorFechado = clGreen;
      _CorPausa   = $000080FF;

var
  frm_SMC_Fiscal_T37: Tfrm_SMC_Fiscal_T37;
  vMesDeReferencia,
  vAnoDeReferencia:Integer;

implementation

{$R *.dfm}

uses Dados,
     Funcoes,
     consulta_T7,
     Classe_Usuario,
     Classe_Cliente,
     GraficoProdutividadeSMC,
     GraficoContadoresSMC,
     GraficoSistemasSMC;

procedure Tfrm_SMC_Fiscal_T37.AbrirProcedimentosFiscaisNoCliente;
begin
    if vMesDeReferencia = -1 then
       exit;

    if qGRID.eof then
       exit;

    if (qGRID.FieldByName('AF_USU').AsString <> '') and
       (qGRID.FieldByName('AF_USU').AsString <> Usuario.Codigo) then
    begin
      Avisos.Avisar('Este cliente está sendo atendido por '+
                    qGRID.FieldByName('AF_USU').AsString);
      exit;
    end;

    if rgSistema.itemindex = -1 then
    begin
      Avisos.Avisar('Selecione o Sistema a abrir Procedimento Fiscal');
      rgSistema.SetFocus;
      exit;
    end;
    Case rgSistema.itemindex of
       0 : AbrirSMC;
       1 : AbrirSMCPLUS;
       2 : AbrirMERCHANT;
       3 : AbrirGETRANSPORTE;
       4 : AbrirMDE;
    End;
    rgSistema.itemindex := -1;
    AtualizaGrid;
end;

procedure Tfrm_SMC_Fiscal_T37.AbrirSMC;
begin
   if qGRID.FieldByName('AF_USA_SMC').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa SMC');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMC').AsInteger <> 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMC já iniciado por '+qGRID.FieldByName('AF_USU').AsString);
     exit
   end;
   try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF             ');
        Query1.sql.add('   SET AF_USU        = :AF_USU,        ');
        Query1.sql.add('       AF_INICIO_DT  = :AF_INICIO_DT,  ');
        Query1.sql.add('       AF_INICIO_DTx = :AF_INICIO_DTx, ');
        Query1.sql.add('       AF_INICIO_HR  = :AF_INICIO_HR,  ');
        Query1.sql.add('       AF_STATUS_SMC = :AF_STATUS_SMC, ');
        Query1.sql.add('       AF_STATUS_SMCx= :AF_STATUS_SMCx ');
        Query1.sql.add(' WHERE AF_MES        = :AF_MES         ');
        Query1.sql.add('   AND AF_ANO        = :AF_ANO         ');
        Query1.sql.add('   AND AF_CLIENTE    = :AF_CLIENTE     ');
        Query1.ParamByName('AF_MES'           ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'           ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'       ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_SMC'    ).AsInteger := 1; // Aberto
        Query1.ParamByName('AF_STATUS_SMCx'   ).AsString  := 'AB';
        Query1.ParamByName('AF_USU'           ).AsString  := Usuario.Codigo;
        if qGRID.FieldByName('AF_INICIO_DTx').AsString = '' then
        begin
           Query1.ParamByName('AF_INICIO_DT'     ).AsDateTime:= DataServidor;
           Query1.ParamByName('AF_INICIO_DTx'    ).AsString  := sDataServidor;
           Query1.ParamByName('AF_INICIO_HR'     ).AsString  := HoraServidor;
        end
        else
        begin
           Query1.ParamByName('AF_INICIO_DT'     ).AsDateTime:= qGRID.FieldByName('AF_INICIO_DT').AsDateTime;
           Query1.ParamByName('AF_INICIO_DTx'    ).AsString  := qGRID.FieldByName('AF_INICIO_DTx').AsString;
           Query1.ParamByName('AF_INICIO_HR'     ).AsString  := qGRID.FieldByName('AF_INICIO_HR').AsString;
        end;
        Query1.execsql;

   except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
   end;
end;

procedure Tfrm_SMC_Fiscal_T37.AbrirSMCPLUS;
begin
   if qGRID.FieldByName('AF_USA_SMCPLUS').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa SMCPLUS');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger <> 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMCPLUS já iniciado por '+qGRID.FieldByName('AF_USU').AsString);
     exit
   end;
   try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF             ');
        Query1.sql.add('   SET AF_USU        = :AF_USU,        ');
        Query1.sql.add('       AF_INICIO_DT  = :AF_INICIO_DT,  ');
        Query1.sql.add('       AF_INICIO_DTx = :AF_INICIO_DTx, ');
        Query1.sql.add('       AF_INICIO_HR  = :AF_INICIO_HR,  ');
        Query1.sql.add('       AF_STATUS_SMCPLUS = :AF_STATUS_SMCPLUS, ');
        Query1.sql.add('       AF_STATUS_SMCPLUSx= :AF_STATUS_SMCPLUSx ');
        Query1.sql.add(' WHERE AF_MES        = :AF_MES         ');
        Query1.sql.add('   AND AF_ANO        = :AF_ANO         ');
        Query1.sql.add('   AND AF_CLIENTE    = :AF_CLIENTE     ');
        Query1.ParamByName('AF_MES'            ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'            ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'        ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_SMCPLUS' ).AsInteger := 1; // Aberto
        Query1.ParamByName('AF_STATUS_SMCPLUSx').AsString  := 'AB';
        Query1.ParamByName('AF_USU'            ).AsString  := Usuario.Codigo;
        if qGRID.FieldByName('AF_INICIO_DTx').AsString = '' then
        begin
           Query1.ParamByName('AF_INICIO_DT'     ).AsDateTime:= DataServidor;
           Query1.ParamByName('AF_INICIO_DTx'    ).AsString  := sDataServidor;
           Query1.ParamByName('AF_INICIO_HR'     ).AsString  := HoraServidor;
        end
        else
        begin
           Query1.ParamByName('AF_INICIO_DT'     ).AsDateTime:= qGRID.FieldByName('AF_INICIO_DT').AsDateTime;
           Query1.ParamByName('AF_INICIO_DTx'    ).AsString  := qGRID.FieldByName('AF_INICIO_DTx').AsString;
           Query1.ParamByName('AF_INICIO_HR'     ).AsString  := qGRID.FieldByName('AF_INICIO_HR').AsString;
        end;
        Query1.execsql;

   except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
   end;
end;

procedure Tfrm_SMC_Fiscal_T37.AbrirMERCHANT;
begin
   if qGRID.FieldByName('AF_USA_MERCHANT').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa MERCHANT');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger <> 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MERCHANT já iniciado por '+qGRID.FieldByName('AF_USU').AsString);
     exit
   end;
   try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF             ');
        Query1.sql.add('   SET AF_USU        = :AF_USU,        ');
        Query1.sql.add('       AF_INICIO_DT  = :AF_INICIO_DT,  ');
        Query1.sql.add('       AF_INICIO_DTx = :AF_INICIO_DTx, ');
        Query1.sql.add('       AF_INICIO_HR  = :AF_INICIO_HR,  ');
        Query1.sql.add('       AF_STATUS_MERCHANT = :AF_STATUS_MERCHANT, ');
        Query1.sql.add('       AF_STATUS_MERCHANTx= :AF_STATUS_MERCHANTx ');
        Query1.sql.add(' WHERE AF_MES        = :AF_MES         ');
        Query1.sql.add('   AND AF_ANO        = :AF_ANO         ');
        Query1.sql.add('   AND AF_CLIENTE    = :AF_CLIENTE     ');
        Query1.ParamByName('AF_MES'            ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'            ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'        ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_MERCHANT' ).AsInteger := 1; // Aberto
        Query1.ParamByName('AF_STATUS_MERCHANTx').AsString  := 'AB';
        Query1.ParamByName('AF_USU'             ).AsString  := Usuario.Codigo;
        if qGRID.FieldByName('AF_INICIO_DTx').AsString = '' then
        begin
           Query1.ParamByName('AF_INICIO_DT'     ).AsDateTime:= DataServidor;
           Query1.ParamByName('AF_INICIO_DTx'    ).AsString  := sDataServidor;
           Query1.ParamByName('AF_INICIO_HR'     ).AsString  := HoraServidor;
        end
        else
        begin
           Query1.ParamByName('AF_INICIO_DT'     ).AsDateTime:= qGRID.FieldByName('AF_INICIO_DT').AsDateTime;
           Query1.ParamByName('AF_INICIO_DTx'    ).AsString  := qGRID.FieldByName('AF_INICIO_DTx').AsString;
           Query1.ParamByName('AF_INICIO_HR'     ).AsString  := qGRID.FieldByName('AF_INICIO_HR').AsString;
        end;
        Query1.execsql;

   except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
   end;
end;

procedure Tfrm_SMC_Fiscal_T37.AbrirGETRANSPORTE;
begin
   if qGRID.FieldByName('AF_USA_GETRANSP').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa GETRANSP');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger <> 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do GETRANSP já iniciado por '+qGRID.FieldByName('AF_USU').AsString);
     exit
   end;
   try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF             ');
        Query1.sql.add('   SET AF_USU        = :AF_USU,        ');
        Query1.sql.add('       AF_INICIO_DT  = :AF_INICIO_DT,  ');
        Query1.sql.add('       AF_INICIO_DTx = :AF_INICIO_DTx, ');
        Query1.sql.add('       AF_INICIO_HR  = :AF_INICIO_HR,  ');
        Query1.sql.add('       AF_STATUS_GETRANSP = :AF_STATUS_GETRANSP, ');
        Query1.sql.add('       AF_STATUS_GETRANSPx= :AF_STATUS_GETRANSPx ');
        Query1.sql.add(' WHERE AF_MES        = :AF_MES         ');
        Query1.sql.add('   AND AF_ANO        = :AF_ANO         ');
        Query1.sql.add('   AND AF_CLIENTE    = :AF_CLIENTE     ');
        Query1.ParamByName('AF_MES'            ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'            ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'        ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_GETRANSP' ).AsInteger := 1; // Aberto
        Query1.ParamByName('AF_STATUS_GETRANSPx').AsString  := 'AB';
        Query1.ParamByName('AF_USU'             ).AsString  := Usuario.Codigo;
        if qGRID.FieldByName('AF_INICIO_DTx').AsString = '' then
        begin
           Query1.ParamByName('AF_INICIO_DT'     ).AsDateTime:= DataServidor;
           Query1.ParamByName('AF_INICIO_DTx'    ).AsString  := sDataServidor;
           Query1.ParamByName('AF_INICIO_HR'     ).AsString  := HoraServidor;
        end
        else
        begin
           Query1.ParamByName('AF_INICIO_DT'     ).AsDateTime:= qGRID.FieldByName('AF_INICIO_DT').AsDateTime;
           Query1.ParamByName('AF_INICIO_DTx'    ).AsString  := qGRID.FieldByName('AF_INICIO_DTx').AsString;
           Query1.ParamByName('AF_INICIO_HR'     ).AsString  := qGRID.FieldByName('AF_INICIO_HR').AsString;
        end;
        Query1.execsql;

   except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
   end;
end;

procedure Tfrm_SMC_Fiscal_T37.AbrirMDE;
begin
   if qGRID.FieldByName('AF_USA_MDE').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa MDE');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MDE').AsInteger <> 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MDE já iniciado por '+qGRID.FieldByName('AF_USU').AsString);
     exit
   end;
   try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF             ');
        Query1.sql.add('   SET AF_USU        = :AF_USU,        ');
        Query1.sql.add('       AF_INICIO_DT  = :AF_INICIO_DT,  ');
        Query1.sql.add('       AF_INICIO_DTx = :AF_INICIO_DTx, ');
        Query1.sql.add('       AF_INICIO_HR  = :AF_INICIO_HR,  ');
        Query1.sql.add('       AF_STATUS_MDE = :AF_STATUS_MDE, ');
        Query1.sql.add('       AF_STATUS_MDEx= :AF_STATUS_MDEx ');
        Query1.sql.add(' WHERE AF_MES        = :AF_MES         ');
        Query1.sql.add('   AND AF_ANO        = :AF_ANO         ');
        Query1.sql.add('   AND AF_CLIENTE    = :AF_CLIENTE     ');
        Query1.ParamByName('AF_MES'            ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'            ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'        ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_MDE'     ).AsInteger := 1; // Aberto
        Query1.ParamByName('AF_STATUS_MDEx'    ).AsString  := 'AB';
        Query1.ParamByName('AF_USU'            ).AsString  := Usuario.Codigo;
        if qGRID.FieldByName('AF_INICIO_DTx').AsString = '' then
        begin
           Query1.ParamByName('AF_INICIO_DT'     ).AsDateTime:= DataServidor;
           Query1.ParamByName('AF_INICIO_DTx'    ).AsString  := sDataServidor;
           Query1.ParamByName('AF_INICIO_HR'     ).AsString  := HoraServidor;
        end
        else
        begin
           Query1.ParamByName('AF_INICIO_DT'     ).AsDateTime:= qGRID.FieldByName('AF_INICIO_DT').AsDateTime;
           Query1.ParamByName('AF_INICIO_DTx'    ).AsString  := qGRID.FieldByName('AF_INICIO_DTx').AsString;
           Query1.ParamByName('AF_INICIO_HR'     ).AsString  := qGRID.FieldByName('AF_INICIO_HR').AsString;
        end;
        Query1.execsql;

   except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
   end;
end;

procedure Tfrm_SMC_Fiscal_T37.AtualizaGrid;
var vRegistro: TBookMark;
begin
    //rgSistema.itemindex := -1;
    //rgModoAutomaticoManual.itemindex := -1;

    try
      vRegistro := qGRID.GetBookmark;
    except
    end;
    QGRID.close;
    QGRID.sql.clear;
    QGRID.sql.add('SELECT *                                 ');
    QGRID.sql.add('  FROM CLIENTE_CLI                       ');
    QGRID.sql.add('  LEFT OUTER JOIN CLIENTE_DETALHE_CLID   ');
    QGRID.sql.add('    ON CLID_CODIGO = CLI_CODIGO          ');
    QGRID.sql.add('  LEFT OUTER JOIN  CONTADOR_CONT         ');
    QGRID.sql.add('    ON CONT_CODIGO = CLID_CDCONTADOR     ');
    QGRID.sql.add('  LEFT OUTER JOIN  CONTADOR_DETALHE_CONTD');
    QGRID.sql.add('    ON CONTD_CODIGO = CONT_CODIGO        ');
    QGRID.sql.add('  LEFT OUTER JOIN   ARQUIVOS_FISCAIS_AF  ');
    QGRID.sql.add('    ON AF_CLIENTE  = CLI_CODIGO          ');
    QGRID.sql.add('  LEFT OUTER  JOIN  CLIENTE_CONTATO_CLIC ');
    QGRID.sql.add('    ON CLIC_CODIGO = CLI_CODIGO          ');
    QGRID.sql.add('  LEFT OUTER JOIN  CONTADOR_CONTATO_CONTC');
    QGRID.sql.add('    ON CONTC_CODIGO=CONT_CODIGO          ');
    QGRID.sql.add(' WHERE AF_CLIENTE  = AF_CLIENTE          ');

    if edMes.Text <> '' then
    begin
       QGRID.sql.add(' AND AF_MES = :AF_MES                 ');
       QGRID.ParamByName('AF_MES').AsInteger := vMesDeReferencia;
    end;
    if edAno.Text <> '' then
    begin
       QGRID.sql.add('   AND AF_ANO = :AF_ANO               ');
       QGRID.ParamByName('AF_ANO').AsInteger := vAnoDeReferencia;
    end;
    if edCliente.Text <> '' then
    begin
       QGRID.sql.add('   AND AF_CLIENTE = :AF_CLIENTE        ');
       QGRID.ParamByName('AF_CLIENTE').AsString := edCliente.Text;
    end;
    if edTecnico.Text <> '' then
    begin
       QGRID.sql.add('   AND AF_USU = :AF_USU                ');
       QGRID.ParamByName('AF_USU').AsString := edTecnico.Text;
    end;

    if edDe.Text <> '  /  /  ' then
    begin
       QGRID.sql.add('   AND AF_FIM_DT >= :DE                ');
       QGRID.ParamByName('DE').AsDateTime := StrToDate(edDe.Text);
    end;
    if edAte.Text <> '  /  /  ' then
    begin
       QGRID.sql.add('   AND AF_FIM_DT <= :ATE                ');
       QGRID.ParamByName('ATE').AsDateTime := StrToDate(edAte.Text);
    end;

    case rgSistemaFiltro.itemindex of
       1 : QGRID.sql.add('AND CLID_SMC          = 1 ');
       2 : QGRID.sql.add('AND CLID_SMCPLUS      = 1 ');
       3 : QGRID.sql.add('AND CLID_MERCHANT     = 1 ');
       4 : QGRID.sql.add('AND CLID_GETRANSPORTE = 1 ');
       5 : QGRID.sql.add('AND CLID_MDE          = 1 ');
    end;

    if rgSistemaFiltro.itemindex < 1 then
    begin
        if rgStatus.itemIndex = 1 then
        begin
           QGRID.sql.add('AND (((CLID_SMC          = 1) AND (AF_STATUS_SMC      = 0)) ');
           QGRID.sql.add('  OR ((CLID_SMCPLUS      = 1) AND (AF_STATUS_SMCPLUS  = 0)) ');
           QGRID.sql.add('  OR ((CLID_MERCHANT     = 1) AND (AF_STATUS_MERCHANT = 0)) ');
           QGRID.sql.add('  OR ((CLID_GETRANSPORTE = 1) AND (AF_STATUS_GETRANSP = 0)) ');
           QGRID.sql.add('  OR ((CLID_MDE          = 1) AND (AF_STATUS_MDE      = 0)))');
        end;
        if rgStatus.itemIndex = 2 then
        begin
           QGRID.sql.add('AND (((CLID_SMC          = 1) AND (AF_STATUS_SMC      = 2)) ');
           QGRID.sql.add('  OR ((CLID_SMCPLUS      = 1) AND (AF_STATUS_SMCPLUS  = 2)) ');
           QGRID.sql.add('  OR ((CLID_MERCHANT     = 1) AND (AF_STATUS_MERCHANT = 2)) ');
           QGRID.sql.add('  OR ((CLID_GETRANSPORTE = 1) AND (AF_STATUS_GETRANSP = 2)) ');
           QGRID.sql.add('  OR ((CLID_MDE          = 1) AND (AF_STATUS_MDE      = 2)))');
        end;
        if rgStatus.itemIndex = 3 then
        begin
           QGRID.sql.add('AND (((CLID_SMC          = 1) AND (AF_STATUS_SMC      <> 3)) ');
           QGRID.sql.add('  OR ((CLID_SMCPLUS      = 1) AND (AF_STATUS_SMCPLUS  <> 3)) ');
           QGRID.sql.add('  OR ((CLID_MERCHANT     = 1) AND (AF_STATUS_MERCHANT <> 3)) ');
           QGRID.sql.add('  OR ((CLID_GETRANSPORTE = 1) AND (AF_STATUS_GETRANSP <> 3)) ');
           QGRID.sql.add('  OR ((CLID_MDE          = 1) AND (AF_STATUS_MDE      <> 3)))');
        end;
        if rgStatus.itemIndex = 4 then
        begin
           QGRID.sql.add('AND (((CLID_SMC          = 1) AND (AF_STATUS_SMC      = 3)) ');
           QGRID.sql.add('  OR ((CLID_SMCPLUS      = 1) AND (AF_STATUS_SMCPLUS  = 3)) ');
           QGRID.sql.add('  OR ((CLID_MERCHANT     = 1) AND (AF_STATUS_MERCHANT = 3)) ');
           QGRID.sql.add('  OR ((CLID_GETRANSPORTE = 1) AND (AF_STATUS_GETRANSP = 3)) ');
           QGRID.sql.add('  OR ((CLID_MDE          = 1) AND (AF_STATUS_MDE      = 3)))');
        end;
    end
    else
    begin
       Case rgSistemaFiltro.itemindex of
          1 : begin
                QGRID.sql.add('AND CLID_SMC = 1 ');
                Case rgStatus.itemIndex of
                   1 : QGRID.sql.add('AND AF_STATUS_SMC =  0 ');
                   2 : QGRID.sql.add('AND AF_STATUS_SMC =  2 ');
                   3 : QGRID.sql.add('AND AF_STATUS_SMC <> 3 ');
                   4 : QGRID.sql.add('AND AF_STATUS_SMC =  3 ');
                end;
              end;
          2 : begin
                QGRID.sql.add('AND CLID_SMCPLUS = 1 ');
                Case rgStatus.itemIndex of
                   1 : QGRID.sql.add('AND AF_STATUS_SMCPLUS =  0 ');
                   2 : QGRID.sql.add('AND AF_STATUS_SMCPLUS =  2 ');
                   3 : QGRID.sql.add('AND AF_STATUS_SMCPLUS <> 3 ');
                   4 : QGRID.sql.add('AND AF_STATUS_SMCPLUS =  3 ');
                end;
              end;
          3 : begin
                QGRID.sql.add('AND CLID_MERCHANT = 1 ');
                Case rgStatus.itemIndex of
                   1 : QGRID.sql.add('AND AF_STATUS_MERCHANT =  0 ');
                   2 : QGRID.sql.add('AND AF_STATUS_MERCHANT =  2 ');
                   3 : QGRID.sql.add('AND AF_STATUS_MERCHANT <> 3 ');
                   4 : QGRID.sql.add('AND AF_STATUS_MERCHANT =  3 ');
                end;
              end;
          4 : begin
                QGRID.sql.add('AND CLID_GETRANSPORTE = 1 ');
                Case rgStatus.itemIndex of
                   1 : QGRID.sql.add('AND AF_STATUS_GETRANSP =  0 ');
                   2 : QGRID.sql.add('AND AF_STATUS_GETRANSP =  2 ');
                   3 : QGRID.sql.add('AND AF_STATUS_GETRANSP <> 3 ');
                   4 : QGRID.sql.add('AND AF_STATUS_GETRANSP =  3 ');
                end;
              end;
          5 : begin
                QGRID.sql.add('AND CLID_MDE = 1');
                Case rgStatus.itemIndex of
                   1 : QGRID.sql.add('AND AF_STATUS_MDE =  0 ');
                   2 : QGRID.sql.add('AND AF_STATUS_MDE =  2 ');
                   3 : QGRID.sql.add('AND AF_STATUS_MDE <> 3 ');
                   4 : QGRID.sql.add('AND AF_STATUS_MDE =  3 ');
                end;
              end;
       end;
    end;
    QGRID.sql.add(' ORDER BY CLI_NOME_FANTASIA ');
    QGRID.Open;

    ContaGrid;

    try
      qGRID.GotoBookmark(vRegistro);
    except
    end;

    //rgSistema.itemindex := -1;
end;

{function Tfrm_SMC_Fiscal_T37.AutomaticoManual(pTipo: Integer): String;
begin
   if pTipo = 0 then
      result := 'MANUAL'
   else
     Result := '';
end;
}
procedure Tfrm_SMC_Fiscal_T37.bListarClick(Sender: TObject);
begin
   Listar;
end;

procedure Tfrm_SMC_Fiscal_T37.bPesqClienteClick(Sender: TObject);
begin
   PesquisarCliente;
end;

procedure Tfrm_SMC_Fiscal_T37.ContaContadores;
begin
end;

procedure Tfrm_SMC_Fiscal_T37.ContaGrid;
begin
   qGRID.DisableControls;
   ContaSistemas;
   ContaProdutividade;
   ContaContadores;
   qGRID.EnableControls;
end;

procedure Tfrm_SMC_Fiscal_T37.ContaProdutividade;
begin
    Executar('TRUNCATE TABLE GRAFICOUSUARQUIVOSFISCAIS_GUAF');

    Query1.close;
    Query1.sql.clear;
    Query1.sql.add('SELECT AF_USU,             ');
    Query1.sql.add('       COUNT(*) AS QTDE    ');
    Query1.sql.add('  FROM ARQUIVOS_FISCAIS_AF ');
    Query1.sql.add(' WHERE AF_MES = :AF_MES    ');
    Query1.sql.add('   AND AF_ANO = :AF_ANO    ');
    Query1.sql.add(' GROUP BY AF_USU           ');
    Query1.ParamByName('AF_MES').AsInteger := vMesDeReferencia;
    Query1.ParamByName('AF_ANO').AsInteger := vAnoDeReferencia;
    Query1.Open;
    while NOT Query1.Eof do
    begin
        Query2.close;
        Query2.sql.clear;
        Query2.sql.add('INSERT INTO GRAFICOUSUARQUIVOSFISCAIS_GUAF ( ');
        Query2.sql.add('             GUAF_USU,                       ');
        Query2.sql.add('             GUAF_QTDE )                     ');
        Query2.sql.add('VALUES (                                     ');
        Query2.sql.add('            :GUAF_USU,                       ');
        Query2.sql.add('            :GUAF_QTDE )                     ');
        Query2.ParamByName('GUAF_USU' ).AsString  := Query1.FieldByName('AF_USU').AsString;
        Query2.ParamByName('GUAF_QTDE').AsInteger := Query1.FieldByName('QTDE'  ).AsInteger;
        Query2.execsql;
        Query1.Next;
    end;
    tbGRAFICOUSUARQUIVOSFISCAIS_GUAF.close;
    tbGRAFICOUSUARQUIVOSFISCAIS_GUAF.Open;

    qGRID.First;
end;

procedure Tfrm_SMC_Fiscal_T37.ContaSistemas;
var
    Total_AF_STATUS_0,
    Total_AF_STATUS_1,
    Total_AF_STATUS_2,
    Total_AF_STATUS_3,
    Total,

    AF_STATUS_SMC_0,
    AF_STATUS_SMC_1,
    AF_STATUS_SMC_2,
    AF_STATUS_SMC_3,
    AF_STATUS_SMC_Total: Integer;

    AF_STATUS_SMCPLUS_0,
    AF_STATUS_SMCPLUS_1,
    AF_STATUS_SMCPLUS_2,
    AF_STATUS_SMCPLUS_3,
    AF_STATUS_SMCPLUS_Total: Integer;

    AF_STATUS_MERCHANT_0,
    AF_STATUS_MERCHANT_1,
    AF_STATUS_MERCHANT_2,
    AF_STATUS_MERCHANT_3,
    AF_STATUS_MERCHANT_Total: Integer;

    AF_STATUS_GETRANSP_0,
    AF_STATUS_GETRANSP_1,
    AF_STATUS_GETRANSP_2,
    AF_STATUS_GETRANSP_3,
    AF_STATUS_GETRANSP_Total: Integer;

    AF_STATUS_MDE_0,
    AF_STATUS_MDE_1,
    AF_STATUS_MDE_2,
    AF_STATUS_MDE_3,
    AF_STATUS_MDE_Total: Integer;

    vGAF_Concluidos,
    vGAF_Falta       : Integer;

    vQtdeClientes    : Integer;
begin
   vQtdeClientes      := 0;

   Total_AF_STATUS_0  := 0;
   Total_AF_STATUS_1  := 0;
   Total_AF_STATUS_2  := 0;
   Total_AF_STATUS_3  := 0;
   Total              := 0;

   AF_STATUS_SMC_Total := 0;
   AF_STATUS_SMC_0     := 0;
   AF_STATUS_SMC_1     := 0;
   AF_STATUS_SMC_2     := 0;
   AF_STATUS_SMC_3     := 0;

   AF_STATUS_SMCPLUS_Total := 0;
   AF_STATUS_SMCPLUS_0     := 0;
   AF_STATUS_SMCPLUS_1     := 0;
   AF_STATUS_SMCPLUS_2     := 0;
   AF_STATUS_SMCPLUS_3     := 0;

   AF_STATUS_MERCHANT_Total := 0;
   AF_STATUS_MERCHANT_0     := 0;
   AF_STATUS_MERCHANT_1     := 0;
   AF_STATUS_MERCHANT_2     := 0;
   AF_STATUS_MERCHANT_3     := 0;

   AF_STATUS_GETRANSP_Total := 0;
   AF_STATUS_GETRANSP_0     := 0;
   AF_STATUS_GETRANSP_1     := 0;
   AF_STATUS_GETRANSP_2     := 0;
   AF_STATUS_GETRANSP_3     := 0;

   AF_STATUS_MDE_Total := 0;
   AF_STATUS_MDE_0     := 0;
   AF_STATUS_MDE_1     := 0;
   AF_STATUS_MDE_2     := 0;
   AF_STATUS_MDE_3     := 0;

    qGRID.First;
    while not qGRID.Eof do
    begin
       vQtdeClientes := vQtdeClientes + 1;
       if qGRID.FieldByName('AF_USA_SMC').AsString = 'Sim' then
       begin
          inc(AF_STATUS_SMC_Total);
          Case qGRID.FieldByName('AF_STATUS_SMC').AsInteger of
             0 : AF_STATUS_SMC_0 := AF_STATUS_SMC_0 + 1;
             1 : AF_STATUS_SMC_1 := AF_STATUS_SMC_1 + 1;
             2 : AF_STATUS_SMC_2 := AF_STATUS_SMC_2 + 1;
             3 : AF_STATUS_SMC_3 := AF_STATUS_SMC_3 + 1;
          End;
       end;
       if qGRID.FieldByName('AF_USA_SMCPLUS').AsString = 'Sim' then
       begin
          inc(AF_STATUS_SMCPLUS_Total);
          Case qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger of
             0 : AF_STATUS_SMCPLUS_0 := AF_STATUS_SMCPLUS_0 + 1;
             1 : AF_STATUS_SMCPLUS_1 := AF_STATUS_SMCPLUS_1 + 1;
             2 : AF_STATUS_SMCPLUS_2 := AF_STATUS_SMCPLUS_2 + 1;
             3 : AF_STATUS_SMCPLUS_3 := AF_STATUS_SMCPLUS_3 + 1;
          End;
       end;
       if qGRID.FieldByName('AF_USA_MERCHANT').AsString = 'Sim' then
       begin
          inc(AF_STATUS_MERCHANT_Total);
          Case qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger of
             0 : AF_STATUS_MERCHANT_0 := AF_STATUS_MERCHANT_0 + 1;
             1 : AF_STATUS_MERCHANT_1 := AF_STATUS_MERCHANT_1 + 1;
             2 : AF_STATUS_MERCHANT_2 := AF_STATUS_MERCHANT_2 + 1;
             3 : AF_STATUS_MERCHANT_3 := AF_STATUS_MERCHANT_3 + 1;
          End;
       end;
       if qGRID.FieldByName('AF_USA_GETRANSP').AsString = 'Sim' then
       begin
          inc(AF_STATUS_GETRANSP_Total);
          Case qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger of
             0 : AF_STATUS_GETRANSP_0 := AF_STATUS_GETRANSP_0 + 1;
             1 : AF_STATUS_GETRANSP_1 := AF_STATUS_GETRANSP_1 + 1;
             2 : AF_STATUS_GETRANSP_2 := AF_STATUS_GETRANSP_2 + 1;
             3 : AF_STATUS_GETRANSP_3 := AF_STATUS_GETRANSP_3 + 1;
          End;
       end;
       if qGRID.FieldByName('AF_USA_MDE').AsString = 'Sim' then
       begin
          inc(AF_STATUS_MDE_Total);
          Case qGRID.FieldByName('AF_STATUS_MDE').AsInteger of
             0 : AF_STATUS_MDE_0 := AF_STATUS_MDE_0 + 1;
             1 : AF_STATUS_MDE_1 := AF_STATUS_MDE_1 + 1;
             2 : AF_STATUS_MDE_2 := AF_STATUS_MDE_2 + 1;
             3 : AF_STATUS_MDE_3 := AF_STATUS_MDE_3 + 1;
          End;
       end;

      qGRID.Next;
    end;


    Total_AF_STATUS_0 := Total_AF_STATUS_0 + AF_STATUS_SMC_0;
    Total_AF_STATUS_1 := Total_AF_STATUS_1 + AF_STATUS_SMC_1;
    Total_AF_STATUS_2 := Total_AF_STATUS_2 + AF_STATUS_SMC_2;
    Total_AF_STATUS_3 := Total_AF_STATUS_3 + AF_STATUS_SMC_3;

    Total_AF_STATUS_0 := Total_AF_STATUS_0 + AF_STATUS_SMCPLUS_0;
    Total_AF_STATUS_1 := Total_AF_STATUS_1 + AF_STATUS_SMCPLUS_1;
    Total_AF_STATUS_2 := Total_AF_STATUS_2 + AF_STATUS_SMCPLUS_2;
    Total_AF_STATUS_3 := Total_AF_STATUS_3 + AF_STATUS_SMCPLUS_3;

    Total_AF_STATUS_0 := Total_AF_STATUS_0 + AF_STATUS_MERCHANT_0;
    Total_AF_STATUS_1 := Total_AF_STATUS_1 + AF_STATUS_MERCHANT_1;
    Total_AF_STATUS_2 := Total_AF_STATUS_2 + AF_STATUS_MERCHANT_2;
    Total_AF_STATUS_3 := Total_AF_STATUS_3 + AF_STATUS_MERCHANT_3;

    Total_AF_STATUS_0 := Total_AF_STATUS_0 + AF_STATUS_GETRANSP_0;
    Total_AF_STATUS_1 := Total_AF_STATUS_1 + AF_STATUS_GETRANSP_1;
    Total_AF_STATUS_2 := Total_AF_STATUS_2 + AF_STATUS_GETRANSP_2;
    Total_AF_STATUS_3 := Total_AF_STATUS_3 + AF_STATUS_GETRANSP_3;

    Total_AF_STATUS_0 := Total_AF_STATUS_0 + AF_STATUS_MDE_0;
    Total_AF_STATUS_1 := Total_AF_STATUS_1 + AF_STATUS_MDE_1;
    Total_AF_STATUS_2 := Total_AF_STATUS_2 + AF_STATUS_MDE_2;
    Total_AF_STATUS_3 := Total_AF_STATUS_3 + AF_STATUS_MDE_3;

    Edit1.Text := IntToStr(AF_STATUS_SMC_Total);
    Edit21.Text:= IntToStr(AF_STATUS_SMC_0);
    Edit2.Text := IntToStr(AF_STATUS_SMC_1);
    Edit3.Text := IntToStr(AF_STATUS_SMC_2);
    Edit4.Text := IntToStr(AF_STATUS_SMC_3);

    Edit5.Text := IntToStr(AF_STATUS_SMCPLUS_Total);
    Edit22.Text:= IntToStr(AF_STATUS_SMCPLUS_0);
    Edit6.Text := IntToStr(AF_STATUS_SMCPLUS_1);
    Edit7.Text := IntToStr(AF_STATUS_SMCPLUS_2);
    Edit8.Text := IntToStr(AF_STATUS_SMCPLUS_3);

    Edit9.Text := IntToStr(AF_STATUS_MERCHANT_Total);
    Edit13.Text:= IntToStr(AF_STATUS_MERCHANT_0);
    Edit10.Text:= IntToStr(AF_STATUS_MERCHANT_1);
    Edit11.Text:= IntToStr(AF_STATUS_MERCHANT_2);
    Edit12.Text:= IntToStr(AF_STATUS_MERCHANT_3);

    Edit14.Text := IntToStr(AF_STATUS_GETRANSP_Total);
    Edit18.Text := IntToStr(AF_STATUS_GETRANSP_0);
    Edit15.Text := IntToStr(AF_STATUS_GETRANSP_1);
    Edit16.Text := IntToStr(AF_STATUS_GETRANSP_2);
    Edit17.Text := IntToStr(AF_STATUS_GETRANSP_3);

    Edit19.Text := IntToStr(AF_STATUS_MDE_Total);
    Edit25.Text := IntToStr(AF_STATUS_MDE_0);
    Edit20.Text := IntToStr(AF_STATUS_MDE_1);
    Edit23.Text := IntToStr(AF_STATUS_MDE_2);
    Edit24.Text := IntToStr(AF_STATUS_MDE_3);

    Total := Total_AF_STATUS_0 +
             Total_AF_STATUS_1 +
             Total_AF_STATUS_2 +
             Total_AF_STATUS_3;
    //Totais RESUMO
    Edit26.Text:= IntToStr(Total);
    Edit30.Text:= IntToStr(Total_AF_STATUS_0);
    Edit27.Text:= IntToStr(Total_AF_STATUS_1);
    Edit28.Text:= IntToStr(Total_AF_STATUS_2);
    Edit29.Text:= IntToStr(Total_AF_STATUS_3);

    pnQtdeClientes.Caption := IntToStr(vQtdeClientes);

    vGAF_Concluidos := Total_AF_STATUS_3;
    vGAF_Falta      := Total - Total_AF_STATUS_3;

    Executar('TRUNCATE TABLE GRAFICOARQUIVOSFISCAIS_GAF');

    Query1.close;
    Query1.sql.clear;
    Query1.sql.add('INSERT INTO GRAFICOARQUIVOSFISCAIS_GAF ( ');
    Query1.sql.add('             GAF_ITEM,                   ');
    Query1.sql.add('             GAF_QTDE )                  ');
    Query1.sql.add('VALUES (                                 ');
    Query1.sql.add('            :GAF_ITEM,                   ');
    Query1.sql.add('            :GAF_QTDE )                  ');
    Query1.ParamByName('GAF_ITEM').AsString  := 'CONCLUIDOS';
    Query1.ParamByName('GAF_QTDE').AsInteger := vGAF_Concluidos;
    Query1.execsql;

    Query1.close;
    Query1.sql.clear;
    Query1.sql.add('INSERT INTO GRAFICOARQUIVOSFISCAIS_GAF ( ');
    Query1.sql.add('             GAF_ITEM,                   ');
    Query1.sql.add('             GAF_QTDE )                  ');
    Query1.sql.add('VALUES (                                 ');
    Query1.sql.add('            :GAF_ITEM,                   ');
    Query1.sql.add('            :GAF_QTDE )                  ');
    Query1.ParamByName('GAF_ITEM').AsString  := 'FALTAM';
    Query1.ParamByName('GAF_QTDE').AsInteger := vGAF_Falta;
    Query1.execsql;

    //frxGaugePanel1.gauge.Maximum      := 100;
    //frxGaugePanel1.gauge.CurrentValue := vGAF_Concluidos * 100 / Total;

    tbGRAFICOARQUIVOSFISCAIS_GAF.close;
    tbGRAFICOARQUIVOSFISCAIS_GAF.Open;

    qGRID.First;
end;

procedure Tfrm_SMC_Fiscal_T37.bGraficoContadorClick(Sender: TObject);
begin
  frmGraficoContadoresSMC := TfrmGraficoContadoresSMC.Create(nil);
  frmGraficoContadoresSMC.ShowModal;
  frmGraficoContadoresSMC.Free;
end;

procedure Tfrm_SMC_Fiscal_T37.bGraficoSistemasClick(Sender: TObject);
begin
  frmGraficoSistemasSMC := TfrmGraficoSistemasSMC.Create(nil);
  frmGraficoSistemasSMC.ShowModal;
  frmGraficoSistemasSMC.Free;
end;

procedure Tfrm_SMC_Fiscal_T37.edOBSChange(Sender: TObject);
begin
     if edObs.text = '' then
     begin
        edobs.color := clwhite;
        edobs.font.color := clblack;
     end
     else
     begin
        edobs.color := clred;
        edobs.font.color := clwhite;
     end;
     edAF_OBS_USU.Style.Color       := edobs.color;
     edAF_OBS_USU.Style.font.color  := edobs.font.color;
     edAF_OBS_DT.Style.Color        := edobs.color;
     edAF_OBS_DT.Style.font.color   := edobs.font.color;
     edAF_OBS_HR.Style.Color        := edobs.color;
     edAF_OBS_HR.Style.font.color   := edobs.font.color;
end;

procedure Tfrm_SMC_Fiscal_T37.edOBSExit(Sender: TObject);
begin
   Gravar_Observacao;
end;

procedure Tfrm_SMC_Fiscal_T37.DBChart2Click(Sender: TObject);
begin
  frmGraficoProdutividadeSMC := TfrmGraficoProdutividadeSMC.Create(nil);
  frmGraficoProdutividadeSMC.ShowModal;
  frmGraficoProdutividadeSMC.Free;
end;

procedure Tfrm_SMC_Fiscal_T37.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  function Cor(vUsa:String;vStatus:Integer):Tcolor;
  begin
    if vUsa = 'Não' then
       Result := clWhite
    else
      case vStatus of
         0 : Result := clRed;
         1 : Result := _CorAberto;
         2 : Result := _CorPausa;
         3 : Result := _CorFechado;
      end;
  end;
  var vCor : TColor;
begin
   DBGrid1.Canvas.Brush.Color:= clWhite;
   DBGrid1.Canvas.Font.Style := [fsBold];
   DBGrid1.Canvas.FillRect(Rect);
   DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   if qGrid.RecordCount = 0 then
      exit;

   if (Column.Field.FieldName = 'AF_USA_SMC'    ) or
      (Column.Field.FieldName = 'AF_STATUS_SMCx') or
      (Column.Field.FieldName = 'AF_ENVIO_SMC'  ) Then
   begin
      vCor := Cor(qGRID.FieldByName('AF_USA_SMC').AsString,qGRID.FieldByName('AF_STATUS_SMC').AsInteger);
      DBGrid1.Canvas.Brush.Color:= vCor;
      DBGrid1.Canvas.Font.Color := clWhite;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_USA_SMCPLUS'    ) or
      (Column.Field.FieldName = 'AF_STATUS_SMCPLUSx') or
      (Column.Field.FieldName = 'AF_ENVIO_SMCPLUS'  ) Then
   begin
      vCor := Cor(qGRID.FieldByName('AF_USA_SMCPLUS').AsString,qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger);
      DBGrid1.Canvas.Brush.Color:= vCor;
      DBGrid1.Canvas.Font.Color := clWhite;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_USA_MERCHANT'    ) or
      (Column.Field.FieldName = 'AF_STATUS_MERCHANTx') or
      (Column.Field.FieldName = 'AF_ENVIO_MERCHANT'  ) Then
   begin
      vCor := Cor(qGRID.FieldByName('AF_USA_MERCHANT').AsString,qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger);
      DBGrid1.Canvas.Brush.Color:= vCor;
      DBGrid1.Canvas.Font.Color := clWhite;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_USA_GETRANSP'    ) or
      (Column.Field.FieldName = 'AF_STATUS_GETRANSPx') or
      (Column.Field.FieldName = 'AF_ENVIO_GETRANSP'  ) Then
   begin
      vCor := Cor(qGRID.FieldByName('AF_USA_GETRANSP').AsString,qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger);
      DBGrid1.Canvas.Brush.Color:= vCor;
      DBGrid1.Canvas.Font.Color := clWhite;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_USA_MDE'    ) or
      (Column.Field.FieldName = 'AF_STATUS_MDEx') or
      (Column.Field.FieldName = 'AF_ENVIO_MDE'  ) Then
   begin
      vCor := Cor(qGRID.FieldByName('AF_USA_MDE').AsString,qGRID.FieldByName('AF_STATUS_MDE').AsInteger);
      DBGrid1.Canvas.Brush.Color:= vCor;
      DBGrid1.Canvas.Font.Color := clWhite;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (gdSelected in State) or (gdFocused in State) then
   begin
      if DBGrid1.Canvas.Brush.Color = clWhite then
      begin
        DBGrid1.Canvas.Brush.Color:=$00E8C5A1; // clGradientInactiveCaption
        DBGrid1.Canvas.Font.Style := [fsBold];
      end;
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
   {
      if qGRID.FieldByName('AF_STATUS_SMC').AsInteger = 0 then
   begin
      (Column.Field.FieldName = 'AF_STATUS_SMCx') or
      (Column.Field.FieldName = 'AF_ENVIO_SMC'  ) Then
   begin


      else
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_USA_SMCPLUS'    ) or
      (Column.Field.FieldName = 'AF_STATUS_SMCPLUSx') or
      (Column.Field.FieldName = 'AF_ENVIO_SMCPLUS'  ) Then
   begin
      if qGRID.FieldByName('AF_USA_SMCPLUS').AsString = 'Sim' then
      begin
         DBGrid1.Canvas.Brush.Color:= $00E8C5A1;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_USA_MERCHANT'    ) or
      (Column.Field.FieldName = 'AF_STATUS_MERCHANTx') or
      (Column.Field.FieldName = 'AF_ENVIO_MERCHANT'  ) Then
   begin
      if qGRID.FieldByName('AF_USA_MERCHANT').AsString = 'Sim' then
      begin
         DBGrid1.Canvas.Brush.Color:= $00E8C5A1;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_USA_GETRANSP'    ) or
      (Column.Field.FieldName = 'AF_STATUS_GETRANSPx') or
      (Column.Field.FieldName = 'AF_ENVIO_GETRANSP'  ) Then
   begin
      if qGRID.FieldByName('AF_USA_GETRANSP').AsString = 'Sim' then
      begin
         DBGrid1.Canvas.Brush.Color:= $00E8C5A1;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_USA_MDE'    ) or
      (Column.Field.FieldName = 'AF_STATUS_MDEx') or
      (Column.Field.FieldName = 'AF_ENVIO_MDE'  ) Then
   begin
      if qGRID.FieldByName('AF_USA_MDE').AsString = 'Sim' then
      begin
         DBGrid1.Canvas.Brush.Color:= $00E8C5A1;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
{
   if (Column.Field.FieldName = 'AF_STATUS_SMCx') then
   begin
      if qGRID.FieldByName('AF_USA_SMC').AsString = 'Não' then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_SMC').AsInteger = 0 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clRed;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_SMC').AsInteger = 1 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorAberto;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_SMC').AsInteger = 2 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorPausa;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_SMC').AsInteger = 3 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorAberto;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_STATUS_SMCPLUSx') then
   begin
      if qGRID.FieldByName('AF_USA_SMCPLUS').AsString = 'Não' then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger = 0 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clRed;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger = 1 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorAberto;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger = 2 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorPausa;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger = 3 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorAberto;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_STATUS_MERCHANTx') then
   begin
      if qGRID.FieldByName('AF_USA_MERCHANT').AsString = 'Não' then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger = 0 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clRed;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger = 1 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorAberto;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger = 2 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorPausa;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger = 3 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorAberto;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_STATUS_GETRANSPx') then
   begin
      if qGRID.FieldByName('AF_USA_GETRANSP').AsString = 'Não' then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger = 0 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clRed;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger = 1 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorAberto;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger = 2 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorPausa;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger = 3 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorAberto;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
   //---------------------------------------------------------------------------
   if (Column.Field.FieldName = 'AF_STATUS_MDEx') then
   begin
      if qGRID.FieldByName('AF_USA_MDE').AsString = 'Não' then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_MDE').AsInteger = 0 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := clRed;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_MDE').AsInteger = 1 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorAberto;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_MDE').AsInteger = 2 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorPausa;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
      else
      if qGRID.FieldByName('AF_STATUS_MDE').AsInteger = 3 then
      begin
         DBGrid1.Canvas.Brush.Color:= clWhite;
         DBGrid1.Canvas.Font.Color := _CorAberto;
         DBGrid1.Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
}
end;

procedure Tfrm_SMC_Fiscal_T37.edAnoChange(Sender: TObject);
begin
   qGRID.Close;
end;

procedure Tfrm_SMC_Fiscal_T37.edClienteExit(Sender: TObject);
var vCodigo:String;
    ClienteLocal:TCliente;
begin
   edClienteNome.Text := '';
   if edCliente.Text = '' then
      exit;

   if ClienteLocal = nil then
      ClienteLocal := TCliente.Create;

   ClienteLocal.Codigo := edCliente.Text;
   ClienteLocal.Abrir;
   if not ClienteLocal.Existe then
   begin
      edCliente.SetFocus;
      exit;
   end;
   if ClienteLocal.NomeFantasia <> '' then
      edClienteNome.Text := ClienteLocal.NomeFantasia
   else
      edClienteNome.Text := ClienteLocal.RazaoSocial;
   ClienteLocal.Free;

   Listar;
end;

procedure Tfrm_SMC_Fiscal_T37.edClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_F1 then
      PesquisarCliente;
end;

procedure Tfrm_SMC_Fiscal_T37.edMesChange(Sender: TObject);
begin
   qGRID.Close;
end;

procedure Tfrm_SMC_Fiscal_T37.edTecnicoExit(Sender: TObject);
var UsuarioLocal: TUsuario;
begin
  edTecnicoNome.Text := '';
  if edTecnico.Text = '' then
     exit;
  try
      UsuarioLocal := TUsuario.Create;
  except
      UsuarioLocal.Free;
      UsuarioLocal := TUsuario.Create;
  end;
  if not UsuarioLocal.Existe(edTecnico.Text) then
  begin
     UsuarioLocal.Free;
     //Avisos.Avisar('Usuário não cadastrado');
     Avisos.Avisar('Usuário não cadastrado');
     edTecnico.SetFocus;
     exit;
  end;
  edTecnicoNome.Text := UsuarioLocal.Codigo;
  UsuarioLocal.Free;

  Listar;
end;

function Tfrm_SMC_Fiscal_T37.Existe_ArquivoFiscalParaCliente(pCLIENTE: String;
  pMes, pAno: Integer): Boolean;
begin
        Dm.Query1.close;
        Dm.Query1.sql.clear;
        Dm.Query1.sql.add('SELECT * FROM ARQUIVOS_FISCAIS_AF ');
        Dm.Query1.sql.add(' WHERE AF_MES     = :AF_MES       ');
        Dm.Query1.sql.add('   AND AF_ANO     = :AF_ANO       ');
        Dm.Query1.sql.add('   AND AF_CLIENTE = :AF_CLIENTE   ');
        Dm.Query1.ParamByName('AF_MES'    ).AsInteger := pMes;
        Dm.Query1.ParamByName('AF_ANO'    ).AsInteger := pAno;
        Dm.Query1.ParamByName('AF_CLIENTE').AsString  := PCLIENTE;
        Dm.Query1.Open;
        Result := Not Dm.Query1.Eof;
end;

procedure Tfrm_SMC_Fiscal_T37.FecharGETRANSPORTE;
begin
   if qGRID.FieldByName('AF_USA_GETRANSP').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa GETRANSP');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger = 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do GETRANSP não iniciado para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger = 3 then
   begin
     Avisos.Avisar('Procedimento Fiscal do GETRANSP já está fechado para este cliente');
     exit
   end;

    try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF                       ');
        Query1.sql.add('   SET AF_FIM_DT          = :AF_FIM_DT,          ');
        Query1.sql.add('       AF_FIM_DTx         = :AF_FIM_DTx,         ');
        Query1.sql.add('       AF_FIM_HR          = :AF_FIM_HR,          ');
        Query1.sql.add('       AF_STATUS_GETRANSP = :AF_STATUS_GETRANSP, ');
        Query1.sql.add('       AF_STATUS_GETRANSPx= :AF_STATUS_GETRANSPx,');
        Query1.sql.add('       AF_ENVIO_GETRANSP  = :AF_ENVIO_GETRANSP   ');
        Query1.sql.add(' WHERE AF_MES             = :AF_MES              ');
        Query1.sql.add('   AND AF_ANO             = :AF_ANO              ');
        Query1.sql.add('   AND AF_CLIENTE         = :AF_CLIENTE          ');
        Query1.ParamByName('AF_MES'             ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'             ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'         ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_GETRANSP' ).AsInteger := 3; // Fechado
        Query1.ParamByName('AF_STATUS_GETRANSPx').AsString  := 'FE';
        Query1.ParamByName('AF_ENVIO_GETRANSP'  ).AsString  := '';//AutomaticoManual(rgModoAutomaticoManual.ItemIndex);
        Query1.ParamByName('AF_FIM_DT'          ).AsDateTime:= DataServidor;
        Query1.ParamByName('AF_FIM_DTx'         ).AsString  := sDataServidor;
        Query1.ParamByName('AF_FIM_HR'          ).AsString  := HoraServidor;
        Query1.execsql;

        AtualizaGrid;

    except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
    end;
end;

procedure Tfrm_SMC_Fiscal_T37.FecharMDE;
begin
   if qGRID.FieldByName('AF_USA_MDE').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa MDE');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MDE').AsInteger = 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MDE não iniciado para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MDE').AsInteger = 3 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MDE já está fechado para este cliente');
     exit
   end;

    try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF             ');
        Query1.sql.add('   SET AF_FIM_DT     = :AF_FIM_DT,     ');
        Query1.sql.add('       AF_FIM_DTx    = :AF_FIM_DTx,    ');
        Query1.sql.add('       AF_FIM_HR     = :AF_FIM_HR,     ');
        Query1.sql.add('       AF_STATUS_MDE = :AF_STATUS_MDE, ');
        Query1.sql.add('       AF_STATUS_MDEx= :AF_STATUS_MDEx,');
        Query1.sql.add('       AF_ENVIO_MDE  = :AF_ENVIO_MDE   ');
        Query1.sql.add(' WHERE AF_MES        = :AF_MES         ');
        Query1.sql.add('   AND AF_ANO        = :AF_ANO         ');
        Query1.sql.add('   AND AF_CLIENTE    = :AF_CLIENTE     ');
        Query1.ParamByName('AF_MES'        ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'        ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'    ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_MDE' ).AsInteger := 3; // Fechado
        Query1.ParamByName('AF_STATUS_MDEx').AsString  := 'FE';
        Query1.ParamByName('AF_ENVIO_MDE'  ).AsString  := '';//AutomaticoManual(rgModoAutomaticoManual.ItemIndex);
        Query1.ParamByName('AF_FIM_DT'     ).AsDateTime:= DataServidor;
        Query1.ParamByName('AF_FIM_DTx'    ).AsString  := sDataServidor;
        Query1.ParamByName('AF_FIM_HR'     ).AsString  := HoraServidor;
        Query1.execsql;

        AtualizaGrid;

    except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
    end;
end;

procedure Tfrm_SMC_Fiscal_T37.FecharMERCHANT;
begin
   if qGRID.FieldByName('AF_USA_MERCHANT').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa MERCHANT');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger = 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MERCHANT não iniciado para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger = 3 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MERCHANT já está fechado para este cliente');
     exit
   end;

    try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF                       ');
        Query1.sql.add('   SET AF_FIM_DT          = :AF_FIM_DT,          ');
        Query1.sql.add('       AF_FIM_DTx         = :AF_FIM_DTx,         ');
        Query1.sql.add('       AF_FIM_HR          = :AF_FIM_HR,          ');
        Query1.sql.add('       AF_STATUS_MERCHANT = :AF_STATUS_MERCHANT, ');
        Query1.sql.add('       AF_STATUS_MERCHANTx= :AF_STATUS_MERCHANTx,');
        Query1.sql.add('       AF_ENVIO_MERCHANT  = :AF_ENVIO_MERCHANT   ');
        Query1.sql.add(' WHERE AF_MES             = :AF_MES              ');
        Query1.sql.add('   AND AF_ANO             = :AF_ANO              ');
        Query1.sql.add('   AND AF_CLIENTE         = :AF_CLIENTE          ');
        Query1.ParamByName('AF_MES'             ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'             ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'         ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_MERCHANT' ).AsInteger := 3; // Fechado
        Query1.ParamByName('AF_STATUS_MERCHANTx').AsString  := 'FE';
        Query1.ParamByName('AF_ENVIO_MERCHANT'  ).AsString  := '';//AutomaticoManual(rgModoAutomaticoManual.ItemIndex);
        Query1.ParamByName('AF_FIM_DT'          ).AsDateTime:= DataServidor;
        Query1.ParamByName('AF_FIM_DTx'         ).AsString  := sDataServidor;
        Query1.ParamByName('AF_FIM_HR'          ).AsString  := HoraServidor;
        Query1.execsql;

        AtualizaGrid;

    except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
    end;
end;

procedure Tfrm_SMC_Fiscal_T37.FecharProcedimentosFiscaisNoCliente;
begin
    if qGRID.eof then
       exit;

    if vMesDeReferencia = -1 then
       exit;

    if (qGRID.FieldByName('AF_USU').AsString <> '') and
       (qGRID.FieldByName('AF_USU').AsString <> Usuario.Codigo) then
    begin
      Avisos.Avisar('Este cliente está sendo atendido por '+
                    qGRID.FieldByName('AF_USU').AsString);
      exit;
    end;

    if rgSistema.itemindex = -1 then
    begin
      Avisos.Avisar('Selecione o Sistema a Fechar Procedimento Fiscal');
      rgSistema.SetFocus;
      exit;
    end;
 {
    if rgModoAutomaticoManual.itemindex = -1 then
    begin
      Avisos.Avisar('Marque se o Fechamento do Procedimento Fiscal foi Automático ou Manual');
      rgModoAutomaticoManual.SetFocus;
      exit;
    end;
}
    Case rgSistema.itemindex of
       0 : FecharSMC;
       1 : FecharSMCPLUS;
       2 : FecharMERCHANT;
       3 : FecharGETRANSPORTE;
       4 : FecharMDE;
    End;
    rgSistema.itemindex := -1;
    AtualizaGrid;
end;

procedure Tfrm_SMC_Fiscal_T37.FecharSMC;
begin
   if qGRID.FieldByName('AF_USA_SMC').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa SMC');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMC').AsInteger = 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMC não iniciado para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMC').AsInteger = 3 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMC já está fechado para este cliente');
     exit
   end;

    try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF             ');
        Query1.sql.add('   SET AF_FIM_DT     = :AF_FIM_DT,     ');
        Query1.sql.add('       AF_FIM_DTx    = :AF_FIM_DTx,    ');
        Query1.sql.add('       AF_FIM_HR     = :AF_FIM_HR,     ');
        Query1.sql.add('       AF_STATUS_SMC = :AF_STATUS_SMC, ');
        Query1.sql.add('       AF_STATUS_SMCx= :AF_STATUS_SMCx,');
        Query1.sql.add('       AF_ENVIO_SMC  = :AF_ENVIO_SMC   ');
        Query1.sql.add(' WHERE AF_MES        = :AF_MES         ');
        Query1.sql.add('   AND AF_ANO        = :AF_ANO         ');
        Query1.sql.add('   AND AF_CLIENTE    = :AF_CLIENTE     ');
        Query1.ParamByName('AF_MES'        ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'        ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'    ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_SMC' ).AsInteger := 3; // Fechado
        Query1.ParamByName('AF_STATUS_SMCx').AsString  := 'FE';
        Query1.ParamByName('AF_ENVIO_SMC'  ).AsString  := '';//AutomaticoManual(rgModoAutomaticoManual.ItemIndex);
        Query1.ParamByName('AF_FIM_DT'     ).AsDateTime:= DataServidor;
        Query1.ParamByName('AF_FIM_DTx'    ).AsString  := sDataServidor;
        Query1.ParamByName('AF_FIM_HR'     ).AsString  := HoraServidor;
        Query1.execsql;

    except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
    end;
end;

procedure Tfrm_SMC_Fiscal_T37.FecharSMCPLUS;
begin
   if qGRID.FieldByName('AF_USA_SMCPLUS').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa SMCPLUS');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger = 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMCPLUS não iniciado para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger = 3 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMCPLUS já está fechado para este cliente');
     exit
   end;

    try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF                     ');
        Query1.sql.add('   SET AF_FIM_DT         = :AF_FIM_DT,         ');
        Query1.sql.add('       AF_FIM_DTx        = :AF_FIM_DTx,        ');
        Query1.sql.add('       AF_FIM_HR         = :AF_FIM_HR,         ');
        Query1.sql.add('       AF_STATUS_SMCPLUS = :AF_STATUS_SMCPLUS, ');
        Query1.sql.add('       AF_STATUS_SMCPLUSx= :AF_STATUS_SMCPLUSx,');
        Query1.sql.add('       AF_ENVIO_SMCPLUS  = :AF_ENVIO_SMCPLUS   ');
        Query1.sql.add(' WHERE AF_MES            = :AF_MES             ');
        Query1.sql.add('   AND AF_ANO            = :AF_ANO             ');
        Query1.sql.add('   AND AF_CLIENTE        = :AF_CLIENTE         ');
        Query1.ParamByName('AF_MES'            ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'            ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'        ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_SMCPLUS' ).AsInteger := 3; // Fechado
        Query1.ParamByName('AF_STATUS_SMCPLUSx').AsString  := 'FE';
        Query1.ParamByName('AF_ENVIO_SMCPLUS'  ).AsString  := '';//AutomaticoManual(rgModoAutomaticoManual.ItemIndex);
        Query1.ParamByName('AF_FIM_DT'         ).AsDateTime:= DataServidor;
        Query1.ParamByName('AF_FIM_DTx'        ).AsString  := sDataServidor;
        Query1.ParamByName('AF_FIM_HR'         ).AsString  := HoraServidor;
        Query1.execsql;

    except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
    end;
end;

procedure Tfrm_SMC_Fiscal_T37.FormShow(Sender: TObject);
var xData, xMes, xAno:String;
    I : integer;
begin
   edDe.Text := '  /  /  ';
   edAte.Text:= '  /  /  ';
   edCliente.Text := '';
   edTecnico.Text := '';
   edClienteNome.Text := '';
   edTecnicoNome.Text := '';

   xData := sDataServidor;
   xMes  := Copy(xData,4,2);
   xAno  := Copy(xData,7,4);
   edMes.Text := xMes;
   edAno.Text := xAno;

   for i := 0 to frm_SMC_Fiscal_T37.ComponentCount-1 do
   begin
     if (frm_SMC_Fiscal_T37.Components[i] is TPanel) then
     begin
       if (frm_SMC_Fiscal_T37.Components[i] as TPanel).Color = clGreen then
          (frm_SMC_Fiscal_T37.Components[i] as TPanel).Color := _CorAberto
       else
       if (frm_SMC_Fiscal_T37.Components[i] as TPanel).Color = clBlue then
          (frm_SMC_Fiscal_T37.Components[i] as TPanel).Color := _CorFechado
       else
       if (frm_SMC_Fiscal_T37.Components[i] as TPanel).Color = $000080FF then
          (frm_SMC_Fiscal_T37.Components[i] as TPanel).Color := _CorPausa;
     end;;
     if (frm_SMC_Fiscal_T37.Components[i] is TLabel) then
     begin
       if (frm_SMC_Fiscal_T37.Components[i] as TLabel).Font.Color = clGreen then
          (frm_SMC_Fiscal_T37.Components[i] as TLabel).Font.Color := _CorAberto
       else
       if (frm_SMC_Fiscal_T37.Components[i] as TLabel).Font.Color = clBlue then
          (frm_SMC_Fiscal_T37.Components[i] as TLabel).Font.Color := _CorFechado
       else
       if (frm_SMC_Fiscal_T37.Components[i] as TLabel).Font.Color = $000080FF then
          (frm_SMC_Fiscal_T37.Components[i] as TLabel).Font.Color := _CorPausa;
     end;
   end;

   PreparaGrid;
end;

procedure Tfrm_SMC_Fiscal_T37.Gravar_Observacao;
begin
   try
        if edOBS.Text = qGRID.FieldByName('AF_OBS').AsString then
           exit;

        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF         ');
        Query1.sql.add('   SET AF_OBS        = :AF_OBS,    ');
        Query1.sql.add('       AF_OBS_USU    = :AF_OBS_USU,');
        Query1.sql.add('       AF_OBS_DT     = :AF_OBS_DT, ');
        Query1.sql.add('       AF_OBS_DTx    = :AF_OBS_DTx,');
        Query1.sql.add('       AF_OBS_HR     = :AF_OBS_HR  ');
        Query1.sql.add(' WHERE AF_CLIENTE    = :AF_CLIENTE ');
        Query1.sql.add('   AND AF_MES        = :AF_MES     ');
        Query1.sql.add('   AND AF_ANO        = :AF_ANO     ');
        Query1.ParamByName('AF_CLIENTE').AsString   := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_OBS'    ).AsString   := edOBS.Text;
        Query1.ParamByName('AF_OBS_USU').AsString   := Usuario.Codigo;
        Query1.ParamByName('AF_OBS_DT' ).AsDateTime := DataServidor;
        Query1.ParamByName('AF_OBS_DTx').AsString   := sDataServidor;
        Query1.ParamByName('AF_OBS_HR' ).AsString   := HoraServidor;
        Query1.ParamByName('AF_MES'    ).AsInteger  := qGRID.FieldByName('AF_MES').AsInteger;
        Query1.ParamByName('AF_ANO'    ).AsInteger  := qGRID.FieldByName('AF_ANO').AsInteger;
        Query1.execsql;
        Log('37',
            'OBS Arq Fisc '+
            edOBS.Text+
            'cli '+
            qGRID.FieldByName('AF_CLIENTE').AsString +
            '-'+
            qGRID.FieldByName('CLI_NOME_FANTASIA').AsString);

        AtualizaGrid;

   except
   end;
end;

procedure Tfrm_SMC_Fiscal_T37.Incluir_ArquivoFiscalParaCliente(pCLIENTE: String;
  pMes, pAno: Integer);
var vDataServidor:TDateTime;
    vHoraServidor,
    xDataServidor:String;
begin
    vDataServidor := DataServidor;
    vHoraServidor := HoraServidor;
    xDataServidor := sDataServidor;
        Dm.Query1.close;
        Dm.Query1.sql.clear;
        Dm.Query1.sql.add('INSERT INTO ARQUIVOS_FISCAIS_AF ( ');
        Dm.Query1.sql.add('             AF_MES,              ');
        Dm.Query1.sql.add('             AF_ANO,              ');
        Dm.Query1.sql.add('             AF_CLIENTE,          ');
        Dm.Query1.sql.add('             AF_STATUS,           ');
        Dm.Query1.sql.add('             AF_STATUSx,          ');
        Dm.Query1.sql.add('             AF_USU,              ');
        Dm.Query1.sql.add('             AF_INICIO_DT,        ');
        Dm.Query1.sql.add('             AF_INICIO_DTx,       ');
        Dm.Query1.sql.add('             AF_INICIO_HR,        ');
        Dm.Query1.sql.add('             AF_FIM_USU,          ');
        Dm.Query1.sql.add('             AF_FIM_DT,           ');
        Dm.Query1.sql.add('             AF_FIM_DTx,          ');
        Dm.Query1.sql.add('             AF_FIM_HR,           ');
        Dm.Query1.sql.add('             AF_USA_SMC,          ');
        Dm.Query1.sql.add('             AF_USA_SMCPLUS,      ');
        Dm.Query1.sql.add('             AF_USA_MERCHANT,     ');
        Dm.Query1.sql.add('             AF_USA_GETRANSP,     ');
        Dm.Query1.sql.add('             AF_USA_MDE,          ');

        Dm.Query1.sql.add('             AF_STATUS_SMC,       ');
        Dm.Query1.sql.add('             AF_STATUS_SMCPLUS,   ');
        Dm.Query1.sql.add('             AF_STATUS_MERCHANT,  ');
        Dm.Query1.sql.add('             AF_STATUS_GETRANSP,  ');
        Dm.Query1.sql.add('             AF_STATUS_MDE,       ');

        Dm.Query1.sql.add('             AF_STATUS_SMCx,      ');
        Dm.Query1.sql.add('             AF_STATUS_SMCPLUSx,  ');
        Dm.Query1.sql.add('             AF_STATUS_MERCHANTx, ');
        Dm.Query1.sql.add('             AF_STATUS_GETRANSPx, ');
        Dm.Query1.sql.add('             AF_STATUS_MDEx,      ');

        Dm.Query1.sql.add('             AF_ENVIO_SMC,        ');
        Dm.Query1.sql.add('             AF_ENVIO_SMCPLUS,    ');
        Dm.Query1.sql.add('             AF_ENVIO_MERCHANT,   ');
        Dm.Query1.sql.add('             AF_ENVIO_GETRANSP,   ');
        Dm.Query1.sql.add('             AF_ENVIO_MDE)        ');
        Dm.Query1.sql.add('VALUES (                          ');
        Dm.Query1.sql.add('            :AF_MES,              ');
        Dm.Query1.sql.add('            :AF_ANO,              ');
        Dm.Query1.sql.add('            :AF_CLIENTE,          ');
        Dm.Query1.sql.add('            :AF_STATUS,           ');
        Dm.Query1.sql.add('            :AF_STATUSx,          ');
        Dm.Query1.sql.add('            :AF_USU,              ');
        Dm.Query1.sql.add('            :AF_INICIO_DT,        ');
        Dm.Query1.sql.add('            :AF_INICIO_DTx,       ');
        Dm.Query1.sql.add('            :AF_INICIO_HR,        ');
        Dm.Query1.sql.add('            :AF_FIM_USU,          ');
        Dm.Query1.sql.add('            :AF_FIM_DT,           ');
        Dm.Query1.sql.add('            :AF_FIM_DTx,          ');
        Dm.Query1.sql.add('            :AF_FIM_HR,           ');
        Dm.Query1.sql.add('            :AF_USA_SMC,          ');
        Dm.Query1.sql.add('            :AF_USA_SMCPLUS,      ');
        Dm.Query1.sql.add('            :AF_USA_MERCHANT,     ');
        Dm.Query1.sql.add('            :AF_USA_GETRANSP,     ');
        Dm.Query1.sql.add('            :AF_USA_MDE,          ');

        Dm.Query1.sql.add('            :AF_STATUS_SMC,       ');
        Dm.Query1.sql.add('            :AF_STATUS_SMCPLUS,   ');
        Dm.Query1.sql.add('            :AF_STATUS_MERCHANT,  ');
        Dm.Query1.sql.add('            :AF_STATUS_GETRANSP,  ');
        Dm.Query1.sql.add('            :AF_STATUS_MDE,       ');

        Dm.Query1.sql.add('            :AF_STATUS_SMCx,      ');
        Dm.Query1.sql.add('            :AF_STATUS_SMCPLUSx,  ');
        Dm.Query1.sql.add('            :AF_STATUS_MERCHANTx, ');
        Dm.Query1.sql.add('            :AF_STATUS_GETRANSPx, ');
        Dm.Query1.sql.add('            :AF_STATUS_MDEx,      ');

        Dm.Query1.sql.add('            :AF_ENVIO_SMC,        ');
        Dm.Query1.sql.add('            :AF_ENVIO_SMCPLUS,    ');
        Dm.Query1.sql.add('            :AF_ENVIO_MERCHANT,   ');
        Dm.Query1.sql.add('            :AF_ENVIO_GETRANSP,   ');
        Dm.Query1.sql.add('            :AF_ENVIO_MDE)        ');

        Dm.Query1.ParamByName('AF_MES'           ).AsInteger := pMes;
        Dm.Query1.ParamByName('AF_ANO'           ).AsInteger := pAno;
        Dm.Query1.ParamByName('AF_CLIENTE'       ).AsString  := pCLIENTE;
        Dm.Query1.ParamByName('AF_STATUS'        ).AsInteger := 0;
        Dm.Query1.ParamByName('AF_STATUSx'       ).AsString  := 'Pendente';
        Dm.Query1.ParamByName('AF_USU'           ).AsString  := '';
        Dm.Query1.ParamByName('AF_INICIO_DT'     ).AsDateTime:= vDataServidor;
        Dm.Query1.ParamByName('AF_INICIO_DTx'    ).AsString  := xDataServidor;
        Dm.Query1.ParamByName('AF_INICIO_HR'     ).AsString  := vHoraServidor;
        Dm.Query1.ParamByName('AF_FIM_USU'       ).AsString  := '';
        Dm.Query1.ParamByName('AF_FIM_DT'        ).AsDateTime:= vDataServidor;
        Dm.Query1.ParamByName('AF_FIM_DTx'       ).AsString  := xDataServidor;
        Dm.Query1.ParamByName('AF_FIM_HR'        ).AsString  := vHoraServidor;
        Dm.Query1.ParamByName('AF_USA_SMC'       ).AsString  := fSIMouNAO(qCLIENTE_CLI.FieldByName('CLID_SMC'         ).AsInteger);
        Dm.Query1.ParamByName('AF_USA_SMCPLUS'   ).AsString  := fSIMouNAO(qCLIENTE_CLI.FieldByName('CLID_SMCPLUS'     ).AsInteger);
        Dm.Query1.ParamByName('AF_USA_MERCHANT'  ).AsString  := fSIMouNAO(qCLIENTE_CLI.FieldByName('CLID_MERCHANT'    ).AsInteger);
        Dm.Query1.ParamByName('AF_USA_GETRANSP'  ).AsString  := fSIMouNAO(qCLIENTE_CLI.FieldByName('CLID_GETRANSPORTE').AsInteger);
        Dm.Query1.ParamByName('AF_USA_MDE'       ).AsString  := fSIMouNAO(qCLIENTE_CLI.FieldByName('CLID_MDE'         ).AsInteger);
        Dm.Query1.ParamByName('AF_ENVIO_SMC'     ).AsString  := '';
        Dm.Query1.ParamByName('AF_ENVIO_SMCPLUS' ).AsString  := '';
        Dm.Query1.ParamByName('AF_ENVIO_MERCHANT').AsString  := '';
        Dm.Query1.ParamByName('AF_ENVIO_GETRANSP').AsString  := '';
        Dm.Query1.ParamByName('AF_ENVIO_MDE'     ).AsString  := '';

        Dm.Query1.ParamByName('AF_STATUS_SMC'     ).AsInteger := 0;
        Dm.Query1.ParamByName('AF_STATUS_SMCPLUS' ).AsInteger := 0;
        Dm.Query1.ParamByName('AF_STATUS_MERCHANT').AsInteger := 0;
        Dm.Query1.ParamByName('AF_STATUS_GETRANSP').AsInteger := 0;
        Dm.Query1.ParamByName('AF_STATUS_MDE'     ).AsInteger := 0;

        Dm.Query1.ParamByName('AF_STATUS_SMCx'     ).AsString  := 'Não';
        Dm.Query1.ParamByName('AF_STATUS_SMCPLUSx' ).AsString  := 'Não';
        Dm.Query1.ParamByName('AF_STATUS_MERCHANTx').AsString  := 'Não';
        Dm.Query1.ParamByName('AF_STATUS_GETRANSPx').AsString  := 'Não';
        Dm.Query1.ParamByName('AF_STATUS_MDEx'     ).AsString  := 'Não';

        Dm.Query1.execsql;
end;

procedure Tfrm_SMC_Fiscal_T37.Listar;
begin
   PreparaGrid;
end;

procedure Tfrm_SMC_Fiscal_T37.Panel14Click(Sender: TObject);
begin
    AbrirProcedimentosFiscaisNoCliente;
end;

procedure Tfrm_SMC_Fiscal_T37.Panel15Click(Sender: TObject);
begin
  PausarProcedimentosFiscaisNoCliente;
end;

procedure Tfrm_SMC_Fiscal_T37.Panel16Click(Sender: TObject);
begin
   FecharProcedimentosFiscaisNoCliente;
end;

procedure Tfrm_SMC_Fiscal_T37.PausarGETRANSPORTE;
begin
   if qGRID.FieldByName('AF_USA_GETRANSP').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa GETRANSP');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger = 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do GETRANSP não iniciado para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger = 2 then
   begin
     Avisos.Avisar('Procedimento Fiscal do GETRANSP já está em espera para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_GETRANSP').AsInteger = 3 then
   begin
     Avisos.Avisar('Procedimento Fiscal do GETRANSP já está fechado para este cliente');
     exit
   end;

   try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF                       ');
        Query1.sql.add('   SET AF_STATUS_GETRANSP = :AF_STATUS_GETRANSP, ');
        Query1.sql.add('       AF_STATUS_GETRANSPx= :AF_STATUS_GETRANSPx ');
        Query1.sql.add(' WHERE AF_MES             = :AF_MES              ');
        Query1.sql.add('   AND AF_ANO             = :AF_ANO              ');
        Query1.sql.add('   AND AF_CLIENTE         = :AF_CLIENTE          ');
        Query1.ParamByName('AF_MES'             ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'             ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'         ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_GETRANSP' ).AsInteger := 2; // Espera
        Query1.ParamByName('AF_STATUS_GETRANSPx').AsString  := 'ES';
        Query1.execsql;

   except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
   end;

end;

procedure Tfrm_SMC_Fiscal_T37.PausarMDE;
begin
   if qGRID.FieldByName('AF_USA_MDE').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa MDE');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MDE').AsInteger = 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MDE não iniciado para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MDE').AsInteger = 2 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MDE já está em espera para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MDE').AsInteger = 3 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MDE já está fechado para este cliente');
     exit
   end;

   try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF             ');
        Query1.sql.add('   SET AF_STATUS_MDE = :AF_STATUS_MDE, ');
        Query1.sql.add('       AF_STATUS_MDEx= :AF_STATUS_MDEx ');
        Query1.sql.add(' WHERE AF_MES        = :AF_MES         ');
        Query1.sql.add('   AND AF_ANO        = :AF_ANO         ');
        Query1.sql.add('   AND AF_CLIENTE    = :AF_CLIENTE     ');
        Query1.ParamByName('AF_MES'           ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'           ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'       ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_MDE'    ).AsInteger := 2; // Espera
        Query1.ParamByName('AF_STATUS_MDEx'   ).AsString  := 'ES';
        Query1.execsql;

   except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
   end;

end;

procedure Tfrm_SMC_Fiscal_T37.PausarMERCHANT;
begin
   if qGRID.FieldByName('AF_USA_MERCHANT').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa MERCHANT');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger = 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MERCHANT não iniciado para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger = 2 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MERCHANT já está em espera para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_MERCHANT').AsInteger = 3 then
   begin
     Avisos.Avisar('Procedimento Fiscal do MERCHANT já está fechado para este cliente');
     exit
   end;

   try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF                      ');
        Query1.sql.add('   SET AF_STATUS_MERCHANT = :AF_STATUS_MERCHANT,');
        Query1.sql.add('       AF_STATUS_MERCHANTx= :AF_STATUS_MERCHANTx');
        Query1.sql.add(' WHERE AF_MES             = :AF_MES             ');
        Query1.sql.add('   AND AF_ANO             = :AF_ANO             ');
        Query1.sql.add('   AND AF_CLIENTE         = :AF_CLIENTE         ');
        Query1.ParamByName('AF_MES'             ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'             ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'         ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_MERCHANT' ).AsInteger := 2; // Espera
        Query1.ParamByName('AF_STATUS_MERCHANTx').AsString  := 'ES';
        Query1.execsql;

   except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
   end;

end;

procedure Tfrm_SMC_Fiscal_T37.PausarProcedimentosFiscaisNoCliente;
begin
    if vMesDeReferencia = -1 then
       exit;

    if qGRID.eof then
       exit;

    if (qGRID.FieldByName('AF_USU').AsString <> '') and
       (qGRID.FieldByName('AF_USU').AsString <> Usuario.Codigo) then
    begin
      Avisos.Avisar('Este cliente está sendo atendido por '+
                    qGRID.FieldByName('AF_USU').AsString);
      exit;
    end;

    if rgSistema.itemindex = -1 then
    begin
      Avisos.Avisar('Selecione o Sistema a Pausar Procedimento Fiscal');
      rgSistema.SetFocus;
      exit;
    end;
    Case rgSistema.itemindex of
       0 : PausarSMC;
       1 : PausarSMCPLUS;
       2 : PausarMERCHANT;
       3 : PausarGETRANSPORTE;
       4 : PausarMDE;
    End;
    rgSistema.itemindex := -1;
    AtualizaGrid;
end;

procedure Tfrm_SMC_Fiscal_T37.PausarSMC;
begin
   if qGRID.FieldByName('AF_USA_SMC').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa SMC');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMC').AsInteger = 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMC não iniciado para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMC').AsInteger = 2 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMC já está em espera para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMC').AsInteger = 3 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMC já está fechado para este cliente');
     exit
   end;

   try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF             ');
        Query1.sql.add('   SET AF_STATUS_SMC = :AF_STATUS_SMC, ');
        Query1.sql.add('       AF_STATUS_SMCx= :AF_STATUS_SMCx ');
        Query1.sql.add(' WHERE AF_MES        = :AF_MES         ');
        Query1.sql.add('   AND AF_ANO        = :AF_ANO         ');
        Query1.sql.add('   AND AF_CLIENTE    = :AF_CLIENTE     ');
        Query1.ParamByName('AF_MES'           ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'           ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'       ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_SMC'    ).AsInteger := 2; // Espera
        Query1.ParamByName('AF_STATUS_SMCx'   ).AsString  := 'ES';
        Query1.execsql;

   except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
   end;
end;

procedure Tfrm_SMC_Fiscal_T37.PausarSMCPLUS;
begin
   if qGRID.FieldByName('AF_USA_SMCPLUS').AsString <> 'Sim' then
   begin
     Avisos.Avisar('Este Cliente não usa SMCPLUS');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger = 0 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMCPLUS não iniciado para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger = 2 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMCPLUS já está em espera para este cliente');
     exit
   end;
   if qGRID.FieldByName('AF_STATUS_SMCPLUS').AsInteger = 3 then
   begin
     Avisos.Avisar('Procedimento Fiscal do SMCPLUS já está fechado para este cliente');
     exit
   end;

   try
        Query1.close;
        Query1.sql.clear;
        Query1.sql.add('UPDATE ARQUIVOS_FISCAIS_AF                     ');
        Query1.sql.add('   SET AF_STATUS_SMCPLUS = :AF_STATUS_SMCPLUS, ');
        Query1.sql.add('       AF_STATUS_SMCPLUSx= :AF_STATUS_SMCPLUSx ');
        Query1.sql.add(' WHERE AF_MES            = :AF_MES             ');
        Query1.sql.add('   AND AF_ANO            = :AF_ANO             ');
        Query1.sql.add('   AND AF_CLIENTE        = :AF_CLIENTE         ');
        Query1.ParamByName('AF_MES'            ).AsInteger := vMesDeReferencia;
        Query1.ParamByName('AF_ANO'            ).AsInteger := vAnoDeReferencia;
        Query1.ParamByName('AF_CLIENTE'        ).AsString  := qGRID.FieldByName('AF_CLIENTE').AsString;
        Query1.ParamByName('AF_STATUS_SMCPLUS' ).AsInteger := 2; // Espera
        Query1.ParamByName('AF_STATUS_SMCPLUSx').AsString  := 'ES';
        Query1.execsql;

   except
      on E: Exception do
         Avisos.Avisar('Erro: ' + E.Message );
   end;

end;

procedure Tfrm_SMC_Fiscal_T37.PesquisarCliente;
begin
    frm_consulta_T7 := Tfrm_consulta_T7.Create(nil);
    frm_consulta_T7.rgConsultar.itemindex := 0; //Cliente
    frm_consulta_T7.showmodal;
    edCliente.Text:= vfrm_consulta_T7_Codigo;
    frm_consulta_T7.Free;
    edClienteExit(nil);
end;

procedure Tfrm_SMC_Fiscal_T37.PreparaGrid;
var vMes, vAno:Integer;
begin
    if (edDe.text  = '  /  /  ' ) and
       (edAte.Text = '  /  /  ' ) then
    begin
        if edMes.text = '' then
        begin
           Avisos.Avisar('Informe o Mês de referência');
           edMes.SetFocus;
           exit;
        end;
        if edAno.text = '' then
        begin
           Avisos.Avisar('Informe o Ano de referência');
           edAno.SetFocus;
           exit;
        end;
        try
           vMes := StrToInt(edMes.Text);
           if (vMes < 1) or (vMes > 12 ) then
           begin
              Avisos.Avisar('Mês inválido');
              edMes.SetFocus;
              exit;
           end;
        except
           Avisos.Avisar('Mês inválido');
           edMes.SetFocus;
           exit;
        end;
        try
           vAno := StrToInt(edAno.Text);
           if (vAno < 1) or (vAno > 21) then
           begin
              Avisos.Avisar('Ano inválido');
              edAno.SetFocus;
              exit;
           end;
        except
           Avisos.Avisar('Ano inválido');
           edAno.SetFocus;
           exit;
        end;
        vMesDeReferencia := vMes;
        vAnoDeReferencia := vAno;

        qCLIENTE_CLI.close;
        qCLIENTE_CLI.sql.clear;
        qCLIENTE_CLI.sql.add('SELECT *                          ');
        qCLIENTE_CLI.sql.add('  FROM CLIENTE_CLI,               ');
        qCLIENTE_CLI.sql.add('       CLIENTE_DETALHE_CLID       ');
        qCLIENTE_CLI.sql.add(' WHERE CLID_CODIGO = CLI_CODIGO   ');
        qCLIENTE_CLI.sql.add('   AND (   (CLID_SMC          = 1)');
        qCLIENTE_CLI.sql.add('        OR (CLID_SMCPLUS      = 1)');
        qCLIENTE_CLI.sql.add('        OR (CLID_MERCHANT     = 1)');
        qCLIENTE_CLI.sql.add('        OR (CLID_GETRANSPORTE = 1)');
        qCLIENTE_CLI.sql.add('        OR (CLID_MDE          = 1)');
        qCLIENTE_CLI.sql.add('       )                          ');
        qCLIENTE_CLI.sql.add(' ORDER BY CLI_NOME_FANTASIA       ');
        qCLIENTE_CLI.Open;

        //Executar('TRUNCATE TABLE ARQUIVOS_FISCAIS_AF');

        While not qCLIENTE_CLI.Eof do
        begin
            if not Existe_ArquivoFiscalParaCliente(qCLIENTE_CLI.FieldByName('CLI_CODIGO').AsString,
                                                   vMesDeReferencia, vAnoDeReferencia) then
                   Incluir_ArquivoFiscalParaCliente(qCLIENTE_CLI.FieldByName('CLI_CODIGO').AsString,
                                                   vMesDeReferencia, vAnoDeReferencia);
            qCLIENTE_CLI.Next;
        end;
    end
    else
    begin
        vMesDeReferencia := -1;
        vAnoDeReferencia := -1;
    end;

    AtualizaGrid;
end;

procedure Tfrm_SMC_Fiscal_T37.qGRIDAfterScroll(DataSet: TDataSet);
begin
     edOBS.Text := qGRID.FieldByName('AF_OBS').AsString;
end;

procedure Tfrm_SMC_Fiscal_T37.rgSistemaFiltroClick(Sender: TObject);
begin
     Listar;
end;

procedure Tfrm_SMC_Fiscal_T37.rgStatusClick(Sender: TObject);
begin
     Listar;
end;

end.


