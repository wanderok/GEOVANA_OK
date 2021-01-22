unit AbreTelas;

interface

uses
   SMC_Fiscal_T37,
   Acessos_T38,
   cadastro_produto_T40,
   consulta_produto_T41,
   config_integracao_lojas_T42,
   natureza_operacao_cfop_T43,
   NCMSH_CEST_T44,
   UF_ICMS_T45,
   CST_COFINS_T46,
   CST_PIS_T47,
   CST_ICMS_T48,
   cad_servico_T49,
   cad_ContaContabil_T50,
   ConsultaPlanoDeContas_T51,
   CSOSN_T54,
   OrigemDoProduto_T55,
   CrescimentoDaBaseDeDados_T56;

procedure Abre_T37;
procedure Abre_T38;
procedure Abre_T40;
procedure Abre_T41;
procedure Abre_T42;
procedure Abre_T43;
procedure Abre_T44;
procedure Abre_T45;
procedure Abre_T46;
procedure Abre_T47;
procedure Abre_T48;
procedure Abre_T49;
procedure Abre_T50;
procedure Abre_T51;
procedure Abre_T54;
procedure Abre_T55;
procedure Abre_T56;

implementation

procedure Abre_T56;
begin
   frmCrescimentoDaBaseDeDados_T56 := TfrmCrescimentoDaBaseDeDados_T56.Create(nil);
   frmCrescimentoDaBaseDeDados_T56.showmodal;
   frmCrescimentoDaBaseDeDados_T56.Free;
end;

procedure Abre_T55;
begin
   frm_OrigemDoProduto_T55 := Tfrm_OrigemDoProduto_T55.Create(nil);
   frm_OrigemDoProduto_T55.showmodal;
   frm_OrigemDoProduto_T55.Free;
end;

procedure Abre_T54;
begin
   frm_CSOSN_T54 := Tfrm_CSOSN_T54.Create(nil);
   frm_CSOSN_T54.showmodal;
   frm_CSOSN_T54.Free;
end;

procedure Abre_T51;
begin
   frm_ConsultaPlanoDeContas_T51 := Tfrm_ConsultaPlanoDeContas_T51.Create(nil);
   frm_ConsultaPlanoDeContas_T51.ShowModal;
   frm_ConsultaPlanoDeContas_T51.Free;
end;

procedure Abre_T50;
begin
   frm_Cad_ContaContabil_T50 := Tfrm_Cad_ContaContabil_T50.Create(nil);
   frm_Cad_ContaContabil_T50.showmodal;
   frm_Cad_ContaContabil_T50.Free;
end;

procedure Abre_T49;
begin
   frm_cad_servico_T49 := Tfrm_cad_servico_T49.Create(nil);
   frm_cad_servico_T49.showmodal;
   frm_cad_servico_T49.Free;
end;

procedure Abre_T48;
begin
   frm_CST_ICMS_T48 := Tfrm_CST_ICMS_T48.Create(nil);
   frm_CST_ICMS_T48.showmodal;
   frm_CST_ICMS_T48.Free;
end;

procedure Abre_T47;
begin
   frm_CST_PIS_T47 := Tfrm_CST_PIS_T47.Create(nil);
   frm_CST_PIS_T47.showmodal;
   frm_CST_PIS_T47.Free;
end;

procedure Abre_T46;
begin
   frm_CST_COFINS_T46 := Tfrm_CST_COFINS_T46.Create(nil);
   frm_CST_COFINS_T46.showmodal;
   frm_CST_COFINS_T46.Free;
end;

procedure Abre_T45;
begin
    frm_UF_ICMS_T45 := Tfrm_UF_ICMS_T45.Create(nil);
    frm_UF_ICMS_T45.showmodal;
    frm_UF_ICMS_T45.Free;
end;

procedure Abre_T44;
begin
   frm_NCMSH_CEST_T44 := Tfrm_NCMSH_CEST_T44.Create(nil);
   frm_NCMSH_CEST_T44.ShowModal;
   frm_NCMSH_CEST_T44.Free;
end;

procedure Abre_T43;
begin
   frm_natureza_operacao_cfop_T43 := Tfrm_natureza_operacao_cfop_T43.Create(nil);
   frm_natureza_operacao_cfop_T43.ShowModal;
   frm_natureza_operacao_cfop_T43.Free;
end;

procedure Abre_T42;
begin
   frm_config_integracao_lojas_T42 := Tfrm_config_integracao_lojas_T42.Create(nil);
   frm_config_integracao_lojas_T42.ShowModal;
   frm_config_integracao_lojas_T42.Free;
end;

procedure Abre_T41;
begin
   frm_consulta_produto_T41 := Tfrm_consulta_produto_T41.Create(nil);
   frm_consulta_produto_T41.ShowModal;
   frm_consulta_produto_T41.Free;
end;

procedure Abre_T40;
begin
   frm_cadastro_produto_T40 := Tfrm_cadastro_produto_T40.Create(nil);
   frm_cadastro_produto_T40.showmodal;
   frm_cadastro_produto_T40.free;
end;

procedure Abre_T38;
begin
   frmAcessos_T38 := TfrmAcessos_T38.Create(nil);
   frmAcessos_T38.ShowModal;
   frmAcessos_T38.Free;
end;

procedure Abre_T37;
begin
   frm_SMC_Fiscal_T37 := Tfrm_SMC_Fiscal_T37.Create(nil);
   frm_SMC_Fiscal_T37.ShowModal;
   frm_SMC_Fiscal_T37.Free;
end;


end.
