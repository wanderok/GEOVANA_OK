//Verificado automaticamente em 16/06/2020 09:27
{$I ACBr.inc}
unit config_nfe_T32;
{

================================================================================
| ITEM|DATA  HR|UNIT                |HISTORICO                                 |
|-----|--------|--------------------|------------------------------------------|
|  179|23/05/20|wander              |Aplicados os bot�es de Controle padr�o    |
|     |   20:12|config_nfe          |                                          |
================================================================================

OBS: Outras altera��es foram feitas por Wander mas n�o documentadas aqui.

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
  Vcl.Buttons, FileCtrl, ACBrEnterTab;

type
  TfrmConfig_NFe_T32 = class(TForm)
    Label4: TLabel;
    GroupBox2: TGroupBox;
    cxComboBox1: TcxComboBox;
    cxGroupBox2: TcxGroupBox;
    GroupBox3: TGroupBox;
    edt_NFeC_PathLogoMarca: TEdit;
    cxButton1: TcxButton;
    ACBrNFe1: TACBrNFe;
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    pnControles: TPanel;
    bControleCancelar: TcxButton;
    bControleGravar: TcxButton;
    ACBrEnterTab1: TACBrEnterTab;
    GroupBox4: TGroupBox;
    rgNFeC_VerMsgWS: TRadioGroup;
    GroupBox7: TGroupBox;
    rgNFeC_Ambiente: TRadioGroup;
    GroupBox6: TGroupBox;
    cbFormaEmissao: TComboBox;
    GroupBox8: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    edt_NFeC_SERIE: TEdit;
    edt_NFeC_nNF: TEdit;
    cxButton3: TcxButton;
    GroupBox9: TGroupBox;
    rgNFeC_LayoutDanfe: TRadioGroup;
    GroupBox10: TGroupBox;
    edtNFeC_PastaNotas: TEdit;
    btn_buscar_xml: TcxButton;
    Label22: TLabel;
    Label102: TLabel;
    cbxModeloPosPrinter: TComboBox;
    cbxPagCodigo: TComboBox;
    rgNFeC_MostraPreview: TRadioGroup;
    Panel17: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btn_buscar_xmlClick(Sender: TObject);
    procedure edt_NFeC_PathLogoMarcaChange(Sender: TObject);
    procedure bControleGravarClick(Sender: TObject);
    procedure bControleCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
  vPodeFechar      : Boolean;
implementation

{$R *.dfm}

uses FuncoesSMC, DadosSMC, Classe_Avisos;

procedure TfrmConfig_NFe_T32.bControleCancelarClick(Sender: TObject);
begin
   vPodeFechar := True;
   Close;
end;

procedure TfrmConfig_NFe_T32.bControleGravarClick(Sender: TObject);
var vNFeC_SERIE : Integer;
begin
  {if not UsuarioMASTER then
  begin
    AcessoExclusivoMaster;
    exit;
  end; }

   if not DadosCorretos then
      exit;

  // Gravar as Configuracoes de emiss�o de NFe
  DM.Query1.Close;
  DM.Query1.Sql.Clear;
  DM.Query1.Sql.Add('UPDATE NFe_Configuracao                        ');
  DM.Query1.Sql.Add('   SET NFeC_SERIE        = :NFeC_SERIE,        ');
  DM.Query1.Sql.Add('       NFeC_nNF          = :NFeC_nNF,          ');
  DM.Query1.Sql.Add('       NFeC_FormaEmissao = :NFeC_FormaEmissao, ');
  DM.Query1.SQL.add('       NFeC_MostraPreview= :NFeC_MostraPreview,');
  DM.Query1.Sql.Add('       NFeC_Ambiente     = :NFeC_Ambiente,     ');
  DM.Query1.Sql.Add('       NFeC_VerMsgWS     = :NFeC_VerMsgWS,     ');
  DM.Query1.Sql.Add('       NFeC_LayoutDanfe  = :NFeC_LayoutDanfe,  ');
  DM.Query1.Sql.Add('       NFeC_PathLogoMarca= :NFeC_PathLogoMarca,');
  DM.Query1.Sql.Add('       NFeC_PastaNotas   = :NFeC_PastaNotas    ');
  DM.Query1.ParamByName('NFeC_SERIE'        ).AsInteger := StrToInt(edt_NFeC_SERIE.Text);
  DM.Query1.ParamByName('NFeC_nNF'          ).AsInteger := StrToInt(edt_NFeC_nNF.Text);
  DM.Query1.ParamByName('NFeC_FormaEmissao' ).AsInteger := cbFormaEmissao.ItemIndex;
  DM.Query1.ParamByName('NFeC_MostraPreview').AsInteger := rgNFeC_MostraPreview.ItemIndex;
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
  DM.Query1.SQL.add('   set ModeloPosPrinter         = :ModeloPosPrinter,        ');
  DM.Query1.SQL.add('       PaginaDeCodigo           = :PaginaDeCodigo          ');
  DM.Query1.ParamByName('ModeloPosPrinter'        ).AsInteger := cbxModeloPosPrinter.ItemIndex;
  DM.Query1.ParamByName('PaginaDeCodigo'          ).AsInteger := cbxPagCodigo.ItemIndex;
  DM.Query1.ExecSql;

  ComparaDadosDaTela('Configuracao da NFe',Frmconfig_NFe_T32);

  Avisos.Avisar('Configura��o atualizada!');
  vPodeFechar := True;
  Close;
end;

procedure TfrmConfig_NFe_T32.Registra_Logs;
begin

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
        Avisos.Avisar('S�rie inv�lida');
        edt_NFeC_SERIE.SetFocus;
        exit;
      end;
   except
      Avisos.Avisar('S�rie inv�lida');
      edt_NFeC_SERIE.SetFocus;
      exit;
   end;

   try
      vNFe_SEQUENCIA := StrToInt(edt_NFeC_nNF.Text);
      if vNFe_SEQUENCIA < 0 then
      begin
        Avisos.Avisar('Sequ�ncia inv�lida');
        edt_NFeC_nNF.SetFocus;
        exit;
      end;
   except
      Avisos.Avisar('Sequ�ncia inv�lida');
      edt_NFeC_nNF.SetFocus;
      exit;
   end;

   // Verificar se existe NFe emitida nesta s�rie
   // com n�mero superior ao que est� sendo definido....
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
     Avisos.Avisar('Existe NFe emitida com n�mero superior a este.');
     edt_NFeC_SERIE.SetFocus;
     exit;
   end;

  // ### rever ###
  // Definir o �ltimo n�mero de NFe emitida
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
       // N�o consta registro de sequencia de NFe para
       // esta s�rie...
       // Criar um registro com "�ltima nota"   = 0
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
       Avisos.Avisar('S�rie criada!');
    end
    else
    begin
       // Atualizar a sequencia de NFe desta s�rie
       DM.Query1.Close;
       DM.Query1.Sql.Clear;
       DM.Query1.SQL.Add('UPDATE SERIENFe_SNFe                   ');
       DM.Query1.SQL.Add('   SET SNFe_SEQUENCIA = :SNFe_SEQUENCIA');
       DM.Query1.SQL.Add(' WHERE SNFe_CODIGO    = :SNFe_CODIGO   ');
       DM.Query1.ParamByName('SNFe_CODIGO'   ).AsInteger := vNFeC_SERIE;
       DM.Query1.ParamByName('SNFe_SEQUENCIA').AsInteger := vNFe_SEQUENCIA;
       DM.Query1.ExecSql;
       Avisos.Avisar('Sequ�ncia da s�rie atualizada!');
    end;
end;

function TfrmConfig_NFe_T32.DadosCorretos:Boolean;
var vNumero : Integer;
begin
   // retorna true se os dados a serem gravados est�o corretos
   // retorna false se n�o est�o
   //---------------------------------------------------------------------------
   result := false;

   if NaoPreencheuCamposObrigatoriosOuImportantes(frmConfig_NFe_T32) then
      exit;

   // A S�rie da NFe � uma informa��o obrigat�ria
   //--------------------------------------------
   if edt_NFeC_SERIE.Text = '' then
   begin
     Avisos.Avisar('Informe a S�rie da NFe');
     edt_NFeC_SERIE.SetFocus;
     exit;
   end;

   if edt_NFeC_nNF.Text = '' then
   begin
     Avisos.Avisar('Informe a S�rie da NFe');
     edt_NFeC_SERIE.SetFocus;
     exit;
   end;
   // A S�rie da NFe deve ser num�rico entre 1 e 800
   //-----------------------------------------------
   try
     vNumero := StrToInt(edt_NFeC_SERIE.Text);
     if (vNumero < 001) or
        (vNumero > 800)then
     begin
        Avisos.Avisar('S�rie inv�lida. '+#13+#13+
                    'Consulte seu contador e use um valor entre 1 e 800');
        edt_NFeC_SERIE.SetFocus;
        exit;
     end;
   except
     Avisos.Avisar('S�rie inv�lida. '+#13+#13+
                 'Consulte seu contador e Use um valor num�rico.');
     edt_NFeC_SERIE.SetFocus;
     exit;
   end;

   {
   try
      vNumero := StrToInt(edt_NFeC_nNF.Text);
      if vNumero < 1 then
      begin
         Avisos.Avisar('N�mero da �ltima NFe emitida inv�lido! '+#13+#13+
                     'Consulte seu contador e Use um valor inteiro.');
         edt_NFeC_nNF.SetFocus;
         exit;
      end;
      if vNumero < fUltimaNFe(edt_NFeC_SERIE.Text) then
      begin
         Avisos.Avisar('J� existe NFe emitida com este valor nesta s�rie. '+#13+#13+
                     'Consulte seu contador e Use um valor correto.');
         edt_NFeC_nNF.SetFocus;
         exit;
      end;
   except
     Avisos.Avisar('N�mero da �ltima NFe inv�lido. '+#13+#13+
                 'Consulte seu contador e Use um valor num�rico.');
     edt_NFeC_nNF.SetFocus;
     exit;
   end;

   // O n�mero da NFe nesta s�rie n�o pode ser inferior
   // ao da �ltima NFe emitida
   }

   // Obrigat�rio: Forma de emiss�o
   if cbFormaEmissao.ItemIndex = -1 then
   begin
     Avisos.Avisar('Defina a Forma de Emiss�o da NFe.');
     cbFormaEmissao.SetFocus;
     exit;
   end;

   // Obrigat�rio: Ambiente de emiss�o da NFe
   if rgNFeC_Ambiente.ItemIndex = -1 then
   begin
     Avisos.Avisar('Defina o Ambiente de Emiss�o da NFe.');
     rgNFeC_Ambiente.SetFocus;
     exit;
   end;

   // Obrigat�rio: Definir se deseja ou n�o ver as mensagens do Web Service
   if rgNFeC_VerMsgWS.ItemIndex = -1 then
   begin
     Avisos.Avisar('Defina se deseja ver mensagens do WebService.');
     rgNFeC_VerMsgWS.SetFocus;
     exit;
   end;

   // Obrigat�rio: Definir o layou do Danfe
   if rgNFeC_LayoutDanfe.ItemIndex = -1 then
   begin
     Avisos.Avisar('Defina o layou de impress�o do DANFE.');
     rgNFeC_LayoutDanfe.SetFocus;
     exit;
   end;

   // Se chegou at� aqui, todas as cr�ticas foram atendidas.
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

procedure TfrmConfig_NFe_T32.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//   CanClose := vPodeFechar;
end;

procedure TfrmConfig_NFe_T32.FormShow(Sender: TObject);
var vNFeC_SERIE : integer;
begin
  vPodeFechar := False;
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
  {
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
  end;  }

  // Salva estes dados para serem comparados ao serem gravados
  // a fim de registrar no log de eventos todas as alera��es feitas pelo usu�rio
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
  rgNFeC_MostraPreview.ItemIndex:= DM.Query1.FieldByName('NFeC_MostraPreview').AsInteger;
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

end.

