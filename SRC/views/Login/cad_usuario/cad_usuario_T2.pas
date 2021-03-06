// TELA-T2
unit cad_usuario_T2;
{
================================================================================
|   DATA   |DESENVOLVEDOR|HISTORICO DA ALTERACAO DO CODIGO                     |
|----------|-------------|-----------------------------------------------------|
|13/10/2020|WANDER       |Codificou a unit                                     |
================================================================================
-------------------------------------------------------------------------------
Campos obrigat�rios devem ter TAG = 100
-------------------------------------------------------------------------------
}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinOffice2007Silver, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxCheckBox, dxGDIPlusClasses,Vcl.ExtCtrls,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue,
  //----------------------------------------------------------------------------
  FuncoesSMC,
  Classe_Usuario;

type
  Tfrm_cad_usuario_T2 = class(TForm)
    bGravar: TcxButton;
    bCancelar: TcxButton;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    edt_confirma_senha: TEdit;
    edt_senha: TEdit;
    edt_usuario: TEdit;
    btn_cons_usuario: TcxButton;
    Image2: TImage;
    bPermissoes: TcxButton;
    bLiberarLogin: TcxButton;
    Panel4: TPanel;
    procedure bCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_usuarioExit(Sender: TObject);
    procedure bGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_usuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edt_senhaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_confirma_senhaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_confirma_senhaExit(Sender: TObject);
    procedure edt_senhaExit(Sender: TObject);
    procedure bPermissoesClick(Sender: TObject);
    procedure bLiberarLoginClick(Sender: TObject);
  private
    { Private declarations }
    procedure Iniciar;
    function DadosCorretos:Boolean;
    procedure Desabilitar_Campos_e_Bot�o_Entrar;
  public
    { Public declarations }
  end;

var
  frm_cad_usuario_T2: Tfrm_cad_usuario_T2;
  UsuarioLocal: TUsuario;

implementation

{$R *.dfm}

uses Acessos_T38;

procedure Tfrm_cad_usuario_T2.bGravarClick(Sender: TObject);
begin
  if UsuarioLocal.Existe(edt_Usuario.Text) then
  begin
      if not fTemAcesso(Usuario.Codigo,'ALTUSU') then
          exit;
  end
  else
      if not fTemAcesso(Usuario.Codigo,'CADUSU') then
          exit;

  if not DadosCorretos then
     exit;

  if UsuarioLocal.Existe(edt_Usuario.Text) then
  begin
    UsuarioLocal.Senha := edt_senha.Text;
    UsuarioLocal.Update;
    UsuarioLocal.Deslogou;
  end
  else
  begin
    UsuarioLocal.Codigo:= edt_usuario.Text;
    UsuarioLocal.Nome  := edt_usuario.Text;
    UsuarioLocal.Senha := edt_senha.Text;
    UsuarioLocal.Insert;
  end;
  UsuarioLocal.Free;

  Iniciar;
end;

procedure Tfrm_cad_usuario_T2.bPermissoesClick(Sender: TObject);
begin
   if not fTemAcesso('DEFACE') then
      exit;
   frmAcessos_T38 := TfrmAcessos_T38.Create(nil);
   frmAcessos_T38.edUSU_CODIGO.text := edt_usuario.text;
   frmAcessos_T38.ShowModal;
   frmAcessos_T38.Free;
end;

procedure Tfrm_cad_usuario_T2.bLiberarLoginClick(Sender: TObject);
begin
   if edt_Usuario.Text = '' then
      exit;
   if UsuarioLocal.Existe(edt_Usuario.Text) then
      UsuarioLocal.Deslogou;

   Avisos.Avisar('O usu�rio [ '+edt_Usuario.Text+' ] foi liberado para Login');
   edt_Usuario.SetFocus;
end;

procedure Tfrm_cad_usuario_T2.Iniciar;
begin
  Limpar_os_campos_da_Tela(frm_cad_usuario_T2);
  Desabilitar_Campos_e_Bot�o_Entrar;
  edt_Usuario.SetFocus;
end;

procedure Tfrm_cad_usuario_T2.Desabilitar_Campos_e_Bot�o_Entrar;
begin
   edt_Senha.Enabled   := False;
   edt_confirma_senha.Enabled   := False;
   bGravar.Enabled  := False;
end;
procedure Tfrm_cad_usuario_T2.bCancelarClick(Sender: TObject);
begin
   try
      UsuarioLocal.Free;
   finally
   end;
   Close;
end;

function Tfrm_cad_usuario_T2.DadosCorretos: Boolean;
begin
  if bPermissoes.Focused then
  begin
     result := true;
     exit;
  end;
  result := false;

  if NaoPreencheuCamposObrigatoriosOuImportantes(frm_cad_usuario_T2) then
      exit;

  if edt_senha.Text <> edt_Confirma_Senha.Text then
  begin
    ShowMessage('As senhas n�o conferem.');
    edt_senha.SetFocus;
    exit;
  end;
  result:=true;
end;

procedure Tfrm_cad_usuario_T2.edt_confirma_senhaExit(Sender: TObject);
begin
  if bPermissoes.Focused then
     exit;
  if bLiberarLogin.Focused then
     exit;

   if not DadosCorretos then
      exit;
   bGravar.Enabled:=true;
   bGravar.SetFocus;
end;

procedure Tfrm_cad_usuario_T2.edt_confirma_senhaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 Then
   begin
      key := #0;
      edt_confirma_senhaExit(Self);
   end;
end;

procedure Tfrm_cad_usuario_T2.edt_senhaExit(Sender: TObject);
begin
  if bPermissoes.Focused then
     exit;
  if bLiberarLogin.Focused then
     exit;

   edt_confirma_senha.Enabled:= true;
   edt_confirma_senha.Setfocus;
end;

procedure Tfrm_cad_usuario_T2.edt_senhaKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 Then
     begin
        key := #0;
        edt_senhaExit(nil);
     end;
end;

procedure Tfrm_cad_usuario_T2.edt_usuarioExit(Sender: TObject);
begin
  if edt_Usuario.Text = '' then exit;
  try
    UsuarioLocal := TUsuario.Create;
  except
    UsuarioLocal.Free;
    UsuarioLocal := TUsuario.Create;
  end;
  edt_Senha.Enabled := True;
  if bPermissoes.Focused then
     exit;

  edt_Senha.SetFocus;
end;

procedure Tfrm_cad_usuario_T2.edt_usuarioKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 Then
     begin
        key := #0;
        edt_usuarioExit(nil);
     end;
end;

procedure Tfrm_cad_usuario_T2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
  self := nil;
end;

procedure Tfrm_cad_usuario_T2.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 Then
     begin
        key := #0;
        Perform(Wm_NextDlgCtl,0,0);
     end;
end;

procedure Tfrm_cad_usuario_T2.FormShow(Sender: TObject);
begin
   inicio_Padrao_De_Todas_As_Telas_Do_Sistema;
   Iniciar;
end;

end.

