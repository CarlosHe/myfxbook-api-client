unit MyfxbookApi.Contract.Provider.HTTPClient;

interface

type

  IMyfxbookApiHTTPClientProvider = interface
    ['{4469D6E6-CD48-4F32-9255-BCBFB5913B94}']
    function Get(const AUrl: string): string;
  end;

implementation

end.
