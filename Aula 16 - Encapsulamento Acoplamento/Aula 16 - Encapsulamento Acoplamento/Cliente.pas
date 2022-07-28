unit Cliente;

interface

uses
  System.Classes, Interfaces;

type
  TCliente = class
  public
    Nome: String;
    Telefone: String;
    Endereco: String;
    Cidade: String;
    UF: String;
    Saldo : Currency;
    Conexao : IConexao;
    constructor Create(aConexao : IConexao);
    procedure CadastrarCliente;
    procedure CriarFinanceiro;
  end;

implementation

uses
  System.SysUtils;

{ TCliente }

procedure TCliente.CadastrarCliente;
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

constructor TCliente.Create(aConexao : IConexao);
begin
  Conexao := aConexao;
  UF := 'RJ';
  Saldo := 1000;
end;

procedure TCliente.CriarFinanceiro;
var
  Lista : TStringList;
begin
  Lista := TStringList.Create;
  try
    Lista.Add('Nome:' + Nome);
    Lista.Add('Saldo:' + CurrToStr(Saldo));
    Lista.SaveToFile(Nome + '_Financeiro.txt');
  finally
    Lista.Free;
  end;
end;

end.
