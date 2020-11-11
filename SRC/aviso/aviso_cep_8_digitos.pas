unit aviso_cep_8_digitos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, cxButtons, dxSkinOffice2007Silver, dxSkinOffice2010Silver,
  dxSkinOffice2013White;

type
  Tfrm_aviso_cep_8_digitos = class(TForm)
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
  frm_aviso_cep_8_digitos: Tfrm_aviso_cep_8_digitos;

implementation

{$R *.dfm}

procedure Tfrm_aviso_cep_8_digitos.cxButton1Click(Sender: TObject);
begin
Close;
end;

end.
