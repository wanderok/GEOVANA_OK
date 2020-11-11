//Verificado automaticamente em 16/06/2020 09:27
unit ConsultaCNPJ_T13;

interface

uses
  GraphicEx,
  pngimage,
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ACBrBase, ACBrSocket, ACBrConsultaCNPJ, JPEG, Mask, ACBrUtil;


type
  TfrmConsultaCNPJ_T13 = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditTipo: TEdit;
    EditRazaoSocial: TEdit;
    EditAbertura: TEdit;
    EditEndereco: TEdit;
    EditNumero: TEdit;
    EditComplemento: TEdit;
    EditBairro: TEdit;
    EditCidade: TEdit;
    EditUF: TEdit;
    EditCEP: TEdit;
    EditSituacao: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    ButBuscar: TBitBtn;
    EditCaptcha: TEdit;
    Label14: TLabel;
    Timer1: TTimer;
    EditFantasia: TEdit;
    Label13: TLabel;
    EditCNPJ: TMaskEdit;
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    ckRemoverEspacosDuplos: TCheckBox;
    ListCNAE2: TListBox;
    Label15: TLabel;
    EditCNAE1: TEdit;
    Label16: TLabel;
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure ButBuscarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditCaptchaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Buscar;
    procedure Aplicar;
  public
    { Public declarations }
  end;

var
  frmConsultaCNPJ_T13: TfrmConsultaCNPJ_T13;

implementation

{$R *.dfm}

procedure TfrmConsultaCNPJ_T13.ButBuscarClick(Sender: TObject);
begin
   if ButBuscar.Caption = 'Consultar' then
      Buscar
   else
      Aplicar;
end;

procedure TfrmConsultaCNPJ_T13.Aplicar;
begin
     Close;
end;

procedure TfrmConsultaCNPJ_T13.Buscar;
var
  I: Integer;
begin
  if EditCaptcha.Text <> '' then
  begin
    if ACBrConsultaCNPJ1.Consulta(
      EditCNPJ.Text,
      EditCaptcha.Text,
      ckRemoverEspacosDuplos.Checked)
    then
    begin
      EditTipo.Text        := ACBrConsultaCNPJ1.EmpresaTipo;
      EditRazaoSocial.Text := ACBrConsultaCNPJ1.RazaoSocial;
      EditAbertura.Text    := DateToStr( ACBrConsultaCNPJ1.Abertura );
      EditFantasia.Text    := ACBrConsultaCNPJ1.Fantasia;
      EditEndereco.Text    := ACBrConsultaCNPJ1.Endereco;
      EditNumero.Text      := ACBrConsultaCNPJ1.Numero;
      EditComplemento.Text := ACBrConsultaCNPJ1.Complemento;
      EditBairro.Text      := ACBrConsultaCNPJ1.Bairro;
      EditComplemento.Text := ACBrConsultaCNPJ1.Complemento;
      EditCidade.Text      := ACBrConsultaCNPJ1.Cidade;
      EditUF.Text          := ACBrConsultaCNPJ1.UF;
      EditCEP.Text         := ACBrConsultaCNPJ1.CEP;
      EditSituacao.Text    := ACBrConsultaCNPJ1.Situacao;
      EditCNAE1.Text       := ACBrConsultaCNPJ1.CNAE1;

      ListCNAE2.Clear;
      for I := 0 to ACBrConsultaCNPJ1.CNAE2.Count - 1 do
        ListCNAE2.Items.Add(ACBrConsultaCNPJ1.CNAE2[I]);

      ButBuscar.Caption := 'Aplicar';

    end;
  end
  else
  begin
    ShowMessage('É necessário digitar o captcha.');
    EditCaptcha.SetFocus;
  end;

end;

procedure TfrmConsultaCNPJ_T13.EditCaptchaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ButBuscarClick(ButBuscar);
end;

procedure TfrmConsultaCNPJ_T13.FormShow(Sender: TObject);
begin
  Timer1.Enabled:= True;
  EditCaptcha.SetFocus;
end;

procedure TfrmConsultaCNPJ_T13.LabAtualizarCaptchaClick(Sender: TObject);
{****************** substituir desta procedure na unit ACBrConsultaCNPJ;
procedure TACBrConsultaCNPJ.Captcha(Stream: TStream);
begin
  try
    //HTTPGet(CURL_CAPTCH);  // GetCaptchaURL
    HTTPGet('www.receita.fazenda.gov.br/Aplicacoes/ATCTA/CPF/captcha/gerarCaptcha.asp');
    if HttpSend.ResultCode = 200 then
    begin
      HTTPSend.Document.Position := 0;
      Stream.CopyFrom(HttpSend.Document, HttpSend.Document.Size);
      Stream.Position := 0;
    end;
  except
    on E: Exception do
      raise EACBrConsultaCNPJException.Create('Erro na hora de fazer o download da imagem do captcha.'+sLineBreak+E.Message);
  end;
end;
//******************************************************}var
  Stream: TMemoryStream;
  ImgArq: String;
  Picture: TPicture;
begin
  Stream := TMemoryStream.Create;
  Picture := TPicture.Create;
  try

    ACBrConsultaCNPJ1.Captcha(Stream);
    Picture.LoadFromStream(Stream);
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Image1.Picture.LoadFromStream(Stream);
    Image1.Picture.Assign(Picture);
    EditCaptcha.Clear;
    EditCaptcha.SetFocus;
  finally
    Stream.Free;
    Picture.Free;
  end;
end;

procedure TfrmConsultaCNPJ_T13.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
  EditCNPJ.SetFocus;
end;

end.

// 00.000.000/0000-00;1;_
