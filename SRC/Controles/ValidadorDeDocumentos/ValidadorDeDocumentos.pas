unit ValidadorDeDocumentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ACBrBase, ACBrValidador,
  System.MaskUtils, Vcl.StdCtrls;

type
  TfrmValidadorDeDocumentos = class(TForm)
    ACBrValidador1: TACBrValidador;
  private
    { Private declarations }
  public
    { Public declarations }
   function TEditCNPJ_Valido(pCNPJ:TEdit):Boolean;
   function TEditCPF_Valido(pCPF:TEdit):Boolean;
   function CNPJ_Valido(pCNPJ:String):Boolean;
   function CPF_Valido(pCPF:String):Boolean;
   function IE_Valida(pIE,pUF:String):Boolean;
   function SUFRAMA_Valido(pSUFRAMA:String):Boolean;
   function Email_Valido(pEmail:String):Boolean;
   function CEP_Valido(pCEP:String):Boolean;
   function formataTelCel(numtexto:String):String;
   function formatelefone(numtexto:String):String;
   function formacelular(numtexto:String):String;
   function percentualValido(pEdit:TEdit):Boolean;
end;

var
  frmValidadorDeDocumentos: TfrmValidadorDeDocumentos;
  vVDD_DocumentoFormatado : String;

implementation

{$R *.dfm}

uses funcoes;

{ TForm1 }

{
TIPOS DE DOCUMENTOS VALIDADOS
   docCPF,
   docCNPJ,           << Implementado
   docUF,
   docInscEst,        << Implementado
   docNumCheque,
   docPIS,
   docCEP,
   docCartaoCredito,
   docSuframa,        << Implementado
   docGTIN,
   docRenavam,
   docEmail,          << Implementado
   docCNH,
   docPrefixoGTIN,
   docCAEPF,
   docPlacaMercosul
}

function TfrmValidadorDeDocumentos.CEP_Valido(pCEP: String): Boolean;
begin
   result := false;
   ACBrValidador1.TipoDocto   := docCEP;
   ACBrValidador1.Documento   := pCEP;
   ACBrValidador1.Complemento := '';
   vVDD_DocumentoFormatado := ACBrValidador1.Formatar;
   ACBrValidador1.PermiteVazio:=true;
   if not ACBrValidador1.Validar then
   begin
     ShowMessage(ACBrValidador1.MsgErro);
     exit;
   end;
   result := true;
end;

function TfrmValidadorDeDocumentos.TEditCNPJ_Valido(pCNPJ:TEdit):Boolean;
begin
  result := CNPJ_Valido(pCNPJ.Text);
  if result then
     pCNPJ.Text := vVDD_DocumentoFormatado;
end;

function TfrmValidadorDeDocumentos.TEditCPF_Valido(pCPF:TEdit):Boolean;
begin
  result := CPF_Valido(pCPF.Text);
  if result then
     pCPF.Text := vVDD_DocumentoFormatado;
end;

function TfrmValidadorDeDocumentos.CNPJ_Valido(pCNPJ: String): Boolean;
begin
   if trim(pCNPJ) = '' then
   begin
      vVDD_DocumentoFormatado:='';
      result:=true;
      exit;
   end;
   result := false;
   pCNPJ := SoNumeros(pCNPJ);
   ACBrValidador1.TipoDocto := docCNPJ;
   ACBrValidador1.Documento := pCNPJ;
   vVDD_DocumentoFormatado := ACBrValidador1.Formatar;
   ACBrValidador1.PermiteVazio:=true;
   if not ACBrValidador1.Validar then
   begin
     ShowMessage(ACBrValidador1.MsgErro);
     exit;
   end;
   result := true;
end;

function TfrmValidadorDeDocumentos.CPF_Valido(pCPF: String): Boolean;
begin
   result := false;
   ACBrValidador1.TipoDocto := docCPF;
   ACBrValidador1.Documento := pCPF;
   vVDD_DocumentoFormatado := ACBrValidador1.Formatar;
   ACBrValidador1.PermiteVazio:=true;
   if not ACBrValidador1.Validar then
   begin
     ShowMessage(ACBrValidador1.MsgErro);
     exit;
   end;
   result := true;
end;

function TfrmValidadorDeDocumentos.Email_Valido(pEmail: String): Boolean;
begin
   result := false;
   ACBrValidador1.TipoDocto   := docEmail;
   ACBrValidador1.Documento   := pEmail;
   vVDD_DocumentoFormatado := ACBrValidador1.Formatar;
   ACBrValidador1.PermiteVazio:=true;
   if not ACBrValidador1.Validar then
   begin
     ShowMessage(ACBrValidador1.MsgErro);
     exit;
   end;
   result := true;
end;

function TfrmValidadorDeDocumentos.IE_Valida(pIE,pUF: String): Boolean;
begin
   result := false;
   ACBrValidador1.TipoDocto   := docInscEst;
   ACBrValidador1.Documento   := pIE;
   ACBrValidador1.Complemento := pUF;
   vVDD_DocumentoFormatado := ACBrValidador1.Formatar;
   ACBrValidador1.PermiteVazio:=true;
   if not ACBrValidador1.Validar then
   begin
     ShowMessage(ACBrValidador1.MsgErro);
     exit;
   end;
   result := true;
end;

function TfrmValidadorDeDocumentos.percentualValido(pEdit: TEdit): Boolean;
var vValor : Real;
begin
   result := true;
   if pEdit.Text = '' then exit;

   result := false;
   try
     vValor := strToFloat(mascToStr(pEdit.Text));
     if vValor < 0 then
     begin
       ShowMessage('Percentual deve ser positivo.');
       exit;
     end;
     if vValor > 100 then
     begin
       ShowMessage('Percentual deve ser menor que 100.');
       exit;
     end;
     pEdit.Text := FormatFloat('#,#0.00',vValor);
   except
     ShowMessage('Valor inválido.');
     exit;
   end;

   result := true;
end;

function TfrmValidadorDeDocumentos.SUFRAMA_Valido(pSUFRAMA: String): Boolean;
begin
   result := false;
   ACBrValidador1.TipoDocto   := docSuframa;
   ACBrValidador1.Documento   := pSUFRAMA;
   vVDD_DocumentoFormatado := ACBrValidador1.Formatar;
   ACBrValidador1.PermiteVazio:=true;
   if not ACBrValidador1.Validar then
   begin
     ShowMessage(ACBrValidador1.MsgErro);
     exit;
   end;
   result := true;
end;

function TfrmValidadorDeDocumentos.formataTelCel(numtexto: String): String;
begin
   result := '';
   numtexto := SoNumeros(trim(numtexto));
   if numtexto = '' then
      exit;

   if length(numtexto) < 10 then
   begin
     Result := '';
     ShowMessage('Número inválido');
     exit;
   end;

   if length(numtexto) = 10 then
       result := formaTelefone(numtexto)
   else
       result := formaCelular(numtexto);
end;

Function TfrmValidadorDeDocumentos.formaTelefone(numtexto:String):String;
begin
    numtexto := sonumeros(numtexto);
    if numtexto = '' then
    begin
       Result:='';
       exit;
    end;
    Delete(numtexto,ansipos('-',numtexto),1);  //Remove traço -
    Delete(numtexto,ansipos('-',numtexto),1);
    Delete(numtexto,ansipos('(',numtexto),1); //Remove parenteses  (
    Delete(numtexto,ansipos(')',numtexto),1); //Remove parenteses  )
    Result:=FormatmaskText('\(00\)0000\-0000;0;',numtexto); // Formata os numero
end;

Function TfrmValidadorDeDocumentos.formaCelular(numtexto:String):String;
begin
    numtexto := sonumeros(numtexto);
    Delete(numtexto,ansipos('-',numtexto),1);  //Remove traço -
    Delete(numtexto,ansipos('-',numtexto),1);
    Delete(numtexto,ansipos('(',numtexto),1); //Remove parenteses  (
    Delete(numtexto,ansipos(')',numtexto),1); //Remove parenteses  )
    Result:=FormatmaskText('\(00\)00000\-0000;0;',numtexto); // Formata os numero
end;

end.



