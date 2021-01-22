//Verificado automaticamente em 16/06/2020 09:28
unit NCMSH_CEST_T44;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinOffice2013LightGray,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxContainer, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, cxTextEdit, cxMemo, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGrid, Vcl.Menus, cxButtons, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, cxGridDBTableView,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGroupBox, ACBrBase, ACBrEnterTab;

type
  Tfrm_NCMSH_CEST_T44 = class(TForm)
    Panel4: TPanel;
    cxButton6: TcxButton;
    SQL_CEST: TFDQuery;
    DS_CEST: TDataSource;
    gdNat: TcxGrid;
    tbView: TcxGridDBTableView;
    tbViewColumn1: TcxGridDBColumn;
    tbViewColumn2: TcxGridDBColumn;
    gdNatLevel1: TcxGridLevel;
    SQL_CESTCEST_CEST: TStringField;
    SQL_CESTCEST_NCM: TStringField;
    SQL_CESTCEST_DESCRICAO: TStringField;
    tbViewColumn3: TcxGridDBColumn;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edFiltro: TEdit;
    rgRelacionar: TRadioGroup;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    DataSource1: TDataSource;
    qRELACAO: TFDQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    pnRelacao: TPanel;
    Timer1: TTimer;
    bPesquisar: TcxButton;
    bSelecionar: TcxButton;
    Panel2: TPanel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure rgRelacionarClick(Sender: TObject);
    procedure SQL_CESTAfterScroll(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure edFiltroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFiltroKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bPesquisarClick(Sender: TObject);
    procedure bSelecionarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Pesquisar;
    procedure Relacionar;
    procedure ListarCESTsDoNCM;
    procedure ListarNCMsDoCEST;
    procedure Pegar_SQL_CEST;
    procedure Pegar_Relacao;

  public
    { Public declarations }
  end;

var
  frm_NCMSH_CEST_T44: Tfrm_NCMSH_CEST_T44;
  vPodeRelaciona:Boolean;
  T44_CEST_CEST,
  T44_CEST_NCM : String;

implementation

{$R *.dfm}

procedure Tfrm_NCMSH_CEST_T44.bPesquisarClick(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_NCMSH_CEST_T44.bSelecionarClick(Sender: TObject);
begin
   if SQL_CEST.Active then
   begin
      if qRelacao.eof then
         Pegar_SQL_CEST
      else
         Pegar_Relacao;
   end;
   Close;
end;

procedure Tfrm_NCMSH_CEST_T44.cxButton1Click(Sender: TObject);
begin
 If Application.MessageBox('Deseja baixar nova tabela?','Atualização de Tabela NCM | CEST',MB_YESNO +
                           MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
end;

procedure Tfrm_NCMSH_CEST_T44.cxButton2Click(Sender: TObject);
begin
 If Application.MessageBox('Deseja realizar a importação e atualização de NCM E CEST?','Atualização de Tabela NCM | CEST',MB_YESNO +
                           MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES Then
end;

procedure Tfrm_NCMSH_CEST_T44.cxButton6Click(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_NCMSH_CEST_T44.edFiltroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Timer1.Enabled:=false;
end;

procedure Tfrm_NCMSH_CEST_T44.edFiltroKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     Timer1.Enabled:=true;
end;

procedure Tfrm_NCMSH_CEST_T44.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
  self := nil;
end;

procedure Tfrm_NCMSH_CEST_T44.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
     if edFiltro.Focused then
     begin
         key := #0;
        Pesquisar;
        gdNat.SetFocus;
        exit;
     end;
   end;
end;

procedure Tfrm_NCMSH_CEST_T44.FormShow(Sender: TObject);
begin
   T44_CEST_CEST := '';
   T44_CEST_NCM  := '';
   vPodeRelaciona:=false;
   edFiltro.SetFocus;
end;

procedure Tfrm_NCMSH_CEST_T44.ListarCESTsDoNCM;
begin
   if not vPodeRelaciona then
      exit;

   pnRelacao.Caption := 'CESTs associados ao NCM/SH '+ SQL_CEST.FieldByName('CEST_NCM').AsString;
   qRelacao.Close;
   if SQL_CEST.FieldByName('CEST_NCM').AsString = '' then
      exit;
   qRelacao.sql.clear;
   qRelacao.sql.add('SELECT *                  ');
   qRelacao.sql.add('  FROM CEST_CEST          ');
   qRelacao.sql.add(' WHERE CEST_NCM = :FILTRO ');
   qRelacao.sql.add('   AND CEST_CEST <> ''''  ');
   qRelacao.ParamByName('FILTRO').AsString := SQL_CEST.FieldByName('CEST_NCM').AsString;
   qRelacao.sql.add('ORDER BY CEST_CEST, CEST_NCM');
   qRelacao.Open;
end;

procedure Tfrm_NCMSH_CEST_T44.ListarNCMsDoCEST;
begin
   if not vPodeRelaciona then
      exit;

   pnRelacao.Caption := 'NCM/SHs associados ao CEST '+ SQL_CEST.FieldByName('CEST_CEST').AsString;
   qRelacao.Close;
   if SQL_CEST.FieldByName('CEST_CEST').AsString = '' then
      exit;
   qRelacao.sql.clear;
   qRelacao.sql.add('SELECT *                  ');
   qRelacao.sql.add('  FROM CEST_CEST          ');
   qRelacao.sql.add(' WHERE CEST_CEST = :FILTRO');
   qRelacao.sql.add('   AND CEST_NCM  <> ''''  ');
   qRelacao.ParamByName('FILTRO').AsString := SQL_CEST.FieldByName('CEST_CEST').AsString;
   qRelacao.sql.add('ORDER BY CEST_CEST, CEST_NCM');
   qRelacao.Open;
end;

procedure Tfrm_NCMSH_CEST_T44.Pegar_Relacao;
begin
   T44_CEST_CEST := qRelacao.FieldByName('CEST_CEST').AsString;
   T44_CEST_NCM  := qRelacao.FieldByName('CEST_NCM' ).AsString;
end;

procedure Tfrm_NCMSH_CEST_T44.Pegar_SQL_CEST;
begin
   T44_CEST_CEST := SQL_CEST.FieldByName('CEST_CEST').AsString;
   T44_CEST_NCM  := SQL_CEST.FieldByName('CEST_NCM' ).AsString;
end;

procedure Tfrm_NCMSH_CEST_T44.Pesquisar;
begin
  if edFIltro.Text = '' then
     exit;
  Timer1.enabled := false;
  vPodeRelaciona := false;

  SQL_CEST.DisableControls;
  SQL_CEST.Close;
  SQL_CEST.sql.clear;
  SQL_CEST.sql.add('SELECT distinct              ');
  SQL_CEST.sql.add('       CEST_CEST,            ');
  SQL_CEST.sql.add('       CEST_NCM,             ');
  SQL_CEST.sql.add('       CEST_DESCRICAO        ');
  SQL_CEST.sql.add('  FROM CEST_CEST             ');
  SQL_CEST.sql.add(' WHERE CEST_CEST = CEST_CEST ');
  if edFiltro.text <> '' then
  begin
     SQL_CEST.sql.add(' AND (    (CEST_CEST      LIKE :FILTRO1) ');
     SQL_CEST.sql.add('       OR (CEST_NCM       LIKE :FILTRO1) ');
     SQL_CEST.sql.add('       OR (CEST_DESCRICAO LIKE :FILTRO1) ');
     SQL_CEST.sql.add('     )                                   ');
     SQL_CEST.ParamByName('FILTRO1').AsString := '%'+edFiltro.text+'%';
  end;
  SQL_CEST.sql.add('ORDER BY CEST_DESCRICAO');
  SQL_CEST.Open;
  vPodeRelaciona := true;
  Relacionar;
  SQL_CEST.EnableControls;
end;

procedure Tfrm_NCMSH_CEST_T44.Relacionar;
begin
   if not SQL_CEST.Active then
      exit;

   case rgRelacionar.ItemIndex of
      0 : ListarCESTsDoNCM;
      1 : ListarNCMsDoCEST;
   end;
end;

procedure Tfrm_NCMSH_CEST_T44.rgRelacionarClick(Sender: TObject);
begin
   Relacionar;
end;

procedure Tfrm_NCMSH_CEST_T44.SQL_CESTAfterScroll(DataSet: TDataSet);
begin
   Relacionar;
end;

procedure Tfrm_NCMSH_CEST_T44.Timer1Timer(Sender: TObject);
begin
  Pesquisar;
end;

end.
