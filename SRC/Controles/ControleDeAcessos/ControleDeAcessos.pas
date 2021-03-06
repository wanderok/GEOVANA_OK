unit ControleDeAcessos;

interface

uses Dialogs, SysUtils,
     Classe_Empresa,
     Classe_Acesso,
     Classe_Usuario,
     Classe_VerificacaoInicial,

     Email,

     FireDAC.Stan.Intf,  FireDAC.Stan.Option, FireDAC.Stan.Param,
     FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
     FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

     Vcl.Controls,
     SHELLAPI, {SHELLAPI Para o ShellExecute}
     IniFiles, // arquivos ini,
     MMSystem, {ACTIVEVOICEPROJECTLib_TLB, execwait,Lembrete,}
     Math, Registry,
     stdctrls, Windows, Messages, Classes, Graphics, Forms,
     ExtCtrls, Mask, Grids, Db, Buttons, ComCtrls,
     DadosSMC, Winsock, Quickrpt, QRCtrls;

function TemAcesso(pUSUARIO,funcao:string):Boolean; overload;
function TemAcesso(funcao:string):Boolean; overload;
function TemAcessoSemMensagem(pUSUARIO,funcao:string):Boolean;

implementation

uses FuncoesSMC, LiberaAcesso_T39;

function TemAcesso(funcao:string):Boolean; overload;
begin
  result := TemAcesso(Usuario.Codigo,funcao);
end;

function TemAcesso(pUSUARIO,funcao:string):Boolean; overload;
var qLocal : TFDQuery;
    vGrupo : String;
begin
   TemAcesso := False;
   IF pUSUARIO = 'MASTER' Then
   begin
     TemAcesso := True;
     Result := true;
     exit;
   end;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   try
     qLocal.Close;
     qLocal.Sql.Clear;
     qLocal.Sql.Add('SELECT PAR_PARAR FROM PARAR_PAR ');
     qLocal.open;
     if qLocal.FieldByName('PAR_PARAR').AsInteger = 1 then
     begin
        qLocal.Free;
        Application.Terminate;
     end;
   except
   end;

   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('SELECT * FROM ACESSOS_ACC ');
   qLocal.Sql.Add(' WHERE ACC_USUARIO = :USU ');
   qLocal.Sql.Add('   AND ACC_FUNCAO  = :FUN ');
   qLocal.ParamByName('USU').AsString := pUSUARIO;
   qLocal.ParamByName('FUN').AsString := funcao;
   qLocal.open; //PausaDelay;
   if qLocal.Eof Then
   Begin
      try
         // DESCOBRE O N�MERO DESTA FUNCAO
         qLocal.Close;
         qLocal.SQL.Clear;
         qLocal.Sql.Add('SELECT * FROM FUNCOES_FUN   ');
         qLocal.Sql.Add(' WHERE FUN_CODIGO = :CODIGO ');
         qLocal.ParamByName('CODIGO').AsString  := funcao;
         qLocal.open; //PausaDelay;
         if qLocal.eof then
         begin
            ShowMessage('Fun��o Inexistente. Execute o ATUALIZADOR do Sistema.');
            LogErros('ControleDeAcessos','Fun��o Inexistente: '+funcao);
            qLocal.free;
            exit;
         end;
         if not qLocal.eof then
         begin
            // PEDIR SENHA...
            // NAO PODE INFORMAR O PRECO
            // SOLICITA SENHA PARA LIBERACAO DE PRECO....
            try
               frmLiberaAcesso_T39 := tfrmLiberaAcesso_T39.Create(nil);
            except
               frmLiberaAcesso_T39.Free;
               frmLiberaAcesso_T39 := tfrmLiberaAcesso_T39.Create(nil);
            end;
            frmLiberaAcesso_T39.edFuncao.caption := funcao;
            frmLiberaAcesso_T39.panel1.caption := qLocal.FieldByName('FUN_NUMERO').AsString;
            frmLiberaAcesso_T39.ShowModal;
            if vfrmLiberaAcesso then
            begin
               frmLiberaAcesso_T39.Free;
               TemAcesso := True;
               qLocal.free;
               exit;
            end;
            TemAcesso := False;
            frmLiberaAcesso_T39.Free;
            qLocal.free;
            ShowMessage('Acesso Negado...');
            exit;
         end;
      except
         showMessage('imposs�vel verificar se voce possui acesso a esta fun��o.'+#13+#13+
                     'Informe o suporte do Sistema.');
         TemAcesso := true;
      end;
      qLocal.free;
      Exit;
   End;
   TemAcesso := True;

   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('SELECT FUN_DESCRICAO FROM FUNCOES_FUN ');
   qLocal.Sql.Add(' WHERE FUN_CODIGO = :CODIGO           ');
   qLocal.ParamByName('CODIGO'   ).AsString := Copy(Funcao,1,10);
   qLocal.open; //PausaDelay;
   //Log('ControleDeAcessos',Funcao+': '+qLocal.FieldByName('FUN_DESCRICAO').AsString);
   qLocal.free;

   AtualizaFUSADA_FUS(pUSUARIO,funcao);
End;

procedure AtualizaFUSADA_FUS(pUSUARIO,pfuncao:String);
var qLocal : TFDQuery;
begin
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('DELETE FUSADA_FUS                ');
   qLocal.sql.add(' WHERE FUS_USUARIO = :FUS_USUARIO');
   qLocal.sql.add('   AND FUS_FUNCAO  = :FUS_FUNCAO ');
   qLocal.ParamByName('FUS_USUARIO').AsString := pUSUARIO;
   qLocal.ParamByName('FUS_FUNCAO' ).AsString := pFUNCAO;
   qLocal.ExecSql;

   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('INSERT INTO FUSADA_FUS  ');
   qLocal.sql.add('     ( FUS_USUARIO,     ');
   qLocal.sql.add('       FUS_FUNCAO)      ');
   qLocal.sql.add('VALUES                  ');
   qLocal.sql.add('     (:FUS_USUARIO,     ');
   qLocal.sql.add('      :FUS_FUNCAO)      ');
   qLocal.ParamByName('FUS_USUARIO').AsString := pUSUARIO;
   qLocal.ParamByName('FUS_FUNCAO' ).AsString := pFUNCAO;
   qLocal.ExecSql;

   qLocal.Free;
end;

function TemAcessoSemMensagem(pUSUARIO,funcao:string):Boolean;
var qLocal : TFDQuery;
    vGrupo : String;
begin
   IF pUSUARIO = 'MASTER' Then
   begin
     Result := true;
     exit;
   end;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('SELECT * FROM ACESSOS_ACC ');
   qLocal.Sql.Add(' WHERE ACC_USUARIO = :USU ');
   qLocal.Sql.Add('   AND ACC_FUNCAO  = :FUN ');
   qLocal.ParamByName('USU').AsString := pUSUARIO;
   qLocal.ParamByName('FUN').AsString := funcao;
   qLocal.open; //PausaDelay;
   if qLocal.Eof Then
   Begin
      Result  := False;
      qLocal.free;
      Exit;
   End;
   Result  := True;
   qLocal.free;
End;

end.
