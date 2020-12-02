unit Consultor_Banco_Comissoes_T31;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxLabel, cxMaskEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Mask, Vcl.DBCtrls, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue,

  Classe_Consultor, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  Dados, cxContainer, cxTextEdit, cxDBEdit, cxDBLabel, Vcl.ExtCtrls;

type
  TfrmConsultor_Banco_Comissoes_T31 = class(TForm)
    gpBanco: TGroupBox;
    cxButton21: TcxButton;
    cxButton28: TcxButton;
    edBanco: TEdit;
    edAgencia: TEdit;
    edDigitoAgencia: TEdit;
    edOperacao: TEdit;
    edConta: TEdit;
    edDigitoConta: TEdit;
    lbNomeDaTela: TLabel;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDQuery1CONBC_CODIGO: TStringField;
    FDQuery1CONBC_BANCO: TStringField;
    FDQuery1CONBC_AGENCIA: TStringField;
    FDQuery1CONBC_AGENCIA_DIG: TStringField;
    FDQuery1CONBC_OPERACAO: TStringField;
    FDQuery1CONBC_CONTA: TStringField;
    FDQuery1CONBC_CONTA_DIG: TStringField;
    FDQuery1CONBC_STATUS: TIntegerField;
    FDQuery1CONBC_ESTACAO: TStringField;
    FDQuery1CONBC_USU: TStringField;
    FDQuery1CONBC_DT: TSQLTimeStampField;
    FDQuery1CONBC_HR: TStringField;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    rgStatus: TRadioGroup;
    edComissao: TEdit;
    FDQuery1STATUS: TStringField;
    procedure cxButton28Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton21Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edComissaoKeyPress(Sender: TObject; var Key: Char);
    procedure edComissaoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    function TrataDadosBancarios:Boolean;
    procedure TrataComissão;
    procedure MostraDados;
    procedure LimpaDados;
  public
    { Public declarations }
  end;

var
  frmConsultor_Banco_Comissoes_T31: TfrmConsultor_Banco_Comissoes_T31;
  vPodeFechar,
  vAlterouDadosBancarios : Boolean;
  Consultor_T31: TConsultor;

implementation

{$R *.dfm}

uses Funcoes, ValidadorDeDocumentos, TiposDeDados;

procedure TfrmConsultor_Banco_Comissoes_T31.cxButton21Click(Sender: TObject);
begin
   TrataDadosBancarios;
   TrataComissão;

   if vAlterouDadosBancarios then
   begin
      MostraDados;
      exit;
   end;

   vPodeFechar:=True;
   Close;
end;

function TfrmConsultor_Banco_Comissoes_T31.TrataDadosBancarios:Boolean;
begin
   result := true;
   vAlterouDadosBancarios := false;
   if (edBanco.Text         = '') and
      (edAgencia.Text       = '') and
      (edDigitoAgencia.Text = '') and
      (edOperacao.Text      = '') and
      (edConta.Text         = '') and
      (edDigitoConta.Text   = '') then
      exit;

   result := false;
   if NaoPreencheuCamposObrigatoriosOuImportantes(frmConsultor_Banco_Comissoes_T31) then
         exit;

   Consultor_T31.Detalhes.Banco.Banco          := edBanco.Text;
   Consultor_T31.Detalhes.Banco.Agencia        := edAgencia.Text;
   Consultor_T31.Detalhes.Banco.Agencia_Digito := edDigitoAgencia.Text;
   Consultor_T31.Detalhes.Banco.Operacao       := edOperacao.Text;
   Consultor_T31.Detalhes.Banco.Conta          := edConta.Text;
   Consultor_T31.Detalhes.Banco.Conta_Digito   := edDigitoConta.Text;
   case rgStatus.ItemIndex of
      0 : Consultor_T31.Detalhes.Banco.Status := scAtivo;
      1 : Consultor_T31.Detalhes.Banco.Status := scInativo;
   end;
   Consultor_T31.Detalhes.Comissao             := StrToFloat(MascToStr(edComissao.Text));

   vAlterouDadosBancarios := true;

   if not Consultor_T31.GravarBancoComissao then
     exit;

   LimpaDados;
end;

procedure TfrmConsultor_Banco_Comissoes_T31.TrataComissão;
begin
   Consultor_T31.Detalhes.Comissao := StrToFloat(MascToStr(edComissao.Text));
end;

procedure TfrmConsultor_Banco_Comissoes_T31.cxButton28Click(Sender: TObject);
begin
  vPodeFechar:=True;
  Close;
end;

procedure TfrmConsultor_Banco_Comissoes_T31.DBGrid1DblClick(Sender: TObject);
begin
   edBanco.Text         := FDQuery1CONBC_BANCO.value;
   edAgencia.Text       := FDQuery1CONBC_AGENCIA.value;
   edDigitoAgencia.Text := FDQuery1CONBC_AGENCIA_DIG.value;
   edOperacao.Text      := FDQuery1CONBC_OPERACAO.value;
   edConta.Text         := FDQuery1CONBC_CONTA.value;
   edDigitoConta.Text   := FDQuery1CONBC_CONTA_DIG.value;
   if FDQuery1CONBC_STATUS.value = 1 then
      rgStatus.ItemIndex := 0
   else
      rgStatus.ItemIndex := 1;
   edBanco.SetFocus;
end;

procedure TfrmConsultor_Banco_Comissoes_T31.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    If FDQuery1.FieldByName('CONBC_STATUS').AsInteger = 0 Then
    begin
       DBGrid1.Canvas.Font.Color := clRed;
       //DBGrid1.Canvas.Brush.Color := clRed;
    end
    else
    begin
       DBGrid1.Canvas.Font.Color := clGreen;
       //DBGrid1.Canvas.Brush.Color := clWhite;
    end;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmConsultor_Banco_Comissoes_T31.edComissaoExit(Sender: TObject);
begin
   if not frmValidadorDeDocumentos.percentualValido((Sender as TEdit)) then
   begin
     (Sender as TEdit).SetFocus;
     exit;
   end;
end;

procedure TfrmConsultor_Banco_Comissoes_T31.edComissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := SoValor(Key);
end;

procedure TfrmConsultor_Banco_Comissoes_T31.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //CanClose := vPodeFechar;
end;

procedure TfrmConsultor_Banco_Comissoes_T31.FormCreate(Sender: TObject);
begin
   vPodeFechar := False;
   vAlterouDadosBancarios:=False;
   Consultor_T31 := TConsultor.Create;
end;

procedure TfrmConsultor_Banco_Comissoes_T31.FormShow(Sender: TObject);
begin
   MostraDados;
end;

procedure TfrmConsultor_Banco_Comissoes_T31.LimpaDados;
begin
   edBanco.Text         := '';
   edAgencia.Text       := '';
   edDigitoAgencia.Text := '';
   edOperacao.Text      := '';
   edConta.Text         := '';
   edDigitoConta.Text   := '';
   rgStatus.ItemIndex   := -1;
   DBGrid1.SetFocus;
end;

procedure TfrmConsultor_Banco_Comissoes_T31.MostraDados;
begin
   FDQuery1.Close;
   FDQuery1.sql.clear;
   FDQuery1.sql.add('SELECT CONBC_CODIGO,      ');
   FDQuery1.sql.add('       CONBC_BANCO,       ');
   FDQuery1.sql.add('       CONBC_AGENCIA,     ');
   FDQuery1.sql.add('       CONBC_AGENCIA_DIG, ');
   FDQuery1.sql.add('       CONBC_OPERACAO,    ');
   FDQuery1.sql.add('       CONBC_CONTA,       ');
   FDQuery1.sql.add('       CONBC_CONTA_DIG,   ');
   FDQuery1.sql.add('       CONBC_STATUS,      ');
   FDQuery1.sql.add('       CASE CONBC_STATUS WHEN 1  THEN ''Ativa''   ');
   FDQuery1.sql.add('                         WHEN 0  THEN ''Inativa'' ');
   FDQuery1.sql.add('                                 ELSE ''Inativa'' ');
   FDQuery1.sql.add('       END AS STATUS,                             ');
   FDQuery1.sql.add('       CONBC_ESTACAO,     ');
   FDQuery1.sql.add('       CONBC_USU,         ');
   FDQuery1.sql.add('       CONBC_DT,          ');
   FDQuery1.sql.add('       CONBC_HR           ');
   FDQuery1.sql.add('  FROM CONSULTOR_BANCO_COMISSAO_CONBC');
   FDQuery1.sql.add(' WHERE CONBC_CODIGO = :CONBC_CODIGO  ');
   FDQuery1.sql.add(' ORDER BY CONBC_STATUS DESC,         ');
   FDQuery1.sql.add('          CONBC_BANCO,               ');
   FDQuery1.sql.add('          CONBC_AGENCIA,             ');
   FDQuery1.sql.add('          CONBC_CONTA                ');
   FDQuery1.ParamByName('CONBC_CODIGO').AsString := Consultor_T31.Codigo;
   FDQuery1.Open;
   edComissao.Text := FormatFloat('#,##0.00',Consultor_T31.Detalhes.Comissao);
end;

end.



