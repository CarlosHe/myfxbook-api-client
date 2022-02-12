unit MyfxbookApi.Builder.Login;

interface

uses
  MyfxbookApi.Contract.Builder.Login,
  MyfxbookApi.Contract.Entity.Login;

type
  TMyfxbookApiLoginBuilder = class(TInterfacedObject, IMyfxbookApiLoginBuilder)
  private
    { private declarations }
    FEmail: string;
    FPassword: string;
  protected
    { protected declarations }
  public
    { public declarations }
    function SetEmail(const AEmail: string): IMyfxbookApiLoginBuilder;
    function SetPassword(const APassword: string): IMyfxbookApiLoginBuilder;
    function Build: IMyfxbookApiLoginEntity;
    class function New: IMyfxbookApiLoginBuilder;
  end;

implementation

uses
  MyfxbookApi.Entity.Login;

{ TMyfxbookApiLoginBuilder }

function TMyfxbookApiLoginBuilder.Build: IMyfxbookApiLoginEntity;
begin
  Result := TMyfxbookApiLoginEntity.New(FEmail, FPassword);
end;

class function TMyfxbookApiLoginBuilder.New: IMyfxbookApiLoginBuilder;
begin
  Result := TMyfxbookApiLoginBuilder.Create;
end;

function TMyfxbookApiLoginBuilder.SetEmail(const AEmail: string): IMyfxbookApiLoginBuilder;
begin
  Result := Self;
  FEmail := AEmail;
end;

function TMyfxbookApiLoginBuilder.SetPassword(const APassword: string): IMyfxbookApiLoginBuilder;
begin
  Result := Self;
  FPassword := APassword;
end;

end.
