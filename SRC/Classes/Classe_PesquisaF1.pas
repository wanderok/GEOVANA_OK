unit Classe_PesquisaF1;

interface

uses Classes, Dialogs, SysUtils, IniFiles,
     FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option;

Const
     _PESQUISA_DESCRICAO = 0;
     _PESQUISA_CHAVE     = 1;
type
   TPesquisaF1 = class
   private
       FFiltro,
       FTabela,
       FCodigo,
       FChave,
       FExiste,
       FDescricao          : String;
       FTipoPesquisa       : Integer;
       qLocal              : TFDQuery;
    function getCodigo: String;
    function Pesquisar:Boolean;
    function Pesquisar_ZONA_ZON:Boolean;
    function Existe:Boolean;
    function Update:Boolean;
    function Insert:Boolean;
    function ProximoCODIGO:String;
   public
      constructor Create;
      destructor Destroy; override;
      property Codigo     : String  read getCodigo;
      function ExisteDescricao(pTabela,pFiltro:String): Boolean;
      function ExisteCodigo(pTabela,pFiltro:String): Boolean;
      function Gravar:Boolean;
   end;

implementation

{ TPesquisaF1 }

constructor TPesquisaF1.Create;
begin
   qLocal := TFDQuery.Create(nil);
   qLocal.ConnectionName := 'X';
end;

destructor TPesquisaF1.Destroy;
begin
   qLocal.Free;
  inherited;
end;

function TPesquisaF1.getCodigo: String;
begin
   Result := FCodigo;
end;

function TPesquisaF1.Existe: Boolean;
begin
   if FTabela = 'ZONA_ZON' then result := Pesquisar_ZONA_ZON;
end;

function TPesquisaF1.ExisteCodigo(pTabela, pFiltro: String): Boolean;
begin
   FTabela       := pTabela;
   FFiltro       := UpperCase(Trim(pFiltro));
   FTipoPesquisa :=_PESQUISA_CHAVE;
   Result        := Existe;
end;

function TPesquisaF1.ExisteDescricao(pTabela, pFiltro: String): Boolean;
begin
   FTabela       := pTabela;
   FFiltro       := UpperCase(Trim(pFiltro));
   FTipoPesquisa :=_PESQUISA_DESCRICAO;
   Result        := Existe;
end;

function TPesquisaF1.Pesquisar: Boolean;
begin
   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('SELECT *             ');
   qLocal.Sql.Add('  FROM ' + FTabela    );
   case FTipoPesquisa of
      _PESQUISA_DESCRICAO:
      begin
         qLocal.Sql.Add(' WHERE ' + FChave + ' LIKE :ARGUMENTO');
         qLocal.Sql.Add(' ORDER BY ' + FChave);
         qLocal.ParamByName('ARGUMENTO').AsString := '%'+FFiltro+'%';
      end;
      _PESQUISA_CHAVE:
      begin
         qLocal.Sql.Add(' WHERE ' + FChave + ' = :ARGUMENTO');
         qLocal.ParamByName('ARGUMENTO').AsString := FFiltro;
      end;
   end;
   qLocal.Open;
   Result := not qLocal.Eof;
end;

function TPesquisaF1.Gravar;
begin
   result := false;

   if ExisteCodigo(FTabela, FFiltro)then
      result := Update
   else
      result := Insert;
end;

function TPesquisaF1.Insert: Boolean;
begin
   qLocal.Close;
   qLocal.SQL.Clear;
   qLocal.Sql.Add('INSERT INTO ' + FTabela);
   qLocal.Sql.Add('     ( '+ FCodigo      );
   qLocal.Sql.Add('       '+ FDescricao   );
   qLocal.Sql.Add('VALUES                ');
   qLocal.Sql.Add('     (:CODIGO,        ');
   qLocal.Sql.Add('      :DESCRICAO)     ');
   qLocal.ParamByName('CODIGO'   ).AsString := ProximoCODIGO;
   qLocal.ParamByName('DESCRICAO').AsString := FDescricao;
   qLocal.ExecSql;
end;

function TPesquisaF1.Pesquisar_ZONA_ZON: Boolean;
begin
   case FTipoPesquisa of
     _PESQUISA_DESCRICAO : FChave := 'ZON_DESCRICAO';
     _PESQUISA_CHAVE     : FChave := 'ZON_CODIGO';
   end;
   qLocal.Sql.Add(' WHERE ZON_DESCRICAO LIKE :ZON_DESCRICAO ');
   qLocal.Sql.Add(' ORDER BY ZON_DESCRICAO                  ');
   qLocal.ParamByName('ZON_DESCRICAO').AsString := '%'+FFiltro+'%';
   qLocal.Open;//
end;

function TPesquisaF1.ProximoCODIGO: String;
begin
//    if FTabela = 'ZONA_ZON' Then result := ProximoZON_CODIGO;
end;

function TPesquisaF1.Update: Boolean;
begin

end;

end.
