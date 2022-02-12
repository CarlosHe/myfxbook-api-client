unit MyfxbookApi.Exception.RequiredFieldsMissing;

interface

uses
  System.SysUtils,
  MyfxbookApi.Exception.Base;

type

  EMyfxbookApiRequiredFieldsMissing = class(EMyfxbookApiException)
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

{ ERequiredFieldsMissing }

constructor EMyfxbookApiRequiredFieldsMissing.Create;
begin
  Self.Message := 'Required fields missing';
end;

initialization

TMyfxbookApiExceptionHandlerManager.DefaultManager.RegisterMyfxbookApiException('Required fields missing.', EMyfxbookApiRequiredFieldsMissing);

end.
