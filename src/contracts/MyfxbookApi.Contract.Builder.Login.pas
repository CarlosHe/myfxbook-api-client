unit MyfxbookApi.Contract.Builder.Login;

interface

uses
  MyfxbookApi.Contract.Entity.Login;

type

  IMyfxbookApiLoginBuilder = interface
    ['{8BB64709-CC39-4690-940A-60AE19AA0A78}']
    /// <summary>Set user e-mail</summary>
    function SetEmail(const AEmail: string): IMyfxbookApiLoginBuilder;
    /// <summary>Set user password</summary>
    function SetPassword(const APassword: string): IMyfxbookApiLoginBuilder;
    /// <summary>Build login entity</summary>
    function Build: IMyfxbookApiLoginEntity;
  end;

implementation

end.
