<h1 align="center">Myfxbook API Client</h1>

<p align="center"><img width="150" src="https://raw.githubusercontent.com/CarlosHe/myfxbook-api-client/main/myfxbook-api-client-logo.png" alt="myfxbook-api-client"></p>

A Delphi client for working with Myfxbook API - https://www.myfxbook.com/api

## Installation

#### via boss:

```bash
boss install github.com/CarlosHe/myfxbook-api-client
```

## Usage

> `email` and `password` are credentials to your myfxbook.com account

```delphi
uses
  MyfxbookApi;

begin
  var
    LMyfxbookApiClient: IMyfxbookApiClient := TMyfxbookApiClient.New(
      TMyfxbookApiLoginBuilder.New
        .SetEmail('my@email.com')
        .SetPassword('my_password')
        .Build
      );
end.
```

## Methods

### **`GetMyAccounts()`**

Get list of all trading accounts

```delphi
uses
  System.JSON,
  MyfxbookApi;

begin
  var
    LMyfxbookApiClient: IMyfxbookApiClient := TMyfxbookApiClient.New(
      TMyfxbookApiLoginBuilder.New
        .SetEmail('my@email.com')
        .SetPassword('my_password')
        .Build
      );

  try
    var
      LMyAccounts: TJSONObject := LMyfxbookApiClient.GetMyAccounts;
    try
      WriteLn(LMyAccounts.ToString);
    finally
      LMyAccounts.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end.
```

<details><summary>View sample response</summary>
<p>

```json
{
  "error": false,
  "message": "",
  "accounts": [
    {
      "id": 12345,
      "name": "Holy Grail",
      "description": "Super duper MA+CCI trading system.",
      "accountId": 1013230,
      "gain": 8.92,
      "absGain": 8.92,
      "daily": "0.04",
      "monthly": "1.25",
      "withdrawals": 0,
      "deposits": 10000,
      "interest": 11.1,
      "profit": 892.45,
      "balance": 10892.45,
      "drawdown": 53.53,
      "equity": 10892.45,
      "equityPercent": 100,
      "demo": true,
      "lastUpdateDate": "03/01/2010 10:14",
      "creationDate": "08/06/2009 08:13",
      "firstTradeDate": "04/21/2008 12:18",
      "tracking": 21,
      "views": 549,
      "commission": 0,
      "currency": "USD",
      "profitFactor": 0.3,
      "pips": 81.2,
      "invitationUrl": "http://www.myfxbook.com/members/john101/anyone/347/SDa45X5TSkdIsXg8",
      "server": {
        "name": "Alpari UK"
      }
    }
  ]
}
```

</p>
</details>

---

### **`GetWatchedAccounts()`**

Get list of all watched accounts

```delphi
uses
  System.JSON,
  MyfxbookApi;

begin
  var
    LMyfxbookApiClient: IMyfxbookApiClient := TMyfxbookApiClient.New(
      TMyfxbookApiLoginBuilder.New
        .SetEmail('my@email.com')
        .SetPassword('my_password')
        .Build
      );

  try
    var
      LWatchedAccounts: TJSONObject := LMyfxbookApiClient.GetWatchedAccounts;
    try
      WriteLn(LWatchedAccounts.ToString);
    finally
      LWatchedAccounts.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end.
```

<details><summary>View sample response</summary>
<p>

```json
{
  "error": false,
  "message": "",
  "accounts": [
    {
      "name": "Holy Grail",
      "gain": 8.92,
      "drawdown": 53.53,
      "demo": true,
      "change": 1.53,
    }
  ]
}
```

</p>
</details>

---

### **`GetOpenOrders(AId)`**

Get all open orders for a given account

Arguments:

- `AId` - _Id of a trading account_

```delphi
uses
  System.JSON,
  MyfxbookApi;

begin
  var
    LMyfxbookApiClient: IMyfxbookApiClient := TMyfxbookApiClient.New(
      TMyfxbookApiLoginBuilder.New
        .SetEmail('my@email.com')
        .SetPassword('my_password')
        .Build
      );

  try
    var
      LOpenOrders: TJSONObject := LMyfxbookApiClient.GetOpenOrders(12345);
    try
      WriteLn(LOpenOrders.ToString);
    finally
      LOpenOrders.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end.
```

<details><summary>View sample response</summary>
<p>

```json
{
 "error": false,
 "message": "",
 "openOrders": [
  {
   "openTime": "03/01/2010 13:52",
   "symbol": "GBPUSD",
   "action": "Sell Limit",
   "sizing": {
    "type": "lots",
    "value": "0.08"
   },
   "openPrice": 1.4932,
   "tp": 1.4882,
   "sl": 0,
   "comment":"Best trade ever"
  }
 ]
}
```

</p>
</details>

---

### **`GetOpenTrades(AId)`**

Get all open trades for a given account

Arguments:

- `AId` - _id of a trading account_

```delphi
uses
  System.JSON,
  MyfxbookApi;

begin
  var
    LMyfxbookApiClient: IMyfxbookApiClient := TMyfxbookApiClient.New(
      TMyfxbookApiLoginBuilder.New
        .SetEmail('my@email.com')
        .SetPassword('my_password')
        .Build
      );

  try
    var
      LOpenTrades: TJSONObject := LMyfxbookApiClient.GetOpenTrades(12345);
    try
      WriteLn(LOpenTrades.ToString);
    finally
      LOpenTrades.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end.
```

<details><summary>View sample response</summary>
<p>

```json
{
 "error": false,
 "message": "",
 "openTrades": [
    {
      "openTime": "03/01/2010 13:39",
      "symbol": "GBPUSD",
      "action": "Sell",
      "sizing":    {
        "type": "lots",
        "value": "0.01"
      },
      "openPrice": 1.4802,
      "tp": 1.4832,
      "sl": 0,
      "comment":"best trade ever",
      "profit": -10.8,
      "pips": -108,
      "swap": 0,
      "magic": 24129962
    }
  ]
}

````

</p>
</details>

---

### **`GetHistory(AId)`**

Get history of all trades for a given account

Arguments:

- `AId` - _id of a trading account_

```delphi
uses
  System.JSON,
  MyfxbookApi;

begin
  var
    LMyfxbookApiClient: IMyfxbookApiClient := TMyfxbookApiClient.New(
      TMyfxbookApiLoginBuilder.New
        .SetEmail('my@email.com')
        .SetPassword('my_password')
        .Build
      );

  try
    var
      LHistory: TJSONObject := LMyfxbookApiClient.GetHistory(12345);
    try
      WriteLn(LHistory.ToString);
    finally
      LHistory.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end.
```

<details><summary>View sample response</summary>
<p>

```json
{
 "error": false,
 "message": "",
 "history": [
  {
   "openTime": "03/01/2010 14:13",
   "closeTime": "03/01/2010 15:26",
   "symbol": "GBPUSD",
   "action": "Buy Limit",
   "sizing": {
    "type": "lots",
    "value": "0.04"
   },
   "openPrice": 1.4831,
   "closePrice": 1.4934,
   "tp": 1.4881,
   "sl": 0,
   "comment":"best trade ever",
   "pips": 0,
   "profit": 0,
   "interest": 12.1,
   "commission": 0
  }
 ]
}
```

</p>
</details>

---

### **`GetDailyGain(AId, AStart, AEnd)`**

Get daily breakdown of all gains for a given account within time range

Arguments:

- `AId` - _id of a trading account_
- `AStart` - _start date, format : yyyy-MM-dd_
- `AEnd` - _end date, format : yyyy-MM-dd_

```delphi
uses
  System.JSON,
  MyfxbookApi;

begin
  var
    LMyfxbookApiClient: IMyfxbookApiClient := TMyfxbookApiClient.New(
      TMyfxbookApiLoginBuilder.New
        .SetEmail('my@email.com')
        .SetPassword('my_password')
        .Build
      );

  try
    var
      LDailyGain: TJSONObject := LMyfxbookApiClient.GetDailyGain(12345, '2022-01-01', '2022-02-07');
    try
      WriteLn(LDailyGain.ToString);
    finally
      LDailyGain.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end.
```

<details><summary>View sample response</summary>
<p>

```json
{
 "error": false,
 "message": "",
 "dailyGain": [
  [{
   "date": "02/01/2010",
   "value": 0.07,
   "profit": 0.03
  }]
 ]
}
```

</p>
</details>

---

### **`GetGain(AId, AStart, AEnd)`**

Get total gain for a given account within time range

Arguments:

- `AId` - _id of a trading account_
- `AStart` - _start date, format : yyyy-MM-dd_
- `AEnd` - _end date, format : yyyy-MM-dd_

```delphi
uses
  System.JSON,
  MyfxbookApi;

begin
  var
    LMyfxbookApiClient: IMyfxbookApiClient := TMyfxbookApiClient.New(
      TMyfxbookApiLoginBuilder.New
        .SetEmail('my@email.com')
        .SetPassword('my_password')
        .Build
      );

  try
    var
      LGain: TJSONObject := LMyfxbookApiClient.GetGain(12345, '2022-01-01', '2022-02-07');
    try
      WriteLn(LGain.ToString);
    finally
      LGain.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end.
```

<details><summary>View sample response</summary>
<p>

```json
{
 "error": false,
 "message": "",
 "value": 86.69
}
```

</p>
</details>

---

### **`GetCommunityOutlook()`**

Get Myfxbook Community Outlook data (https://www.myfxbook.com/community/outlook)

```delphi
uses
  System.JSON,
  MyfxbookApi;

begin
  var
    LMyfxbookApiClient: IMyfxbookApiClient := TMyfxbookApiClient.New(
      TMyfxbookApiLoginBuilder.New
        .SetEmail('my@email.com')
        .SetPassword('my_password')
        .Build
      );

  try
    var
      LCommunityOutlook: TJSONObject := LMyfxbookApiClient.GetCommunityOutlook();
    try
      WriteLn(LCommunityOutlook.ToString);
    finally
      LCommunityOutlook.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end.
```

<details><summary>View sample response</summary>
<p>

```json
{
 "error": false,
 "message": "",
 "symbols": [
  {
   "name": "EURUSD",
   "shortPercentage": 55,
   "longPercentage": 44,
   "shortVolume": 1142.58,
   "longVolume": 905.47,
   "longPositions": 2932,
   "shortPositions": 3888,
   "totalPositions": 2048,
   "avgShortPrice":1.3808,
   "avgLongPrice":1.4097
  }
 ],
 "general": {
  "demoAccountsPercentage": 43,
  "realAccountsPercentage": 56,
  "profitablePercentage": 54,
  "nonProfitablePercentage": 45,
  "fundsWon": "6,819,251.63",
  "fundsLost": "-8,740,646.15",
  "averageDeposit": "21,740.16",
  "averageAccountProfit": "4,127.88",
  "averageAccountLoss": "-5,290.95",
  "totalFunds": "35,914,737.56"
 }
}
```

</p>
</details>

---

### **`GetCommunityOutlookByCountry(ASymbol)`**

Get community outlook data broken down by a country for provided symbol

Arguments:

- `ASymbol` - a trading instrument (currency pair)

```delphi
uses
  System.JSON,
  MyfxbookApi;

begin
  var
    LMyfxbookApiClient: IMyfxbookApiClient := TMyfxbookApiClient.New(
      TMyfxbookApiLoginBuilder.New
        .SetEmail('my@email.com')
        .SetPassword('my_password')
        .Build
      );

  try
    var
      LCommunityOutlookByCountry: TJSONObject := LMyfxbookApiClient.GetCommunityOutlookByCountry('eurusd');
    try
      WriteLn(LCommunityOutlookByCountry.ToString);
    finally
      LCommunityOutlookByCountry.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end.
```

<details><summary>View sample response</summary>
<p>

```json
{
 "error": false,
 "message": "",
 "countries": [
  {
   "name": "GERMANY",
   "code": "DE",
   "longVolume": 13.71,
   "shortVolume": 35.76,
   "longPositions": 111,
   "shortPositions": 489
  }
 ]
}
```

</p>
</details>

---

### **`GetDailyData(AId, AStart, AEnd)`**

Get daily breakdown of all account data within time range

Arguments:

- `AId` - _id of a trading account_
- `AStart` - _start date, format : yyyy-MM-dd_
- `AEnd` - _end date, format : yyyy-MM-dd_

```delphi
uses
  System.JSON,
  MyfxbookApi;

begin
  var
    LMyfxbookApiClient: IMyfxbookApiClient := TMyfxbookApiClient.New(
      TMyfxbookApiLoginBuilder.New
        .SetEmail('my@email.com')
        .SetPassword('my_password')
        .Build
      );

  try
    var
      LDailyData: TJSONObject := LMyfxbookApiClient.GetDailyData(12345, '2022-01-01', '2022-02-07');
    try
      WriteLn(LDailyData.ToString);
    finally
      LDailyData.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.Message);
  end;
end.
```

<details><summary>View sample response</summary>
<p>

```json
{
 "error": false,
 "message": "",
 "dataDaily":[
  [{
   "date": "02/01/2010",
   "balance": 25083.56,
   "pips": 83.30,
   "lots": 0.41,
   "floatingPL": -500.00,
   "profit": 84.7400,
   "growthEquity": -4.15,
   "floatingPips": 1.00
  }]
 ]
}
```

</p>
</details>