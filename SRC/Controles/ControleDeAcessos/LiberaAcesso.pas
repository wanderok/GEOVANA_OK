unit LiberaAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, jpeg, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Classe_Usuario, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxButtons;

type
  TfrmLiberaAcesso = class(TForm)
    pnSenhaPreco: TPanel;
    Label75: TLabel;
    edUsuario: TEdit;
    btSenhaPreco: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edSenha: TEdit;
    edFuncao: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    pnUsuario: TPanel;
    bPermissoes: TcxButton;
    lbNomeDaTela: TLabel;
    procedure btSenhaPrecoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edUsuarioExit(Sender: TObject);
    procedure bPermissoesClick(Sender: TObject);
  private
    { Private declarations }
    procedure VerificaAcesso;
  public
    { Public declarations }
  end;

var
  frmLiberaAcesso: TfrmLiberaAcesso;
  vfrmLiberaAcesso : boolean;
  UsuarioLocal     : TUsuario;
implementation

{$R *.dfm}
uses
  Acessos_T38,
  funcoes;

procedure TfrmLiberaAcesso.bPermissoesClick(Sender: TObject);
begin
   if edUsuario.text = '' then
   begin
      if not fTemAcesso('DEFACE') then
         exit;
   end
   else
   begin
      if not fTemAcesso(edUsuario.Text,'DEFACE') then
         exit;
   end;

   frmAcessos_T38 := TfrmAcessos_T38.Create(nil);
   frmAcessos_T38.edUSU_CODIGO.text := Usuario.Codigo;
   frmAcessos_T38.edFUN_NUMERO.text := Panel1.Caption;
   frmAcessos_T38.ShowModal;
   frmAcessos_T38.Free;
   VerificaAcesso;
   Close;
end;

procedure TfrmLiberaAcesso.btSenhaPrecoClick(Sender: TObject);
begin
  VerificaAcesso;
end;

procedure TfrmLiberaAcesso.VerificaAcesso;
var qLocal : TFDQuery;
begin
   vfrmLiberaAcesso := false;
   if edUsuario.text = 'MASTER' then
   begin
     if edSenha.text = fSenhaUsuarioMaster then
     begin
        vfrmLiberaAcesso := true;
        exit;
     end;
     vfrmLiberaAcesso := false;
     exit;
   end;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('SELECT *                         ');
   qLocal.Sql.Add('  FROM USUARIO_USU,              ');
   qLocal.Sql.Add('       ACESSOS_ACC               ');
   qLocal.Sql.Add(' WHERE USU_CODIGO  = :USU_CODIGO ');
   if edUsuario.text <> '' then
   begin
      qLocal.Sql.Add('   AND USU_SENHA   = :USU_SENHA  ');
      qLocal.ParamByName('USU_SENHA' ).AsString := criptografar(edSenha.text);
   end;
   qLocal.Sql.Add('   AND ACC_USUARIO = USU_CODIGO  ');
   qLocal.Sql.Add('   AND ACC_FUNCAO  = :FUN        ');
   if edUsuario.text <> '' then
      qLocal.ParamByName('USU_CODIGO').AsString := edUsuario.text
   else
      qLocal.ParamByName('USU_CODIGO').AsString := Usuario.Codigo;
   qLocal.ParamByName('FUN'       ).AsString := edfuncao.caption;
   qLocal.Open;
   if not qLocal.Eof Then
   begin
     // LIBERA O ACESSO
     vfrmLiberaAcesso := true;
   end;
   qLocal.Free;
   close;
end;

procedure TfrmLiberaAcesso.edUsuarioExit(Sender: TObject);
begin
  if bPermissoes.focused then
     exit;

  if edUsuario.Text = '' then
  begin
    edUsuario.SetFocus;
    exit;
  end;
  try
    UsuarioLocal := TUsuario.Create;
  except
    UsuarioLocal.Free;
    UsuarioLocal := TUsuario.Create;
  end;
  if not UsuarioLocal.Existe(edUsuario.Text) then
  begin
     UsuarioLocal.Free;
     ShowMessage('Usuário não cadastrado');
     edUsuario.SetFocus;
     exit;
  end;
  edSenha.Enabled   := True;
  edSenha.SetFocus;
end;

procedure TfrmLiberaAcesso.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #27 Then
   begin
      key := #0;
      close;
   End;
   if key = #13 then
   begin
      key := #0;
      Perform(Wm_NextDlgCtl,0,0);
   end;
end;

procedure TfrmLiberaAcesso.FormShow(Sender: TObject);
begin
     pnUsuario.Caption := Usuario.Codigo;// + ' - ' + xxxNomeUsuario;
     {
     if FileExists('FERRAMENTAS\LOGO.JPG') then
     begin
        image1.Picture.LoadFromFile('FERRAMENTAS\LOGO.JPG');
        image1.Refresh;
     end;
     }
     vfrmLiberaAcesso := false;
     edUsuario.SetFocus;
end;

end.
