unit MyfxbookApi.Exception.Base;

interface

uses
  System.SysUtils;

type

  EMyfxbookApiException = class(Exception)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create; reintroduce; virtual; abstract;
  end;

  EMyfxbookApiExceptionClass = class of EMyfxbookApiException;

implementation

end.
