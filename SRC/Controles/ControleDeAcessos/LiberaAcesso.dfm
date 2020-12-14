object frmLiberaAcesso: TfrmLiberaAcesso
  Left = 240
  Top = 164
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Usu'#225'rio e Senha para liberar fun'#231#227'o'
  ClientHeight = 252
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnSenhaPreco: TPanel
    Left = 0
    Top = 40
    Width = 376
    Height = 212
    Color = 8421440
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label75: TLabel
      Left = 54
      Top = 8
      Width = 273
      Height = 16
      Caption = 'Voc'#234' n'#227'o possui acesso a esta fun'#231#227'o.'
      Color = 8421440
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 56
      Top = 30
      Width = 258
      Height = 16
      Caption = 'Informe usu'#225'rio e senha com acesso.'
      Color = 8421440
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 5
      Top = 86
      Width = 55
      Height = 16
      Caption = 'Usu'#225'rio'
      Color = 8421440
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 13
      Top = 123
      Width = 45
      Height = 16
      Caption = 'Senha'
      Color = 8421440
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 292
      Top = 155
      Width = 43
      Height = 13
      Caption = 'Fun'#231#227'o'
      Color = 15254945
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 67
      Top = 63
      Width = 282
      Height = 13
      Caption = 'Ou passe o cart'#227'o magn'#233'tico do usu'#225'rio que possui acesso'
      Color = 8421440
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edUsuario: TEdit
      Left = 64
      Top = 78
      Width = 310
      Height = 37
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      OnExit = edUsuarioExit
    end
    object btSenhaPreco: TButton
      Left = 97
      Top = 155
      Width = 124
      Height = 56
      Caption = 'OK'
      TabOrder = 2
      OnClick = btSenhaPrecoClick
    end
    object edSenha: TEdit
      Left = 64
      Top = 115
      Width = 310
      Height = 37
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
    object edFuncao: TPanel
      Left = 251
      Top = 86
      Width = 63
      Height = 28
      Caption = '(invisivel)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object Panel1: TPanel
      Left = 251
      Top = 170
      Width = 122
      Height = 38
      BevelOuter = bvNone
      Caption = '00'
      Color = 15254945
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
    end
    object bPermissoes: TcxButton
      Left = 0
      Top = 154
      Width = 80
      Height = 57
      Caption = 'Permiss'#245'es'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'Metropolis'
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00030000000C0000001300000015000000150000001600000016000000170000
        00170000001800000018000000170000000F0000000400000000000000000000
        000B2C517EC33C6BACFF3967A7FF3762A2FF345E9EFF335999FF315595FF2E51
        90FF2C4D8CFF2A4A88FF2A4685FF1D305DC70000000F00000000000000000000
        000F4176B5FF8DDDFEFF52C9FEFF4AC4FEFF40BEFDFF44C2FDFF60CFFEFF55CC
        FEFF2BB3FCFF19A8FCFF12A4FBFF294786FF0000001500000000000000000000
        000E437BBBFFA1E5FFFF5ED0FFFF57CCFFFF4BAAD3FF405357FF3C5156FF55AD
        D3FF2DB6FFFF26B0FEFF1DA9FCFF2C4B8AFF0000001400000000000000000000
        000D4680C0FFB4EBFFFF6BD7FFFF63D4FFFF5BCFFFFF48707DFF436D7CFF55CA
        FFFF3ABCFFFF31B9FFFF28B2FCFF2E5090FF0000001300000000000000000000
        000B4884C5FFC5F2FFFF78DDFFFF70D8FFFF69D5FFFF57A3BFFF529FBFFF78D9
        FFFF47C4FFFF3FBFFFFF35BAFDFF305594FF0000001100000000000000000000
        000A4A88C8FFD4F6FFFF81E3FFFF7CDFFFFF74DCFFFF527177FF4F6F76FF7CDB
        FFFF54CBFFFF4CC7FFFF43BFFDFF335B9AFF0000000F00000000000000000000
        00084C8BCBFFE0F9FFFF8CE6FFFF85E4FFFF7EE1FFFF5F8C95FF5B8995FF69D8
        FFFF62D2FFFF5ACFFFFF4FC7FDFF36609FFF0000000E00000000000000000000
        00064C8CCCFFE7FBFFFFE4FAFFFFDFF9FFFFD8F7FFFFD1F4FFFFC8F2FFFFBFEE
        FFFFB4EBFFFFA8E7FFFF99E0FDFF3966A5FF0000000C00000000000000000000
        0003386897C44C8CCCFF4C8CCCFF4B8ACAFF4A87C7FF4884C4FF4681C0FF447D
        BCFF4279B9FF4075B4FF3E70B0FF2C507FC80000000700000000000000000000
        000100000012564B3EFFD0CCC8FF665B4EFF0000001B00000007000000080000
        001F726A5FFFB6AFA9FF4B3F30FF0000001C0000000200000000000000000000
        00000000000D5E5447F3D8D3CFFF6D6256FF16130F5600000008000000091713
        105A6F6557FFB6AEA5FF4B3F31F4000000150000000000000000000000000000
        000000000008585046CBB9B3ACFFA0988FFF3D352BBA1613105616130F583A31
        28BC91877DFF958C81FF3E352ACE0000000E0000000000000000000000000000
        000000000003211F1C4D999187FDC3BEB8FFA19990FF72675BFF6F6557FF9289
        7FFFACA59DFF766C60FE14110E53000000050000000000000000000000000000
        00000000000000000005433F3A839E958CFFBDB7B0FFD9D5D1FFD6D2CDFFAFA8
        A0FF7E7569FF2B261F890000000A000000010000000000000000000000000000
        000000000000000000010000000524211F4A5B554CB96B6256E75B5144E8453D
        34BA1815124E0000000800000001000000000000000000000000}
      OptionsImage.Layout = blGlyphTop
      TabOrder = 5
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = bPermissoesClick
    end
  end
  object pnUsuario: TPanel
    Left = 0
    Top = 0
    Width = 376
    Height = 41
    Caption = 'USU'#193'RIO'
    Color = 15254945
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
end
