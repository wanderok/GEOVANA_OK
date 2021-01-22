unit config_certificado_T33;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinOffice2013White, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.Mask,
  Vcl.DBCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, dxSkinOffice2007Silver,
  dxSkinOffice2013LightGray, Vcl.ExtCtrls, Vcl.Buttons, cxGroupBox, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue,

  ACBrBase, ACBrDFe, ACBrNFe, ACBrDFeSSL, ACBrPosPrinter, ACBrUtil,
  pcnConversao, pcnConversaoNFe, pcnNFe, pcnNFeRTXT,
  blcksock,  System.TypInfo;

type
  Tfrm_config_certificado_T33 = class(TForm)
    cxButton23: TcxButton;
    cxButton25: TcxButton;
    lSSLLib: TLabel;
    lCryptLib: TLabel;
    lHttpLib: TLabel;
    lXmlSign: TLabel;
    Label104: TLabel;
    Label1: TLabel;
    cbSSLLib: TComboBox;
    cbCryptLib: TComboBox;
    cbHttpLib: TComboBox;
    cbXmlSignLib: TComboBox;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie: TEdit;
    cbxSSLType: TComboBox;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    Label4: TLabel;
    cxGroupBox2: TcxGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    cxButton3: TcxButton;
    Label7: TLabel;
    OpenDialog1: TOpenDialog;
    ACBrNFe1: TACBrNFe;
    Label2: TLabel;
    Label3: TLabel;
    Panel17: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton23Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cbSSLLibChange(Sender: TObject);
    procedure cbCryptLibChange(Sender: TObject);
    procedure cbHttpLibChange(Sender: TObject);
    procedure cbXmlSignLibChange(Sender: TObject);
    procedure cxButton25Click(Sender: TObject);
  private
    { Private declarations }
    procedure Preenche_itens_dos_CheckBoxes;
    procedure MostraDados_CONFIG_NOTAS;
    function DadosCorretos:Boolean;
    procedure MostraDados_NFe_Configuracao;
    procedure AtualizarSSLLibsCombo;
  public
    { Public declarations }
  end;

var
  frm_config_certificado_T33: Tfrm_config_certificado_T33;

implementation

{$R *.dfm}

uses DadosSMC, FuncoesSMC;

procedure Tfrm_config_certificado_T33.AtualizarSSLLibsCombo;
begin
  cbSSLLib.ItemIndex     := Integer(ACBrNFe1.Configuracoes.Geral.SSLLib);
  cbCryptLib.ItemIndex   := Integer(ACBrNFe1.Configuracoes.Geral.SSLCryptLib);
  cbHttpLib.ItemIndex    := Integer(ACBrNFe1.Configuracoes.Geral.SSLHttpLib);
  cbXmlSignLib.ItemIndex := Integer(ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib);
  cbxSSLType.Enabled     := (ACBrNFe1.Configuracoes.Geral.SSLHttpLib in [httpWinHttp, httpOpenSSL]);
end;

procedure Tfrm_config_certificado_T33.cbCryptLibChange(Sender: TObject);
begin
  try
    if cbCryptLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(cbCryptLib.ItemIndex);
  finally
    AtualizarSSLLibsCombo;
  end;
end;

procedure Tfrm_config_certificado_T33.cbHttpLibChange(Sender: TObject);
begin
  try
    if cbHttpLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(cbHttpLib.ItemIndex);
  finally
    AtualizarSSLLibsCombo;
  end;
end;

procedure Tfrm_config_certificado_T33.cbSSLLibChange(Sender: TObject);
begin
   try
    if cbSSLLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLLib := TSSLLib(cbSSLLib.ItemIndex);
  finally
    AtualizarSSLLibsCombo;
  end;
end;

procedure Tfrm_config_certificado_T33.cbXmlSignLibChange(Sender: TObject);
begin
  try
    if cbXmlSignLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);
  finally
    AtualizarSSLLibsCombo;
  end;
end;

procedure Tfrm_config_certificado_T33.cxButton1Click(Sender: TObject);
begin
   //{$IFNDEF ACBrNFeOpenSSL}
       edtNumSerie.Text := ACBrNFe1.SSL.SelecionarCertificado;
   //{$ENDIF}

   //{$IFNDEF ACBrNFeOpenSSL}
   // edtNumSerie.Text := ACBrNFe1.SSL.SelecionarCertificado;
   //{$ENDIF}
   label3.Caption := FormatDateBr(ACBrNFe1.SSL.CertDataVenc)
end;

procedure Tfrm_config_certificado_T33.cxButton23Click(Sender: TObject);
var vNFeC_SERIE : Integer;
begin
  {if not UsuarioMASTER then
  begin
    AcessoExclusivoMaster;
    exit;
  end; }

   if not DadosCorretos then
      exit;

  // Gravar as Configuracoes do Certificado Digital
  DM.Query1.Close;
  DM.Query1.SQL.Clear;
  DM.Query1.SQL.Add('UPDATE config_notas                                         ');
  DM.Query1.SQL.Add('   SET NUMERO_SERIE_CERTIFICADO = :NUMERO_SERIE_CERTIFICADO,');
  DM.Query1.SQL.Add('       SENHA_CERTIFICADO        = :SENHA_CERTIFICADO,       ');
  DM.Query1.SQL.add('       CryptLib                 = :CryptLib,                ');
  DM.Query1.SQL.add('       HttpLib                  = :HttpLib,                 ');
  DM.Query1.SQL.add('       SSLLib                   = :SSLLib,                  ');
  DM.Query1.SQL.add('       SSLType                  = :SSLType,                 ');
  DM.Query1.SQL.add('       XmlSignLib               = :XmlSignLib,              ');
  DM.Query1.SQL.add('       ArquivoPFX               = :ArquivoPFX               ');
  DM.Query1.ParamByName('NUMERO_SERIE_CERTIFICADO').AsString  := edtNumSerie.Text;
  DM.Query1.ParamByName('SENHA_CERTIFICADO'       ).AsString  := edtSenha.Text;
  DM.Query1.ParamByName('CryptLib'                ).AsInteger := cbCryptLib.ItemIndex;
  DM.Query1.ParamByName('HttpLib'                 ).AsInteger := cbHttpLib.ItemIndex;
  DM.Query1.ParamByName('SSLLib'                  ).AsInteger := cbSSLLib.ItemIndex;
  DM.Query1.ParamByName('SSLType'                 ).AsInteger := cbxSSLType.ItemIndex;
  DM.Query1.ParamByName('XmlSignLib'              ).AsInteger := cbXmlSignLib.ItemIndex;
  DM.Query1.ParamByName('ArquivoPFX'              ).AsString  := edtCaminho.text;
  DM.Query1.ExecSql;

  ComparaDadosDaTela('Config Certificado Digital',frm_config_certificado_T33);

  Avisos.Avisar('Configuração atualizada!');
  Close;
end;

procedure Tfrm_config_certificado_T33.cxButton25Click(Sender: TObject);
begin
   close;
end;

procedure Tfrm_config_certificado_T33.cxButton2Click(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Certificado';
  OpenDialog1.DefaultExt := '*.pfx';
  OpenDialog1.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog1.Execute then
    edtCaminho.Text := OpenDialog1.FileName;
end;

function Tfrm_config_certificado_T33.DadosCorretos: Boolean;
var vNumero : Integer;
begin
   // retorna true se os dados a serem gravados estão corretos
   // retorna false se não estão
   //---------------------------------------------------------------------------
   result := false;

   if NaoPreencheuCamposObrigatoriosOuImportantes(frm_config_certificado_T33) then
      exit;

   {
   try
      vNumero := StrToInt(edt_NFeC_nNF.Text);
      if vNumero < 1 then
      begin
         Avisos.Avisar('Número da última NFe emitida inválido! '+#13+#13+
                     'Consulte seu contador e Use um valor inteiro.');
         edt_NFeC_nNF.SetFocus;
         exit;
      end;
      if vNumero < fUltimaNFe(edt_NFeC_SERIE.Text) then
      begin
         Avisos.Avisar('Já existe NFe emitida com este valor nesta série. '+#13+#13+
                     'Consulte seu contador e Use um valor correto.');
         edt_NFeC_nNF.SetFocus;
         exit;
      end;
   except
     Avisos.Avisar('Número da última NFe inválido. '+#13+#13+
                 'Consulte seu contador e Use um valor numérico.');
     edt_NFeC_nNF.SetFocus;
     exit;
   end;

   // O número da NFe nesta série não pode ser inferior
   // ao da última NFe emitida
   }

   // Se chegou até aqui, todas as críticas foram atendidas.
   result := true;
end;

procedure Tfrm_config_certificado_T33.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
  self := nil;
end;

procedure Tfrm_config_certificado_T33.FormShow(Sender: TObject);
var vNFeC_SERIE : integer;
begin
  // Preenche itens dos CheckBoxes
  Preenche_itens_dos_CheckBoxes;
  // Recuperar Configuracao de NFe
  DM.Query1.Close;
  DM.Query1.Sql.Clear;
  DM.Query1.Sql.Add('SELECT * fROM NFe_Configuracao');
  DM.Query1.Open;
  MostraDados_NFe_Configuracao;

  // Recuperar Configuracao de Certificado
  DM.Query1.Close;
  DM.Query1.Sql.Clear;
  DM.Query1.Sql.Add('SELECT * fROM CONFIG_NOTAS');
  DM.Query1.Open;

  MostraDados_CONFIG_NOTAS;

  // Salva estes dados para serem comparados ao serem gravados
  // a fim de registrar no log de eventos todas as alerações feitas pelo usuário
  SalvaDadosDaTela(frm_config_certificado_T33);
end;

procedure Tfrm_config_certificado_T33.MostraDados_CONFIG_NOTAS;
begin
  edtNumSerie.Text              := DM.Query1.FieldByName('NUMERO_SERIE_CERTIFICADO').AsString;
  edtSenha.Text                 := DM.Query1.FieldByName('SENHA_CERTIFICADO'       ).AsString;
  edtCaminho.text               := DM.Query1.FieldByName('ArquivoPFX'              ).AsString;

  cbCryptLib.ItemIndex          := DM.Query1.FieldByName('CryptLib'                ).AsInteger;
  cbHttpLib.ItemIndex           := DM.Query1.FieldByName('HttpLib'                 ).AsInteger;
  cbSSLLib.ItemIndex            := DM.Query1.FieldByName('SSLLib'                  ).AsInteger;
  cbxSSLType.ItemIndex          := DM.Query1.FieldByName('SSLType'                 ).AsInteger;
  cbXmlSignLib.ItemIndex        := DM.Query1.FieldByName('XmlSignLib'              ).AsInteger;

end;

procedure Tfrm_config_certificado_T33.MostraDados_NFe_Configuracao;
begin
  exit;
end;

procedure Tfrm_config_certificado_T33.Preenche_itens_dos_CheckBoxes;
var
  w : Integer;
  T: TSSLLib;
  I: TpcnTipoEmissao;
  J: TpcnModeloDF;
  K: TpcnVersaoDF;
  U: TSSLCryptLib;
  V: TSSLHttpLib;
  X: TSSLXmlSignLib;
  Y: TSSLType;
  N: TACBrPosPrinterModelo;
  O: TACBrPosPaginaCodigo;
  l: Integer;

begin
  cbSSLLib.Items.Clear;
  for T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(T) ) );
  cbSSLLib.ItemIndex := 0;

  cbCryptLib.Items.Clear;
  for U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), integer(U) ) );
  cbCryptLib.ItemIndex := 0;

  cbHttpLib.Items.Clear;
  for V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), integer(V) ) );
  cbHttpLib.ItemIndex := 0;

  cbXmlSignLib.Items.Clear;
  for X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(X) ) );
  cbXmlSignLib.ItemIndex := 0;

  cbxSSLType.Items.Clear;
  for Y := Low(TSSLType) to High(TSSLType) do
     cbxSSLType.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(Y) ) );
  cbxSSLType.ItemIndex := 0;
end;



end.
