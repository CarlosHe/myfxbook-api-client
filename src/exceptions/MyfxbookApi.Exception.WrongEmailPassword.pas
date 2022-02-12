unit MyfxbookApi.Exception.WrongEmailPassword;

interface

uses
  System.SysUtils,
  MyfxbookApi.Exception.Base;

type

  EMyfxbookApiWrongEmailPassword = class(EMyfxbookApiException)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create; override;
  end;

implementation

uses
  MyfxbookApi.Singleton.ExceptionHandlerManager;

{ EWrongEmailPassword }

constructor EMyfxbookApiWrongEmailPassword.Create;
begin
  Self.Message := 'Wrong email/password';
end;

initialization

TMyfxbookApiExceptionHandlerManager.DefaultManager.RegisterMyfxbookApiException('Wrong email/password.', EMyfxbookApiWrongEmailPassword);

end.
