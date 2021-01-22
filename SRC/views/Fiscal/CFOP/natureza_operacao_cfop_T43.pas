//Verificado automaticamente em 16/06/2020 09:28
unit natureza_operacao_cfop_T43;
{
================================================================================
|   DATA   |DESENVOLVEDOR|HISTORICO DA ALTERACAO DO CODIGO                     |
|----------|-------------|-----------------------------------------------------|
|31/03/2020|WANDER       |Passou a tratar ESTADO = 'EXTERIOR'                  |
|        57|             |                                                     |
================================================================================
Tenha em mente que o CFOP define o pagamento de impostos sobre as mercadorias recebidas e transportadas em sua empresa. � formado por 4 d�gitos e est� relacionado � emiss�o de notas fiscais

Em resumo, o CFOP indica se h� ou n�o recolhimento de impostos sobre produtos transportados e como isso deve ocorrer.

Um problema comum de quem trabalha com a compra de mercadorias � n�o conseguir cadastrar uma Nota Fiscal de Produto (NF-e) ou uma Nota Fiscal de Consumidor (NFC-e) no sistema de gest�o. Certamente, os documentos recebidos pelo seu neg�cio ter�o o CFOP iniciando com 5, 6 ou 7, que indicam uma sa�da.

N�o h� nada de errado nisso, pois o fornecedor precisa informar a venda do produto. Por isso, voc� deve realizar uma opera��o de entrada, que come�a 1, 2 ou 3.Em outras palavras, se voc� receber uma nota fiscal com o CFOP 5.101 (Venda de produ��o do estabelecimento), voc� dever� registr�-la com o CFOP 1.101 (Compra para industrializa��o ou produ��o rural).

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
    SQL_CFOP: TFDQuery;
    DS_CFOP: TDataSource;
    grNatOP: TcxGroupBox;
    edFiltro: TEdit;
    gdNat: TcxGrid;
    tbView: TcxGridDBTableView;
    gdNatLevel1: TcxGridLevel;
    Label1: TLabel;
    SQL_CFOPCODIGO: TStringField;
    SQL_CFOPFORAESTADO: TStringField;
    SQL_CFOPES: TStringField;
    SQL_CFOPICMS: TStringField;
    SQL_CFOPNAT_TIPO: TStringField;
    SQL_CFOPDESCRICAO: TStringField;
    SQL_CFOPDESCRICAO2: TStringField;
    tbViewColumn1: TcxGridDBColumn;
    tbViewColumn2: TcxGridDBColumn;
    DBMemo1: TDBMemo;
    lbNomeDaTela: TLabel;
    rgAbrangencia: TRadioGroup;
    rgFluxo: TRadioGroup;
    DBMemo2: TDBMemo;
    Label4: TLabel;
    cxGroupBox2: TcxGroupBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFiltroChange(Sender: TObject);
    procedure rgAbrangenciaClick(Sender: TObject);
    procedure rgFluxoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  frm_natureza_operacao_cfop_T43: Tfrm_natureza_operacao_cfop_T43;

implementation

{$R *.dfm}

procedure Tfrm_natureza_operacao_cfop_T43.Pesquisar;
begin
  SQL_CFOP.Close;
  SQL_CFOP.sql.clear;
  SQL_CFOP.sql.add('SELECT *                        ');
  SQL_CFOP.sql.add('  FROM NATUREZADEOPERACAO_NATOP ');
  SQL_CFOP.sql.add(' WHERE CODIGO = CODIGO          ');
  if edFiltro.text <> '' then
  begin
     SQL_CFOP.sql.add(' AND (    (DESCRICAO  LIKE :FILTRO1) ');
     SQL_CFOP.sql.add('       OR (DESCRICAO2 LIKE :FILTRO1) ');
     SQL_CFOP.sql.add('       OR (CODIGO     LIKE :FILTRO1) ');
     SQL_CFOP.sql.add('     )                               ');
     SQL_CFOP.ParamByName('FILTRO1').AsString := '%'+edFiltro.text+'%';
  end;
  Case rgAbrangencia.ItemIndex of
    1 : begin
           Case rgFluxo.ItemIndex of
             0 : begin
                     SQL_CFOP.sql.add(' AND ( (CODIGO LIKE :p1) OR (CODIGO LIKE :p2) )');
                     SQL_CFOP.ParamByName('p1').AsString := '1%';
                     SQL_CFOP.ParamByName('p2').AsString := '5%';
                  end;
              1 : begin
                     SQL_CFOP.sql.add(' AND CODIGO LIKE :p1');
                     SQL_CFOP.ParamByName('p1').AsString := '1%';
                  end;
              2 : begin
                     SQL_CFOP.sql.add(' AND CODIGO LIKE :p1');
                     SQL_CFOP.ParamByName('p1').AsString := '5%';
                  end;
           End;
        end;
    2 : begin
           Case rgFluxo.ItemIndex of
             0 : begin
                     SQL_CFOP.sql.add(' AND ( (CODIGO LIKE :p1) OR (CODIGO LIKE :p2) )');
                     SQL_CFOP.ParamByName('p1').AsString := '2%';
                     SQL_CFOP.ParamByName('p2').AsString := '6%';
                  end;
              1 : begin
                     SQL_CFOP.sql.add(' AND CODIGO LIKE :p1');
                     SQL_CFOP.ParamByName('p1').AsString := '2%';
                  end;
              2 : begin
                     SQL_CFOP.sql.add(' AND CODIGO LIKE :p1');
                     SQL_CFOP.ParamByName('p1').AsString := '6%';
                  end;
           end;
        end;
    3 : begin
           Case rgFluxo.ItemIndex of
              0 : begin
                     SQL_CFOP.sql.add(' AND ( (CODIGO LIKE :p1) OR (CODIGO LIKE :p2) )');
                     SQL_CFOP.ParamByName('p1').AsString := '3%';
                     SQL_CFOP.ParamByName('p2').AsString := '7%';
                  end;
              1 : begin
                     SQL_CFOP.sql.add(' AND CODIGO LIKE :p1');
                     SQL_CFOP.ParamByName('p1').AsString := '3%';
                  end;
              2 : begin
                     SQL_CFOP.sql.add(' AND CODIGO LIKE :p1');
                     SQL_CFOP.ParamByName('p1').AsString := '7%';
                  end;
           end;
        end;
    end;

  SQL_CFOP.Open;
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
    close;
end;

procedure Tfrm_natureza_operacao_cfop_T43.FormShow(Sender: TObject);
begin
   edFiltro.SetFocus;
end;

end.
