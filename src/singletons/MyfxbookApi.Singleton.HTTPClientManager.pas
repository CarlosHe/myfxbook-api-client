unit MyfxbookApi.Singleton.HTTPClientManager;

interface

uses
  System.Generics.Collections,
  MyfxbookApi.Contract.Provider.HTTPClient;

type

  TMyfxbookApiHTTPClientManager = class
  private
    { private declarations }
    FMyfxbookApiHTTPClientCollection: TDictionary<string, IMyfxbookApiHTTPClientProvider>;
    FDefaultHTTPClientName: string;
    class var FMyfxbookApiHTTPClientManager: TMyfxbookApiHTTPClientManager;
  protected
    { protected declarations }
    class function GetDefaultManager: TMyfxbookApiHTTPClientManager; static;
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
    procedure RegisterHTTPClient(const AName: string; const AHTTPClient: IMyfxbookApiHTTPClientProvider; const ASetAsDefault: Boolean = False);
    procedure SetDefaultHTTPClient(const AName: string);
    function GetDefaultHTTPClient: IMyfxbookApiHTTPClientProvider;
    function GetHTTPClientByName(const AName: string): IMyfxbookApiHTTPClientProvider;
    class destructor UnInitialize;
    class property DefaultManager: TMyfxbookApiHTTPClientManager read GetDefaultManager;
  end;

implementation

uses
  MyfxbookApi.Resource,
  System.SysUtils;

{ TMyfxbookApiHTTPClientManager }

constructor TMyfxbookApiHTTPClientManager.Create;
begin
  FMyfxbookApiHTTPClientCollection := TDictionary<string, IMyfxbookApiHTTPClientProvider>.Create;
end;

destructor TMyfxbookApiHTTPClientManager.Destroy;
begin
  FMyfxbookApiHTTPClientCollection.Free;
  inherited;
end;

function TMyfxbookApiHTTPClientManager.GetDefaultHTTPClient: IMyfxbookApiHTTPClientProvider;
begin
  if FMyfxbookApiHTTPClientCollection.Count < 1 then
    raise Exception.Create(sThereIsNoHTTPClientRegistered);
  if not FDefaultHTTPClientName.IsEmpty then
  begin
    if not FMyfxbookApiHTTPClientCollection.ContainsKey(FDefaultHTTPClientName) then
      raise Exception.Create(Format(sCouldNotFindThisHTTPClient, [FDefaultHTTPClientName]));
    Exit(FMyfxbookApiHTTPClientCollection.Items[FDefaultHTTPClientName]);
  end;
  Exit(FMyfxbookApiHTTPClientCollection.Items[FMyfxbookApiHTTPClientCollection.Keys.ToArray[0]])
end;

class function TMyfxbookApiHTTPClientManager.GetDefaultManager: TMyfxbookApiHTTPClientManager;
begin
  if FMyfxbookApiHTTPClientManager = nil then
    FMyfxbookApiHTTPClientManager := TMyfxbookApiHTTPClientManager.Create;
  Result := FMyfxbookApiHTTPClientManager;
end;

function TMyfxbookApiHTTPClientManager.GetHTTPClientByName(const AName: string): IMyfxbookApiHTTPClientProvider;
begin
  if not FMyfxbookApiHTTPClientCollection.ContainsKey(AName) then
    raise Exception.Create(Format(sCouldNotFindThisHTTPClient, [AName]));
  Result := FMyfxbookApiHTTPClientCollection.Items[AName];
end;

procedure TMyfxbookApiHTTPClientManager.RegisterHTTPClient(const AName: string; const AHTTPClient: IMyfxbookApiHTTPClientProvider; const ASetAsDefault: Boolean);
begin
  FMyfxbookApiHTTPClientCollection.Add(AName, AHTTPClient);
  if ASetAsDefault then
    FDefaultHTTPClientName := AName;
end;

procedure TMyfxbookApiHTTPClientManager.SetDefaultHTTPClient(const AName: string);
begin
  if not FMyfxbookApiHTTPClientCollection.ContainsKey(AName) then
    raise Exception.Create(Format(sCouldNotFindThisHTTPClient, [AName]));
  FDefaultHTTPClientName := AName;
end;

class destructor TMyfxbookApiHTTPClientManager.UnInitialize;
begin
  FMyfxbookApiHTTPClientManager.Free;
end;

end.
