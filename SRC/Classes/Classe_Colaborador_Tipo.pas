unit Classe_Colaborador_Tipo;

interface

uses Classes, Dialogs, SysUtils, IniFiles, vcl.stdctrls,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option;

type
  tTipo_Colaborador = class
    private
       FExiste  : Boolean;
       FCodigo  : String;
       FNome    : String;
       FUsu     : String;
       FEstacao : String;
       FData    : TDateTime;
       FHora    : String;
       Query    : TFDQuery;
    function getFCodigo: String;
    procedure setFCodigo(const Value: String);
    function getFData: TDateTime;
    function getFHora: String;
    function getFNome: String;
    function getFUsu: String;
    procedure setFNome(const Value: String);
    function Insert:Boolean;
    function Inserir_TIPOCOLABORADOR_TPCOL:Boolean;
    function Update:Boolean;
    function Update_TIPOCOLABORADOR_TPCOL:Boolean;
    function  proximoCodigo:String;
    function getFExiste: Boolean;
    procedure LimparCampos;
    procedure Pegar_Dados_Basicos;
    function getFEstacao: String;
    function DadosCorretos:Boolean;
    public
      constructor Create;
      destructor Destroy; override;
       property Existe       : Boolean    read getFExiste;
       property Codigo       : String     read getFCodigo  write setFCodigo;
       property Nome         : String     read getFNome    write setFNome;
       property Usu          : String     read getFUsu;
       property Estacao      : String     read getFEstacao;
       property Data         : TDateTime  read getFData;
       property Hora         : String     read getFHora;
       procedure Abrir;
       function Gravar:Boolean;

  end;

implementation

uses FuncoesSMC;

{ tTipo_Colaborador }

procedure tTipo_Colaborador.Abrir;
begin
    LimparCampos;

    Pegar_Dados_Basicos;
    if not Existe then
       exit;
end;

constructor tTipo_Colaborador.Create;
begin
  Query := TFDQuery.Create(nil);
  Query.ConnectionName :='X';
end;

function tTipo_Colaborador.DadosCorretos: Boolean;
begin
    Result := False;
    // ...criticas...
    Result := True;
end;

destructor tTipo_Colaborador.Destroy;
begin
  Query.Free;
  inherited;
end;

function tTipo_Colaborador.getFCodigo: String;
begin
   Result := FCodigo;
end;

function tTipo_Colaborador.getFData: TDateTime;
begin
   result := FData;
end;

function tTipo_Colaborador.getFEstacao: String;
begin
  Result := FEstacao;
end;

function tTipo_Colaborador.getFExiste: Boolean;
begin
   Result := FExiste;
end;

function tTipo_Colaborador.getFHora: String;
begin
   result := FHora;
end;

function tTipo_Colaborador.getFNome: String;
begin
   result := FNome;
end;

function tTipo_Colaborador.getFUsu: String;
begin
   result := FUsu;
end;

function tTipo_Colaborador.Gravar:Boolean;
begin
   result := false;
   if not DadosCorretos then
      exit;

   if Existe then
   begin
      if not Update then
         exit;
   end
   else
      if not Insert then
         exit;
   result := true;
end;

function tTipo_Colaborador.Insert: Boolean;
begin
    result := False;
    if not Inserir_TIPOCOLABORADOR_TPCOL then exit;
    Result := True;
    Log('Classe_Colaborador_Tipo','Cadastrou tipo de colaborador ' + FCodigo + '-' + FNome);
end;

procedure tTipo_Colaborador.LimparCampos;
begin
   FExiste  := False;
   FCodigo  := '';
   FNome    := '';
   FUsu     := '';
   FData    := 0;
   FHora    := '';
end;

procedure tTipo_Colaborador.Pegar_Dados_Basicos;
begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT * FROM TIPOCOLABORADOR_TPCOL');
    Query.SQL.Add(' WHERE TPCOL_CODIGO = :TPCOL_CODIGO');
    Query.ParamByName('TPCOL_CODIGO').AsString := FCodigo;
    Query.Open;
    if Query.eof then
    begin
       FExiste:=False;
       exit;
    end;
    FExiste := True;
    FCodigo := Query.FieldByName('TPCOL_CODIGO' ).AsString;
    FNome   := Query.FieldByName('TPCOL_NOME'   ).AsString;
    FEstacao:= Query.FieldByName('TPCOL_ESTACAO').AsString;
    FUsu    := Query.FieldByName('TPCOL_USU'    ).AsString;
    FData   := Query.FieldByName('TPCOL_DT'     ).AsDateTime;
    FHora   := Query.FieldByName('TPCOL_HR'     ).AsString;
end;

function tTipo_Colaborador.proximoCodigo: String;
var qProximo: TFDQuery;
    vCodigoCandidato:Integer;
    sCodigoCandidato:String;
begin
    vCodigoCandidato := 1;
    sCodigoCandidato := '1';
    qProximo := TFDQuery.Create(nil);
    qProximo.ConnectionName :='X';
    qProximo.Close;
    qProximo.SQL.Clear;
    qProximo.SQL.Add('SELECT MAX(TPCOL_CODIGO) AS MAIOR');
    qProximo.SQL.Add('  FROM TIPOCOLABORADOR_TPCOL     ');
    qProximo.Open;
    if qProximo.eof then
    begin
      qProximo.Free;
      result := sCodigoCandidato;
      exit;
    end;
    try
      vCodigoCandidato := StrToInt(qProximo.FieldByName('MAIOR').AsString);
      vCodigoCandidato := vCodigoCandidato + 1;
      sCodigoCandidato := FormatFloat('#',vCodigoCandidato);
      result := sCodigoCandidato;
      qProximo.Free;
      exit;
    except
       vCodigoCandidato := 1;
       sCodigoCandidato := '1';
       qProximo.Close;
       qProximo.SQL.Clear;
       qProximo.SQL.Add('SELECT TPCOL_CODIGO                ');
       qProximo.SQL.Add('  FROM TIPOCOLABORADOR_TPCOL       ');
       qProximo.SQL.Add(' WHERE TPCOL_CODIGO = :TPCOL_CODIGO');
       qProximo.ParamByName('TPCOL_CODIGO').AsString := sCodigoCandidato;
       qProximo.Open;
       while not qProximo.Eof do
       begin
          qProximo.Close;
          inc(vCodigoCandidato);
          sCodigoCandidato := FormatFloat('#',vCodigoCandidato);
          qProximo.ParamByName('TPCOL_CODIGO').AsString := sCodigoCandidato;
          qProximo.Open;
       end;
       qProximo.Free;
       result := sCodigoCandidato;
       exit;
    end;
end;

function tTipo_Colaborador.Inserir_TIPOCOLABORADOR_TPCOL:Boolean;
begin
   result := false;
   try
       Query.close;
       Query.sql.Clear;
       Query.sql.Add('INSERT INTO TIPOCOLABORADOR_TPCOL (  ');
       Query.sql.Add('       TPCOL_CODIGO,                 ');
       Query.sql.Add('       TPCOL_NOME,                   ');
       Query.sql.Add('       TPCOL_USU,                    ');
       Query.sql.Add('       TPCOL_ESTACAO,                ');
       Query.sql.Add('       TPCOL_DT,                     ');
       Query.sql.Add('       TPCOL_HR                      ');
       Query.sql.Add(' )                                   ');
       Query.sql.Add('VALUES (                             ');
       Query.sql.Add('      :TPCOL_CODIGO,                 ');
       Query.sql.Add('      :TPCOL_NOME,                   ');
       Query.sql.Add('      :TPCOL_USU,                    ');
       Query.sql.Add('      :TPCOL_ESTACAO,                ');
       Query.sql.Add('      :TPCOL_DT,                     ');
       Query.sql.Add('      :TPCOL_HR                      ');
       Query.sql.Add(' )                                   ');
       Query.ParamByName('TPCOL_CODIGO' ).AsString  := self.FCodigo;
       Query.ParamByName('TPCOL_NOME'   ).AsString  := self.FNome;
       Query.ParamByName('TPCOL_USU'    ).AsString  := Usuario.Codigo;
       Query.ParamByName('TPCOL_ESTACAO').AsString  := NomeComputador;
       Query.ParamByName('TPCOL_DT'     ).AsDateTime:= DataServidor;
       Query.ParamByName('TPCOL_HR'     ).AsString  := HoraServidor;
       Query.ExecSql;
       result := true
    except
       Avisos.Avisar('Erro ao incluir Tipo de Colaborador ' + FNome);
       LOGErros('Classe_Colaborador_Tipo','Erro ao incluir Tipo de Colaborador ' + FNome);
    end;
end;

procedure tTipo_Colaborador.setFCodigo(const Value: String);
begin
   if Value = '' then
      FCodigo := Copy(proximoCodigo,1,10)
   else
      FCodigo := Copy(Value,1,10);
end;

procedure tTipo_Colaborador.setFNome(const Value: String);
begin
   FNome := Copy(Value,1,40);
end;

function tTipo_Colaborador.Update: Boolean;
begin
    result := False;
    if not Update_TIPOCOLABORADOR_TPCOL then exit;
    Result := True;
    Log('Classe_Colaborador_Tipo','Cadastrou tipo de colaborador ' + FCodigo + '-' + FNome);
end;

function tTipo_Colaborador.Update_TIPOCOLABORADOR_TPCOL: Boolean;
begin
    try
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('UPDATE TIPOCOLABORADOR_TPCOL           ');
        Query.SQL.Add('   SET TPCOL_NOME    = :TPCOL_NOME,    ');
        Query.SQL.Add('       TPCOL_USU     = :TPCOL_USU,     ');
        Query.SQL.Add('       TPCOL_ESTACAO = :TPCOL_ESTACAO, ');
        Query.SQL.Add('       TPCOL_DT      = :TPCOL_DT,      ');
        Query.SQL.Add('       TPCOL_HR      = :TPCOL_HR       ');
        Query.SQL.Add(' WHERE TPCOL_CODIGO  = :TPCOL_CODIGO   ');
        Query.ParamByName('TPCOL_CODIGO' ).AsString  := self.FCodigo;
        Query.ParamByName('TPCOL_NOME'   ).AsString  := self.FNome;
        Query.ParamByName('TPCOL_USU'    ).AsString  := Usuario.Codigo;
        Query.ParamByName('TPCOL_ESTACAO').AsString  := NomeComputador;
        Query.ParamByName('TPCOL_DT'     ).AsDateTime:= DataServidor;
        Query.ParamByName('TPCOL_HR'     ).AsString  := HoraServidor;
        Query.ExecSql;
        Log('Classe_Colaborador_Tipo','Alterou Tipo de Colaborador '+ FNome);
        Result := True;
    except
       Avisos.Avisar('Erro ao alterar Tipo de Colaborador '+ FNome);
       LogErros('Classe_Colaborador','Erro ao alterar Tipo de Colaborador '+ FNome);
    end;
end;

end.
