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
  DadosSMC in '..\..\SRC\DataModules\DadosSMC.pas' {DM: TDataModule},
  FuncoesSMC in '..\..\SRC\Funcoes\FuncoesSMC.pas',
  Classe_Usuario in '..\..\src\Classes\Classe_Usuario.pas',
  Classe_VerificacaoInicial in '..\..\src\Classes\Classe_VerificacaoInicial.pas',
  TiposDeDados in '..\..\src\TiposDeDados\TiposDeDados.pas',
  Email in '..\..\src\EnviarEmail\Email.pas' {frmEmail},
  Classe_Empresa in '..\..\src\Classes\Classe_Empresa.pas',
  PesquisaF1_T16 in '..\..\SRC\views\Consulta_Cadastros\PesquisaF1_T16.pas' {frm_PesquisaF1_T16},
  cad_comissoes_T30 in '..\..\src\views\cad_colaborador\cad_comissoes_T30.pas' {frm_cad_comissoes_T30},
  tipo_colaborador_T8 in '..\..\SRC\views\cad_colaborador\tipo_colaborador_T8.pas' {Frm_tipo_colaborador_T8},
  cad_ramo_atividade_T9 in '..\..\src\views\cad_ramo_atividade\cad_ramo_atividade_T9.pas' {frm_cad_ramo_atividade_T9},
  cad_regiao_T11 in '..\..\src\views\cad_regiao\cad_regiao_T11.pas' {frm_cad_regiao_T11},
  config_certificado_T33 in '..\..\SRC\views\configs\config_certificado_T33.pas' {frm_config_certificado_T33},
  config_email in '..\..\src\views\configs\config_email.pas' {frm_config_email},
  config_mde in '..\..\src\views\configs\config_mde.pas' {Frm_Conf_mde},
  config_mdfe in '..\..\src\views\configs\config_mdfe.pas' {Frm_config_MDFe},
  config_nfce_T34 in '..\..\SRC\views\configs\config_nfce_T34.pas' {Frm_config_nfce_T34},
  config_nfs in '..\..\src\views\configs\config_nfs.pas' {frm_confi_nfs},
  email_arquivos_fiscais in '..\..\src\views\configs\email_arquivos_fiscais.pas' {frm_config_email_fiscais},
  config_integracao_lojas_T42 in '..\..\SRC\views\configs\config_integracao_lojas_T42.pas' {frm_config_integracao_lojas_T42},
  MenuConfiguracaoNfeNFce in '..\..\src\views\configs\MenuConfiguracaoNfeNFce.pas' {frmMenuConfiguracaoNfeNFce},
  consulta_T7 in '..\..\src\views\Consulta_Cadastros\consulta_T7.pas' {frm_consulta_T7},
  ControleDeAcessos in '..\..\src\Controles\ControleDeAcessos\ControleDeAcessos.pas',
  LiberaAcesso_T39 in '..\..\SRC\Controles\ControleDeAcessos\LiberaAcesso_T39.pas' {frmLiberaAcesso_T39},
  cad_empresa_T3 in '..\..\SRC\views\cad_empresa\cad_empresa_T3.pas' {frm_cad_empresa_T3},
  U_Municipio_T5 in '..\..\src\views\consultar_municipio\U_Municipio_T5.pas' {Frm_Municipio_T5},
  vw_acesso_remoto in '..\..\src\views\Acesso_Remoto\vw_acesso_remoto.pas' {frm_acesso_remoto},
  Classe_TributacaoPIS in '..\..\src\Classes\Classe_TributacaoPIS.pas',
  Classe_EmpresaTributacao in '..\..\src\Classes\Classe_EmpresaTributacao.pas',
  Classe_TributacaoCOFINS in '..\..\SRC\Classes\Classe_TributacaoCOFINS.pas',
  Classe_TributacaoISS in '..\..\SRC\Classes\Classe_TributacaoISS.pas',
  ValidadorDeDocumentos in '..\..\src\Controles\ValidadorDeDocumentos\ValidadorDeDocumentos.pas' {frmValidadorDeDocumentos},
  reg_tributario_T4 in '..\..\src\views\configs\reg_tributario_T4.pas' {frm_reg_tributario_T4},
  Classe_Alteracao in '..\..\src\Classes\Classe_Alteracao.pas',
  Classe_Endereco in '..\..\src\Classes\Classe_Endereco.pas',
  auditoria_T10 in '..\..\src\views\Auditoria\auditoria_T10.pas' {frm_auditoria_T10},
  Classe_Contato in '..\..\src\Classes\Classe_Contato.pas',
  cad_zona_T12 in '..\..\src\views\cad_zona\cad_zona_T12.pas' {frm_cad_zona_T12},
  ConsultaCNPJ_T13 in '..\..\src\views\Consulta_CNPJ\ConsultaCNPJ_T13.pas' {frmConsultaCNPJ_T13},
  ConsultaCPF_T14 in '..\..\src\views\Consulta_CPF\ConsultaCPF_T14.pas' {frmConsulta_CPFT14},
  FORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18 in '..\..\SRC\views\cad_fornecedores\FORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18.pas' {frmFORNECEDOR_HISTORICO_BLOQUEIOS_FHB_T18},
  Classe_Avisos in '..\..\src\Classes\Classe_Avisos.pas',
  Classe_Fornecedor in '..\..\src\Classes\Classe_Fornecedor.pas',
  Classe_Cliente in '..\..\src\Classes\Classe_Cliente.pas',
  cad_fornecedor_T19 in '..\..\SRC\views\cad_fornecedores\cad_fornecedor_T19.pas' {frm_cad_fornecedor_T19},
  Mensagem in '..\..\SRC\aviso\Mensagem.pas' {frm_Mensagem},
  aviso_campos_sugeridos in '..\..\src\aviso\aviso_campos_sugeridos.pas' {frm_aviso_campos_sugeridos},
  aviso_senha_invalida in '..\..\src\aviso\aviso_senha_invalida.pas' {frm_senha_invalida},
  aviso_campos_obrigatorios in '..\..\src\aviso\aviso_campos_obrigatorios.pas' {frm_campos_obrigatorios},
  aviso_certificado_digital in '..\..\src\aviso\aviso_certificado_digital.pas' {frm_aviso_certificado_vencido},
  aviso_ie_existente in '..\..\SRC\aviso\aviso_ie_existente.pas' {frm_aviso_ie_existente},
  aviso_cnpj_existente in '..\..\src\aviso\aviso_cnpj_existente.pas' {frm_aviso_cnpj_existente},
  aviso_rg_existente in '..\..\SRC\aviso\aviso_rg_existente.pas' {frm_aviso_rg_existente},
  aviso_cpf_existente in '..\..\src\aviso\aviso_cpf_existente.pas' {frm_aviso_cpf_existente},
  MostraMemo in '..\..\SRC\views\funcao\MostraMemo.pas' {frmMostraMemo},
  LimpaBaseDeDados in '..\..\src\Funcoes\LimpaBaseDeDados\LimpaBaseDeDados.pas' {FrmLimpaBaseDeDados},
  DadosNuvem in '..\..\src\DataModules\DadosNuvem.pas' {DMNuvem: TDataModule},
  Classe_Configuracoes in '..\..\src\Classes\Classe_Configuracoes.pas',
  Classe_Nuvem in '..\..\src\Classes\Classe_Nuvem.pas',
  cad_cliente_T6 in '..\..\src\views\cad_clientes\cad_cliente_T6.pas' {frm_cad_cliente_T6},
  CONSULTOR_HISTORICO_BLOQUEIOS_CHB_T23 in '..\..\SRC\views\cad_consultor\CONSULTOR_HISTORICO_BLOQUEIOS_CHB_T23.pas' {frmCONSULTOR_HISTORICO_BLOQUEIOS_CHB_T23},
  cad_colaborador_T20 in '..\..\src\views\cad_colaborador\cad_colaborador_T20.pas' {frm_cad_colaborador_T20},
  Classe_Consultor in '..\..\src\Classes\Classe_Consultor.pas',
  cad_transportadora_T28 in '..\..\SRC\views\cad_transportadora\cad_transportadora_T28.pas' {frm_cad_transportadora_T28},
  Classe_Colaborador in '..\..\src\Classes\Classe_Colaborador.pas',
  CLIENTE_HISTORICO_BLOQUEIOS_CHB_T17 in '..\..\src\views\cad_clientes\CLIENTE_HISTORICO_BLOQUEIOS_CHB_T17.pas' {frmCLIENTE_HISTORICO_BLOQUEIOS_CHB_T17},
  TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB_T29 in '..\..\SRC\views\cad_transportadora\TRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB_T29.pas' {frmTRANSPORTADORA_HISTORICO_BLOQUEIOS_TRAHB_T29},
  cad_consultor_T21 in '..\..\src\views\cad_consultor\cad_consultor_T21.pas' {frm_cad_consultor_T21},
  COLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22 in '..\..\src\views\cad_colaborador\COLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22.pas' {frmCOLABORADOR_HISTORICO_BLOQUEIOS_COLHB_T22},
  Classe_Contador in '..\..\src\Classes\Classe_Contador.pas',
  cad_contador_T24 in '..\..\src\views\cad_contador\cad_contador_T24.pas' {frm_cad_contador_T24},
  Classe_Motorista in '..\..\src\Classes\Classe_Motorista.pas',
  CONTADOR_HISTORICO_BLOQUEIOS_CONTHB_T25 in '..\..\src\views\cad_contador\CONTADOR_HISTORICO_BLOQUEIOS_CONTHB_T25.pas' {frmCONTADOR_HISTORICO_BLOQUEIOS_CONTHB_T25},
  cad_motorista_T26 in '..\..\src\views\cad_motorista\cad_motorista_T26.pas' {frm_cad_motorista_T26},
  Classe_Transportadora in '..\..\src\Classes\Classe_Transportadora.pas',
  MOTORISTA_HISTORICO_BLOQUEIOS_MOTHB_T27 in '..\..\src\views\cad_motorista\MOTORISTA_HISTORICO_BLOQUEIOS_MOTHB_T27.pas' {frmMOTORISTA_HISTORICO_BLOQUEIOS_MOTHB_T27},
  Classe_Comissao in '..\..\src\Classes\Classe_Comissao.pas',
  Consultor_Banco_Comissoes_T31 in '..\..\src\views\cad_consultor\Consultor_Banco_Comissoes_T31.pas' {frmConsultor_Banco_Comissoes_T31},
  Telas_Numeros in '..\..\src\Controles\Telas_Numeros.pas',
  config_nfe_T32 in '..\..\SRC\views\configs\config_nfe_T32.pas' {frmConfig_NFe_T32},
  cad_cliente_SMC_T35 in '..\..\src\views\cad_clientes\cad_cliente_SMC_T35.pas' {Frm_cad_cliente_SMC_T35},
  Classe_Colaborador_Tipo in '..\..\src\Classes\Classe_Colaborador_Tipo.pas',
  cad_marca in '..\..\SRC\views\cad_produto\cad_marca\cad_marca.pas' {Frm_Marca},
  cadastro_produto_T40 in '..\..\SRC\views\cad_produto\cadastro_produto_T40.pas' {frm_cadastro_produto_T40},
  painel_SMC_T36 in '..\..\src\views\SMC\painel_SMC_T36.pas' {frm_painel_SMC_T36},
  SMC_Fiscal_T37 in '..\..\src\views\SMC\SMC_Fiscal_T37.pas' {frm_SMC_Fiscal_T37},
  GraficoSistemasSMC in '..\..\SRC\views\SMC\GraficoSistemasSMC.pas' {frmGraficoSistemasSMC},
  GraficoProdutividadeSMC in '..\..\src\views\SMC\GraficoProdutividadeSMC.pas' {frmGraficoProdutividadeSMC},
  GraficoContadoresSMC in '..\..\src\views\SMC\GraficoContadoresSMC.pas' {frmGraficoContadoresSMC},
  ConfigArquivosFiscaisSMC in '..\..\src\views\SMC\ConfigArquivosFiscaisSMC.pas' {frmConfigArquivosFiscaisSMC},
  Classe_Produto in '..\..\src\Classes\Classe_Produto.pas',
  funcoes_T53 in '..\..\SRC\views\funcao\funcoes_T53.pas' {frm_funcoes_T53},
  CST_ICMS_T48 in '..\..\SRC\views\Fiscal\CST_ICMS\CST_ICMS_T48.pas' {frm_CST_ICMS_T48},
  OrigemDoProduto_T55 in '..\..\SRC\views\Fiscal\OrigemDoProduto\OrigemDoProduto_T55.pas' {frm_OrigemDoProduto_T55},
  UF_ICMS_T45 in '..\..\SRC\views\Fiscal\UF_ICMS\UF_ICMS_T45.pas' {frm_UF_ICMS_T45},
  natureza_operacao_cfop_T43 in '..\..\src\views\Fiscal\natureza_operacao\natureza_operacao_cfop_T43.pas' {frm_natureza_operacao_cfop_T43},
  CST_COFINS_T46 in '..\..\src\views\Fiscal\CST_COFINS\CST_COFINS_T46.pas' {frm_CST_COFINS_T46},
  CST_PIS_T47 in '..\..\src\views\Fiscal\CST_PIS\CST_PIS_T47.pas' {frm_CST_PIS_T47},
  cad_servico_T49 in '..\..\SRC\views\cad_servicos\cad_servico_T49.pas' {frm_cad_servico_T49},
  Classe_ContaContabil in '..\..\src\Classes\Classe_ContaContabil.pas',
  cad_ContaContabil_T50 in '..\..\src\views\Contabilidade\cad_ContaContabil\cad_ContaContabil_T50.pas' {frm_Cad_ContaContabil_T50},
  consulta_produto_T41 in '..\..\src\views\Consulta_Cadastros\consulta_produto_T41.pas' {frm_consulta_produto_T41},
  tributacao_produto_Combustivel_T62 in '..\..\SRC\views\cad_produto\fiscal\tributacao_produto_Combustivel_T62.pas' {frm_tributacao_produto_Combustivel_T62},
  ConsultaPlanoDeContas_T51 in '..\..\src\views\Consulta_Cadastros\ConsultaPlanoDeContas_T51.pas' {frm_ConsultaPlanoDeContas_T51},
  Acessos_T38 in '..\..\SRC\views\Acessos_Permissoes\Acessos_T38.pas' {frmAcessos_T38},
  NCMSH_CEST_T44 in '..\..\src\views\Fiscal\NCMSH_CEST\NCMSH_CEST_T44.pas' {frm_NCMSH_CEST_T44},
  CSOSN_T54 in '..\..\src\views\Fiscal\CSOSN\CSOSN_T54.pas' {frm_CSOSN_T54},
  CrescimentoDaBaseDeDados_T56 in '..\..\SRC\views\Auditoria\CrescimentoDaBaseDeDados_T56.pas' {FrmCrescimentoDaBaseDeDados_T56},
  AbreTelas in '..\..\SRC\Controles\AbreTelas.pas',
  tributacao_produto_ICMSST_T59 in '..\..\SRC\views\cad_produto\fiscal\tributacao_produto_ICMSST_T59.pas' {frm_tributacao_produto_ICMSST_T59},
  tributacao_produto_ICMS_T58 in '..\..\src\views\cad_produto\fiscal\tributacao_produto_ICMS_T58.pas' {frm_tributacao_produto_ICMS_T58},
  tributacao_produto_PIS_COFINS_T60 in '..\..\src\views\cad_produto\fiscal\tributacao_produto_PIS_COFINS_T60.pas' {frm_tributacao_produto_PIS_COFINS_T60},
  tributacao_produto_FCP_T61 in '..\..\src\views\cad_produto\fiscal\tributacao_produto_FCP_T61.pas' {frm_tributacao_produto_FCP_T61},
  tributacao_produto_CEST_NCM_T57 in '..\..\src\views\cad_produto\fiscal\tributacao_produto_CEST_NCM_T57.pas' {frm_tributacao_produto_CEST_NCM_T57},
  Grupo_Tributario_T63 in '..\..\SRC\views\cad_produto\fiscal\Grupo_Tributario_T63.pas' {frm_Grupo_Tributario_T63},
  tributacao_produto_T52 in '..\..\src\views\cad_produto\fiscal\tributacao_produto_T52.pas' {frm_tributacao_produto_T52};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_Login_T1, frm_Login_T1);
  Application.CreateForm(TfrmValidadorDeDocumentos, frmValidadorDeDocumentos);
  Application.CreateForm(TDMNuvem, DMNuvem);
  Application.Run;
end.
