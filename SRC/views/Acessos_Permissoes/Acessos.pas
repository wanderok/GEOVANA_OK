unit Acessos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  StdCtrls, ExtCtrls, Buttons, Db, Mask, CheckLst, ComCtrls, MPlayer, jpeg, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, 
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, 
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmAcessos = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    bConfirma: TBitBtn;
    bImprime: TBitBtn;
    Edit2: TEdit;
    CheckListBox1: TCheckListBox;
    Query1: TFDQuery;
    CheckListBox2: TCheckListBox;
    Button1: TButton;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    btExemplo: TBitBtn;
    MediaPlayer1: TMediaPlayer;
    rgOrdem: TRadioGroup;
    rgFuncoes: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure bConfirmaClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure btExemploClick(Sender: TObject);
    procedure bImprimeClick(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaTela;
    procedure habilita;
    procedure desabilita;
  public
    { Public declarations }
  end;

var
  frmAcessos: TfrmAcessos;

implementation

uses
  PesqUsuario, Principal, Funcoes;


{$R *.DFM}

procedure TfrmAcessos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 Then
  begin
     key := #0;
     if Edit1.Text <> '' Then
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

procedure TfrmAcessos.FormShow(Sender: TObject);
var vContador : integer;
begin
   CheckListBox1.enabled := false;
   try
       query1.close;
       query1.sql.clear;
       query1.sql.add('DELETE FROM ACESSOS_ACC');
       query1.sql.add(' WHERE ACC_USUARIO NOT IN (SELECT DISTINCT USU_CODIGO FROM USUARIO_USU) ');
       query1.execsql;
   except
   end;
   if rgFuncoes.ItemIndex > 0 then
   begin
       if edit1.Text = '' then
       begin
          showMessage(xxxNomeUsuario+', Informe o usuário.');
          edit1.SetFocus;
          exit;
       end;
   end;

   Query1.Close;
   Query1.Sql.Clear;
   Query1.Sql.Add('SELECT * FROM FUNCOES_FUN');
   if rgFuncoes.ItemIndex = 1 then
   begin
      Query1.Sql.Add('WHERE FUN_CODIGO IN (SELECT ACC_FUNCAO FROM ACESSOS_ACC ');
      Query1.Sql.Add('                      WHERE ACC_USUARIO=:USUARIO)       ');
      Query1.ParamByName('USUARIO').AsString := edit1.Text;
   end;
   if rgFuncoes.ItemIndex = 2 then
   begin
      Query1.Sql.Add('WHERE FUN_CODIGO NOT IN (SELECT ACC_FUNCAO FROM ACESSOS_ACC ');
      Query1.Sql.Add('                          WHERE ACC_USUARIO=:USUARIO)       ');
      Query1.ParamByName('USUARIO').AsString := edit1.Text;
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
      CheckListBox1.Items.Add(Query1.FieldByName('FUN_NUMERO').AsString+'.'+Query1.FieldByName('FUN_DESCRICAO').AsString);
      CheckListBox2.Items.Add(Query1.FieldByName('FUN_CODIGO').AsString);
      Query1.Next;
   End;
   if edit1.text <> '' then
   begin
      Edit1Exit(Self);
      edit1.enabled := false;
   end
   else
      Edit1.SetFocus;
end;

procedure TfrmAcessos.Edit1Exit(Sender: TObject);
Var i : Integer;
begin
   CheckListBox1.enabled := false;
   if rgOrdem.Focused then
     exit;
   if Edit1.Text = '' then exit;

   edit2.text := '';
   Query1.Close;
   Query1.Sql.Clear;
   Query1.Sql.Add('SELECT * FROM USUARIO_USU');
   Query1.Sql.Add(' WHERE USU_CODIGO = :COD');
   Query1.ParamByName('COD').AsString := Edit1.Text;
   Query1.Open;
   if Query1.Eof Then
   Begin
     showMessage(xxxNomeUsuario+', Usuário não encontrado');
     LimpaTela;
     edit1.setfocus;
     Exit;
   End;
   Habilita;
   CheckListBox1.enabled := true;
   Edit2.Text := Query1.FieldByName('USU_NOME').AsString;

   if rgFuncoes.ItemIndex = 0 then
     bConfirma.Enabled := True
   else
     bConfirma.Enabled := False;

   // mostra seus acessos
   Query1.Close;
   Query1.Sql.Clear;
   Query1.Sql.Add('SELECT * FROM ACESSOS_ACC ');
   Query1.Sql.Add(' WHERE ACC_USUARIO = :USU ');
   Query1.ParamByName('USU').AsString := Edit1.Text;
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
   End;

   bConfirma.Enabled := True;
   bImprime.Enabled := True;
end;

procedure TfrmAcessos.LimpaTela;
Var i : integer;
begin
   for i := 0 to (frmAcessos.ComponentCount - 1) do
   BEGIN
      if frmAcessos.Components[i] is TEdit Then
         if ((frmAcessos.Components[i]) as TEdit).Name <> 'Edit1' Then
              ((frmAcessos.Components[i]) As TEdit).Text := '';
      if frmAcessos.Components[i] is TMaskEdit Then
         ((frmAcessos.Components[i]) As TMaskEdit).Text := '';
   END;
   For i := 0 to CheckListBox2.Items.Count - 1 do
   begin
      CheckListBox1.Checked[i] := False;
      CheckListBox2.Checked[i] := False;
   End;

   ProgressBar1.Position := 0;
   bConfirma.Enabled := True;
   bImprime.Enabled  := True;
end;

procedure TfrmAcessos.Habilita;
Var i : integer;
begin
   for i := 0 to (frmAcessos.ComponentCount - 1) do
      if frmAcessos.Components[i] is TEdit Then
        if ((frmAcessos.Components[i]) as TEdit).Name <> 'Edit1' Then
           ((frmAcessos.Components[i]) As TEdit).Enabled := True;
  bConfirma.Enabled := True;
  bImprime.Enabled := True;
end;

procedure TfrmAcessos.Desabilita;
Var i : integer;
begin
   for i := 0 to (frmAcessos.ComponentCount - 1) do
     if frmAcessos.Components[i] is TEdit Then
       if ((frmAcessos.Components[i]) as TEdit).Name <> 'Edit1' Then
          ((frmAcessos.Components[i]) As TEdit).Enabled := False;
   bConfirma.Enabled := False;
   bImprime.Enabled := False;
end;

procedure TfrmAcessos.bConfirmaClick(Sender: TObject);
Var i : integer;
begin
   if rgFuncoes.ItemIndex <> 0 then
   begin
      showMessage(xxxNomeUsuario+', Somente visualizando TODAS as funções poderá gravar...');
      rgFuncoes.SetFocus;
      exit;
   end;
   Query1.Close;
   Query1.Sql.Clear;
   Query1.Sql.Add('DELETE FROM ACESSOS_ACC WHERE ACC_USUARIO = :USU');
   Query1.ParamByName('USU').AsString := Edit1.Text;
   Query1.ExecSql;
   progressbar1.Max := CheckListBox1.Items.Count;
   For i := 0 to CheckListBox1.Items.Count - 1 do
   begin
      ProgressBar1.Position := (i+1);
      frmAcessos.Refresh; Application.ProcessMessages;
      if CheckListBox1.Checked[i] Then
      Begin
         Query1.Close;
         Query1.SQL.Clear;
         Query1.SQL.Add('INSERT INTO ACESSOS_ACC     ');
         Query1.SQL.Add('  (ACC_USUARIO, ACC_FUNCAO) ');
         Query1.SQL.Add('VALUES                      ');
         Query1.SQL.Add('  (:USU,:FUN)               ');
         Query1.ParamByName('USU').AsString := Edit1.text;
         Query1.ParamByName('FUN').AsString := CheckListBox2.Items[i];
         Query1.ExecSql;
      End;
   End;
   ProgressBar1.Position := 0;

   try
     for i := 0 to frmBrena.MainMenu1.Items.Count - 1 do
       frmBrena.MainMenu1.Items[i].Enabled := False;
   except
   end;

   Query1.Close;
   Query1.Sql.Clear;
   Query1.Sql.Add('SELECT * FROM ACESSOS_ACC');
   Query1.Sql.Add(' WHERE ACC_USUARIO = :USU');
   Query1.ParamByName('USU').AsString := Edit1.Text;
   Query1.Open;
   While Not Query1.Eof Do
   Begin
     for i := 0 to frmBrena.MainMenu1.Items.Count - 1 do
     Begin
        if frmBrena.MainMenu1.Items[i].Name =
           Query1.FieldByName('ACC_FUNCAO').AsString Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
        if frmBrena.MainMenu1.Items[i].Name = 'FIM' Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
        if frmBrena.MainMenu1.Items[i].Name = 'Movimentos1' Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
        if frmBrena.MainMenu1.Items[i].Name = 'FINANC' Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
        if frmBrena.MainMenu1.Items[i].Name = 'Contabilidade1' Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
        if frmBrena.MainMenu1.Items[i].Name = 'CADASTROS' Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
        if frmBrena.MainMenu1.Items[i].Name = 'UTIL' Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
        if frmBrena.MainMenu1.Items[i].Name = 'Suporte1' Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
        if frmBrena.MainMenu1.Items[i].Name = 'Relatorios1' Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
        if frmBrena.MainMenu1.Items[i].Name = 'Grfico1' Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
        if frmBrena.MainMenu1.Items[i].Name = 'N9Chamados1' Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
        if frmBrena.MainMenu1.Items[i].Name = 'AViagens1' Then
           frmBrena.MainMenu1.Items[i].Enabled := True;
     End;
     Query1.Next;
   End;

   CheckListBox1.enabled := false;
   LimpaTela;
   if edit1.enabled then
   begin
     Edit1.Text := '';
     Edit1.SetFocus;
   end
   else
     Close;
end;

procedure TfrmAcessos.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = vk_f1 Then
     begin
        FrmPesqUsuario := TFrmPesqUsuario.Create(Self);
        FrmPesqUsuario.ShowModal;
        Edit1.Text := vUsuario;
        FrmPesqUsuario.Free;
        Edit1Exit(Self);
     end;
end;

procedure TfrmAcessos.Button1Click(Sender: TObject);
Var i : Integer;
begin
     For i := 0 to CheckListBox1.Items.Count - 1 do
         CheckListBox1.Checked[i] := True;
end;

procedure TfrmAcessos.Button2Click(Sender: TObject);
Var i : Integer;
begin
     For i := 0 to CheckListBox1.Items.Count - 1 do
         CheckListBox1.Checked[i] := False;

end;

procedure TfrmAcessos.Edit1Enter(Sender: TObject);
begin
     Pintar(frmAcessos,Sender);
end;

procedure TfrmAcessos.btExemploClick(Sender: TObject);
begin
     MediaPlayer1.FileName:= xxxLocalArquivosMedia+'\ACESSOS.AVI';
     MediaPlayer1.Open;
     MediaPlayer1.Play;
end;

procedure TfrmAcessos.bImprimeClick(Sender: TObject);
begin
     showMessage(xxxNomeUsuario+', Rotina a ser desenvolvida');
end;

procedure TfrmAcessos.CheckListBox1Click(Sender: TObject);
begin
     if not CheckListBox1.enabled then
     begin
        ShowMessage(xxxNomeUsuario+', escolha o usuário e dê ENTER em seu código');
        edit1.setfocus;
        exit;
     end;
end;

end.
