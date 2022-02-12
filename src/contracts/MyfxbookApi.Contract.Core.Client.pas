unit MyfxbookApi.Contract.Core.Client;

interface

uses
  System.JSON;

type

  IMyfxbookApiClient = interface
    ['{1208D25B-6B0B-43C9-B322-6BE91F977CC4}']
    /// <summary>Get list of all trading accounts</summary>
    function GetMyAccounts(): TJSONObject;
    /// <summary>Get list of all watched accounts</summary>
    function GetWatchedAccounts(): TJSONObject;
    /// <summary>Get all open orders for a given account</summary>
    /// <param name="AId">Id of a trading account</param>
    function GetOpenOrders(const AId: UInt32): TJSONObject;
    /// <summary>Get all open trades for a given account</summary>
    /// <param name="AId">Id of a trading account</param>
    function GetOpenTrades(const AId: UInt32): TJSONObject;
    /// <summary>Get history of all trades for a given account</summary>
    /// <param name="AId">Id of a trading account</param>
    function GetHistory(const AId: UInt32): TJSONObject;
    /// <summary>Get daily breakdown of all gains for a given account within time range</summary>
    /// <param name="AId">Id of a trading account</param>
    /// <param name="AStart">Start date</param>
    /// <param name="AEnd">End date</param>
    function GetDailyGain(const AId: UInt32; const AStart: string; const AEnd: string): TJSONObject;
    /// <summary>Get total gain for a given account within time range</summary>
    /// <param name="AId">Id of a trading account</param>
    /// <param name="AStart">Start date</param>
    /// <param name="AEnd">End date</param>
    function GetGain(const AId: UInt32; const AStart: string; const AEnd: string): TJSONObject;
    /// <summary>Get Myfxbook Community Outlook data (https://www.myfxbook.com/community/outlook)</summary>
    function GetCommunityOutlook(): TJSONObject;
    /// <summary>Get community outlook data broken down by a country for provided symbol</summary>
    /// <param name="ASymbol">A trading instrument (currency pair)</param>
    function GetCommunityOutlookByCountry(ASymbol: string): TJSONObject;
    /// <summary>Get daily breakdown of all account data within time range</summary>
    /// <param name="AId">Id of a trading account</param>
    /// <param name="AStart">Start date</param>
    /// <param name="AEnd">End date</param>
    function GetDailyData(const AId: UInt32; const AStart: string; const AEnd: string): TJSONObject;
  end;

implementation

end.
