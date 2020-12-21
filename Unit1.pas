unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPFisica = class
  private
    FCPF: string;
    procedure SetCPF(const Value: string);
  published
    property CPF: string read FCPF write SetCPF;
  end;

  TPJuridica = class
  private
    FCNPJ: string;
    procedure SetCNPJ(const Value: string);
  published
    property CNPJ: string read FCNPJ write SetCNPJ;
  end;

  TPessoa<T:constructor> = class
  private
    FTipo: T;
    procedure SetTipo(const Value: T);

  published
    property Tipo: T read FTipo write SetTipo;

  public
    constructor Create;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TPJuridica }

procedure TPJuridica.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

{ TPFisica }

procedure TPFisica.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

{ TPessoa<T> }

constructor TPessoa<T>.Create;
begin
  FTipo := T.Create;
end;

procedure TPessoa<T>.SetTipo(const Value: T);
begin
  FTipo := Value;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  pf: TPessoa<TPFisica>;
begin
  try
    pf := TPessoa<TPFisica>.Create;
    pf.Tipo.CPF := '12324444';
  finally
    pf.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  pj: TPessoa<TPJuridica>;
begin
  try
    pj := TPessoa<TPJuridica>.Create;
    pj.Tipo.CNPJ := '234234234234';
  finally
    pj.Free;
  end;
end;

end.
