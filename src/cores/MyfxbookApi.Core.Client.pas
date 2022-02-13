unit MyfxbookApi.Core.Client;

interface

uses
  System.JSON,
  System.Net.URLClient,
  System.Generics.Collections,
  MyfxbookApi.Contract.Core.Client,
  MyfxbookApi.Contract.Entity.Login;

type

  TMyfxbookApiClient = class(TInterfacedObject, IMyfxbookApiClient)
  private
    { private declarations }
    FLogin: IMyfxbookApiLoginEntity;
    FSessionId: string;
  protected
    { protected declarations }
    /// <summary>Login to your account</summary>
    function Login(): TJSONObject;
    /// <summary>Log out of your account</summary>
    function Logout(): TJSONObject;
    function GetSessionId: string;
    function BuildURI(const AEndpoint: string; const AParams: TURIParameters): string;
    function MakeApiCall(const AEndpoint: string; const AParams: TURIParameters): TJSONObject;
  public
    constructor Create(const ALogin: IMyfxbookApiLoginEntity);
    function GetMyAccounts(): TJSONObject;
    function GetWatchedAccounts(): TJSONObject;
    function GetOpenOrders(const AId: UInt32): TJSONObject;
    function GetOpenTrades(const AId: UInt32): TJSONObject;
    function GetHistory(const AId: UInt32): TJSONObject;
    function GetDailyGain(const AId: UInt32; const AStart: string; const AEnd: string): TJSONObject;
    function GetGain(const AId: UInt32; const AStart: string; const AEnd: string): TJSONObject;
    function GetCommunityOutlook(): TJSONObject;
    function GetCommunityOutlookByCountry(ASymbol: string): TJSONObject;
    function GetDailyData(const AId: UInt32; const AStart: string; const AEnd: string): TJSONObject;
    class function New(const ALogin: IMyfxbookApiLoginEntity): IMyfxbookApiClient;
  end;

implementation

uses
  System.SysUtils,
  MyfxbookApi.Consts,
  MyfxbookApi.Contract.Provider.HTTPClient,
  MyfxbookApi.Resource,
  MyfxbookApi.Singleton.HTTPClientManager,
  MyfxbookApi.Singleton.ExceptionHandlerManager;

{ TMyfxbookApiClient }

function TMyfxbookApiClient.BuildURI(const AEndpoint: string; const AParams: TURIParameters): string;
var
  LURI: TURI;
  LParam: TURIParameter;
begin
  LURI := TURI.Create(API_ROOT_URL + '/' + AEndpoint + '.json');
  for LParam in AParams do
    LURI.AddParameter(LParam);
  Result := LURI.ToString;
end;

constructor TMyfxbookApiClient.Create(const ALogin: IMyfxbookApiLoginEntity);
begin
  FLogin := ALogin;
end;

function TMyfxbookApiClient.GetCommunityOutlook: TJSONObject;
begin
  Result := MakeApiCall('get-community-outlook', [
    TURIParameter.Create('session', GetSessionId)
    ]);
end;

function TMyfxbookApiClient.GetCommunityOutlookByCountry(ASymbol: string): TJSONObject;
begin
  Result := MakeApiCall('get-community-outlook-by-country', [
    TURIParameter.Create('session', GetSessionId),
    TURIParameter.Create('symbol', ASymbol)
    ]);
end;

function TMyfxbookApiClient.GetDailyData(const AId: UInt32; const AStart, AEnd: string): TJSONObject;
begin
  Result := MakeApiCall('get-data-daily', [
    TURIParameter.Create('session', GetSessionId),
    TURIParameter.Create('id', AId.ToString),
    TURIParameter.Create('start', AStart),
    TURIParameter.Create('end',  AEnd)
    ]);
end;

function TMyfxbookApiClient.GetDailyGain(const AId: UInt32; const AStart, AEnd: string): TJSONObject;
begin
  Result := MakeApiCall('get-daily-gain', [
    TURIParameter.Create('session', GetSessionId),
    TURIParameter.Create('id', AId.ToString),
    TURIParameter.Create('start', AStart),
    TURIParameter.Create('end',  AEnd)
    ]);
end;

function TMyfxbookApiClient.GetGain(const AId: UInt32; const AStart, AEnd: string): TJSONObject;
begin
  Result := MakeApiCall('get-gain', [
    TURIParameter.Create('session', GetSessionId),
    TURIParameter.Create('id', AId.ToString),
    TURIParameter.Create('start', AStart),
    TURIParameter.Create('end',  AEnd)
    ]);
end;

function TMyfxbookApiClient.GetHistory(const AId: UInt32): TJSONObject;
begin
  Result := MakeApiCall('get-history', [
    TURIParameter.Create('session', GetSessionId),
    TURIParameter.Create('id', AId.ToString)
    ]);
end;

function TMyfxbookApiClient.GetMyAccounts: TJSONObject;
begin
  Result := MakeApiCall('get-my-accounts', [
    TURIParameter.Create('session', GetSessionId)
    ]);
end;

function TMyfxbookApiClient.GetOpenOrders(const AId: UInt32): TJSONObject;
begin
  Result := MakeApiCall('get-open-orders', [
    TURIParameter.Create('session', GetSessionId),
    TURIParameter.Create('id', AId.ToString)
    ]);
end;

function TMyfxbookApiClient.GetOpenTrades(const AId: UInt32): TJSONObject;
begin
  Result := MakeApiCall('get-open-trades', [
    TURIParameter.Create('session', GetSessionId),
    TURIParameter.Create('id', AId.ToString)
    ]);
end;

function TMyfxbookApiClient.GetSessionId: string;
var
  LJSONObjectLogin: TJSONObject;
begin
  if not FSessionId.IsEmpty then
    Exit(FSessionId);
  LJSONObjectLogin := Login();
  try
    FSessionId := LJSONObjectLogin.GetValue<string>('session');
    Result := FSessionId;
  finally
    LJSONObjectLogin.Free;
  end;
end;

function TMyfxbookApiClient.GetWatchedAccounts: TJSONObject;
begin
  Result := MakeApiCall('get-watched-accounts', [
    TURIParameter.Create('session', GetSessionId)
    ]);
end;

function TMyfxbookApiClient.Login: TJSONObject;
begin
  Result := MakeApiCall('login', [
    TURIParameter.Create('email', FLogin.GetEmail),
    TURIParameter.Create('password', FLogin.GetPassword)
    ]);
end;

function TMyfxbookApiClient.Logout: TJSONObject;
begin
  Result := MakeApiCall('logout', [
    TURIParameter.Create('session', GetSessionId)
    ]);
end;

function TMyfxbookApiClient.MakeApiCall(const AEndpoint: string; const AParams: TURIParameters): TJSONObject;
var
  LHTTPClient: IMyfxbookApiHTTPClientProvider;
  LURL: string;
  LStringResponse: string;
  LJSONResponse: TJSONObject;
begin
  LHTTPClient := TMyfxbookApiHTTPClientManager.DefaultManager.GetDefaultHTTPClient;
  LURL := BuildURI(AEndpoint, AParams);

  LStringResponse := LHTTPClient.Get(LURL);

  LJSONResponse := TJSONObject.ParseJSONValue(LStringResponse) as TJSONObject;
  try
    if LJSONResponse = nil then
      raise Exception.Create(sInvalidJSONFormat);

    if LJSONResponse.GetValue<Boolean>('error') then
      TMyfxbookApiExceptionHandlerManager.DefaultManager.Handler(LJSONResponse.GetValue<string>('message'));

    Result := LJSONResponse.Clone as TJSONObject;
  finally
    LJSONResponse.Free;
  end;
end;

class function TMyfxbookApiClient.New(const ALogin: IMyfxbookApiLoginEntity): IMyfxbookApiClient;
begin
  Result := TMyfxbookApiClient.Create(ALogin);
end;

end.
