unit MyfxbookApi.Exception.InvalidAccount;

interface

uses
  System.SysUtils,
  MyfxbookApi.Exception.Base;

type

  EMyfxbookApiInvalidAccount = class(EMyfxbookApiException)
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

{ EInvalidAccount }

constructor EMyfxbookApiInvalidAccount.Create;
begin
  Self.Message := 'Invalid account';
end;

initialization

TMyfxbookApiExceptionHandlerManager.DefaultManager.RegisterMyfxbookApiException('Invalid account.', EMyfxbookApiInvalidAccount);

end.
