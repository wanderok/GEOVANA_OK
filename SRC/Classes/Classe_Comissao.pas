unit Classe_Comissao;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,

     FuncoesSMC, TiposDeDados;

type

   TComissaoDeServico = class
   private
       FServico,
       FHoraTecnica : Real;
    function getFHoraTecnica: Real;
    function getFServico: Real;
    procedure setFHoraTecnica(const Value: Real);
    procedure setFServico(const Value: Real);
   public
       property Servico     : Real read getFServico     write setFServico;
       property HoraTecnica : Real read getFHoraTecnica write setFHoraTecnica;
   end;

   TComissaoDeVenda = class
   private
       FBalcao,
       FExterna: Real;
    function getFBalcao: Real;
    function getFExterna: Real;
    procedure setFBalcao(const Value: Real);
    procedure setFExterna(const Value: Real);
   public
       property Balcao  : Real read getFBalcao  write setFBalcao;
       property Externa : Real read getFExterna write setFExterna;
   end;

   TComissao = class
   private
       FTipoComissao : TTipoComissao;
       FCodigo       : String;
       FServico      : TComissaoDeServico;
       FVenda        : TComissaoDeVenda;
       FExiste       : Boolean;
    function getFCodigo: String;
    function getFTipoComissao: TTipoComissao;
    procedure setFCodigo(const Value: String);
    procedure setFTipoComissao(const Value: TTipoComissao);
    function getFExiste: Boolean;

    function Existe_Comissao_Para_o_Colaborador: Boolean;
    function Existe_Comissao_Para_o_Consultor  : Boolean;

    function Gravar_Comissao_De_Colaborador: Boolean;
    function Gravar_Comissao_De_Consultor  : Boolean;

   public
       constructor Create;
       destructor Destroy; override;
       property TipoComissao : TTipoComissao      read getFTipoComissao write setFTipoComissao;
       property Codigo       : String             read getFCodigo       write setFCodigo;
       property Servico      : TComissaoDeServico read FServico         write FServico;
       property Venda        : TComissaoDeVenda   read FVenda           write FVenda;
       property Existe       : Boolean            read getFExiste;
       function Gravar:Boolean;
   end;

implementation

var qComissao: TFDQuery;

{ TComissaoDeServico }

function TComissaoDeServico.getFHoraTecnica: Real;
begin
   Result := self.FHoraTecnica;
end;

function TComissaoDeServico.getFServico: Real;
begin
   Result := self.FServico;
end;

procedure TComissaoDeServico.setFHoraTecnica(const Value: Real);
begin
   self.FHoraTecnica := Value;
end;

procedure TComissaoDeServico.setFServico(const Value: Real);
begin
   self.FServico := Value;
end;

{ TComissaoDeVenda }

function TComissaoDeVenda.getFBalcao: Real;
begin
   result := self.FBalcao;
end;

function TComissaoDeVenda.getFExterna: Real;
begin
   result := self.FExterna;
end;

procedure TComissaoDeVenda.setFBalcao(const Value: Real);
begin
   self.FBalcao := Value;
end;

procedure TComissaoDeVenda.setFExterna(const Value: Real);
begin
   self.FExterna := Value;
end;

{ TComissao }

constructor TComissao.Create;
begin
   FServico  := TComissaoDeServico.Create;
   FVenda    := TComissaoDeVenda.Create;
   qComissao := TFDQuery.Create(nil);
   qComissao.ConnectionName :='X';
end;

destructor TComissao.Destroy;
begin
  FServico.Free;
  FVenda.Free;
  qComissao.Free;
  inherited;
end;

function TComissao.getFCodigo: String;
begin
  Result := self.FCodigo;
end;

function TComissao.getFExiste: Boolean;
begin
   Case self.FTipoComissao of
      tcColaborador : Result := Existe_Comissao_Para_o_Colaborador;
      tcConsultor   : Result := Existe_Comissao_Para_o_Consultor;
   End;
end;

function TComissao.Existe_Comissao_Para_o_Colaborador: Boolean;
begin
   qComissao.Close;
   qComissao.SQL.Clear;
   qComissao.SQL.Add('SELECT TOP 1 *                       ');
   qComissao.SQL.Add('  FROM COLABORADOR_COMISSAO_COLCOM   ');
   qComissao.SQL.Add(' WHERE COLCOM_CODIGO = :CODIGO       ');
   qComissao.SQL.Add(' ORDER BY COLCOM_DT DESC,            ');
   qComissao.SQL.Add('          COLCOM_HR DESC             ');
   qComissao.ParamByName('CODIGO').AsString := self.FCodigo;
   qComissao.Open;
   Result := not qComissao.Eof;
   if Result then
   begin
     Self.FServico.FServico     := qComissao.FieldByName('COLCOM_SERVICOS'   ).AsFloat;
     Self.FServico.FHoraTecnica := qComissao.FieldByName('COLCOM_HORATECNICA').AsFloat;
     Self.FVenda.FBalcao        := qComissao.FieldByName('COLCOM_BALCAO'     ).AsFloat;
     Self.FVenda.FExterna       := qComissao.FieldByName('COLCOM_EXTERNA'    ).AsFloat;
   end
   else
   begin
     Self.FServico.FServico     := 0;
     Self.FServico.FHoraTecnica := 0;
     Self.FVenda.FBalcao        := 0;
     Self.FVenda.FExterna       := 0;
   end;
end;

function TComissao.Existe_Comissao_Para_o_Consultor: Boolean;
begin
   qComissao.Close;
   qComissao.SQL.Clear;
   qComissao.SQL.Add('SELECT TOP 1 *                       ');
   qComissao.SQL.Add('  FROM CONSULTOR_COMISSAO_CONCOM     ');
   qComissao.SQL.Add(' WHERE CONCOM_CODIGO = :CODIGO       ');
   qComissao.SQL.Add(' ORDER BY CONCOM_DT DESC,            ');
   qComissao.SQL.Add('          CONCOM_HR DESC             ');
   qComissao.ParamByName('CODIGO').AsString := self.FCodigo;
   qComissao.Open;
   Result := not qComissao.Eof;
   if Result then
   begin
     Self.FServico.FServico     := qComissao.FieldByName('CONCOM_SERVICOS'   ).AsFloat;
     Self.FServico.FHoraTecnica := qComissao.FieldByName('CONCOM_HORATECNICA').AsFloat;
     Self.FVenda.FBalcao        := qComissao.FieldByName('CONCOM_BALCAO'     ).AsFloat;
     Self.FVenda.FExterna       := qComissao.FieldByName('CONCOM_EXTERNA'    ).AsFloat;
   end
   else
   begin
     Self.FServico.FServico     := 0;
     Self.FServico.FHoraTecnica := 0;
     Self.FVenda.FBalcao        := 0;
     Self.FVenda.FExterna       := 0;
   end;
end;

function TComissao.getFTipoComissao: TTipoComissao;
begin
   Result := self.FTipoComissao;
end;

function TComissao.Gravar: Boolean;
begin
   result := false;
   Case self.FTipoComissao of
      tcColaborador: result := Gravar_Comissao_De_Colaborador;
      tcConsultor  : result := Gravar_Comissao_De_Consultor;
   End;
end;

function TComissao.Gravar_Comissao_De_Colaborador: Boolean;
begin
  try
     qComissao.close;
     qComissao.sql.Clear;
     qComissao.sql.Add('INSERT INTO COLABORADOR_COMISSAO_COLCOM (      ');
     qComissao.sql.Add('       COLCOM_CODIGO,                          ');
     qComissao.sql.Add('       COLCOM_SERVICOS,                        ');
     qComissao.sql.Add('       COLCOM_HORATECNICA,                     ');
     qComissao.sql.Add('       COLCOM_BALCAO,                          ');
     qComissao.sql.Add('       COLCOM_EXTERNA,                         ');
     qComissao.sql.Add('       COLCOM_USU,                             ');
     qComissao.sql.Add('       COLCOM_DT,                              ');
     qComissao.sql.Add('       COLCOM_HR                               ');
     qComissao.sql.Add('       )                                       ');
     qComissao.sql.Add('VALUES (                                        ');
     qComissao.sql.Add('      :COLCOM_CODIGO,                          ');
     qComissao.sql.Add('      :COLCOM_SERVICOS,                        ');
     qComissao.sql.Add('      :COLCOM_HORATECNICA,                     ');
     qComissao.sql.Add('      :COLCOM_BALCAO,                          ');
     qComissao.sql.Add('      :COLCOM_EXTERNA,                         ');
     qComissao.sql.Add('      :COLCOM_USU,                             ');
     qComissao.sql.Add('      :COLCOM_DT,                              ');
     qComissao.sql.Add('      :COLCOM_HR                               ');
     qComissao.sql.Add('       )                                       ');
     qComissao.ParamByName('COLCOM_CODIGO'     ).AsString   := Self.FCodigo;
     qComissao.ParamByName('COLCOM_SERVICOS'   ).AsFloat    := Self.FServico.FServico;
     qComissao.ParamByName('COLCOM_HORATECNICA').AsFloat    := Self.FServico.FHoraTecnica;
     qComissao.ParamByName('COLCOM_BALCAO'     ).AsFloat    := Self.FVenda.FBalcao;
     qComissao.ParamByName('COLCOM_EXTERNA'    ).AsFloat    := Self.FVenda.FExterna;
     qComissao.ParamByName('COLCOM_USU'        ).AsString   := Usuario.Codigo;
     qComissao.ParamByName('COLCOM_DT'         ).AsDateTime := DataServidor;
     qComissao.ParamByName('COLCOM_HR'         ).AsString   := HoraServidor;
     qComissao.ExecSql;
     Log('Classe_Comissao','Definiu comissão do colaborador ');
     Result := True;
  except
     Result := False;
  end;
end;

function TComissao.Gravar_Comissao_De_Consultor: Boolean;
begin
 try
     qComissao.close;
     qComissao.sql.Clear;
     qComissao.sql.Add('INSERT INTO CONSULTOR_COMISSAO_CONCOM (        ');
     qComissao.sql.Add('       CONCOM_CODIGO,                          ');
     qComissao.sql.Add('       CONCOM_SERVICOS,                        ');
     qComissao.sql.Add('       CONCOM_HORATECNICA,                     ');
     qComissao.sql.Add('       CONCOM_BALCAO,                          ');
     qComissao.sql.Add('       CONCOM_EXTERNA,                         ');
     qComissao.sql.Add('       CONCOM_USU,                             ');
     qComissao.sql.Add('       CONCOM_DT,                              ');
     qComissao.sql.Add('       CONCOM_HR                               ');
     qComissao.sql.Add('       )                                       ');
     qComissao.sql.Add('VALUES (                                       ');
     qComissao.sql.Add('      :CONCOM_CODIGO,                          ');
     qComissao.sql.Add('      :CONCOM_SERVICOS,                        ');
     qComissao.sql.Add('      :CONCOM_HORATECNICA,                     ');
     qComissao.sql.Add('      :CONCOM_BALCAO,                          ');
     qComissao.sql.Add('      :CONCOM_EXTERNA,                         ');
     qComissao.sql.Add('      :CONCOM_USU,                             ');
     qComissao.sql.Add('      :CONCOM_DT,                              ');
     qComissao.sql.Add('      :CONCOM_HR                               ');
     qComissao.sql.Add('       )                                       ');
     qComissao.ParamByName('CONCOM_CODIGO'     ).AsString   := Self.FCodigo;
     qComissao.ParamByName('CONCOM_SERVICOS'   ).AsFloat    := Self.FServico.FServico;
     qComissao.ParamByName('CONCOM_HORATECNICA').AsFloat    := Self.FServico.FHoraTecnica;
     qComissao.ParamByName('CONCOM_BALCAO'     ).AsFloat    := Self.FVenda.FBalcao;
     qComissao.ParamByName('CONCOM_EXTERNA'    ).AsFloat    := Self.FVenda.FExterna;
     qComissao.ParamByName('CONCOM_USU'        ).AsString   := Usuario.Codigo;
     qComissao.ParamByName('CONCOM_DT'         ).AsDateTime := DataServidor;
     qComissao.ParamByName('CONCOM_HR'         ).AsString   := HoraServidor;
     qComissao.ExecSql;
     Log('Classe_Comissao','Definiu comissão do consultor ');
     Result := True;
  except
     Result := False;
  end;
end;

procedure TComissao.setFCodigo(const Value: String);
begin
   self.FCodigo := Value;
end;

procedure TComissao.setFTipoComissao(const Value: TTipoComissao);
begin
   Self.FTipoComissao := Value;
end;

end.
{
   begin
     qComissao.Close;
     qComissao.SQL.Clear;
     qComissao.SQL.Add('SELECT TOP 1 *                       ');
     qComissao.SQL.Add('  FROM COLABORADOR_COMISSAO_COLCOM   ');
     qComissao.SQL.Add(' WHERE COLCOM_CODIGO = :CODIGO       ');
     qComissao.SQL.Add(' ORDER COLCOM_DT DESC                ');
   end
   else
   if self.FTipoComissao = tcConsultor then
   begin
     qComissao.Close;
     qComissao.SQL.Clear;
     qComissao.SQL.Add('SELECT TOP 1 *                       ');
     qComissao.SQL.Add('  FROM CONSULTOR_COMISSAO_CONCOM     ');
     qComissao.SQL.Add(' WHERE CONCOM_CODIGO = :CODIGO       ');
     qComissao.SQL.Add(' ORDER CONCOM_DT DESC                ');
   end;
   qComissao.ParamByName('CODIGO').AsString := self.FCodigo;
   qComissao.Open;

   Result := not qComissao.Eof;
}
