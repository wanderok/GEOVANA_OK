unit ConfigArquivosFiscaisSMC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmConfigArquivosFiscaisSMC = class(TForm)
    ColorBox1: TColorBox;
    Edit1: TEdit;
    procedure ColorBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigArquivosFiscaisSMC: TfrmConfigArquivosFiscaisSMC;

implementation

{$R *.dfm}

procedure TfrmConfigArquivosFiscaisSMC.ColorBox1Change(Sender: TObject);
begin
     edit1.text := ColorToString(colorbox1.Color);
end;

end.
