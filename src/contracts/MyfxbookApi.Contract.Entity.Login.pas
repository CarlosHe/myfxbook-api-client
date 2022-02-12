unit MyfxbookApi.Contract.Entity.Login;

interface

type

  IMyfxbookApiLoginEntity = interface
    ['{E7F95393-33C3-4E19-B027-9895F5ECF21D}']
    /// <summary>Get user e-mail</summary>
    function GetEmail: string;
    /// <summary>Get user password</summary>
    function GetPassword: string;
  end;

implementation

end.
