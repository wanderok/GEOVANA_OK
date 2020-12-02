unit config_nfce_T34;

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
  dxSkinXmas2008Blue, Vcl.ExtCtrls, ACBrBase, ACBrDFe, ACBrNFe,
  ACBrDFeSSL, ACBrPosPrinter, ACBrUtil,
  pcnConversao, pcnConversaoNFe, pcnNFe, pcnNFeRTXT,
  ACBrEnterTab,
  Vcl.FileCtrl,
  System.TypInfo;

type
  TFrm_config_nfce_T34 = class(TForm)
    Label4: TLabel;
    cxGroupBox2: TcxGroupBox;
    grp_csc: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    edCSC_ID: TEdit;
    edCSC: TEdit;
    lbNomeDaTela: TLabel;
    GroupBox7: TGroupBox;
    rgNFeC_Ambiente: TRadioGroup;
    GroupBox6: TGroupBox;
    cbFormaEmissao: TComboBox;
    GroupBox8: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edt_NFeC_SERIE: TEdit;
    edt_NFeC_nNF: TEdit;
    cxButton3: TcxButton;
    GroupBox4: TGroupBox;
    rgNFeC_VerMsgWS: TRadioGroup;
    GroupBox9: TGroupBox;
    rgNFeC_LayoutDanfe: TRadioGroup;
    GroupBox5: TGroupBox;
    Label22: TLabel;
    Label102: TLabel;
    cxComboBox1: TcxComboBox;
    cbxModeloPosPrinter: TComboBox;
    rgNFeC_MostraPreview: TRadioGroup;
    cbxPagCodigo: TComboBox;
    GroupBox10: TGroupBox;
    edtNFeC_PastaNotas: TEdit;
    cxButton2: TcxButton;
    GroupBox11: TGroupBox;
    edt_NFeC_PathLogoMarca: TEdit;
    cxButton4: TcxButton;
    pnControles: TPanel;
    bControleCancelar: TcxButton;
    bControleGravar: TcxButton;
    Image1: TImage;
    ACBrNFe1: TACBrNFe;
    ACBrEnterTab1: TACBrEnterTab;
    OpenDialog1: TOpenDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bControleGravarClick(Sender: TObject);
    procedure bControleCancelarClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
    procedure MostraDados_NFCe_Configuracao;
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
  Frm_config_nfce_T34: TFrm_config_nfce_T34;

implementation

{$R *.dfm}

uses funcoes, Dados, Classe_Avisos;

procedure TFrm_config_nfce_T34.bControleCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TFrm_config_nfce_T34.bControleGravarClick(Sender: TObject);
var vNFeC_SERIE : Integer;
begin
  {if not UsuarioMASTER then
  begin
    AcessoExclusivoMaster;
    exit;
  end; }

   if not DadosCorretos then
      exit;

  // Gravar as Configuracoes de emissão de NFe
  DM.Query1.Close;
  DM.Query1.Sql.Clear;
  DM.Query1.Sql.Add('UPDATE NFCe_Configuracao                         ');
  DM.Query1.Sql.Add('   SET NFCeC_SERIE        = :NFCeC_SERIE,        ');
  DM.Query1.Sql.Add('       NFCeC_nNF          = :NFCeC_nNF,          ');
  DM.Query1.Sql.Add('       NFCeC_FormaEmissao = :NFCeC_FormaEmissao, ');
  DM.Query1.SQL.add('       NFCeC_MostraPreview= :NFCeC_MostraPreview,');
  DM.Query1.Sql.Add('       NFCeC_Ambiente     = :NFCeC_Ambiente,     ');
  DM.Query1.Sql.Add('       NFCeC_VerMsgWS     = :NFCeC_VerMsgWS,     ');
  DM.Query1.Sql.Add('       NFCeC_LayoutDanfe  = :NFCeC_LayoutDanfe,  ');
  DM.Query1.Sql.Add('       NFCeC_PathLogoMarca= :NFCeC_PathLogoMarca,');
  DM.Query1.Sql.Add('       NFCeC_PastaNotas   = :NFCeC_PastaNotas,   ');
  DM.Query1.Sql.Add('       NFCeC_CSCID        = :NFCeC_CSCID,        ');
  DM.Query1.Sql.Add('       NFCeC_CSC          = :NFCeC_CSC           ');
  DM.Query1.ParamByName('NFCeC_SERIE'        ).AsInteger := StrToInt(edt_NFeC_SERIE.Text);
  DM.Query1.ParamByName('NFCeC_nNF'          ).AsInteger := StrToInt(edt_NFeC_nNF.Text);
  DM.Query1.ParamByName('NFCeC_FormaEmissao' ).AsInteger := cbFormaEmissao.ItemIndex;
  DM.Query1.ParamByName('NFCeC_MostraPreview').AsInteger := rgNFeC_MostraPreview.ItemIndex;
  DM.Query1.ParamByName('NFCeC_Ambiente'     ).AsInteger := rgNFeC_Ambiente.ItemIndex;
  DM.Query1.ParamByName('NFCeC_VerMsgWS'     ).AsInteger := rgNFeC_VerMsgWS.ItemIndex;
  DM.Query1.ParamByName('NFCeC_LayoutDanfe'  ).AsInteger := rgNFeC_LayoutDanfe.ItemIndex;
  DM.Query1.ParamByName('NFCeC_PathLogoMarca').AsString  := edt_NFeC_PathLogoMarca.Text;
  DM.Query1.ParamByName('NFCeC_PastaNotas'   ).AsString  := edtNFeC_PastaNotas.Text;
  DM.Query1.ParamByName('NFCeC_CSCID'        ).AsString  := edCSC_ID.Text;
  DM.Query1.ParamByName('NFCeC_CSC'          ).AsString  := edCSC.Text;
  DM.Query1.ExecSql;

  // Gravar as Configuracoes do Certificado Digital
  DM.Query1.Close;
  DM.Query1.SQL.Clear;
  DM.Query1.SQL.Add('UPDATE config_notas                                         ');
  DM.Query1.SQL.add('   set ModeloPosPrinter         = :ModeloPosPrinter,        ');
  DM.Query1.SQL.add('       PaginaDeCodigo           = :PaginaDeCodigo          ');
  DM.Query1.ParamByName('ModeloPosPrinter'        ).AsInteger := cbxModeloPosPrinter.ItemIndex;
  DM.Query1.ParamByName('PaginaDeCodigo'          ).AsInteger := cbxPagCodigo.ItemIndex;
  DM.Query1.ExecSql;

  ComparaDadosDaTela('Configuracao da NFCe',Frm_config_nfce_T34);

  Avisos.Avisar('Configuração atualizada!');
  Close;
end;

procedure TFrm_config_nfce_T34.cxButton2Click(Sender: TObject);
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

procedure TFrm_config_nfce_T34.cxButton3Click(Sender: TObject);
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
        Avisos.Avisar('Série inválida');
        edt_NFeC_SERIE.SetFocus;
        exit;
      end;
   except
      Avisos.Avisar('Série inválida');
      edt_NFeC_SERIE.SetFocus;
      exit;
   end;

   try
      vNFe_SEQUENCIA := StrToInt(edt_NFeC_nNF.Text);
      if vNFe_SEQUENCIA < 0 then
      begin
        Avisos.Avisar('Sequência inválida');
        edt_NFeC_nNF.SetFocus;
        exit;
      end;
   except
      Avisos.Avisar('Sequência inválida');
      edt_NFeC_nNF.SetFocus;
      exit;
   end;

   // Verificar se existe NFe emitida nesta série
   // com número superior ao que está sendo definido....
   DM.Query1.Close;
   DM.Query1.Sql.Clear;
   DM.Query1.SQL.Add('SELECT 1 from NOTAFISCAL65_NFCE65      ');
   DM.Query1.SQL.Add('  WHERE NFCE65_NUMERO > :NFCE65_NUMERO ');
   DM.Query1.SQL.Add('    AND NFCE65_SERIE  = :NFCE65_SERIE  ');
   DM.Query1.ParamByName('NFCE65_SERIE' ).AsInteger := vNFeC_SERIE;
   DM.Query1.ParamByName('NFCE65_NUMERO').AsInteger := vNFe_SEQUENCIA;
   DM.Query1.Open;
   if not DM.Query1.eof then
   begin
     Avisos.Avisar('Existe NFCe emitida com número superior a este.');
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
    DM.Query1.SQL.Add('SELECT SNFCe_SEQUENCIA         ');
    DM.Query1.SQL.Add('  FROM SERIENFCe_SNFCe         ');
    DM.Query1.SQL.Add('  WHERE SNFCe_CODIGO = :CODIGO ');
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
       Avisos.Avisar('Série criada!');
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
       Avisos.Avisar('Sequência da série atualizada!');
    end;
end;

procedure TFrm_config_nfce_T34.cxButton4Click(Sender: TObject);
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

function TFrm_config_nfce_T34.DadosCorretos: Boolean;
var vNumero : Integer;
begin
   // retorna true se os dados a serem gravados estão corretos
   // retorna false se não estão
   //---------------------------------------------------------------------------
   result := false;

   if NaoPreencheuCamposObrigatoriosOuImportantes(Frm_config_nfce_T34) then
      exit;

   // A Série da NFe é uma informação obrigatória
   //--------------------------------------------
   if edt_NFeC_SERIE.Text = '' then
   begin
     Avisos.Avisar('Informe a Série da NFe');
     edt_NFeC_SERIE.SetFocus;
     exit;
   end;

   if edt_NFeC_nNF.Text = '' then
   begin
     Avisos.Avisar('Informe a Série da NFe');
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
        Avisos.Avisar('Série inválida. '+#13+#13+
                    'Consulte seu contador e use um valor entre 1 e 800');
        edt_NFeC_SERIE.SetFocus;
        exit;
     end;
   except
     Avisos.Avisar('Série inválida. '+#13+#13+
                 'Consulte seu contador e Use um valor numérico.');
     edt_NFeC_SERIE.SetFocus;
     exit;
   end;

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

   // Obrigatório: Forma de emissão
   if cbFormaEmissao.ItemIndex = -1 then
   begin
     Avisos.Avisar('Defina a Forma de Emissão da NFe.');
     cbFormaEmissao.SetFocus;
     exit;
   end;

   // Obrigatório: Ambiente de emissão da NFe
   if rgNFeC_Ambiente.ItemIndex = -1 then
   begin
     Avisos.Avisar('Defina o Ambiente de Emissão da NFe.');
     rgNFeC_Ambiente.SetFocus;
     exit;
   end;

   // Obrigatório: Definir se deseja ou não ver as mensagens do Web Service
   if rgNFeC_VerMsgWS.ItemIndex = -1 then
   begin
     Avisos.Avisar('Defina se deseja ver mensagens do WebService.');
     rgNFeC_VerMsgWS.SetFocus;
     exit;
   end;

   // Obrigatório: Definir o layou do Danfe
   if rgNFeC_LayoutDanfe.ItemIndex = -1 then
   begin
     Avisos.Avisar('Defina o layou de impressão do DANFE.');
     rgNFeC_LayoutDanfe.SetFocus;
     exit;
   end;

   // Se chegou até aqui, todas as críticas foram atendidas.
   result := true;
end;

procedure TFrm_config_nfce_T34.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
  self := nil;
end;

procedure TFrm_config_nfce_T34.MostraDados_CONFIG_NOTAS;
begin
  // Preencher dados de configuracao de Certificado
  cbxModeloPosPrinter.ItemIndex := DM.Query1.FieldByName('ModeloPosPrinter'        ).AsInteger;
  cbxPagCodigo.ItemIndex        := DM.Query1.FieldByName('PaginaDeCodigo'          ).AsInteger;
end;

procedure TFrm_config_nfce_T34.MostraDados_NFCe_Configuracao;
begin
  // Preenche a tela com os dados recuperados do banco de dados
  //----------------------------------------------------------------------------
  Image1.Visible := false;
  edt_NFeC_SERIE.Text           := FormatFloat('000'     ,DM.Query1.FieldByName('NFCeC_SERIE').AsInteger);
  edt_NFeC_nNF.Text             := FormatFloat('00000000',DM.Query1.FieldByName('NFCeC_nNF'  ).AsInteger);
  cbFormaEmissao.ItemIndex      := DM.Query1.FieldByName('NFCeC_FormaEmissao' ).AsInteger;
  rgNFeC_MostraPreview.ItemIndex:= DM.Query1.FieldByName('NFCeC_MostraPreview').AsInteger;
  rgNFeC_Ambiente.ItemIndex     := DM.Query1.FieldByName('NFCeC_Ambiente'     ).AsInteger;
  rgNFeC_LayoutDanfe.ItemIndex  := DM.Query1.FieldByName('NFCeC_LayoutDanfe'  ).AsInteger;
  edt_NFeC_PathLogoMarca.Text   := DM.Query1.FieldByName('NFCeC_PathLogoMarca').AsString;
  edtNFeC_PastaNotas.Text       := DM.Query1.FieldByName('NFCeC_PastaNotas'   ).AsString;
  edCSC_ID.Text                 := DM.Query1.FieldByName('NFCeC_CSCID'        ).AsString;
  edCSC.Text                    := DM.Query1.FieldByName('NFCeC_CSC'          ).AsString;
end;

procedure TFrm_config_nfce_T34.MostraLogo(pArquivoImagem: String);
begin
  if pArquivoImagem <> '' then
  begin
     Image1.Picture.LoadFromFile(pArquivoImagem);
     Image1.Visible := True;
  end;
end;

procedure TFrm_config_nfce_T34.Preenche_itens_dos_CheckBoxes;
VAR w : Integer;
  T: TSSLLib;
  I: TpcnTipoEmissao;
  J: TpcnModeloDF;
  K: TpcnVersaoDF;
  U: TSSLCryptLib;
  V: TSSLHttpLib;
  X: TSSLXmlSignLib;
//  Y: TSSLType;
  N: TACBrPosPrinterModelo;
  O: TACBrPosPaginaCodigo;
  l: Integer;

begin
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
end;

procedure TFrm_config_nfce_T34.Registra_Logs;
begin

end;

end.
