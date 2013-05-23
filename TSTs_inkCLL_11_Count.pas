unit TSTs_inkCLL_11_Count;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkCLL,
     inkCLL;

type

 tTests_inkCLL_11_Count= class(tTSTCTC_CORE_inkCLL)
  published
    procedure Count_Nil;
    procedure Count_One;
    procedure Count_Two;
    procedure Count_SiX;
  end;

implementation

procedure  tTests_inkCLL_11_Count.Count_Nil;
begin
    LIST:=_list_crt_NIL;
    //--
    AssertEquals(_list_Count,inkCLL_clcCount(LIST));
end;

procedure  tTests_inkCLL_11_Count.Count_One;
begin
    LIST:=_list_crt_One;
    //--
    AssertEquals(_list_Count,inkCLL_clcCount(LIST));
end;

procedure  tTests_inkCLL_11_Count.Count_Two;
begin
    LIST:=_list_crt_Two;
    //--
    AssertEquals(_list_Count,inkCLL_clcCount(LIST));
end;

procedure  tTests_inkCLL_11_Count.Count_SiX;
begin
    LIST:=_list_crt_Six;
    //--
    AssertEquals(_list_Count,inkCLL_clcCount(LIST));
end;

initialization
    RegisterTest(cTestSuitePath__inkCLL,tTests_inkCLL_11_Count);
end.

