unit MyfxbookApi.Singleton.ExceptionHandlerManager;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  MyfxbookApi.Exception.Base;

type

  TMyfxbookApiExceptionHandlerManager = class
  private
    { private declarations }
    FExceptClassCollection: TDictionary<string, EMyfxbookApiExceptionClass>;
    class var FMyfxbookApiExceptionHandlerManager: TMyfxbookApiExceptionHandlerManager;
  protected
    { protected declarations }
    class function GetDefaultManager: TMyfxbookApiExceptionHandlerManager; static;
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
    procedure Handler(const AErrorMessage: string);
    procedure RegisterMyfxbookApiException(const AErrorMessage: string; const AMyfxbookApiException: EMyfxbookApiExceptionClass);
    class destructor UnInitialize;
    class property DefaultManager: TMyfxbookApiExceptionHandlerManager read GetDefaultManager;
  end;

implementation

{ TMyfxbookApiExceptionHandlerManager }

constructor TMyfxbookApiExceptionHandlerManager.Create;
begin
  FExceptClassCollection := TDictionary<string, EMyfxbookApiExceptionClass>.Create;
end;

destructor TMyfxbookApiExceptionHandlerManager.Destroy;
begin
  FExceptClassCollection.Free;
  inherited;
end;

class function TMyfxbookApiExceptionHandlerManager.GetDefaultManager: TMyfxbookApiExceptionHandlerManager;
begin
  if FMyfxbookApiExceptionHandlerManager = nil then
    FMyfxbookApiExceptionHandlerManager := TMyfxbookApiExceptionHandlerManager.Create;
  Result := FMyfxbookApiExceptionHandlerManager;
end;

procedure TMyfxbookApiExceptionHandlerManager.Handler(const AErrorMessage: string);
var
  LExceptClass: EMyfxbookApiExceptionClass;
begin
  if not FExceptClassCollection.ContainsKey(AErrorMessage) then
    raise Exception.Create(Format('Unknown error occurred: %s', [AErrorMessage]));

  LExceptClass := FExceptClassCollection.Items[AErrorMessage];
  raise LExceptClass.Create;
end;

procedure TMyfxbookApiExceptionHandlerManager.RegisterMyfxbookApiException(const AErrorMessage: string; const AMyfxbookApiException: EMyfxbookApiExceptionClass);
begin
  FExceptClassCollection.Add(AErrorMessage, AMyfxbookApiException);
end;

class destructor TMyfxbookApiExceptionHandlerManager.UnInitialize;
begin
  FMyfxbookApiExceptionHandlerManager.Free;
end;

end.
