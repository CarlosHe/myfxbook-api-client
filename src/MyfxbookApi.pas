unit MyfxbookApi;

interface

uses
  MyfxbookApi.Builder.Login,
  MyfxbookApi.Core.Client,
  MyfxbookApi.Contract.Builder.Login,
  MyfxbookApi.Contract.Core.Client,
  MyfxbookApi.Contract.Entity.Login,
  MyfxbookApi.Contract.Provider.HTTPClient,
  MyfxbookApi.Entity.Login,
  MyfxbookApi.Singleton.ExceptionHandlerManager,
  MyfxbookApi.Singleton.HTTPClientManager;

type

  TMyfxbookApiLoginBuilder = MyfxbookApi.Builder.Login.TMyfxbookApiLoginBuilder;
  TMyfxbookApiClient = MyfxbookApi.Core.Client.TMyfxbookApiClient;
  IMyfxbookApiLoginBuilder = MyfxbookApi.Contract.Builder.Login.IMyfxbookApiLoginBuilder;
  IMyfxbookApiClient = MyfxbookApi.Contract.Core.Client.IMyfxbookApiClient;
  IMyfxbookApiLoginEntity = MyfxbookApi.Contract.Entity.Login.IMyfxbookApiLoginEntity;
  IMyfxbookApiHTTPClientProvider = MyfxbookApi.Contract.Provider.HTTPClient.IMyfxbookApiHTTPClientProvider;
  TMyfxbookApiLoginEntity = MyfxbookApi.Entity.Login.TMyfxbookApiLoginEntity;
  TMyfxbookApiExceptionHandlerManager = MyfxbookApi.Singleton.ExceptionHandlerManager.TMyfxbookApiExceptionHandlerManager;
  TMyfxbookApiHTTPClientManager = MyfxbookApi.Singleton.HTTPClientManager.TMyfxbookApiHTTPClientManager;

implementation

end.
