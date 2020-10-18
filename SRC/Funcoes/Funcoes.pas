unit Funcoes;

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
     Dados, Winsock, Quickrpt, QRCtrls;

const
    Email_Host      = 'server-web4.dal.pz.samtooweb.com';   // 'smtps.bol.com.br'; // smtps.bol.com.br
    //imap 993
    //pop3 995
    //smtp 465

    Email_Erros_Do_Sistema = 'para@wander.eng.br';
    Email_Port      = 993;
    Email_UserId    = 'suporte@wander.eng.br'; // 'suporte@wander.eng.br'; // 'sistemabrena@bol.com.br';
    Email_PassWord  = 'Ab102030'; // 'Ab102030@'; //'Ab102030@'; //'fernanda123';

var Acesso : TAcesso;
    Usuario:TUsuario;
    VerificacaoInicial: TVerificacaoInicial;
    Empresa: TEmpresa;
    xMemo : tMemo;

    xxxAtualizado,
    globalFuncoes_Atualizado:String;

function SoNumeros(pnumero:String):String;
function SoNumerosI(pnumero:String):Integer;
function Eh_CPF(pNumero:String):Boolean;
function Eh_CNPJ(pNumero:String):Boolean;
function FormataCPF_CGC(CPF_CGC: string):string; //formata o CPF ou CGC com suas respectivas m�scaras.
function  CHEK_CGC(var_cgc:string):boolean;
function  CHEK_CPF(var_cpf:string):boolean;
procedure AtualizaFUSADA_FUS(pUSUARIO,pfuncao:String);
Function fNomeDoSistema:String;
procedure Certificado_Digital_Vencendo_Avisar_Usuario_e_Enviar_Email_Ao_Suporte;
function Criptografar(pTexto: String): String;
function DesCriptografar(pTexto: String): String;
Function NomeComputador : String;
function MandaEmail(pEmail,pSubject:String; pTexto:TMemo):Boolean;
function MandaEmailCurto(pEmail,pSubject:String; pTexto:TMemo):Boolean;
function ValorAsc(Letra: String): Byte;
function DataServidor:tDateTime;
function sDataServidor:String;
function HoraServidor:String;
function  JaEnviouEmail(pDestinatario,pAssunto:String):Boolean;
function INSERT_EMAIL_EMAIL(pDestinatario,pAssunto:String;pEMAIL_ENVIADO:Integer):Integer;
Procedure INSERT_CORPOEMAIL_CEMAIL(pEMAIL_SEQUENCIAL,pCEMAIL_LINHA:Integer;pCEMAIL_TEXTO:String);
function ProximoEMAIL_SEQUENCIAL:Integer;
Function DataDoExecutavel:String;
procedure Executar_Script(pComando:String);
procedure Atualizado;
Procedure Log(pHistorico:string); overload;
Procedure Log(pEmail,pHistorico:string); overload;
Procedure LogErros(pHistorico:string);
function Ja_Executou_Script(pInformacao:String) : Boolean;
function FaltaPreencherAlgumCampoObrigatorio(pTela:TForm):Boolean;
procedure Limpar_os_campos_da_Tela(pTela:TForm);
procedure Destroi_Objetos_das_Classes;
procedure Gravar_Dados_do_Ultimo_Acesso(pEmpresa:String);

implementation

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

procedure Limpar_os_campos_da_Tela(pTela:TForm);
var vComponents,i : integer;
begin
   for vComponents := 0 to pTela.ComponentCount-1 do
   begin
       if (pTela.Components[vComponents] is TRadioGroup) then
       begin
          (pTela.Components[vComponents] as TRadioGroup).ItemIndex := -1;
          (pTela.Components[vComponents] as TRadioGroup).Color := clWhite;
       end;
       if (pTela.Components[vComponents] is TMemo) then
       begin
          (pTela.Components[vComponents] as TMemo).Lines.Clear;
          (pTela.Components[vComponents] as TMemo).Color := clWhite;
       end;
       if (pTela.Components[vComponents] is TCheckBox) then
       begin
          (pTela.Components[vComponents] as TCheckBox).Checked:=False;
          (pTela.Components[vComponents] as TCheckBox).Color := clWhite;
       end;
       if (pTela.Components[vComponents] is TEdit) then
       begin
          (pTela.Components[vComponents] as TEdit).Text := '';
          (pTela.Components[vComponents] as TEdit).Color := clWhite;
       end;
       if (pTela.Components[vComponents] is TMaskEdit) then
       begin
          (pTela.Components[vComponents] as TMaskEdit).Text := '';
          (pTela.Components[vComponents] as TMaskEdit).Color := clWhite;
       end;

       if (pTela.Components[vComponents] is TStringGrid) then
       begin
          (pTela.Components[vComponents] as TStringGrid).Color := clWhite;
          for i := 1 to (pTela.Components[vComponents] as TStringGrid).RowCount -1 do
             (pTela.Components[vComponents] as TStringGrid).rows[i].Clear;
       end;
     end;
end;

function Criptografar(pTexto: String): String;
var
   Cont, Cod: Integer;
   Retorna: String;
begin
   for Cont := 1 to Length(pTexto) do
   begin
      Cod := ValorAsc(Copy(pTexto, Cont, 1));
      Retorna := Retorna + Chr(Cod + 7(*valor a ser adicionado - pode ser modificado*));
   end;
   Criptografar := Retorna;
end;

function DesCriptografar(pTexto: String): String;
var
   Cont, Cod: integer;
   Retorna: String;
begin
   for Cont := 1 to Length(pTexto) do
   begin
       Cod := ValorAsc(Copy(pTexto, Cont, 1));
       Retorna := Retorna + Chr(Cod - 7);
   end;
   DesCriptografar := Retorna;
end;

{
function Criptografar(pTexto: String): String;
var
   PosicaoNaString, CaracterASCII: integer;
   Retornar: String;
begin
   for PosicaoNaString := 1 to Length(pTexto) do
   begin
       CaracterASCII := ValorAsc(Copy(pTexto, PosicaoNaString, 1));
       Retornar := Retornar + Chr(CaracterASCII + 7);
   end;
   result := Retornar;
end;

function DesCriptografar(pTexto: String): String;
var
   PosicaoNaString, CaracterASCII: integer;
   Retornar: String;
begin
   for PosicaoNaString := 1 to Length(pTexto) do
   begin
       CaracterASCII := ValorAsc(Copy(pTexto, PosicaoNaString, 1));
       Retornar := Retornar + Chr(CaracterASCII - 7);
   end;
   result := Retornar;
end;
}
function ValorAsc(Letra: String): Byte;
begin
   if Length(letra) > 0 then
      result := Ord(Letra[1])
   else
      result := 0;
end;

procedure Certificado_Digital_Vencendo_Avisar_Usuario_e_Enviar_Email_Ao_Suporte;
var vFrase: String;
begin
     vFrase := 'Certificado Digital vence em '+
               DateToStr(VerificacaoInicial.ValidadeCertificado);
     log('wanderok@msn.com',vFrase);
     ShowMessage(vFrase);
end;

Procedure Log(pHistorico:string); overload;
var Q1: TFDQuery;
    vFuncao: String;
    vLOG_SEQUENCIAL, vLetra,
    vLOG_LINHA : integer;
    vFrase,i : String;
begin
   try
     Q1 := TFDQuery.Create(nil);
     Q1.ConnectionName := 'X';

     Q1.Close;
     Q1.Sql.Clear;
     Q1.Sql.Add('SELECT MAX(LOG_SEQUENCIAL) AS MAXIMO FROM LOG_LOG   ');
     Q1.open; //PausaDelay;
     vLOG_SEQUENCIAL := q1.fieldByName('MAXIMO').AsInteger+1;
     vLOG_LINHA      := 0;

     // dividir o historico...
     vFrase := '';
     For vLetra := 1 to length(pHistorico) Do
     begin
        vFrase := vFrase + pHistorico[vLetra];
        if Length(vFrase) >= 255 then
        begin
             inc(vLOG_LINHA);
             Q1.Close;
             Q1.Sql.Clear;
             Q1.Sql.Add('INSERT INTO LOG_LOG   ');
             Q1.Sql.Add('    ( LOG_SEQUENCIAL, ');
             Q1.Sql.Add('      LOG_EXECUTAVEL, '); // 24/03/19
             Q1.Sql.Add('      LOG_LINHA,      ');
             Q1.Sql.Add('      LOG_DATA,       '); // DATA DA OPERACAO
             Q1.Sql.Add('      LOG_USUARIO,    '); // USUARIO
             Q1.Sql.Add('      LOG_HORA,       '); // HORARIO
             Q1.Sql.Add('      LOG_ACESSO,     '); // NOME DA ROTINA DE ACESSO (CODIGOS DE "CRIAR FUNCOES")
             Q1.Sql.Add('      LOG_FUNCAO,     '); // NOME DA FUNCAO/OPERACAO EXECUTADA
             Q1.Sql.Add('      LOG_HISTORICO,  '); // DESCRICAO DO QUE FOI FEITO
             Q1.Sql.Add('      LOG_DADOANTIGO, '); // SE ALTERACAO, VALOR ANTERIOR
             Q1.Sql.Add('      LOG_DADONOVO,   '); // SE ALTERACAO, VALOR NOVO/ALTERADO
             Q1.Sql.Add('      LOG_TIPO,       '); // I=INCLUSAO, C=CONSULTA, A=ALTERACAO, E=EXCLUSAO, L=LISTAGEM
             Q1.Sql.Add('      LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
             Q1.Sql.Add('      LOG_PEDIDO,       '); // NUMERO DO PEDIDO
             Q1.Sql.Add('      LOG_ESTACAO,      '); // NOME DO COMPUTADOR
             Q1.Sql.Add('      LOG_SEQFINANCEIRO)');
             Q1.Sql.Add('VALUES                ');
             Q1.Sql.Add('    ( :LOG_SEQUENCIAL,');
             Q1.Sql.Add('      :LOG_EXECUTAVEL,'); // 24/03/19
             Q1.Sql.Add('      :LOG_LINHA,     ');
             Q1.Sql.Add('      :LOG_DATA,      ');
             Q1.Sql.Add('      :LOG_USUARIO,   ');
             Q1.Sql.Add('      :LOG_HORA,      ');
             Q1.Sql.Add('      :LOG_ACESSO,    ');
             Q1.Sql.Add('      :LOG_FUNCAO,    ');
             Q1.Sql.Add('      :LOG_HISTORICO, ');
             Q1.Sql.Add('      :LOG_DADOANTIGO,');
             Q1.Sql.Add('      :LOG_DADONOVO,  ');
             Q1.Sql.Add('      :LOG_TIPO,      ');
             Q1.Sql.Add('      :LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
             Q1.Sql.Add('      :LOG_PEDIDO,       '); // NUMERO DO PEDIDO
             Q1.Sql.Add('      :LOG_ESTACAO,      '); // NOME DO COMPUTADOR
             Q1.Sql.Add('      :LOG_SEQFINANCEIRO)');
             Q1.ParamByName('LOG_SEQUENCIAL').AsInteger  := vLOG_SEQUENCIAL;
             Q1.ParamByName('LOG_EXECUTAVEL').AsString   := DataDoExecutavel;
             Q1.ParamByName('LOG_LINHA'     ).AsInteger  := vLOG_LINHA;
             Q1.ParamByName('LOG_DATA'      ).AsDateTime := DataServidor;
             Q1.ParamByName('LOG_USUARIO'   ).AsString   := Usuario.Codigo;
             Q1.ParamByName('LOG_HORA'      ).AsString   := HoraServidor;
             Q1.ParamByName('LOG_ACESSO'    ).AsString   := '';
             Q1.ParamByName('LOG_FUNCAO'    ).AsString   := '';
             Q1.ParamByName('LOG_HISTORICO' ).AsString   := Copy(Uppercase(vFrase),1,255);
             Q1.ParamByName('LOG_DADOANTIGO').AsString   := '';
             Q1.ParamByName('LOG_DADONOVO'  ).AsString   := '';
             Q1.ParamByName('LOG_TIPO'      ).AsString   := '';
             Q1.ParamByName('LOG_CRIPTOGRAFADO').AsString:= 'N';
             Q1.ParamByName('LOG_PEDIDO'    ).AsString   := '';
             Q1.ParamByName('LOG_ESTACAO'   ).AsString   := NomeComputador;
             Q1.ParamByName('LOG_SEQFINANCEIRO').AsInteger  := 0;
             Q1.ExecSql;
           vFrase := '';
        end;
     end;
     inc(vLOG_LINHA);
     Q1.Close;
     Q1.Sql.Clear;
     Q1.Sql.Add('INSERT INTO LOG_LOG   ');
     Q1.Sql.Add('    ( LOG_SEQUENCIAL, ');
     Q1.Sql.Add('      LOG_EXECUTAVEL,'); // 24/03/19
     Q1.Sql.Add('      LOG_LINHA,      ');
     Q1.Sql.Add('      LOG_DATA,       '); // DATA DA OPERACAO
     Q1.Sql.Add('      LOG_USUARIO,    '); // USUARIO
     Q1.Sql.Add('      LOG_HORA,       '); // HORARIO
     Q1.Sql.Add('      LOG_ACESSO,     '); // NOME DA ROTINA DE ACESSO (CODIGOS DE "CRIAR FUNCOES")
     Q1.Sql.Add('      LOG_FUNCAO,     '); // NOME DA FUNCAO/OPERACAO EXECUTADA
     Q1.Sql.Add('      LOG_HISTORICO,  '); // DESCRICAO DO QUE FOI FEITO
     Q1.Sql.Add('      LOG_DADOANTIGO, '); // SE ALTERACAO, VALOR ANTERIOR
     Q1.Sql.Add('      LOG_DADONOVO,   '); // SE ALTERACAO, VALOR NOVO/ALTERADO
     Q1.Sql.Add('      LOG_TIPO,       '); // I=INCLUSAO, C=CONSULTA, A=ALTERACAO, E=EXCLUSAO, L=LISTAGEM
     Q1.Sql.Add('      LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
     Q1.Sql.Add('      LOG_PEDIDO,       '); // NUMERO DO PEDIDO
     Q1.Sql.Add('      LOG_ESTACAO,      '); // NOME DO COMPUTADOR
     Q1.Sql.Add('      LOG_SEQFINANCEIRO)');
     Q1.Sql.Add('VALUES                ');
     Q1.Sql.Add('    ( :LOG_SEQUENCIAL,');
     Q1.Sql.Add('      :LOG_EXECUTAVEL,'); // 24/03/19
     Q1.Sql.Add('      :LOG_LINHA,     ');
     Q1.Sql.Add('      :LOG_DATA,      ');
     Q1.Sql.Add('      :LOG_USUARIO,   ');
     Q1.Sql.Add('      :LOG_HORA,      ');
     Q1.Sql.Add('      :LOG_ACESSO,    ');
     Q1.Sql.Add('      :LOG_FUNCAO,    ');
     Q1.Sql.Add('      :LOG_HISTORICO, ');
     Q1.Sql.Add('      :LOG_DADOANTIGO,');
     Q1.Sql.Add('      :LOG_DADONOVO,  ');
     Q1.Sql.Add('      :LOG_TIPO,      ');
     Q1.Sql.Add('      :LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
     Q1.Sql.Add('      :LOG_PEDIDO,       '); // NUMERO DO PEDIDO
     Q1.Sql.Add('      :LOG_ESTACAO,      '); // NOME DO COMPUTADOR
     Q1.Sql.Add('      :LOG_SEQFINANCEIRO)');
     Q1.ParamByName('LOG_SEQUENCIAL').AsInteger  := vLOG_SEQUENCIAL;
     Q1.ParamByName('LOG_EXECUTAVEL').AsString   := DataDoExecutavel;
     Q1.ParamByName('LOG_LINHA'     ).AsInteger  := vLOG_LINHA;
     Q1.ParamByName('LOG_DATA'      ).AsDateTime := DataServidor;
     Q1.ParamByName('LOG_USUARIO'   ).AsString   := Usuario.Codigo;
     Q1.ParamByName('LOG_HORA'      ).AsString   := HoraServidor;
     Q1.ParamByName('LOG_ACESSO'    ).AsString   := '';
     Q1.ParamByName('LOG_FUNCAO'    ).AsString   := '';
     Q1.ParamByName('LOG_HISTORICO' ).AsString   := vFrase;
     Q1.ParamByName('LOG_DADOANTIGO').AsString   := '';
     Q1.ParamByName('LOG_DADONOVO'  ).AsString   := '';
     Q1.ParamByName('LOG_TIPO'      ).AsString   := '';
     Q1.ParamByName('LOG_CRIPTOGRAFADO').AsString:= 'N';
     Q1.ParamByName('LOG_PEDIDO'    ).AsString   := '';
     Q1.ParamByName('LOG_ESTACAO'   ).AsString   := NomeComputador;
     Q1.ParamByName('LOG_SEQFINANCEIRO').AsInteger  := 0;
     Q1.ExecSql;
   except
   end;
   Q1.free;
end;

Procedure Log(pEmail,pHistorico:string); overload;
begin
   //Envia o erro para o email do suporte
   xMemo := tMemo.Create(nil);
   xMemo.Parent := Application.MainForm;
   xMemo.visible := false;
   xMemo.lines.clear;
   xMemo.lines.add('==================================');
   xMemo.lines.add(pHistorico);
   xMemo.lines.add('==================================');
   xMemo.lines.add('Empresa: '          + Empresa.NomeFantasia);
   xMemo.lines.add('Codigo Unisystem: ' + Empresa.CodigoUniSystem);
   xMemo.lines.add('Data: '             + sDataServidor + ' ' + HoraServidor);
   xMemo.lines.add('==================================');
   xMemo.lines.add('Banco de Dados: '   + Acesso.nomeDaConexao);
   xMemo.lines.add('Versao do EXE: '    + DataDoExecutavel);
   xMemo.lines.add('Computador: '       + NomeComputador);
   xMemo.lines.add('Usuario: '          + Usuario.Nome);
   xMemo.lines.add('==================================');

   MandaEmailCurto(pEmail,
                   'Certificado Digital Vencendo: '+Empresa.NomeFantasia
                   ,xMemo);

   MandaEmailCurto('smc.atendimentos@gmail.com',
                   'Certificado Digital Vencendo: '+Empresa.NomeFantasia
                   ,xMemo);

   xMemo.Free;

   Log(pHistorico);
end;

Procedure LogErros(pHistorico:string);
var qLocal: TFDQuery;
    vFuncao: String;
    vLOG_SEQUENCIAL, vLetra,
    vLOG_LINHA : integer;
    vFrase,i : String;
begin
   try
     qLocal := TFDQuery.Create(nil);
     qLocal.ConnectionName := 'X';

     qLocal.Close;
     qLocal.Sql.Clear;
     qLocal.Sql.Add('SELECT MAX(LOG_SEQUENCIAL) AS MAXIMO FROM LOG_LOG   ');
     qLocal.open; //PausaDelay;
     vLOG_SEQUENCIAL := qLocal.fieldByName('MAXIMO').AsInteger+1;
     vLOG_LINHA      := 0;

     // dividir o historico...
     vFrase := '';
     For vLetra := 1 to length(pHistorico) Do
     begin
        vFrase := vFrase + pHistorico[vLetra];
        if Length(vFrase) >= 255 then
        begin
             inc(vLOG_LINHA);
             qLocal.Close;
             qLocal.Sql.Clear;
             qLocal.Sql.Add('INSERT INTO LOG_LOG   ');
             qLocal.Sql.Add('    ( LOG_SEQUENCIAL, ');
             qLocal.Sql.Add('      LOG_EXECUTAVEL, '); // 24/03/19
             qLocal.Sql.Add('      LOG_LINHA,      ');
             qLocal.Sql.Add('      LOG_DATA,       '); // DATA DA OPERACAO
             qLocal.Sql.Add('      LOG_USUARIO,    '); // USUARIO
             qLocal.Sql.Add('      LOG_HORA,       '); // HORARIO
             qLocal.Sql.Add('      LOG_ACESSO,     '); // NOME DA ROTINA DE ACESSO (CODIGOS DE "CRIAR FUNCOES")
             qLocal.Sql.Add('      LOG_FUNCAO,     '); // NOME DA FUNCAO/OPERACAO EXECUTADA
             qLocal.Sql.Add('      LOG_HISTORICO,  '); // DESCRICAO DO QUE FOI FEITO
             qLocal.Sql.Add('      LOG_DADOANTIGO, '); // SE ALTERACAO, VALOR ANTERIOR
             qLocal.Sql.Add('      LOG_DADONOVO,   '); // SE ALTERACAO, VALOR NOVO/ALTERADO
             qLocal.Sql.Add('      LOG_TIPO,       '); // '' = usuarios, E=Erros
             qLocal.Sql.Add('      LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
             qLocal.Sql.Add('      LOG_PEDIDO,       '); // NUMERO DO PEDIDO
             qLocal.Sql.Add('      LOG_ESTACAO,      '); // NOME DO COMPUTADOR
             qLocal.Sql.Add('      LOG_SEQFINANCEIRO)');
             qLocal.Sql.Add('VALUES                ');
             qLocal.Sql.Add('    ( :LOG_SEQUENCIAL,');
             qLocal.Sql.Add('      :LOG_EXECUTAVEL,'); // 24/03/19
             qLocal.Sql.Add('      :LOG_LINHA,     ');
             qLocal.Sql.Add('      :LOG_DATA,      ');
             qLocal.Sql.Add('      :LOG_USUARIO,   ');
             qLocal.Sql.Add('      :LOG_HORA,      ');
             qLocal.Sql.Add('      :LOG_ACESSO,    ');
             qLocal.Sql.Add('      :LOG_FUNCAO,    ');
             qLocal.Sql.Add('      :LOG_HISTORICO, ');
             qLocal.Sql.Add('      :LOG_DADOANTIGO,');
             qLocal.Sql.Add('      :LOG_DADONOVO,  ');
             qLocal.Sql.Add('      :LOG_TIPO,      ');
             qLocal.Sql.Add('      :LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
             qLocal.Sql.Add('      :LOG_PEDIDO,       '); // NUMERO DO PEDIDO
             qLocal.Sql.Add('      :LOG_ESTACAO,      '); // NOME DO COMPUTADOR
             qLocal.Sql.Add('      :LOG_SEQFINANCEIRO)');
             qLocal.ParamByName('LOG_SEQUENCIAL').AsInteger  := vLOG_SEQUENCIAL;
             qLocal.ParamByName('LOG_EXECUTAVEL').AsString   := DataDoExecutavel;
             qLocal.ParamByName('LOG_LINHA'     ).AsInteger  := vLOG_LINHA;
             qLocal.ParamByName('LOG_DATA'      ).AsDateTime := DataServidor;
             qLocal.ParamByName('LOG_USUARIO'   ).AsString   := Usuario.Codigo;
             qLocal.ParamByName('LOG_HORA'      ).AsString   := HoraServidor;
             qLocal.ParamByName('LOG_ACESSO'    ).AsString   := '';
             qLocal.ParamByName('LOG_FUNCAO'    ).AsString   := '';
             qLocal.ParamByName('LOG_HISTORICO' ).AsString   := Copy(Uppercase(vFrase),1,255);
             qLocal.ParamByName('LOG_DADOANTIGO').AsString   := '';
             qLocal.ParamByName('LOG_DADONOVO'  ).AsString   := '';
             qLocal.ParamByName('LOG_TIPO'      ).AsString   := 'E';
             qLocal.ParamByName('LOG_CRIPTOGRAFADO').AsString:= 'N';
             qLocal.ParamByName('LOG_PEDIDO'    ).AsString   := '';
             qLocal.ParamByName('LOG_ESTACAO'   ).AsString   := NomeComputador;
             qLocal.ParamByName('LOG_SEQFINANCEIRO').AsInteger  := 0;
             qLocal.ExecSql;
           vFrase := '';
        end;
     end;
     inc(vLOG_LINHA);
     qLocal.Close;
     qLocal.Sql.Clear;
     qLocal.Sql.Add('INSERT INTO LOG_LOG   ');
     qLocal.Sql.Add('    ( LOG_SEQUENCIAL, ');
     qLocal.Sql.Add('      LOG_TIPO,       ');
     qLocal.Sql.Add('      LOG_EXECUTAVEL,'); // 24/03/19
     qLocal.Sql.Add('      LOG_LINHA,      ');
     qLocal.Sql.Add('      LOG_DATA,       '); // DATA DA OPERACAO
     qLocal.Sql.Add('      LOG_USUARIO,    '); // USUARIO
     qLocal.Sql.Add('      LOG_HORA,       '); // HORARIO
     qLocal.Sql.Add('      LOG_ACESSO,     '); // NOME DA ROTINA DE ACESSO (CODIGOS DE "CRIAR FUNCOES")
     qLocal.Sql.Add('      LOG_FUNCAO,     '); // NOME DA FUNCAO/OPERACAO EXECUTADA
     qLocal.Sql.Add('      LOG_HISTORICO,  '); // DESCRICAO DO QUE FOI FEITO
     qLocal.Sql.Add('      LOG_DADOANTIGO, '); // SE ALTERACAO, VALOR ANTERIOR
     qLocal.Sql.Add('      LOG_DADONOVO,   '); // SE ALTERACAO, VALOR NOVO/ALTERADO
     qLocal.Sql.Add('      LOG_TIPO,       ');
     qLocal.Sql.Add('      LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
     qLocal.Sql.Add('      LOG_PEDIDO,       '); // NUMERO DO PEDIDO
     qLocal.Sql.Add('      LOG_ESTACAO,      '); // NOME DO COMPUTADOR
     qLocal.Sql.Add('      LOG_SEQFINANCEIRO)');
     qLocal.Sql.Add('VALUES                ');
     qLocal.Sql.Add('    ( :LOG_SEQUENCIAL,');
     qLocal.Sql.Add('      :LOG_EXECUTAVEL,'); // 24/03/19
     qLocal.Sql.Add('      :LOG_LINHA,     ');
     qLocal.Sql.Add('      :LOG_DATA,      ');
     qLocal.Sql.Add('      :LOG_USUARIO,   ');
     qLocal.Sql.Add('      :LOG_HORA,      ');
     qLocal.Sql.Add('      :LOG_ACESSO,    ');
     qLocal.Sql.Add('      :LOG_FUNCAO,    ');
     qLocal.Sql.Add('      :LOG_HISTORICO, ');
     qLocal.Sql.Add('      :LOG_DADOANTIGO,');
     qLocal.Sql.Add('      :LOG_DADONOVO,  ');
     qLocal.Sql.Add('      :LOG_TIPO,      ');
     qLocal.Sql.Add('      :LOG_CRIPTOGRAFADO,'); // S=SIM N=NAO
     qLocal.Sql.Add('      :LOG_PEDIDO,       '); // NUMERO DO PEDIDO
     qLocal.Sql.Add('      :LOG_ESTACAO,      '); // NOME DO COMPUTADOR
     qLocal.Sql.Add('      :LOG_SEQFINANCEIRO)');
     qLocal.ParamByName('LOG_SEQUENCIAL').AsInteger  := vLOG_SEQUENCIAL;
     qLocal.ParamByName('LOG_EXECUTAVEL').AsString   := DataDoExecutavel;
     qLocal.ParamByName('LOG_LINHA'     ).AsInteger  := vLOG_LINHA;
     qLocal.ParamByName('LOG_DATA'      ).AsDateTime := DataServidor;
     qLocal.ParamByName('LOG_USUARIO'   ).AsString   := Usuario.Codigo;
     qLocal.ParamByName('LOG_HORA'      ).AsString   := HoraServidor;
     qLocal.ParamByName('LOG_ACESSO'    ).AsString   := '';
     qLocal.ParamByName('LOG_FUNCAO'    ).AsString   := '';
     qLocal.ParamByName('LOG_HISTORICO' ).AsString   := vFrase;
     qLocal.ParamByName('LOG_DADOANTIGO').AsString   := '';
     qLocal.ParamByName('LOG_DADONOVO'  ).AsString   := '';
     qLocal.ParamByName('LOG_TIPO'      ).AsString   := 'E';
     qLocal.ParamByName('LOG_CRIPTOGRAFADO').AsString:= 'N';
     qLocal.ParamByName('LOG_PEDIDO'    ).AsString   := '';
     qLocal.ParamByName('LOG_ESTACAO'   ).AsString   := NomeComputador;
     qLocal.ParamByName('LOG_SEQFINANCEIRO').AsInteger  := 0;
     qLocal.ExecSql;
   except
   end;
   qLocal.free;
end;

function MandaEmail(pEmail,pSubject:String; pTexto:TMemo):Boolean;
var Q : TFDQuery;
begin
    // RECEBE UM ENDERECO DE EMAIL E ENVIA
    Result := False;

    //EXIT; // 04/04/2020 - SMC

    if pEmail = '' then
      pEmail := 'wanderok@msn.com';

   {
   if pEmail <> fEmailSuporte then
   begin
        q := TFDQuery.Create(nil);
        Q.ConnectionName := 'X';
        Q.close;
        Q.sql.clear;
        Q.sql.add('SELECT CFG_EMAIL FROM CONFIG_CFG ');
        Q.open; //PausaDelay;
        if not Q.Eof Then
           if q.fieldByName('CFG_EMAIL').AsString <> '' then
              pEmail := q.fieldByName('CFG_EMAIL').AsString;
        Q.Free;
   end;
   }
   frmEmail := tfrmEmail.create(Nil);
   frmEmail.Visible := false;
   vEmailCurto := false;
   vAvisarQueEnviou := False;
   frmEmail.edEmail.Text   := pEmail;
   if pSubject <> '' then
      frmEmail.edAssunto.text := LowerCase('SMC '+pSubject+': ' +Empresa.NomeFantasia)
   else
      frmEmail.edAssunto.text := LowerCase('SMC Alerta '+Empresa.NomeFantasia);
   frmEmail.Memo1.Lines.Clear;
   frmEmail.Memo1.Lines.Add('----------------------------------------------------------');
   frmEmail.Memo1.Lines.Add('Empresa: ' + Empresa.NomeFantasia);
   frmEmail.Memo1.Lines.Add('Usu�rio: ' + Usuario.Codigo + '-'+Usuario.Nome);
   frmEmail.Memo1.Lines.Add('Esta��o: ' + NomeComputador);
   frmEmail.Memo1.Lines.Add('   Data: ' + DateToStr(DataServidor) + ' ' + HoraServidor);
   frmEmail.Memo1.Lines.Add('----------------------------------------------------------');
   frmEmail.Memo1.Lines.Add(pTexto.Text);
   frmEmail.Memo1.Lines.Add('-------------------------f i m ---------------------------');
   frmEmail.bEnviarEmailClick(Nil);
end;

function MandaEmailCurto(pEmail,pSubject:String; pTexto:TMemo):Boolean;
//var Q : TFDQuery;
begin
    // RECEBE UM ENDERECO DE EMAIL E ENVIA
    Result := False;

   frmEmail := tfrmEmail.create(Nil);
   frmEmail.Visible := false;
   vEmailCurto := true;
   vAvisarQueEnviou := False;
   //xxxMandarEmailSemAvisar := 'N';
   //if pEmail <> '' then
   //   frmEmail.edEmail.Text   := pEmail
   //else
      frmEmail.edEmail.Text   := 'wanderok@msn.com';
   if pSubject <> '' then
      frmEmail.edAssunto.text := pSubject+' ' +Empresa.NomeFantasia
   else
      frmEmail.edAssunto.text := fNomeDoSistema+': '+Empresa.NomeFantasia;
   frmEmail.Memo1.Lines.Clear;
   frmEmail.Memo1.Lines.Add(pTexto.Text);
   vEmail:=pEmail;
   frmEmail.bEnviarEmailClick(Nil);
   Result := vfrmEmailSucesso;
   frmEmail.Free;
end;

Function NomeComputador : String;
var
   lpBuffer : PChar;
   nSize    : DWord;
const
   Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
   nSize := Buff_Size;
   lpBuffer := StrAlloc(Buff_Size);
   GetComputerName(lpBuffer,nSize);
   Result := String(lpBuffer);
   //Result := SEMHIFEM(String(lpBuffer));
   StrDispose(lpBuffer);
end;

function DataServidor:tDateTime;
var Q : TFDQuery;
begin
   try
     Q := TFDQuery.Create(nil);
     Q.ConnectionName := 'X';

     Q.Close;
     Q.SQL.Clear;
     Q.Sql.Add('select getdate() AS DATA');
     Q.open; //PausaDelay;
     Result := StrToDate(Copy(q.fieldByName('DATA').AsString,1,8));
   except
     Result := 0;
   end;
   q.Free;
end;

function sDataServidor:String;
begin
   result := Copy(DateToStr(DataServidor),1,8);
end;

function HoraServidor:String;
var Q : TFDQuery;
begin
   // retorna a hora atual lida do servidor
   try
     Q := TFDQuery.Create(nil);
     Q.ConnectionName := 'X';

     Q.Close;
     Q.SQL.Clear;
     Q.Sql.Add('select convert(char(10),getdate(),108) AS HORA');
     Q.open;
     Result := Copy(TimeToStr(q.fieldByName('HORA').AsDateTime),1,5);
   except
     Result := '';
   end;
   q.Free;
end;

function JaEnviouEmail(pDestinatario,pAssunto:String):Boolean;
var Q : TFDQuery;
begin
    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';
    Q.close;
    Q.sql.clear;
    Q.sql.add('SELECT TOP 1 EMAIL_SEQUENCIAL          ');
    Q.sql.add('  FROM EMAIL_EMAIL                     ');
    Q.sql.add(' WHERE EMAIL_DESTINO = :EMAIL_DESTINO  ');
    Q.sql.add('   AND EMAIL_ASSUNTO = :EMAIL_ASSUNTO  ');
    Q.sql.add('   AND EMAIL_DATA    = :EMAIL_DATA     ');
    Q.ParamByName('EMAIL_DESTINO').AsString   := pDestinatario;
    Q.ParamByName('EMAIL_ASSUNTO').AsString   := pAssunto;
    Q.ParamByName('EMAIL_DATA'   ).AsDateTime := DataServidor;
    Q.open;
    if Q.eof then
       result := False
    else
      result := True;
    Q.Free;
end;

function INSERT_EMAIL_EMAIL(pDestinatario,pAssunto:String;pEMAIL_ENVIADO:Integer):Integer;
var Q : TFDQuery;
    vEMAIL_SEQUENCIAL : integer;
begin
    if JaEnviouEmail(pDestinatario,pAssunto) then
       exit;

    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';

    try
      Q.close;
      Q.sql.clear;
      Q.sql.add('INSERT INTO EMAIL_EMAIL ');
      Q.sql.add(' ( EMAIL_SEQUENCIAL,    ');
      Q.sql.add('   EMAIL_DESTINO,       ');
      Q.sql.add('   EMAIL_ASSUNTO,       ');
      Q.sql.add('   EMAIL_DATA,          ');
      Q.sql.add('   EMAIL_USUARIO,       ');
      Q.sql.add('   EMAIL_ESTACAO,       ');
      Q.sql.add('   EMAIL_DTENVIO,       ');
      Q.sql.add('   EMAIL_HRENVIO,       ');
      Q.sql.add('   EMAIL_ENVIADO,       ');
      Q.sql.add('   EMAIL_HR)            ');
      Q.sql.add('VALUES                  ');
      Q.sql.add(' (:EMAIL_SEQUENCIAL,    ');
      Q.sql.add('  :EMAIL_DESTINO,       ');
      Q.sql.add('  :EMAIL_ASSUNTO,       ');
      Q.sql.add('  :EMAIL_DATA,          ');
      Q.sql.add('  :EMAIL_USUARIO,       ');
      Q.sql.add('  :EMAIL_ESTACAO,       ');
      Q.sql.add('  :EMAIL_DTENVIO,       ');
      Q.sql.add('  :EMAIL_HRENVIO,       ');
      Q.sql.add('  :EMAIL_ENVIADO,       ');
      Q.sql.add('  :EMAIL_HR)            ');
      vEMAIL_SEQUENCIAL := ProximoEMAIL_SEQUENCIAL;
      Q.ParamByName('EMAIL_SEQUENCIAL').AsInteger  := vEMAIL_SEQUENCIAL;
      Q.ParamByName('EMAIL_DESTINO'   ).AsString   := copy(pDestinatario,1,30);
      Q.ParamByName('EMAIL_ASSUNTO'   ).AsString   := copy(pAssunto,1,30);
      Q.ParamByName('EMAIL_DATA'      ).AsDateTime := DataServidor;
      Q.ParamByName('EMAIL_USUARIO'   ).AsString   := copy(Usuario.Codigo,1,10);
      Q.ParamByName('EMAIL_ESTACAO'   ).AsString   := copy(NomeComputador,1,20);
      Q.ParamByName('EMAIL_DTENVIO'   ).AsDateTime := DataServidor;
      Q.ParamByName('EMAIL_HRENVIO'   ).AsString   := HoraServidor;
      Q.ParamByName('EMAIL_ENVIADO'   ).AsInteger  := pEMAIL_ENVIADO;
      Q.ParamByName('EMAIL_HR'        ).AsString   := HoraServidor;
      Q.ExecSql;
      result := vEMAIL_SEQUENCIAL;
    except
    end;
    Q.Free;
end;

Procedure INSERT_CORPOEMAIL_CEMAIL(pEMAIL_SEQUENCIAL,pCEMAIL_LINHA:Integer;pCEMAIL_TEXTO:String);
var Q : TFDQuery;
begin
    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';
;

    // CORPO DO EMAIL
    Q.close;
    Q.sql.clear;
    Q.sql.add('INSERT INTO CORPOEMAIL_CEMAIL ');
    Q.sql.add(' ( CEMAIL_SEQUENCIAL,         ');
    Q.sql.add('   CEMAIL_LINHA,              ');
    Q.sql.add('   CEMAIL_TEXTO      )        ');
    Q.sql.add('VALUES                        ');
    Q.sql.add(' (:CEMAIL_SEQUENCIAL,         ');
    Q.sql.add('  :CEMAIL_LINHA,              ');
    Q.sql.add('  :CEMAIL_TEXTO      )        ');
    Q.ParamByName('CEMAIL_SEQUENCIAL').AsInteger  := pEMAIL_SEQUENCIAL;
    Q.ParamByName('CEMAIL_LINHA'     ).AsInteger  := pCEMAIL_LINHA;
    Q.ParamByName('CEMAIL_TEXTO'     ).AsString   := pCEMAIL_TEXTO;
    Q.ExecSql;
    Q.Free;
end;

Function ProximoEMAIL_SEQUENCIAL:Integer;
var Q : TFDQuery;
begin
    // retorna o maior sequencial +1 na tabela EMAIL_EMAIL
    q := TFDQuery.Create(nil);
    Q.ConnectionName := 'X';

    Q.Close;
    Q.Sql.Clear;
    Q.SQL.Add('SELECT MAX(EMAIL_SEQUENCIAL) AS MAIOR ');
    Q.SQL.Add('  FROM EMAIL_EMAIL                    ');
    Q.open; //PausaDelay;
    if Q.eof then
       result := 1
    else
       result := Q.FieldByName('MAIOR').AsInteger + 1;
    q.Free;
end;

Function DataDoExecutavel:String;
var FileDate: integer;
begin
  Result := '';
  try
  FileDate := FileAge(Application.ExeName);
  if FileDate > -1 then
     Result := DateTimeToStr(FileDateToDateTime(FileDate));
  except
  end;
end;

procedure Executar_Script(pComando:String);
var qLocal : TFDQuery;
begin
   if Ja_Executou_Script(pComando) then
      exit;

   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
   {
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('DISABLE TRIGGER ALL ON DATABASE');
   try
     qLocal.ExecSql;
   finally
   end;
   }
   TRY
      qLocal.Close;
      qLocal.Sql.Clear;
      qLocal.Sql.Add(pComando);
      qLocal.ExecSql;
      Atualizado;
   except
      LogErros('Erro ao executar: '+pComando);
   end;
   qLocal.Close;
   qLocal.Sql.Clear;
   qLocal.Sql.Add('ENABLE TRIGGER ALL ON DATABASE');
   ///qLocal.ExecSql;

   qLocal.Free;
end;

procedure Atualizado;
var qLocal : tFDQuery;
begin
    if xxxAtualizado = '' then
       exit;

    qLocal := TFDQuery.Create(nil);
    qLocal.ConnectionName := 'X';

   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT ATU_FUNCAO FROM ATUALIZADO_ATU ');
   qLocal.sql.add(' WHERE ATU_FUNCAO = :ATU_FUNCAO       ');
   qLocal.ParamByName('ATU_FUNCAO').AsString := xxxAtualizado;
   qLocal.Open;
   if not qLocal.eof Then
   begin
      qLocal.Free;
      exit;
   end;

   qLocal.Close;
   qLocal.SQL.clear;
   qLocal.sql.add('INSERT INTO ATUALIZADO_ATU ');
   qLocal.sql.add('     ( ATU_FUNCAO,         ');
   qLocal.sql.add('       ATU_DATA)           ');
   qLocal.sql.add('VALUES                     ');
   qLocal.sql.add('     (:ATU_FUNCAO,         ');
   qLocal.sql.add('      :ATU_DATA)           ');
   qLocal.ParamByName('ATU_FUNCAO').AsString   := xxxAtualizado;
   qLocal.ParamByName('ATU_DATA'  ).AsDateTime := DataServidor; // Now;
   qLocal.ExecSQL;
   qLocal.free;
end;

function Ja_Executou_Script(pInformacao:String) : Boolean;
var qLocal : tFDQuery;
begin
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';

   pInformacao:=Copy(pInformacao,1,255);
   xxxAtualizado := pInformacao;

   result := true;
   qLocal.close;
   qLocal.sql.clear;
   qLocal.sql.add('SELECT ATU_FUNCAO FROM ATUALIZADO_ATU ');
   qLocal.sql.add(' WHERE ATU_FUNCAO = :ATU_FUNCAO       ');
   qLocal.ParamByName('ATU_FUNCAO').AsString := pInformacao;
   qLocal.Open;
   if qLocal.eof Then
   begin
      xxxAtualizado := pInformacao;
      Atualizado;
      result := false;
   end;
   qLocal.Free;
end;

function FaltaPreencherAlgumCampoObrigatorio(pTela:TForm):Boolean;
var vComponent:Integer;
begin
   Result := False;
   for vComponent := 0 to pTela.ComponentCount-1 do
   begin
      //Edit
      if pTela.Components[vComponent] is tEdit then
      begin
         if (pTela.Components[vComponent] as tEdit).Tag = 123 then
         begin
            if (pTela.Components[vComponent] as tEdit).Text = '' then
            begin
               Result := True;
               (pTela.Components[vComponent] as tEdit).Color := clAqua;
            end;
         end;
      end;
      //Edit
      if pTela.Components[vComponent] is tMaskEdit then
      begin
         if (pTela.Components[vComponent] as tMaskEdit).Tag = 100 then
         begin
            if (pTela.Components[vComponent] as tMaskEdit).Text = '' then
            begin
               Result := True;
               (pTela.Components[vComponent] as tMaskEdit).Color := clAqua;
            end;
         end;
      end;
   end;
   if result then
   begin
     ShowMessage('Preencha os campos obrigat�rios assinalados');
   end;
end;

procedure Destroi_Objetos_das_Classes;
begin
    Acesso.Desconectar;
    Acesso.Free;
    Empresa.Free;
    Usuario.Free;
    //VerificacaoInicial.Free;
end;

procedure Gravar_Dados_do_Ultimo_Acesso(pEmpresa:String);
var ArquivoIni: TIniFile;
    vSMC_INI:String;
begin
   vSMC_INI := 'Arquivos\SMC_INI';
   ArquivoIni := TIniFile.Create(vSMC_INI);
   ArquivoIni.WriteString('LOGIN','EMPRESA', pEmpresa);
   ArquivoIni.WriteString('LOGIN','USUARIO', Usuario.Codigo);
   ArquivoIni.Free;
end;

function Eh_CPF(pNumero:String):Boolean;
begin
   //Retorna true se o comprimento da string for 11
   result := (length(SoNumeros(pNumero)) = 11);
end;

function Eh_CNPJ(pNumero:String):Boolean;
begin
   //Retorna true se o comprimento da string for 14
   result := (length(SoNumeros(pNumero)) = 14);
end;

function FormataCPF_CGC(CPF_CGC: string):string;
{formata o CPF ou CGC com suas respectivas m�scaras.
  Ex: 15132731020355 => 15.132.731/0203-55}
var vDoc   : String;
    vLetra : Char;
    i      : integer;
begin
   vDoc := '';
   if CPF_CGC = '00.000.000/0000-00' then
   begin
      result := CPF_CGC;
      exit;
   end;
   for i := 1 to length(CPF_CGC) Do
   begin
       vLetra := CPF_CGC[i];
       if (vLetra <> ' ') and
          (vLetra <> '.') and
          (vLetra <> ',') and
          (vLetra <> '-') and
          (vLetra <> '/') and
          (vLetra <> '\') Then
          if (vLetra >= '0') and (vLetra <= '9') then
             vDoc := vDoc + vLetra;
   end;
   if length(vDOC)=11 then
       begin
         if CHEK_CPF(vDOC) then
            begin
                insert('.',vDoc,4);
                insert('.',vDoc,8);
                insert('-',vDoc,12);
                result := vDoc;
            end
         else
            begin
               result := '';
               Exit;
            end;
       end
   else
       if length(vDoc)=14 then
           begin
             if CHEK_CGC(vDoc) then
                 begin
                   insert('.',vDoc,3);
                   insert('.',vDoc,7);
                   insert('/',vDoc,11);
                   insert('-',vDoc,16);
                 end
             else
                 begin
                    result := '';
                    exit;
                 end;
           end
       else
          begin
             result := '';
             exit;
          end;

   result := vDoc;
end;

function CHEK_CPF(var_cpf:string):boolean;
(*confere o digito verificador do cpf*)
var
   i,j,sub_tot:integer;

begin
     var_cpf := SoNumeros(var_cpf);
     CHEK_CPF:=true;
     sub_tot:=0;
     j:=2;
     for i:=9 downto 1 do
         begin
         sub_tot:=sub_tot+strtoint(var_cpf[i])*j;
         j:=j+1
         end;

     sub_tot:=sub_tot mod 11;
     if ((sub_tot=0) or (sub_tot=1)) then
        sub_tot:=0
     else
         sub_tot:=11-sub_tot;

     if sub_tot<>strtoint(var_cpf[10]) then
        CHEK_CPF:=false
     else
         begin    (*calcula 2 digito*)
         sub_tot:=0;
         j:=2;
         for i:=10 downto 1 do
             begin
             sub_tot:=sub_tot+strtoint(var_cpf[i])*j;
             j:=j+1;
             end;

         sub_tot:=sub_tot mod 11;
         if ((sub_tot=0) or (sub_tot=1)) then
            sub_tot:=0
         else
             sub_tot:=11-sub_tot;

         if sub_tot<>strtoint(var_cpf[11]) then
            CHEK_CPF:=false;
         end;
end;

function CHEK_CGC(var_cgc:string):boolean;
(*confere o digito verificador do cgc*)
var
   i,j,sub_tot:integer;
begin
     var_cgc := SoNumeros(var_cgc);
     CHEK_CGC:=true;
     j:=2;
     sub_tot:=0;
     for i:=12 downto 1 do
         begin
         if j>9 then
            j:=2;
         sub_tot:=sub_tot+strtoint(var_cgc[i])*j;
         j:=j+1;
         end;
     sub_tot:=sub_tot mod 11;
     if ((sub_tot=0) or (sub_tot=1)) then
        sub_tot:=0
     else
         sub_tot:=11-sub_tot;

     if sub_tot<>strtoint(var_cgc[13]) then
        CHEK_CGC:=false
     else
         begin    (*calcula 2 digito*)
         sub_tot:=0;
         j:=2;
         for i:=13 downto 1 do
         begin
             if j>9 then
                j:=2;
             sub_tot:=sub_tot+strtoint(var_cgc[i])*j;
             j:=j+1;
         end;

         sub_tot:=sub_tot mod 11;
         if ((sub_tot=0) or (sub_tot=1)) then
            sub_tot:=0
         else
             sub_tot:=11-sub_tot;

         if sub_tot<>strtoint(var_cgc[14]) then
            CHEK_CGC:=false;

         end;
end;

function SoNumeros(pnumero:String):String;
var vDigito, vNumero : String;
    i       : integer;
begin
    // recebe uma string e a retorna somente com digitos,
    // ex. recebe 633.403.056-68 e retorna 63340305668
    vNumero := '';
    for i := 1 to length(pNumero) do
    begin
        vDigito := Copy(pNumero,i,1);
        if (vDigito = '1') or
           (vDigito = '2') or
           (vDigito = '3') or
           (vDigito = '4') or
           (vDigito = '5') or
           (vDigito = '6') or
           (vDigito = '7') or
           (vDigito = '8') or
           (vDigito = '9') or
           (vDigito = '0') then
           vNumero := vNumero + vDigito;
        {end
        else
        begin
           try
              StrToInt(vDigito);
              vNumero := vNumero + vDigito
           except
           end;
        end;
        }
    end;
    result := vNumero;
end;

function SoNumerosI(pnumero:String):Integer;
begin
     Result := StrToInt(SoNumeros(pNumero));
end;
Function fNomeDoSistema:String;
begin
     Result := 'SMC Plus';
end;


end.
