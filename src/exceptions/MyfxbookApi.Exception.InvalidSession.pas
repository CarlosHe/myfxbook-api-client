unit MyfxbookApi.Exception.InvalidSession;

interface

uses
  System.SysUtils,
  MyfxbookApi.Exception.Base;

type

  EMyfxbookApiInvalidSession = class(EMyfxbookApiException)
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

{ EInvalidSession }

constructor EMyfxbookApiInvalidSession.Create;
begin
  Self.Message := 'Invalid session';
end;

initialization

TMyfxbookApiExceptionHandlerManager.DefaultManager.RegisterMyfxbookApiException('Invalid session.', EMyfxbookApiInvalidSession);

end.
