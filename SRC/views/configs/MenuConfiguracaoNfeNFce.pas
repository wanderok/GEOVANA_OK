unit MenuConfiguracaoNfeNFce;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMenuConfiguracaoNfeNFce = class(TForm)
    Button1: TButton;
    Button2: TButton;
//    procedure Button2Click(Sender: TObject);
  //  procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuConfiguracaoNfeNFce: TfrmMenuConfiguracaoNfeNFce;

implementation

{$R *.dfm}

uses config_NFe_T32, config_nfce_T34;

{
procedure TfrmMenuConfiguracaoNfeNFce.Button1Click(Sender: TObject);
begin
  if not verificaaberta(Frmconfig_NFe_T32) then
  begin
    Frmconfig_NFe := TFrmconfig_nfe.Create(nil);
    Frmconfig_NFe.showmodal;
  end;
  close;
end;

procedure TfrmMenuConfiguracaoNfeNFce.Button2Click(Sender: TObject);
begin
  if not u_funcoes.verificaaberta(Frm_config_nfce_T34) then
  begin
    Frm_config_nfce_T34 := TFrm_config_nfce_T34.Create(nil);
    Frm_config_nfce_T34.showmodal;
  end;
  close;
end;               }

procedure TfrmMenuConfiguracaoNfeNFce.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
  self := nil;
end;

end.
