unit Classe_Avisos;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option;
type
   TAvisos = class
   private
   public
      Procedure SenhaInvalida;
      Procedure CamposObrigatorios;
      Function  DesejaPreencherCamposSugeridos:Boolean;
      procedure Avisar(pFrase:String);
      procedure CertificadoDigital(pDtVence:TDateTime);
      procedure CNPJ_existente(pNome,pCodigo:String);
      procedure CPF_existente(pNome,pCodigo:String);
      procedure RG_existente(pNome,pCodigo:String);
      procedure IE_existente(pNome,pCodigo:String);
   end;

implementation

{ TAvisos }

uses aviso_senha_invalida,
     aviso_campos_obrigatorios,
     aviso_campos_sugeridos,
     aviso_certificado_digital,
     aviso_cnpj_existente,
     aviso_cpf_existente,
     aviso_ie_existente,
     aviso_rg_existente,

     Mensagem,
     DateUtils;

procedure TAvisos.Avisar(pFrase: String);
begin
   frm_Mensagem:= Tfrm_Mensagem.Create(nil);
   frm_Mensagem.memo1.lines.add(pFrase);
   frm_Mensagem.ShowModal;
   frm_Mensagem.Free;
end;

procedure TAvisos.CamposObrigatorios;
begin
   frm_campos_obrigatorios:= Tfrm_campos_obrigatorios.Create(nil);
   frm_campos_obrigatorios.ShowModal;
   frm_campos_obrigatorios.Free;
end;

procedure TAvisos.CertificadoDigital(pDtVence: TDateTime);
begin
   frm_aviso_certificado_vencido:= Tfrm_aviso_certificado_vencido.Create(nil);
   frm_aviso_certificado_vencido.lbDias.Caption := IntToStr(DaysBetween(Date,pDtVence))+ ' dias ';
   frm_aviso_certificado_vencido.lbData.Caption := '( '+DateToStr(pDtVence)+' )';
   frm_aviso_certificado_vencido.ShowModal;
   frm_aviso_certificado_vencido.Free;
end;

procedure TAvisos.CNPJ_existente(pNome, pCodigo: String);
begin
   frm_aviso_cnpj_existente:= Tfrm_aviso_cnpj_existente.Create(nil);
   frm_aviso_cnpj_existente.lbNome.Caption   := pNome;
   frm_aviso_cnpj_existente.lbCodigo.Caption := '( Código: ' + pCodigo + ' )';
   frm_aviso_cnpj_existente.ShowModal;
   frm_aviso_cnpj_existente.Free;
end;

procedure TAvisos.CPF_existente(pNome, pCodigo: String);
begin
   frm_aviso_cpf_existente:= Tfrm_aviso_cpf_existente.Create(nil);
   frm_aviso_cpf_existente.lbNome.Caption   := pNome;
   frm_aviso_cpf_existente.lbCodigo.Caption := '( Código: ' + pCodigo + ' )';
   frm_aviso_cpf_existente.ShowModal;
   frm_aviso_cpf_existente.Free;
end;

function TAvisos.DesejaPreencherCamposSugeridos: Boolean;
begin
   frm_aviso_campos_sugeridos:= Tfrm_aviso_campos_sugeridos.Create(nil);
   frm_aviso_campos_sugeridos.ShowModal;
   Result := vfrm_aviso_campos_sugeridosResposta;
   frm_aviso_campos_sugeridos.Free
end;

procedure TAvisos.IE_existente(pNome, pCodigo: String);
begin
   frm_aviso_ie_existente:= Tfrm_aviso_ie_existente.Create(nil);
   frm_aviso_ie_existente.lbNome.Caption   := pNome;
   frm_aviso_ie_existente.lbCodigo.Caption := '( Código: ' + pCodigo + ' )';
   frm_aviso_ie_existente.ShowModal;
   frm_aviso_ie_existente.Free;
end;

procedure TAvisos.RG_existente(pNome, pCodigo: String);
begin
   frm_aviso_rg_existente:= Tfrm_aviso_rg_existente.Create(nil);
   frm_aviso_rg_existente.lbNome.Caption   := pNome;
   frm_aviso_rg_existente.lbCodigo.Caption := '( Código: ' + pCodigo + ' )';
   frm_aviso_rg_existente.ShowModal;
   frm_aviso_rg_existente.Free;
end;

procedure TAvisos.SenhaInvalida;
begin
   frm_senha_invalida:= Tfrm_senha_invalida.Create(nil);
   frm_senha_invalida.ShowModal;
   frm_senha_invalida.Free;
end;

end.
