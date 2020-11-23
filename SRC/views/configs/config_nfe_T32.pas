//Verificado automaticamente em 16/06/2020 09:27
{$I ACBr.inc}
unit config_nfe_T32;
{

================================================================================
| ITEM|DATA  HR|UNIT                |HISTORICO                                 |
|-----|--------|--------------------|------------------------------------------|
|  179|23/05/20|wander              |Aplicados os botões de Controle padrão    |
|     |   20:12|config_nfe          |                                          |
================================================================================

OBS: Outras alterações foram feitas por Wander mas não documentadas aqui.

}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinOffice2013White, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.Menus, cxDBEdit, Vcl.StdCtrls,
  cxButtons, Vcl.Mask, Vcl.DBCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckBox, cxPC, cxGroupBox, dxSkinOffice2007Silver,
  dxSkinOffice2013LightGray, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, Vcl.ExtCtrls,
  ACBrBase, ACBrDFe, ACBrNFe, ACBrDFeSSL, ACBrPosPrinter, ACBrUtil,
  pcnConversao, pcnConversaoNFe, pcnNFe, pcnNFeRTXT,
  blcksock,  System.TypInfo,
  Vcl.Buttons, FileCtrl;

type
  TfrmConfig_NFe_T32 = class(TForm)
    Label4: TLabel;
    grp_geral: TGroupBox;
    GroupBox1: TGroupBox;
    edtNFeC_PastaNotas: TEdit;
    btn_buscar_xml: TcxButton;
    GroupBox2: TGroupBox;
    cxComboBox1: TcxComboBox;
    grp_sequencia_nfce: TGroupBox;
    lbl1: TLabel;
    Label8: TLabel;
    edt_NFeC_nNF: TEdit;
    cxGroupBox2: TcxGroupBox;
    GroupBox3: TGroupBox;
    edt_NFeC_PathLogoMarca: TEdit;
    cxButton1: TcxButton;
    GroupBox5: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    edt_NFeC_SERIE: TEdit;
    rgNFeC_VerMsgWS: TRadioGroup;
    rgNFeC_LayoutDanfe: TRadioGroup;
    lSSLLib: TLabel;
    cbSSLLib: TComboBox;
    lCryptLib: TLabel;
    cbCryptLib: TComboBox;
    lHttpLib: TLabel;
    cbHttpLib: TComboBox;
    lXmlSign: TLabel;
    cbXmlSignLib: TComboBox;
    Label22: TLabel;
    cbxModeloPosPrinter: TComboBox;
    Label102: TLabel;
    Label104: TLabel;
    edtCaminho: TEdit;
    Label105: TLabel;
    edtSenha: TEdit;
    cbxPagCodigo: TComboBox;
    sbtnGetCert: TSpeedButton;
    ACBrNFe1: TACBrNFe;
    edtNumSerie: TEdit;
    Label25: TLabel;
    cxButton2: TcxButton;
    OpenDialog1: TOpenDialog;
    cbFormaEmissao: TComboBox;
    Label29: TLabel;
    cxButton3: TcxButton;
    Image1: TImage;
    rgNFeC_Ambiente: TRadioGroup;
    Label1: TLabel;
    cbxSSLType: TComboBox;
    rgNFe_MostraPreview: TRadioGroup;
    pnControles: TPanel;
    bControleCancelar: TcxButton;
    cxButton4: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btn_buscar_xmlClick(Sender: TObject);
    procedure edt_NFeC_PathLogoMarcaChange(Sender: TObject);
    procedure bControleGravarClick(Sender: TObject);
    procedure bControleCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure MostraDados_NFe_Configuracao;
    procedure MostraDados_CONFIG_NOTAS;

    function DadosCorretos:Boolean;
    procedure Registra_Logs;
    procedure Preenche_itens_dos_CheckBoxes;
    procedure MostraLogo(pArquivoImagem:String);
  public
    { Public declarations }
  end;

const
  SELDIRHELP = 1000;

var
  frmConfig_NFe_T32: TfrmConfig_NFe_T32;

implementation

{$R *.dfm}

uses funcoes, Dados;

procedure TfrmConfig_NFe_T32.bControleCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmConfig_NFe_T32.bControleGravarClick(Sender: TObject);
var vNFeC_SERIE : Integer;
begin
  if not UsuarioMASTER then
  begin
    AcessoExclusivoMaster;
    exit;
  end;

   if not DadosCorretos then
      exit;

  // Gravar as Configuracoes de emissão de NFe
  DM.Query1.Close;
  DM.Query1.Sql.Clear;
  DM.Query1.Sql.Add('UPDATE NFe_Configuracao                        ');
  DM.Query1.Sql.Add('   SET NFeC_SERIE        = :NFeC_SERIE,        ');
  DM.Query1.Sql.Add('       NFeC_nNF          = :NFeC_nNF,          ');
  DM.Query1.Sql.Add('       NFeC_FormaEmissao = :NFeC_FormaEmissao, ');
  DM.Query1.SQL.add('       NFe_MostraPreview = :NFe_MostraPreview, ');
  DM.Query1.Sql.Add('       NFeC_Ambiente     = :NFeC_Ambiente,     ');
  DM.Query1.Sql.Add('       NFeC_VerMsgWS     = :NFeC_VerMsgWS,     ');
  DM.Query1.Sql.Add('       NFeC_LayoutDanfe  = :NFeC_LayoutDanfe,  ');
  DM.Query1.Sql.Add('       NFeC_PathLogoMarca= :NFeC_PathLogoMarca,');
  DM.Query1.Sql.Add('       NFeC_PastaNotas   = :NFeC_PastaNotas    ');
  DM.Query1.ParamByName('NFeC_SERIE'        ).AsInteger := StrToInt(edt_NFeC_SERIE.Text);
  DM.Query1.ParamByName('NFeC_nNF'          ).AsInteger := StrToInt(edt_NFeC_nNF.Text);
  DM.Query1.ParamByName('NFeC_FormaEmissao' ).AsInteger := cbFormaEmissao.ItemIndex;
  DM.Query1.ParamByName('NFe_MostraPreview' ).AsInteger := rgNFe_MostraPreview.ItemIndex;
  DM.Query1.ParamByName('NFeC_Ambiente'     ).AsInteger := rgNFeC_Ambiente.ItemIndex;
  DM.Query1.ParamByName('NFeC_VerMsgWS'     ).AsInteger := rgNFeC_VerMsgWS.ItemIndex;
  DM.Query1.ParamByName('NFeC_LayoutDanfe'  ).AsInteger := rgNFeC_LayoutDanfe.ItemIndex;
  DM.Query1.ParamByName('NFeC_PathLogoMarca').AsString  := edt_NFeC_PathLogoMarca.Text;
  DM.Query1.ParamByName('NFeC_PastaNotas'   ).AsString  := edtNFeC_PastaNotas.Text;
  DM.Query1.ExecSql;

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
  DM.Query1.SQL.add('       ArquivoPFX               = :ArquivoPFX,              ');
  DM.Query1.SQL.add('       ModeloPosPrinter         = :ModeloPosPrinter,        ');
  DM.Query1.SQL.add('       PaginaDeCodigo           = :PaginaDeCodigo          ');
  DM.Query1.ParamByName('NUMERO_SERIE_CERTIFICADO').AsString  := edtNumSerie.Text;
  DM.Query1.ParamByName('SENHA_CERTIFICADO'       ).AsString  := edtSenha.Text;
  DM.Query1.ParamByName('CryptLib'                ).AsInteger := cbCryptLib.ItemIndex;
  DM.Query1.ParamByName('HttpLib'                 ).AsInteger := cbHttpLib.ItemIndex;
  DM.Query1.ParamByName('SSLLib'                  ).AsInteger := cbSSLLib.ItemIndex;
  DM.Query1.ParamByName('SSLType'                 ).AsInteger := cbxSSLType.ItemIndex;
  DM.Query1.ParamByName('XmlSignLib'              ).AsInteger := cbXmlSignLib.ItemIndex;
  DM.Query1.ParamByName('ArquivoPFX'              ).AsString  := edtCaminho.text;
  DM.Query1.ParamByName('ModeloPosPrinter'        ).AsInteger := cbxModeloPosPrinter.ItemIndex;
  DM.Query1.ParamByName('PaginaDeCodigo'          ).AsInteger := cbxPagCodigo.ItemIndex;
  DM.Query1.ExecSql;


  ComparaDadosDaTela('Configuracao da NFe',Frmconfig_NFe_T32);

  ShowMessage('A configuração foi atualizada.');
  Close;
end;

procedure TfrmConfig_NFe_T32.Registra_Logs;
begin

end;

procedure TfrmConfig_NFe_T32.sbtnGetCertClick(Sender: TObject);
begin
   {$IFNDEF ACBrNFeOpenSSL}
       edtNumSerie.Text := ACBrNFe1.SSL.SelecionarCertificado;
   {$ENDIF}

   {$IFNDEF ACBrNFeOpenSSL}
    edtNumSerie.Text := ACBrNFe1.SSL.SelecionarCertificado;
   {$ENDIF}
end;

procedure TfrmConfig_NFe_T32.btn_buscar_xmlClick(Sender: TObject);
var
  Dir: string;
begin
  if Length(edtNFeC_PastaNotas.Text) <= 0 then
     Dir := ExtractFileDir(application.ExeName)
  else
     Dir := edtNFeC_PastaNotas.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
    edtNFeC_PastaNotas.Text := Dir;
end;

procedure TfrmConfig_NFe_T32.cxButton1Click(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Logo';
  OpenDialog1.DefaultExt := '*.bmp';
  OpenDialog1.Filter := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog1.Execute then
  begin
    edt_NFeC_PathLogoMarca.Text := OpenDialog1.FileName;
  end;

end;

procedure TfrmConfig_NFe_T32.cxButton2Click(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Certificado';
  OpenDialog1.DefaultExt := '*.pfx';
  OpenDialog1.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog1.Execute then
    edtCaminho.Text := OpenDialog1.FileName;
end;

procedure TfrmConfig_NFe_T32.cxButton3Click(Sender: TObject);
var vNFeC_SERIE, vNFe_SEQUENCIA: Integer;
begin
  if not UsuarioMASTER then
  begin
     AcessoExclusivoMaster;
     exit;
  end;

   try
      vNFeC_SERIE := StrToInt(edt_NFeC_SERIE.Text);
      if vNFeC_SERIE < 0 then
      begin
        ShowMessage('Série inválida');
        edt_NFeC_SERIE.SetFocus;
        exit;
      end;
   except
      ShowMessage('Série inválida');
      edt_NFeC_SERIE.SetFocus;
      exit;
   end;

   try
      vNFe_SEQUENCIA := StrToInt(edt_NFeC_nNF.Text);
      if vNFe_SEQUENCIA < 0 then
      begin
        ShowMessage('Sequencia inválida');
        edt_NFeC_nNF.SetFocus;
        exit;
      end;
   except
      ShowMessage('Sequencia inválida');
      edt_NFeC_nNF.SetFocus;
      exit;
   end;

   // Verificar se existe NFe emitida nesta série
   // com número superior ao que está sendo definido....
   DM.Query1.Close;
   DM.Query1.Sql.Clear;
   DM.Query1.SQL.Add('SELECT 1 from NOTAFISCAL55_NFE55     ');
   DM.Query1.SQL.Add('  WHERE NFE55_NUMERO > :NFE55_NUMERO ');
   DM.Query1.SQL.Add('    AND NFE55_SERIE  = :NFE55_SERIE  ');
   DM.Query1.ParamByName('NFE55_SERIE' ).AsInteger := vNFeC_SERIE;
   DM.Query1.ParamByName('NFE55_NUMERO').AsInteger := vNFe_SEQUENCIA;
   DM.Query1.Open;
   if not DM.Query1.eof then
   begin
     ShowMessage('Existe NFe emitida com número superior a este.');
     edt_NFeC_SERIE.SetFocus;
     exit;
   end;

  // ### rever ###
  // Definir o último número de NFe emitida
  // Perigo!!!! Se estiverem emitindo NFe neste momento,
  // Pode afetar a sequencia....
  //----------------------------------------------------
    DM.Query1.Close;
    DM.Query1.Sql.Clear;
    DM.Query1.SQL.Add('SELECT SNFe_SEQUENCIA         ');
    DM.Query1.SQL.Add('  FROM SERIENFe_SNFe          ');
    DM.Query1.SQL.Add('  WHERE SNFe_CODIGO = :CODIGO ');
    DM.Query1.ParamByName('CODIGO').AsInteger :=  vNFeC_SERIE;
    DM.Query1.Open;
    if DM.Query1.eof then
    begin
       // Não consta registro de sequencia de NFe para
       // esta série...
       // Criar um registro com "última nota"   = 0
       //                       (SNF_SEQUENCIA  = 0)
       DM.Query1.Close;
       DM.Query1.Sql.Clear;
       DM.Query1.SQL.Add('INSERT INTO SERIENFe_SNFe');
       DM.Query1.SQL.Add('     ( SNFe_SEQUENCIA,   ');
       DM.Query1.SQL.Add('       SNFe_CODIGO)      ');
       DM.Query1.SQL.Add('vALUES                   ');
       DM.Query1.SQL.Add('     (:SNFe_SEQUENCIA,   ');
       DM.Query1.SQL.Add('      :SNFe_CODIGO)      ');
       DM.Query1.ParamByName('SNFe_CODIGO'   ).AsInteger := vNFeC_SERIE;
       DM.Query1.ParamByName('SNFe_SEQUENCIA').AsInteger := vNFe_SEQUENCIA;
       DM.Query1.ExecSql;
       ShowMessage('Série criada!');
    end
    else
    begin
       // Atualizar a sequencia de NFe desta série
       DM.Query1.Close;
       DM.Query1.Sql.Clear;
       DM.Query1.SQL.Add('UPDATE SERIENFe_SNFe                   ');
       DM.Query1.SQL.Add('   SET SNFe_SEQUENCIA = :SNFe_SEQUENCIA');
       DM.Query1.SQL.Add(' WHERE SNFe_CODIGO    = :SNFe_CODIGO   ');
       DM.Query1.ParamByName('SNFe_CODIGO'   ).AsInteger := vNFeC_SERIE;
       DM.Query1.ParamByName('SNFe_SEQUENCIA').AsInteger := vNFe_SEQUENCIA;
       DM.Query1.ExecSql;
       ShowMessage('Sequência da série atualizada!');
    end;

end;

function TfrmConfig_NFe_T32.DadosCorretos:Boolean;
var vNumero : Integer;
begin
   // retorna true se os dados a serem gravados estão corretos
   // retorna false se não estão
   //---------------------------------------------------------------------------
   result := false;

   // A Série da NFe é uma informação obrigatória
   //--------------------------------------------
   if edt_NFeC_SERIE.Text = '' then
   begin
     ShowMessage('Informe a Série da NFe');
     edt_NFeC_SERIE.SetFocus;
     exit;
   end;

   // A Série da NFe deve ser numérico entre 1 e 800
   //-----------------------------------------------
   try
     vNumero := StrToInt(edt_NFeC_SERIE.Text);
     if (vNumero < 001) or
        (vNumero > 800)then
     begin
        ShowMessage('Série inválida. '+#13+#13+
                    'Consulte seu contador e use um valor entre 1 e 800');
        edt_NFeC_SERIE.SetFocus;
        exit;
     end;
   except
     ShowMessage('Série inválida. '+#13+#13+
                 'Consulte seu contador e Use um valor numérico.');
     edt_NFeC_SERIE.SetFocus;
     exit;
   end;

   {
   try
      vNumero := StrToInt(edt_NFeC_nNF.Text);
      if vNumero < 1 then
      begin
         ShowMessage('Número da última NFe emitida inválido! '+#13+#13+
                     'Consulte seu contador e Use um valor inteiro.');
         edt_NFeC_nNF.SetFocus;
         exit;
      end;
      if vNumero < fUltimaNFe(edt_NFeC_SERIE.Text) then
      begin
         ShowMessage('Já existe NFe emitida com este valor nesta série. '+#13+#13+
                     'Consulte seu contador e Use um valor correto.');
         edt_NFeC_nNF.SetFocus;
         exit;
      end;
   except
     ShowMessage('Número da última NFe inválido. '+#13+#13+
                 'Consulte seu contador e Use um valor numérico.');
     edt_NFeC_nNF.SetFocus;
     exit;
   end;

   // O número da NFe nesta série não pode ser inferior
   // ao da última NFe emitida
   }

   // Obrigatório: Forma de emissão
   if cbFormaEmissao.ItemIndex = -1 then
   begin
     ShowMessage('Defina a Forma de Emissão da NFe.');
     cbFormaEmissao.SetFocus;
     exit;
   end;

   // Obrigatório: Ambiente de emissão da NFe
   if rgNFeC_Ambiente.ItemIndex = -1 then
   begin
     ShowMessage('Defina o Ambiente de Emissão da NFe.');
     rgNFeC_Ambiente.SetFocus;
     exit;
   end;

   // Obrigatório: Definir se deseja ou não ver as mensagens do Web Service
   if rgNFeC_VerMsgWS.ItemIndex = -1 then
   begin
     ShowMessage('Defina se deseja ou não visualizar mensagens do WebService.');
     rgNFeC_VerMsgWS.SetFocus;
     exit;
   end;

   // Obrigatório: Definir o layou do Danfe
   if rgNFeC_LayoutDanfe.ItemIndex = -1 then
   begin
     ShowMessage('Defina o layou de impressão do DANFE da NFe.');
     rgNFeC_LayoutDanfe.SetFocus;
     exit;
   end;

   // Se chegou até aqui, todas as críticas foram atendidas.
   result := true;
end;

procedure TfrmConfig_NFe_T32.edt_NFeC_PathLogoMarcaChange(Sender: TObject);
begin
   MostraLogo(edt_NFeC_PathLogoMarca.Text);
end;

procedure TfrmConfig_NFe_T32.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
  self := nil;
end;

procedure TfrmConfig_NFe_T32.FormShow(Sender: TObject);
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

  if edt_NFeC_SERIE.Text <> '' then
  begin
     try
        vNFeC_SERIE := StrToInt(edt_NFeC_SERIE.Text);

        edt_NFeC_nNF.Text := '';
        if edt_NFeC_SERIE.Text <> '' then
        begin
            DM.Query1.Close;
            DM.Query1.Sql.Clear;
            DM.Query1.SQL.Add('SELECT SNFe_SEQUENCIA             ');
            DM.Query1.SQL.Add('  FROM SERIENFe_SNFe              ');
            DM.Query1.SQL.Add(' WHERE SNFe_CODIGO = :SNFe_CODIGO ');
            DM.Query1.ParamByName('SNFe_CODIGO'   ).AsInteger := vNFeC_SERIE;
            DM.Query1.Open;
            if not DM.Query1.Eof then
               edt_NFeC_nNF.Text := DM.Query1.FieldByName('SNFe_SEQUENCIA').AsString;
        end;
    except
    end;
  end;

  // Salva estes dados para serem comparados ao serem gravados
  // a fim de registrar no log de eventos todas as alerações feitas pelo usuário
  SalvaDadosDaTela(Frmconfig_NFe_T32);
end;

procedure TfrmConfig_NFe_T32.MostraDados_NFe_Configuracao;
begin
  // Preenche a tela com os dados recuperados do banco de dados
  //----------------------------------------------------------------------------
  Image1.Visible := false;
  edt_NFeC_SERIE.Text           := FormatFloat('000'     ,DM.Query1.FieldByName('NFeC_SERIE').AsInteger);
  edt_NFeC_nNF.Text             := FormatFloat('00000000',DM.Query1.FieldByName('NFeC_nNF'  ).AsInteger);
  cbFormaEmissao.ItemIndex      := DM.Query1.FieldByName('NFeC_FormaEmissao' ).AsInteger;
  rgNFe_MostraPreview.ItemIndex := DM.Query1.FieldByName('NFeC_MostraPreview').AsInteger;
  rgNFeC_Ambiente.ItemIndex     := DM.Query1.FieldByName('NFeC_Ambiente'     ).AsInteger;
  rgNFeC_LayoutDanfe.ItemIndex  := DM.Query1.FieldByName('NFeC_LayoutDanfe'  ).AsInteger;
  edt_NFeC_PathLogoMarca.Text   := DM.Query1.FieldByName('NFeC_PathLogoMarca').AsString;
  edtNFeC_PastaNotas.Text       := DM.Query1.FieldByName('NFeC_PastaNotas'   ).AsString;
end;

procedure TfrmConfig_NFe_T32.MostraLogo(pArquivoImagem: String);
begin
  if pArquivoImagem <> '' then
  begin
     Image1.Picture.LoadFromFile(pArquivoImagem);
     Image1.Visible := True;
  end;
end;

procedure TfrmConfig_NFe_T32.MostraDados_CONFIG_NOTAS;
begin
  // Preencher dados de configuracao de Certificado
  edtNumSerie.Text              := DM.Query1.FieldByName('NUMERO_SERIE_CERTIFICADO').AsString;
  edtSenha.Text                 := DM.Query1.FieldByName('SENHA_CERTIFICADO'       ).AsString;
  cbCryptLib.ItemIndex          := DM.Query1.FieldByName('CryptLib'                ).AsInteger;
  cbHttpLib.ItemIndex           := DM.Query1.FieldByName('HttpLib'                 ).AsInteger;
  cbSSLLib.ItemIndex            := DM.Query1.FieldByName('SSLLib'                  ).AsInteger;
  cbxSSLType.ItemIndex          := DM.Query1.FieldByName('SSLType'                 ).AsInteger;
  cbXmlSignLib.ItemIndex        := DM.Query1.FieldByName('XmlSignLib'              ).AsInteger;
  edtCaminho.text               := DM.Query1.FieldByName('ArquivoPFX'              ).AsString;
  cbxModeloPosPrinter.ItemIndex := DM.Query1.FieldByName('ModeloPosPrinter'        ).AsInteger;
  cbxPagCodigo.ItemIndex        := DM.Query1.FieldByName('PaginaDeCodigo'          ).AsInteger;
end;

procedure TfrmConfig_NFe_T32.Preenche_itens_dos_CheckBoxes;
VAR w : Integer;
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

  cbxModeloPosPrinter.Items.Clear ;
  for N := Low(TACBrPosPrinterModelo) to High(TACBrPosPrinterModelo) do
    cbxModeloPosPrinter.Items.Add( GetEnumName(TypeInfo(TACBrPosPrinterModelo), integer(N) ) ) ;

  cbxPagCodigo.Items.Clear ;
  for O := Low(TACBrPosPaginaCodigo) to High(TACBrPosPaginaCodigo) do
     cbxPagCodigo.Items.Add( GetEnumName(TypeInfo(TACBrPosPaginaCodigo), integer(O) ) ) ;

  cbFormaEmissao.Items.Clear;
  for I := Low(TpcnTipoEmissao) to High(TpcnTipoEmissao) do
     cbFormaEmissao.Items.Add( GetEnumName(TypeInfo(TpcnTipoEmissao), integer(I) ) );
  cbFormaEmissao.ItemIndex := 0;

  cbxSSLType.Items.Clear;
  for Y := Low(TSSLType) to High(TSSLType) do
     cbxSSLType.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(Y) ) );
  cbxSSLType.ItemIndex := 0;

end;

end.

