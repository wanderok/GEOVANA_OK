unit Acessos_T38;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  StdCtrls, ExtCtrls, Buttons, Db, Mask, CheckLst, ComCtrls, MPlayer, jpeg, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, 
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, 
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
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
  dxSkinXmas2008Blue, cxButtons;

type
  TfrmAcessos_T38 = class(TForm)
    Panel1: TPanel;
    CheckListBox1: TCheckListBox;
    Query1: TFDQuery;
    CheckListBox2: TCheckListBox;
    ProgressBar1: TProgressBar;
    MediaPlayer1: TMediaPlayer;
    bConfirma: TcxButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    rgFuncoes: TRadioGroup;
    edUSU_CODIGO: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    edFiltro: TEdit;
    Query2: TFDQuery;
    edFUN_NUMERO: TEdit;
    Label4: TLabel;
    rgOrdem: TRadioGroup;
    Panel3: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edUSU_CODIGOExit(Sender: TObject);
    procedure edUSU_CODIGOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure bImprimeClick(Sender: TObject);
    procedure bConfirmaClick(Sender: TObject);
    procedure edFiltroChange(Sender: TObject);
    procedure rgFuncoesClick(Sender: TObject);
    procedure rgOrdemClick(Sender: TObject);
    procedure edFUN_NUMEROKeyPress(Sender: TObject; var Key: Char);
    procedure edFUN_NUMEROChange(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaTela;
    procedure habilita;
    procedure desabilita;
    procedure Gravar;
    procedure Preencher;
    procedure IncluirAcesso(pUsuario,pAcesso:String);
    procedure RetirarAcesso(pUsuario,pAcesso:String);
    function ExisteAcesso(pUsuario,pAcesso:String):Boolean;
    Function fFUN_DESCRICAO(pAcesso:String):String;

  public
    { Public declarations }
  end;

var
  frmAcessos_T38: TfrmAcessos_T38;

implementation

uses
  Classe_Avisos,
  Consulta_T7,
  FuncoesSMC,
  DadosSMC;


{$R *.DFM}

procedure TfrmAcessos_T38.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 Then
  begin
     key := #0;
     if edUSU_CODIGO.Text <> '' Then
     begin
        LimpatELA;
        Exit;
     end
     else
        Close;
  end;

  if key = #13 then
  begin
     key := #0;
     Perform(Wm_NextDlgCtl,0,0);
  End;
end;

procedure TfrmAcessos_T38.FormShow(Sender: TObject);
begin
   edUSU_CODIGO.enabled := (edUSU_CODIGO.text = '');

   Preencher;
end;

procedure TfrmAcessos_T38.edUSU_CODIGOExit(Sender: TObject);
Var i : Integer;
begin
   //CheckListBox1.enabled := true;
   if rgOrdem.Focused then
     exit;
   if edUSU_CODIGO.Text = '' then exit;

   edit2.text := '';
   Query1.Close;
   Query1.Sql.Clear;
   Query1.Sql.Add('SELECT * FROM USUARIO_USU');
   Query1.Sql.Add(' WHERE USU_CODIGO = :COD');
   Query1.ParamByName('COD').AsString := edUSU_CODIGO.Text;
   Query1.Open;
   if Query1.Eof Then
   Begin
     Avisos.Avisar('Usuário não encontrado');
     LimpaTela;
     edUSU_CODIGO.setfocus;
     Exit;
   End;
   Habilita;
   //CheckListBox1.enabled := true;
   Edit2.Text := Query1.FieldByName('USU_NOME').AsString;

   if rgFuncoes.ItemIndex = 0 then
     bConfirma.Enabled := True
   else
     bConfirma.Enabled := False;

   Preencher;
   {
   // mostra seus acessos
   Query1.Close;
   Query1.Sql.Clear;
   Query1.Sql.Add('SELECT * FROM ACESSOS_ACC ');
   Query1.Sql.Add(' WHERE ACC_USUARIO = :USU ');
   Query1.ParamByName('USU').AsString := edUSU_CODIGO.Text;
   Query1.Open;

   if Not CheckListBox1.Focused Then
   Begin
      For i := 0 to CheckListBox2.Items.Count - 1 do
      begin
         CheckListBox1.Checked[i] := False;
         CheckListBox2.Checked[i] := False;
      End;

      While Not Query1.Eof Do
      Begin
         For i := 0 to CheckListBox2.Items.Count - 1 do
            if CheckListBox2.items[i] = Query1.FieldByName('ACC_FUNCAO').AsString Then
               CheckListBox1.Checked[i] := True;
         Query1.Next;
      End;
   End;  }

   bConfirma.Enabled := True;

   Preencher;

   //bImprime.Enabled := True;
end;

procedure TfrmAcessos_T38.LimpaTela;
Var i : integer;
begin
   for i := 0 to (frmAcessos_T38.ComponentCount - 1) do
   BEGIN
      if frmAcessos_T38.Components[i] is TEdit Then
         if ((frmAcessos_T38.Components[i]) as TEdit).Name <> 'edUSU_CODIGO' Then
              ((frmAcessos_T38.Components[i]) As TEdit).Text := '';
      if frmAcessos_T38.Components[i] is TMaskEdit Then
         ((frmAcessos_T38.Components[i]) As TMaskEdit).Text := '';
   END;
   For i := 0 to CheckListBox2.Items.Count - 1 do
   begin
      CheckListBox1.Checked[i] := False;
      CheckListBox2.Checked[i] := False;
   End;

   ProgressBar1.Position := 0;
   bConfirma.Enabled := True;
   //bImprime.Enabled  := True;
end;

procedure TfrmAcessos_T38.preencher;
var vContador : integer;
begin
   if edUSU_CODIGO.text = '' then
      exit;

   CheckListBox1.font.color := clWhite;

   if rgFuncoes.ItemIndex > 0 then
   begin
       if edUSU_CODIGO.Text = '' then
       begin
          Avisos.Avisar('Informe o usuário.');
          edUSU_CODIGO.SetFocus;
          exit;
       end;
   end;

   Query1.Close;
   Query1.Sql.Clear;
   Query1.Sql.Add('SELECT * FROM FUNCOES_FUN');
   Query1.Sql.Add('WHERE FUN_CODIGO = FUN_CODIGO');

   {
   if rgFuncoes.ItemIndex = 1 then
   begin
      Query1.Sql.Add('AND FUN_CODIGO IN (SELECT ACC_FUNCAO FROM ACESSOS_ACC ');
      Query1.Sql.Add('                      WHERE ACC_USUARIO=:USUARIO)       ');
      Query1.ParamByName('USUARIO').AsString := edUSU_CODIGO.Text;
   end;
   if rgFuncoes.ItemIndex = 2 then
   begin
      Query1.Sql.Add('AND FUN_CODIGO NOT IN (SELECT ACC_FUNCAO FROM ACESSOS_ACC ');
      Query1.Sql.Add('                          WHERE ACC_USUARIO=:USUARIO)       ');
      Query1.ParamByName('USUARIO').AsString := edUSU_CODIGO.Text;
   end;
   }

   if edFUN_NUMERO.Text <> '' then
   begin
      Query1.Sql.Add('AND FUN_NUMERO = :FUN_NUMERO');
      Query1.ParamByName('FUN_NUMERO').AsInteger := StrToInt(edFUN_NUMERO.Text);
   end;

   if edFiltro.Text <> '' then
   begin
      Query1.Sql.Add('AND FUN_DESCRICAO LIKE :FILTRO');
      Query1.ParamByName('FILTRO').AsString := '%'+edFiltro.Text+'%';
   end;

   if rgFuncoes.ItemIndex <> 0 then
   begin
      Query1.Sql.Add('AND FUN_GRUPO = :FUN_GRUPO');
      Query1.ParamByName('FUN_GRUPO').AsInteger := rgFuncoes.ItemIndex;
   end;

   case rgOrdem.ItemIndex of
      0 : Query1.Sql.Add('ORDER BY FUN_NUMERO');
      1 : Query1.Sql.Add('ORDER BY FUN_DESCRICAO');
   end;
   Query1.Open;
   CheckListBox1.Items.Clear;
   CheckListBox2.Items.Clear;
   vContador := 0;
   While Not Query1.Eof Do
   Begin
      inc(vcontador);
      CheckListBox1.Items.Add('[ '+FormatFloat('000',Query1.FieldByName('FUN_NUMERO').AsInteger)+' ]  '+Query1.FieldByName('FUN_DESCRICAO').AsString);
      CheckListBox2.Items.Add(Query1.FieldByName('FUN_CODIGO').AsString);
      if ExisteAcesso(edUSU_CODIGO.Text, Query1.FieldByName('FUN_CODIGO').AsString) then
         CheckListBox1.Checked[vContador-1] := true;

      Query1.Next;
   End;
   //if edUSU_CODIGO.text <> '' then
   //begin
      //edUSU_CODIGOExit(Self);
   //   edUSU_CODIGO.enabled := false;
   //end
   //else
   //   edUSU_CODIGO.SetFocus;
end;

procedure TfrmAcessos_T38.RetirarAcesso(pUsuario, pAcesso: String);
begin
   if ExisteAcesso(pUsuario,pAcesso) then
   begin
      dm.Query1.Close;
      dm.Query1.SQL.Clear;
      dm.Query1.SQL.Add('DELETE FROM ACESSOS_ACC    ');
      dm.Query1.SQL.Add('  WHERE ACC_USUARIO = :USU ');
      dm.Query1.SQL.Add('    AND ACC_FUNCAO  = :FUN ');
      dm.Query1.ParamByName('USU').AsString := pUsuario;
      dm.Query1.ParamByName('FUN').AsString := pAcesso;
      dm.Query1.ExecSql;
      LOG('T38','Tirou acesso ['+fFUN_DESCRICAO(pAcesso)+ '] do usuario ['+pUsuario+']'+edit2.text);
   end;

end;

procedure TfrmAcessos_T38.rgFuncoesClick(Sender: TObject);
begin
   Preencher;
end;

procedure TfrmAcessos_T38.rgOrdemClick(Sender: TObject);
begin
   Preencher;
end;

procedure TfrmAcessos_T38.Habilita;
Var i : integer;
begin
   for i := 0 to (frmAcessos_T38.ComponentCount - 1) do
      if frmAcessos_T38.Components[i] is TEdit Then
        if ((frmAcessos_T38.Components[i]) as TEdit).Name <> 'edUSU_CODIGO' Then
           ((frmAcessos_T38.Components[i]) As TEdit).Enabled := True;
  bConfirma.Enabled := True;
  //bImprime.Enabled := True;
end;

procedure TfrmAcessos_T38.Desabilita;
Var i : integer;
begin
   for i := 0 to (frmAcessos_T38.ComponentCount - 1) do
     if frmAcessos_T38.Components[i] is TEdit Then
       if ((frmAcessos_T38.Components[i]) as TEdit).Name <> 'edUSU_CODIGO' Then
          ((frmAcessos_T38.Components[i]) As TEdit).Enabled := False;
   bConfirma.Enabled := False;
   //bImprime.Enabled := False;
end;

procedure TfrmAcessos_T38.edFiltroChange(Sender: TObject);
begin
   Preencher;
end;

procedure TfrmAcessos_T38.edFUN_NUMEROChange(Sender: TObject);
begin
   Preencher;
end;

procedure TfrmAcessos_T38.edFUN_NUMEROKeyPress(Sender: TObject; var Key: Char);
begin
   key := SoNumero(key);
end;

procedure TfrmAcessos_T38.Gravar;
Var i : integer;
begin
   progressbar1.Max := CheckListBox1.Items.Count;
   For i := 0 to CheckListBox1.Items.Count - 1 do
   begin
      ProgressBar1.Position := (i+1);
      Application.ProcessMessages;
      if CheckListBox1.Checked[i] Then
         IncluirAcesso(edUSU_CODIGO.text,CheckListBox2.Items[i])
      else
         RetirarAcesso(edUSU_CODIGO.text,CheckListBox2.Items[i])
   End;
   ProgressBar1.Position := 0;
   LimpaTela;
   if edUSU_CODIGO.enabled then
   begin
     edUSU_CODIGO.Text := '';
     edUSU_CODIGO.SetFocus;
   end
   else
     Close;
end;

procedure TfrmAcessos_T38.IncluirAcesso(pUsuario,pAcesso:String);
begin
   if not ExisteAcesso(pUsuario,pAcesso) then
   begin
      dm.Query1.Close;
      dm.Query1.SQL.Clear;
      dm.Query1.SQL.Add('INSERT INTO ACESSOS_ACC     ');
      dm.Query1.SQL.Add('  (ACC_USUARIO, ACC_FUNCAO) ');
      dm.Query1.SQL.Add('VALUES                      ');
      dm.Query1.SQL.Add('  (:USU,:FUN)               ');
      dm.Query1.ParamByName('USU').AsString := pUsuario;
      dm.Query1.ParamByName('FUN').AsString := pAcesso;
      dm.Query1.ExecSql;
      LOG('T38','Deu acesso ['+fFUN_DESCRICAO(pAcesso)+ '] ao usuario ['+pUsuario+']'+edit2.text);
   end;
end;

procedure TfrmAcessos_T38.edUSU_CODIGOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{     if key = vk_f1 Then
     begin
        FrmPesqUsuario := TFrmPesqUsuario.Create(Self);
        FrmPesqUsuario.ShowModal;
        edUSU_CODIGO.Text := vUsuario;
        FrmPesqUsuario.Free;
        edUSU_CODIGOExit(Self);
     end;
}
end;

function TfrmAcessos_T38.ExisteAcesso(pUsuario, pAcesso: String): Boolean;
begin
      dm.Query1.Close;
      dm.Query1.SQL.Clear;
      dm.Query1.SQL.Add('SELECT * FROM ACESSOS_ACC  ');
      dm.Query1.SQL.Add('  WHERE ACC_USUARIO = :USU ');
      dm.Query1.SQL.Add('    AND ACC_FUNCAO  = :FUN ');
      dm.Query1.ParamByName('USU').AsString := pUsuario;
      dm.Query1.ParamByName('FUN').AsString := pAcesso;
      dm.Query1.Open;
      Result := not dm.Query1.eof;
end;

procedure TfrmAcessos_T38.Button1Click(Sender: TObject);
Var i : Integer;
begin
     For i := 0 to CheckListBox1.Items.Count - 1 do
         CheckListBox1.Checked[i] := True;
end;

procedure TfrmAcessos_T38.Button2Click(Sender: TObject);
Var i : Integer;
begin
     For i := 0 to CheckListBox1.Items.Count - 1 do
         CheckListBox1.Checked[i] := False;
end;

procedure TfrmAcessos_T38.bConfirmaClick(Sender: TObject);
begin
     Gravar;
end;

procedure TfrmAcessos_T38.bImprimeClick(Sender: TObject);
begin
     Avisos.Avisar('Rotina a ser desenvolvida');
end;

Function TfrmAcessos_T38.fFUN_DESCRICAO(pAcesso:String):String;
begin
   Query2.close;
   Query2.sql.clear;
   Query2.sql.add('SELECT FUN_DESCRICAO    ');
   Query2.sql.add('  FROM FUNCOES_FUN      ');
   Query2.sql.add(' WHERE FUN_CODIGO = :COD');
   Query2.ParamByName('COD').AsString := pAcesso;
   Query2.Open;
   Result := Query2.FieldByName('FUN_DESCRICAO').AsString;
end;
end.
