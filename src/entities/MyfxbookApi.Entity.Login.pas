unit MyfxbookApi.Entity.Login;

interface

uses
  MyfxbookApi.Contract.Entity.Login;

type

  TMyfxbookApiLoginEntity = class(TInterfacedObject, IMyfxbookApiLoginEntity)
  private
    { private declarations }
    FEmail: string;
    FPassword: string;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(const AEmail: string; const APassword: string);
    function GetEmail: string;
    function GetPassword: string;
    class function New(const AEmail: string; const APassword: string): IMyfxbookApiLoginEntity;
  end;

implementation

{ TMyfxbookApiLoginEntity }

constructor TMyfxbookApiLoginEntity.Create(const AEmail, APassword: string);
begin
  FEmail := AEmail;
  FPassword := APassword;
end;

function TMyfxbookApiLoginEntity.GetEmail: string;
begin
  Result := FEmail;
end;

function TMyfxbookApiLoginEntity.GetPassword: string;
begin
  Result := FPassword;
end;

class function TMyfxbookApiLoginEntity.New(const AEmail, APassword: string): IMyfxbookApiLoginEntity;
begin
  Result := TMyfxbookApiLoginEntity.Create(AEmail, APassword);
end;

end.
