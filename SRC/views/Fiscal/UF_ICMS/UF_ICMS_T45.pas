unit UF_ICMS_T45;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  StdCtrls, ExtCtrls, Buttons, DadosSMC, Db, Grids, DBGrids, FuncoesSMC,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, 
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, 
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxGroupBox, Vcl.Menus, cxButtons, ACBrBase, ACBrEnterTab;

type
  Tfrm_UF_ICMS_T45 = class(TForm)
    Label1: TLabel;
    EditUF: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    Query: TFDQuery;
    DataSource1: TDataSource;
    edit1: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    cxGroupBox2: TcxGroupBox;
    bConfirma: TcxButton;
    bExclui: TcxButton;
    ACBrEnterTab1: TACBrEnterTab;
    Panel2: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure EditUFExit(Sender: TObject);
    procedure bConfirmaClick(Sender: TObject);
    procedure EditUFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure edit1Exit(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure LimpaTela;
    procedure habilita;
    procedure desabilita;
    procedure Atualiza_Lista_de_UFs;
    procedure Gravar;
    procedure Excluir;

  public
    { Public declarations }
  end;

var
  frm_UF_ICMS_T45: Tfrm_UF_ICMS_T45;

implementation

//uses
  //PesqICMS;

{$R *.DFM}

procedure Tfrm_UF_ICMS_T45.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #27 Then
        begin
           key := #0;
           if EditUF.Text <> '' Then
              Begin
                 LimpaTela;
                 Exit;
              End
           Else
               Close;
        end;


      if key = #13 then begin
          key := #0;
          Perform(Wm_NextDlgCtl,0,0);
      End;

end;

procedure Tfrm_UF_ICMS_T45.FormShow(Sender: TObject);
begin
//    Desabilita;
    Atualiza_Lista_de_UFs;
    EditUF.SetFocus;
end;

procedure Tfrm_UF_ICMS_T45.Gravar;
begin
     if Not fTemAcesso('CADICMS') Then
        Exit;

     try
        Edit2.Text := FormatFloat('#,##0.00',StrToFloat(Edit2.Text));
     except
        Avisos.Avisar('Valor inválido');
        Edit2.SetFocus;
        Exit;
     end;

     try
        Edit1.Text := FormatFloat('#,##0.00',StrToFloat(Edit1.Text));
     except
        Avisos.Avisar('Valor inválido');
        Edit1.SetFocus;
        Exit;
     end;

     Dm.Query1.Close;
     Dm.Query1.Sql.Clear;
     Dm.Query1.Sql.Add('DELETE FROM ICMSUF_IU WHERE ESTADO = :COD');
     Dm.Query1.ParamByName('COD').AsString := EditUF.Text;
     DM.Query1.ExecSql;

     Dm.Query1.Close;
     Dm.Query1.SQL.Clear;
     Dm.Query1.Sql.Add('INSERT INTO ICMSUF_IU');
     Dm.Query1.Sql.Add('(ESTADO,VALOR,ICMS_ALIQUOTA_NAO_CONTRIBUINTE,IU_CSOSN)    ');
     Dm.Query1.Sql.Add('VALUES            ');
     Dm.Query1.Sql.Add('(:ESTADO,:VALOR,:ICMS_ALIQUOTA_NAO_CONTRIBUINTE,:IU_CSOSN)  ');
     DM.Query1.ParamByName('ESTADO'   ).AsString := EditUF.Text;
     DM.Query1.ParamByName('VALOR'    ).AsFloat  := StrToFloat(MascToStr(Edit2.Text));
     DM.Query1.ParamByName('ICMS_ALIQUOTA_NAO_CONTRIBUINTE').AsFloat  := StrToFloat(MascToStr(Edit1.Text));
     DM.Query1.ParamByName('IU_CSOSN').AsString := ''; //edIU_CSOSN.Text;
     DM.Query1.ExecSql;
     LimpaTela;

     Atualiza_Lista_de_UFs;

     EditUF.Text := '';
     EditUF.SetFocus;
end;

procedure Tfrm_UF_ICMS_T45.EditUFExit(Sender: TObject);
begin
        DM.Query1.Close;
        DM.Query1.Sql.Clear;
        DM.Query1.Sql.Add('SELECT * FROM ICMSUF_IU ');
        DM.Query1.Sql.Add(' WHERE ESTADO = :COD ');
        DM.Query1.ParamByName('COD').AsString := EditUF.Text;
        DM.Query1.Open;
        Habilita;
        if DM.Query1.Eof Then
        Begin
           LimpaTela;
           Exit;
        End;
        Edit2.Text := FormatFloat('#,##0.00',DM.Query1.FieldByName('VALOR'                         ).AsFloat);
        Edit1.Text := FormatFloat('#,##0.00',DM.Query1.FieldByName('ICMS_ALIQUOTA_NAO_CONTRIBUINTE').AsFloat);
        //edIU_CSOSN.Text := DM.Query1.FieldByName('IU_CSOSN').AsString;

        bConfirma.Enabled := True;
        bExclui.Enabled := True;
end;

procedure Tfrm_UF_ICMS_T45.LimpaTela;
Var i : integer;
begin
    for i := 0 to (frm_UF_ICMS_T45.ComponentCount - 1) do
        if frm_UF_ICMS_T45.Components[i] is TEdit Then
           if ((frm_UF_ICMS_T45.Components[i]) as TEdit).Name <> 'EditUF' Then
              ((frm_UF_ICMS_T45.Components[i]) As TEdit).Text := '';
    bConfirma.Enabled := True;
    bExclui.Enabled := True;

    Atualiza_Lista_de_UFs;
end;

procedure Tfrm_UF_ICMS_T45.Habilita;
Var i : integer;
begin
    for i := 0 to (frm_UF_ICMS_T45.ComponentCount - 1) do
        if frm_UF_ICMS_T45.Components[i] is TEdit Then
           if ((frm_UF_ICMS_T45.Components[i]) as TEdit).Name <> 'EditUF' Then
              ((frm_UF_ICMS_T45.Components[i]) As TEdit).Enabled := True;
    bConfirma.Enabled := True;
    bExclui.Enabled := True;
end;

procedure Tfrm_UF_ICMS_T45.Desabilita;
Var i : integer;
begin
    for i := 0 to (frm_UF_ICMS_T45.ComponentCount - 1) do
        if frm_UF_ICMS_T45.Components[i] is TEdit Then
           if ((frm_UF_ICMS_T45.Components[i]) as TEdit).Name <> 'EditUF' Then
              ((frm_UF_ICMS_T45.Components[i]) As TEdit).Enabled := False;
    bConfirma.Enabled := False;
    bExclui.Enabled := False;
end;

procedure Tfrm_UF_ICMS_T45.Atualiza_Lista_de_UFs;
begin
     query.close;
     query.sql.clear;
     query.sql.add('select *         ');
     query.sql.add('  from ICMSUF_IU ');
     query.sql.add(' order by estado ');
     query.Open;
end;

procedure Tfrm_UF_ICMS_T45.bConfirmaClick(Sender: TObject);
begin
     Gravar;
end;

procedure Tfrm_UF_ICMS_T45.EditUFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
VAR ESTADO : STRING;
begin
{        if key = vk_f1 Then
           begin
              FrmPesqICMS := TFrmPesqICMS.Create(Self);
              FrmPesqICMS.ShowModal;
              ESTADO := vUF_ICMS;
              FrmPesqICMS.Free;
              EditUF.Text := ESTADO;
              if EditUF.Text <> '' Then
                 EditUFExit(Self);
           end;
}
end;

procedure Tfrm_UF_ICMS_T45.Excluir;
begin
     if Not fTemAcesso('EXCICMS') Then
        Exit;

     if application.MessageBox('Excluir ICMS ? ',
        'Exclusão de ICMS',MB_YESNO+MB_ICONINFORMATION+MB_DEFBUTTON1) = IDNO then
        Exit;

     Dm.Query1.Close;
     Dm.Query1.Sql.Clear;
     Dm.Query1.Sql.Add('DELETE FROM ICMSUF_IU WHERE ESTADO = :COD');
     Dm.Query1.ParamByName('COD').AsString := EditUF.Text;
     DM.Query1.ExecSql;
     LimpaTela;

     Atualiza_Lista_de_UFs;

     EditUF.Text := '';
     EditUF.SetFocus;
end;

procedure Tfrm_UF_ICMS_T45.BtnGravarClick(Sender: TObject);
begin
    Gravar;
end;

procedure Tfrm_UF_ICMS_T45.cxButton2Click(Sender: TObject);
begin
     Excluir;
end;

procedure Tfrm_UF_ICMS_T45.Edit2Exit(Sender: TObject);
begin
     try
        Edit2.Text := FormatFloat('#,##0.00',StrToFloat(Edit2.Text));
     except
        Avisos.Avisar('Valor inválido');
        Edit2.SetFocus;
        Exit;
     end;
end;

procedure Tfrm_UF_ICMS_T45.edit1Exit(Sender: TObject);
begin
     try
        Edit1.Text := FormatFloat('#,##0.00',StrToFloat(Edit1.Text));
     except
        Avisos.Avisar('Valor inválido');
        Edit1.SetFocus;
        Exit;
     end;
end;

end.

