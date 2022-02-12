unit MyfxbookApi.Exception.MaxLoginAttemptsReached;

interface

uses
  System.SysUtils,
  MyfxbookApi.Exception.Base;

type

  EMyfxbookApiMaxLoginAttemptsReached = class(EMyfxbookApiException)
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

{ EMaxLoginAttemptsReached }

constructor EMyfxbookApiMaxLoginAttemptsReached.Create;
begin
  Self.Message := 'Max login attempts reached. Please try again later';
end;

initialization

TMyfxbookApiExceptionHandlerManager.DefaultManager.RegisterMyfxbookApiException('Max login attempts reached. Please try again later.', EMyfxbookApiMaxLoginAttemptsReached);

end.
