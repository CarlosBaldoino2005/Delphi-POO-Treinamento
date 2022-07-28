unit Classe.Pessoa;

interface

uses
  System.Classes, Interfaces;

type
  TPessoa = class
  public
    Nome: String;
    Telefone: String;
    Endereco: String;
    Cidade: String;
    UF: String;
    Conexao : IConexao;
    Tipo : String;
    constructor Create(aConexao : IConexao); virtual;
    procedure Cadastrar;
    procedure CriarFinanceiro;
  end;

implementation

uses
  System.SysUtils;

{ TCliente }

procedure TPessoa.Cadastrar;
var
  Lista : TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome:' + Nome);
    Lista.Add('Telefone:' + Telefone);
    Lista.Add('Endere�o:' + Endereco);
    Lista.Add('Cidade:' + Cidade);
    Lista.Add('UF:' + UF);
    Lista.SaveToFile(Nome + '_Cliente.txt');
    Conexao.Gravar;
  finally
    Lista.Free;
  end;
end;

constructor TPessoa.Create(aConexao : IConexao);
begin
  Conexao := aConexao;
  UF := 'RJ';
end;

procedure TPessoa.CriarFinanceiro;
var
  Lista : TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome:' + Nome);
    Lista.SaveToFile(Nome + '_Financeiro.txt');
  finally
    Lista.Free;
  end;
end;

end.
