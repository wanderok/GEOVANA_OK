unit aviso_cpf_11_digitos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, cxButtons, dxSkinOffice2007Silver, dxSkinOffice2010Silver,
  dxSkinOffice2013White;

type
  Tfrm_aviso_cpf = class(TForm)
    Image1: TImage;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_aviso_cpf: Tfrm_aviso_cpf;

implementation

{$R *.dfm}

procedure Tfrm_aviso_cpf.cxButton1Click(Sender: TObject);
begin
Close;
end;

end.
