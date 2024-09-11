unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, Vcl.StdCtrls, IdDNSResolver;

type
  TForm1 = class(TForm)
    IdDNSResolver: TIdDNSResolver;
    Label1: TLabel;
    edDNS: TEdit;
    Label2: TLabel;
    EdTimeOut: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
    function GetDetail(RR: TResultRecord): string;
    function DecodeSecToTime(Secs: Cardinal): string;
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  count: Integer;
begin
  Memo1.Clear;
  IdDNSResolver.Host := edDNS.Text;
  IdDNSResolver.WaitingTime := StrToInt(EdTimeOut.Text);
  IdDNSResolver.ClearInternalQuery;
  IdDNSResolver.QueryType := [TQueryRecordTypes.qtSOA];
  IdDNSResolver.Resolve(Edit3.Text);

  for count := 0 to IdDNSResolver.QueryResult.count - 1 do
  begin
    Memo1.Lines.Add(GetDetail(IdDNSResolver.QueryResult.Items[count]));
  end;
end;

function TForm1.GetDetail(RR: TResultRecord): string;
begin
  if (RR is TARecord) then
    Result := 'IP address = ' + TARecord(RR).IPAddress + #13 + #10;
  if (RR is TCNRecord) then
    Result := 'Name Server = ' + TCNRecord(RR).HostName + #13 + #10;;
  if (RR is THINFORecord) then
    Result := 'CPU =' + THINFORecord(RR).CPU + '; OS= ' + THINFORecord(RR).OS +
      #13 + #10;;
  if (RR is TMINFORecord) then
    Result := 'Responsible Email is: ' + TMINFORecord(RR)
      .ResponsiblePersonMailbox + #13 + #10;;
  if (RR is TMXRecord) then
    Result := 'Mail Server is: ' + TMXRecord(RR).ExchangeServer + #13 + #10;;
  if (RR is TNAMERecord) then
    Result := 'Name Server = ' + TNAMERecord(RR).HostName + #13 + #10;;
  if (RR is TNSRecord) then
    Result := 'Name Server = ' + TNSRecord(RR).HostName + #13 + #10;
  if (RR is TPTRRecord) then
    Result := 'PTR = ' + TPTRRecord(RR).HostName + #13 + #10;
  if (RR is TRDATARecord) then
    Result := 'IP address = ' + TRDATARecord(RR).IPAddress + #13 + #10;
  if (RR is TSOARecord) then
  begin
    Result := 'Primary Domain Server = ' + TSOARecord(RR).Primary + #13 + #10;
    Result := Result + 'ResponsiblePersion mail = ' + TSOARecord(RR)
      .ResponsiblePerson + #13 + #10;
    Result := Result + 'Serial = ' + IntToStr(TSOARecord(RR).Serial) +
      #13 + #10;
    Result := Result + 'Refresh = ' + IntToStr(TSOARecord(RR).Refresh) + ' (' +
      DecodeSecToTime(TSOARecord(RR).Refresh) + ')' + #13 + #10;
    Result := Result + 'Retry = ' + IntToStr(TSOARecord(RR).Retry) + ' (' +
      DecodeSecToTime(TSOARecord(RR).Retry) + ')' + #13 + #10;
    Result := Result + 'Expire = ' + IntToStr(TSOARecord(RR).Expire) + ' (' +
      DecodeSecToTime(TSOARecord(RR).Expire) + ')' + #13 + #10;
    Result := Result + 'default TTL = ' + IntToStr(TSOARecord(RR).MinimumTTL) +
      ' (' + DecodeSecToTime(TSOARecord(RR).MinimumTTL) + ')';
  end;

  if (RR is TTextRecord) then
    Result := TTextRecord(RR).Text.Text;
end;

function TForm1.DecodeSecToTime(Secs: Cardinal): string;
var
  sec, min, hour, day, temp: Cardinal;
begin
  sec := Secs mod 60;
  temp := (Secs - sec) div 60;
  min := temp mod 60;
  temp := (temp - min) div 60;
  hour := temp mod 24;
  day := (temp - hour) div 24;

  if (day > 0) then
    Result := IntToStr(day) + 'day';
  if (hour > 0) then
    Result := Result + IntToStr(hour) + 'hour';
  if (min > 0) then
    Result := Result + IntToStr(min) + 'min';
  if (sec > 0) then
    Result := Result + IntToStr(sec) + 'sec';
end;

end.
