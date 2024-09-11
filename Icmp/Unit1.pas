unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  IdBaseComponent, IdComponent, IdRawBase, IdRawClient, IdIcmpClient;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    edHost: TEdit;
    btnGo: TButton;
    IdIcmpClient1: TIdIcmpClient;
    Memo1: TMemo;
    procedure btnGoClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnGoClick(Sender: TObject);
begin
  Memo1.Clear;
  IdIcmpClient1.Host := edHost.Text;
  IdIcmpClient1.ReceiveTimeout := 5000;
  IdIcmpClient1.Ping;

  case IdIcmpClient1.ReplyStatus.ReplyStatusType of
    rsEcho:
      begin
        Memo1.Lines.Append(format('response from host %s in %d millisec.',
        [IdIcmpClient1.ReplyStatus.FromIpAddress,
        IdIcmpClient1.ReplyStatus.MsRoundTripTime]));
//        result := true;
      end;
    rsError:
      Memo1.Lines.Append('Unknown error.');
    rsTimeOut:
      Memo1.Lines.Append('Timed out.');
    rsErrorUnreachable:
      Memo1.Lines.Append(format('Host %s reports destination network unreachable.',
      [IdIcmpClient1.ReplyStatus.FromIpAddress]));
    rsErrorTTLExceeded:
      Memo1.Lines.Append(format('Hope %d %s: TTL expired.',
      [IdIcmpClient1.ReceiveTimeout, IdIcmpClient1.ReplyStatus.FromIpAddress]));
  end; // case
end;

end.
