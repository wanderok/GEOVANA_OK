//Verificado automaticamente em 16/06/2020 09:28
unit natureza_operacao_cfop_T43;
{
================================================================================
|   DATA   |DESENVOLVEDOR|HISTORICO DA ALTERACAO DO CODIGO                     |
|----------|-------------|-----------------------------------------------------|
|31/03/2020|WANDER       |Passou a tratar ESTADO = 'EXTERIOR'                  |
|        57|             |                                                     |
================================================================================
Tenha em mente que o CFOP define o pagamento de impostos sobre as mercadorias recebidas e transportadas em sua empresa. É formado por 4 dígitos e está relacionado à emissão de notas fiscais

Em resumo, o CFOP indica se há ou não recolhimento de impostos sobre produtos transportados e como isso deve ocorrer.

Um problema comum de quem trabalha com a compra de mercadorias é não conseguir cadastrar uma Nota Fiscal de Produto (NF-e) ou uma Nota Fiscal de Consumidor (NFC-e) no sistema de gestão. Certamente, os documentos recebidos pelo seu negócio terão o CFOP iniciando com 5, 6 ou 7, que indicam uma saída.

Não há nada de errado nisso, pois o fornecedor precisa informar a venda do produto. Por isso, você deve realizar uma operação de entrada, que começa 1, 2 ou 3.Em outras palavras, se você receber uma nota fiscal com o CFOP 5.101 (Venda de produção do estabelecimento), você deverá registrá-la com o CFOP 1.101 (Compra para industrialização ou produção rural).

https://enotas.com.br/blog/cfop/
}

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms,
  cxMemo, Vcl.StdCtrls, cxGroupBox, Vcl.Menus, cxButtons,
  Data.DB, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxDropDownEdit,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxRadioGroup, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxControls,
  cxContainer, cxEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, cxClasses, cxGridCustomView, cxMaskEdit, cxTextEdit,
  Vcl.DBCtrls, Vcl.ExtCtrls;

type
  Tfrm_natureza_operacao_cfop_T43 = class(TForm)
    SQL_NAT: TFDQuery;
    DS_NAT: TDataSource;
    grNatOP: TcxGroupBox;
    edFiltro: TEdit;
    gdNat: TcxGrid;
    tbView: TcxGridDBTableView;
    gdNatLevel1: TcxGridLevel;
    Label1: TLabel;
    SQL_NATCODIGO: TStringField;
    SQL_NATFORAESTADO: TStringField;
    SQL_NATES: TStringField;
    SQL_NATICMS: TStringField;
    SQL_NATNAT_TIPO: TStringField;
    SQL_NATDESCRICAO: TStringField;
    SQL_NATDESCRICAO2: TStringField;
    tbViewColumn1: TcxGridDBColumn;
    tbViewColumn2: TcxGridDBColumn;
    DBMemo1: TDBMemo;
    rgAbrangencia: TRadioGroup;
    rgFluxo: TRadioGroup;
    DBMemo2: TDBMemo;
    Label4: TLabel;
    cxGroupBox2: TcxGroupBox;
    Panel2: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFiltroChange(Sender: TObject);
    procedure rgAbrangenciaClick(Sender: TObject);
    procedure rgFluxoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

  private
    { Private declarations }
    procedure Pesquisar;
    procedure PegarCodigo;
  public
    { Public declarations }
  end;

var
  frm_natureza_operacao_cfop_T43: Tfrm_natureza_operacao_cfop_T43;
  T43_CODIGO: String;
implementation

{$R *.dfm}

procedure Tfrm_natureza_operacao_cfop_T43.PegarCodigo;
begin
   if not SQL_NAT.Active then
      exit;
   T43_CODIGO := SQL_NAT.FieldByName('CODIGO').AsString;
   Close;
end;

procedure Tfrm_natureza_operacao_cfop_T43.Pesquisar;
begin
  SQL_NAT.Close;
  SQL_NAT.sql.clear;
  SQL_NAT.sql.add('SELECT *                        ');
  SQL_NAT.sql.add('  FROM NATUREZADEOPERACAO_NATOP ');
  SQL_NAT.sql.add(' WHERE CODIGO = CODIGO          ');
  if edFiltro.text <> '' then
  begin
     SQL_NAT.sql.add(' AND (    (DESCRICAO  LIKE :FILTRO1) ');
     SQL_NAT.sql.add('       OR (DESCRICAO2 LIKE :FILTRO1) ');
     SQL_NAT.sql.add('       OR (CODIGO     LIKE :FILTRO1) ');
     SQL_NAT.sql.add('     )                               ');
     SQL_NAT.ParamByName('FILTRO1').AsString := '%'+edFiltro.text+'%';
  end;
  Case rgAbrangencia.ItemIndex of
    1 : begin
           Case rgFluxo.ItemIndex of
             0 : begin
                     SQL_NAT.sql.add(' AND ( (CODIGO LIKE :p1) OR (CODIGO LIKE :p2) )');
                     SQL_NAT.ParamByName('p1').AsString := '1%';
                     SQL_NAT.ParamByName('p2').AsString := '5%';
                  end;
              1 : begin
                     SQL_NAT.sql.add(' AND CODIGO LIKE :p1');
                     SQL_NAT.ParamByName('p1').AsString := '1%';
                  end;
              2 : begin
                     SQL_NAT.sql.add(' AND CODIGO LIKE :p1');
                     SQL_NAT.ParamByName('p1').AsString := '5%';
                  end;
           End;
        end;
    2 : begin
           Case rgFluxo.ItemIndex of
             0 : begin
                     SQL_NAT.sql.add(' AND ( (CODIGO LIKE :p1) OR (CODIGO LIKE :p2) )');
                     SQL_NAT.ParamByName('p1').AsString := '2%';
                     SQL_NAT.ParamByName('p2').AsString := '6%';
                  end;
              1 : begin
                     SQL_NAT.sql.add(' AND CODIGO LIKE :p1');
                     SQL_NAT.ParamByName('p1').AsString := '2%';
                  end;
              2 : begin
                     SQL_NAT.sql.add(' AND CODIGO LIKE :p1');
                     SQL_NAT.ParamByName('p1').AsString := '6%';
                  end;
           end;
        end;
    3 : begin
           Case rgFluxo.ItemIndex of
              0 : begin
                     SQL_NAT.sql.add(' AND ( (CODIGO LIKE :p1) OR (CODIGO LIKE :p2) )');
                     SQL_NAT.ParamByName('p1').AsString := '3%';
                     SQL_NAT.ParamByName('p2').AsString := '7%';
                  end;
              1 : begin
                     SQL_NAT.sql.add(' AND CODIGO LIKE :p1');
                     SQL_NAT.ParamByName('p1').AsString := '3%';
                  end;
              2 : begin
                     SQL_NAT.sql.add(' AND CODIGO LIKE :p1');
                     SQL_NAT.ParamByName('p1').AsString := '7%';
                  end;
           end;
        end;
    end;

  SQL_NAT.Open;
  //tbView.ViewData.Expand(true);
end;

procedure Tfrm_natureza_operacao_cfop_T43.rgAbrangenciaClick(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_natureza_operacao_cfop_T43.rgFluxoClick(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_natureza_operacao_cfop_T43.tbViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  PegarCodigo;
end;

procedure Tfrm_natureza_operacao_cfop_T43.edFiltroChange(Sender: TObject);
begin
   Pesquisar;
end;

procedure Tfrm_natureza_operacao_cfop_T43.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
  Self := nil;
end;

procedure Tfrm_natureza_operacao_cfop_T43.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_escape then
  begin
    close;
    exit;
  end;
  if Key = vk_Return then
  begin
     PegarCodigo;
  end;
end;

procedure Tfrm_natureza_operacao_cfop_T43.FormShow(Sender: TObject);
begin
   T43_CODIGO:='';
   edFiltro.SetFocus;
end;

end.
