unit painel_SMC_T36;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tfrm_painel_SMC_T36 = class(TForm)
    Panel1: TPanel;
    bFinanceiro: TButton;
    bFiscal: TButton;
    lbNomeDaTela: TLabel;
    Panel2: TPanel;
    bComercial: TButton;
    procedure bFiscalClick(Sender: TObject);
    procedure bComercialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_painel_SMC_T36: Tfrm_painel_SMC_T36;

implementation

{$R *.dfm}

uses SMC_Fiscal_T37;

procedure Tfrm_painel_SMC_T36.bComercialClick(Sender: TObject);
begin
{
    frm_SMC_Fiscal_T37 := Tfrm_SMC_Fiscal_T37.Create(nil);
    frm_SMC_Fiscal_T37.showmodal;
    frm_SMC_Fiscal_T37.Free;
}
end;

procedure Tfrm_painel_SMC_T36.bFiscalClick(Sender: TObject);
begin
    frm_SMC_Fiscal_T37 := Tfrm_SMC_Fiscal_T37.Create(nil);
    frm_SMC_Fiscal_T37.showmodal;
    frm_SMC_Fiscal_T37.Free;
end;

end.
