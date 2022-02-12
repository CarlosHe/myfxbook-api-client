unit MyfxbookApi.Provider.HTTPClient;

interface

uses
  System.Net.HTTPClient,
  MyfxbookApi.Contract.Provider.HTTPClient;

type

  TMyfxbookApiHTTPClientProvider = class(TInterfacedObject, IMyfxbookApiHTTPClientProvider)
  private
    { private declarations }
    FHTTPClient: THTTPClient;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
    function Get(const AUrl: string): string;
    class function New: IMyfxbookApiHTTPClientProvider;
  end;

implementation

uses
  MyfxbookApi.Singleton.HTTPClientManager;

{ TMyfxbookApiHTTPClient }

constructor TMyfxbookApiHTTPClientProvider.Create;
begin
  FHTTPClient := THTTPClient.Create;
end;

destructor TMyfxbookApiHTTPClientProvider.Destroy;
begin
  FHTTPClient.Free;
  inherited;
end;

function TMyfxbookApiHTTPClientProvider.Get(const AUrl: string): string;
var
  LHTTPResponse: IHTTPResponse;
begin
  LHTTPResponse := FHTTPClient.Get(AUrl);
  Result := LHTTPResponse.ContentAsString;
end;

class function TMyfxbookApiHTTPClientProvider.New: IMyfxbookApiHTTPClientProvider;
begin
  Result := TMyfxbookApiHTTPClientProvider.Create;
end;

initialization

TMyfxbookApiHTTPClientManager.DefaultManager.RegisterHTTPClient('default', TMyfxbookApiHTTPClientProvider.New);

end.
