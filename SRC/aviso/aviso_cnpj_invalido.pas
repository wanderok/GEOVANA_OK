unit aviso_cnpj_invalido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, cxButtons, dxSkinOffice2007Silver, dxSkinOffice2010Silver,
  dxSkinOffice2013White;

type
  Tfrm_aviso_cnpj_invalido = class(TForm)
    Image1: TImage;
    Label3: TLabel;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_aviso_cnpj_invalido: Tfrm_aviso_cnpj_invalido;

implementation

{$R *.dfm}

procedure Tfrm_aviso_cnpj_invalido.cxButton1Click(Sender: TObject);
begin
Close;
end;

end.
