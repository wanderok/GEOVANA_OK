unit aviso_copia_seguranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  dxSkinsCore, cxButtons, cxControls, cxContainer, cxEdit, cxGroupBox;

type
  Tfrm_copia_seguranca = class(TForm)
    Image1: TImage;
    Label3: TLabel;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    cxButton1: TcxButton;
    Edit2: TEdit;
    cxButton3: TcxButton;
    Edit3: TEdit;
    cxButton4: TcxButton;
    Edit4: TEdit;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    Label6: TLabel;
    cxButton2: TcxButton;
    Label9: TLabel;
    cxButton7: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_copia_seguranca: Tfrm_copia_seguranca;

implementation

{$R *.dfm}

uses consulta_copia_seguranca;

procedure Tfrm_copia_seguranca.cxButton1Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_copia_seguranca.cxButton7Click(Sender: TObject);
begin
    frm_consulta_copia_seguranca := Tfrm_consulta_copia_seguranca.Create(nil);
    frm_consulta_copia_seguranca.showmodal;
end;

end.
