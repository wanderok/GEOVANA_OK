unit Classe_Nuvem;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Classe_Cliente,
  Classe_Configuracoes;

type
  TNuvem = class
  private
    FServidor    : String;
    FBancoDeDados: String;
    FPorta       : Integer;
    FUsuario     : String;
    FSenha       : String;
    FQuery       : TFDQuery;
    FCliente     : TCliente;
    FConfiguracao: TConfiguracao;
    procedure Abrir_configuracoes;
    function getBancoDeDados: String;
    function getPorta: Integer;
    function getSenha: String;
    function getServidor: String;
    function getUsuario: String;
    procedure setBancoDeDados(const Value: String);
    procedure setPorta(const Value: Integer);
    procedure setSenha(const Value: String);
    procedure setServidor(const Value: String);
    procedure setUsuario(const Value: String);
    function ClienteExisteNaNuvem:Boolean;
    procedure UpdateClienteNuvem;
    procedure InsertClienteNuvem;
   public
    constructor Create;
    destructor Destroy; override;
    property Servidor    : String  read getServidor     write setServidor;
    property BancoDeDados: String  read getBancoDeDados write setBancoDeDados;
    property Porta       : Integer read getPorta        write setPorta;
    property Usuario     : String  read getUsuario      write setUsuario;
    property Senha       : String  read getSenha        write setSenha;
    procedure GravarConfiguracoesNuvem;
    procedure uploadCliente(pCliente:TCliente);
  end;

implementation

{ TNuvem }

uses Funcoes,
     DadosNuvem,
     TiposDeDados;

procedure TNuvem.Abrir_configuracoes;
begin
    FQuery.close;
    FQuery.sql.clear;
    FQuery.sql.add('SELECT * FROM CONFIG_NUVEM_CFGN');
    FQuery.Open;

    FServidor    := DesCriptografar(FQuery.FieldByName('CFGN_SERVIDOR'    ).AsString);
    FBancoDeDados:= DesCriptografar(FQuery.FieldByName('CFGN_BANCODEDADOS').AsString);
    FPorta       :=                 FQuery.FieldByName('CFGN_PORTA'       ).AsInteger;
    FUsuario     := DesCriptografar(FQuery.FieldByName('CFGN_SERVIDOR'    ).AsString);
    FSenha       := DesCriptografar(FQuery.FieldByName('CFGN_SERVIDOR'    ).AsString);
end;

procedure TNuvem.UpdateClienteNuvem;
begin
   DMNuvem.Query1.close;
   DMNuvem.Query1.sql.clear;
   DMNuvem.Query1.sql.add('UPDATE CLIENTE_CLI                            ');
   DMNuvem.Query1.sql.add('   SET CLI_NOME_FANTASIA = :CLI_NOME_FANTASIA,');
   DMNuvem.Query1.sql.add('       CLI_RAZAO_SOCIAL  = :CLI_RAZAO_SOCIAL, ');
   DMNuvem.Query1.sql.add('       CLI_CELULAR       = :CLI_CELULAR,      ');
   DMNuvem.Query1.sql.add('       CLI_STATUS        = :CLI_STATUS        ');
   DMNuvem.Query1.sql.add(' WHERE CLI_CODIGO        = :CLI_CODIGO        ');
   DMNuvem.Query1.ParamByName('CLI_NOME_FANTASIA').AsString := FCliente.NomeFantasia;
   DMNuvem.Query1.ParamByName('CLI_RAZAO_SOCIAL' ).AsString := FCliente.RazaoSocial;
   DMNuvem.Query1.ParamByName('CLI_CELULAR'      ).AsString   := FCliente.Detalhes.Contato.Cel;
   DMNuvem.Query1.ParamByName('CLI_STATUS'       ).AsInteger:= StatusCadastralToInt(FCliente.Status);
   DMNuvem.Query1.ParamByName('CLI_CODIGO'       ).AsString := FCliente.Codigo;
   DMNuvem.Query1.ExecSql;
end;

function TNuvem.ClienteExisteNaNuvem: Boolean;
begin
   DMNuvem.Query1.close;
   DMNuvem.Query1.sql.clear;
   DMNuvem.Query1.sql.add('SELECT * FROM CLIENTE_CLI      ');
   DMNuvem.Query1.sql.add(' WHERE CLI_CODIGO = :CLI_CODIGO');
   DMNuvem.Query1.ParamByName('CLI_CODIGO').AsString := FCliente.Codigo;
   DMNuvem.Query1.Open;
   Result := (not DMNuvem.Query1.EOF);
end;

constructor TNuvem.Create;
begin
   FQuery := TFDQuery.Create(nil);
   FQuery.ConnectionName := 'X';
   FConfiguracao := TConfiguracao.Create;
end;

destructor TNuvem.Destroy;
begin
  FQuery.Free;
  FConfiguracao.Free;
  inherited;
end;

function TNuvem.getBancoDeDados: String;
begin
   Abrir_configuracoes;
   Result := self.FBancoDeDados;
end;

function TNuvem.getPorta: Integer;
begin
   Abrir_configuracoes;
   Result := self.Porta;
end;

function TNuvem.getSenha: String;
begin
   Abrir_configuracoes;
   Result := self.FSenha;
end;

function TNuvem.getServidor: String;
begin
   Abrir_configuracoes;
   Result := self.FServidor;
end;

function TNuvem.getUsuario: String;
begin
   Abrir_configuracoes;
   Result := self.FUsuario;
end;

procedure TNuvem.GravarConfiguracoesNuvem;
begin
   FQuery.ExecSql;
   FQuery.Close;
   FQuery.Sql.Clear;
   FQuery.Sql.Add('UPDATE CONFIG_NUVEM_CFGN                       ');
   FQuery.Sql.Add('   SET CFGN_SERVIDOR      = :CFGN_SERVIDOR,    ');
   FQuery.Sql.Add('       CFGN_BANCODEDADOS  = :CFGN_BANCODEDADOS,');
   FQuery.Sql.Add('       CFGN_PORTA         = :CFGN_PORTA,       ');
   FQuery.Sql.Add('       CFGN_USUARIO       = :CFGN_USUARIO,     ');
   FQuery.Sql.Add('       CFGN_SENHA         = :CFGN_SENHA        ');
   FQuery.ParamByName('CFGN_SERVIDOR'    ).AsString := Criptografar(FServidor);
   FQuery.ParamByName('CFGN_BANCODEDADOS').AsString := Criptografar(FBancoDeDados);
   FQuery.ParamByName('CFGN_PORTA'       ).AsInteger:= FPorta;
   FQuery.ParamByName('CFGN_USUARIO'     ).AsString := Criptografar(FUsuario);
   FQuery.ParamByName('CFGN_SENHA'       ).AsString := Criptografar(FSenha);
   FQuery.ExecSql;
   Abrir_configuracoes;
end;

procedure TNuvem.InsertClienteNuvem;
begin
   DMNuvem.Query1.Close;
   DMNuvem.Query1.SQL.Clear;
   DMNuvem.Query1.SQL.Add('INSERT INTO CLIENTE_CLI   ');
   DMNuvem.Query1.SQL.Add('     (                    ');
   DMNuvem.Query1.SQL.Add('       CLI_CODIGO,        ');
   DMNuvem.Query1.SQL.Add('       CLI_NOME_FANTASIA, ');
   DMNuvem.Query1.SQL.Add('       CLI_RAZAO_SOCIAL,  ');
   DMNuvem.Query1.SQL.Add('       CLI_STATUS,        ');
   DMNuvem.Query1.SQL.Add('       CLI_CELULAR        ');
   DMNuvem.Query1.SQL.Add('     )                    ');
   DMNuvem.Query1.SQL.Add('VALUES                    ');
   DMNuvem.Query1.SQL.Add('     (                    ');
   DMNuvem.Query1.SQL.Add('      :CLI_CODIGO,        ');
   DMNuvem.Query1.SQL.Add('      :CLI_NOME_FANTASIA, ');
   DMNuvem.Query1.SQL.Add('      :CLI_RAZAO_SOCIAL,  ');
   DMNuvem.Query1.SQL.Add('      :CLI_STATUS,        ');
   DMNuvem.Query1.SQL.Add('      :CLI_CELULAR        ');
   DMNuvem.Query1.SQL.Add('     )                    ');
   DMNuvem.Query1.ParamByName('CLI_CODIGO'       ).AsString   := FCliente.Codigo;
   DMNuvem.Query1.ParamByName('CLI_NOME_FANTASIA').AsString   := FCliente.NomeFantasia;
   DMNuvem.Query1.ParamByName('CLI_RAZAO_SOCIAL' ).AsString   := FCliente.RazaoSocial;
   DMNuvem.Query1.ParamByName('CLI_STATUS'       ).AsInteger  := StatusCadastralToInt(FCliente.Status);
   DMNuvem.Query1.ParamByName('CLI_CELULAR'      ).AsString   := FCliente.Detalhes.Contato.Cel;
   DMNuvem.Query1.ExecSql;
end;

procedure TNuvem.setBancoDeDados(const Value: String);
begin
   self.FSenha:=Value;
end;

procedure TNuvem.setPorta(const Value: Integer);
begin
   self.FPorta:=Value;
end;

procedure TNuvem.setSenha(const Value: String);
begin
   self.FSenha:=Value;
end;

procedure TNuvem.setServidor(const Value: String);
begin
   self.FServidor := Value;
end;

procedure TNuvem.setUsuario(const Value: String);
begin
   self.FUsuario := Value;
end;

procedure TNuvem.uploadCliente(pCliente: TCliente);
begin
 if not FConfiguracao.TrataNuvem then
    exit;

  FCliente := pCliente;
 if ClienteExisteNaNuvem then
    UpdateClienteNuvem
 else
    InsertClienteNuvem;
end;

end.
