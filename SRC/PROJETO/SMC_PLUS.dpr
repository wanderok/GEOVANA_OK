program SMC_PLUS;

uses
  Vcl.Forms,
  main_smc in '..\..\src\main_smc.pas' {Frm_main},
  vw_Login_T1 in '..\..\src\views\Login\vw_Login_T1.pas' {frm_Login},
  alterar_senha in '..\..\src\views\Login\cad_usuario\alterar_senha.pas' {frm_alterar_senha},
  cad_usuario_T2 in '..\..\src\views\Login\cad_usuario\cad_usuario_T2.pas' {frm_cad_usuario_T2},
  senha_adm in '..\..\src\views\Login\cad_usuario\senha_adm.pas' {frm_senha_adm},
  senha_adm_permisoes in '..\..\src\views\Login\cad_usuario\senha_adm_permisoes.pas' {frm_adm_libera},
  Classe_Acesso in '..\..\src\Classes\Classe_Acesso.pas',
  Dados in '..\..\src\DataModules\Dados.pas' {DM: TDataModule},
  Funcoes in '..\..\src\Funcoes\Funcoes.pas',
  Classe_Usuario in '..\..\src\Classes\Classe_Usuario.pas',
  Classe_VerificacaoInicial in '..\..\src\Classes\Classe_VerificacaoInicial.pas',
  TiposDeDados in '..\..\src\TiposDeDados\TiposDeDados.pas',
  Email in '..\..\src\EnviarEmail\Email.pas' {frmEmail},
  Classe_Empresa in '..\..\src\Classes\Classe_Empresa.pas',
  cad_bairro in '..\..\src\views\cad_bairro\cad_bairro.pas' {frm_cad_bairro},
  cad_cliente_T6 in '..\..\src\views\cad_clientes\cad_cliente_T6.pas' {frm_cad_cliente_T6},
  cad_comissoes in '..\..\src\views\cad_colaborador\cad_comissoes.pas' {fmr_comissao_colab},
  cadastro_colaborador in '..\..\src\views\cad_colaborador\cadastro_colaborador.pas' {frm_colaborador},
  tipo_colab in '..\..\src\views\cad_colaborador\tipo_colab.pas' {Frm_tipo_colab},
  cad_consultor in '..\..\src\views\cad_consultor\cad_consultor.pas' {Frm_consultor},
  consultor_banco_comissoes in '..\..\src\views\cad_consultor\consultor_banco_comissoes.pas' {frm_consultor_comissoes_banco},
  cad_motorista in '..\..\src\views\cad_motorista\cad_motorista.pas' {Frm_motorista},
  cad_ramo_atividade in '..\..\src\views\cad_ramo_atividade\cad_ramo_atividade.pas' {FRM_cad_ramo_atividade},
  cad_regiao in '..\..\src\views\cad_regiao\cad_regiao.pas' {Frm_regiao},
  cad_transportadora in '..\..\src\views\cad_transportadora\cad_transportadora.pas' {Frm_transportadora},
  cad_zona in '..\..\src\views\cad_zona\cad_zona.pas' {FRM_cad_zona},
  cadastro_fornecedor in '..\..\src\views\cadastro_fornecedor\cadastro_fornecedor.pas' {Frm_fornecedor},
  config_certificado in '..\..\src\views\configs\config_certificado.pas' {frm_config_certificado},
  config_email in '..\..\src\views\configs\config_email.pas' {frm_config_email},
  config_mde in '..\..\src\views\configs\config_mde.pas' {Frm_Conf_mde},
  config_mdfe in '..\..\src\views\configs\config_mdfe.pas' {Frm_config_MDFe},
  config_nfce in '..\..\src\views\configs\config_nfce.pas' {Frm_Conf_Nfce},
  config_nfe in '..\..\src\views\configs\config_nfe.pas' {Frmconfig_NFe},
  config_nfs in '..\..\src\views\configs\config_nfs.pas' {frm_confi_nfs},
  email_arquivos_fiscais in '..\..\src\views\configs\email_arquivos_fiscais.pas' {frm_config_email_fiscais},
  integracao_outros_bancos in '..\..\src\views\configs\integracao_outros_bancos.pas' {frm_intagracao_outras_base_dados},
  MenuConfiguracaoNfeNFce in '..\..\src\views\configs\MenuConfiguracaoNfeNFce.pas' {frmMenuConfiguracaoNfeNFce},
  consulta_T7 in '..\..\src\views\Consulta_Cadastros\consulta_T7.pas' {frm_consulta_T7},
  ControleDeAcessos in '..\..\src\Controles\ControleDeAcessos\ControleDeAcessos.pas',
  LiberaAcesso in '..\..\src\Controles\ControleDeAcessos\LiberaAcesso.pas' {frmLiberaAcesso},
  cad_empresa_T3 in '..\..\SRC\views\cad_empresa\cad_empresa_T3.pas' {frm_cad_empresa_T3},
  U_Municipio_T5 in '..\..\src\views\consultar_municipio\U_Municipio_T5.pas' {Frm_Municipio_T5},
  vw_acesso_remoto in '..\..\src\views\Acesso_Remoto\vw_acesso_remoto.pas' {frm_acesso_remoto},
  Classe_TributacaoPIS in '..\..\src\Classes\Classe_TributacaoPIS.pas',
  Classe_EmpresaTributacao in '..\..\src\Classes\Classe_EmpresaTributacao.pas',
  Classe_TributacaoCOFINS in '..\..\SRC\Classes\Classe_TributacaoCOFINS.pas',
  Classe_TributacaoISS in '..\..\SRC\Classes\Classe_TributacaoISS.pas',
  ValidadorDeDocumentos in '..\..\src\Controles\ValidadorDeDocumentos\ValidadorDeDocumentos.pas' {frmValidadorDeDocumentos},
  reg_tributario_T4 in '..\..\src\views\configs\reg_tributario_T4.pas' {frm_reg_tributario_T4},
  Classe_Cliente in '..\..\src\Classes\Classe_Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_Login_T1, frm_Login_T1);
  Application.CreateForm(Tfrm_acesso_remoto, frm_acesso_remoto);
  Application.CreateForm(TfrmValidadorDeDocumentos, frmValidadorDeDocumentos);
  Application.CreateForm(Tfrm_reg_tributario_T4, frm_reg_tributario_T4);
  Application.Run;
end.
