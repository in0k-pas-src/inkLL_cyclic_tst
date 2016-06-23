unit TSTs_inkLLc_11_Count;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLLc,
     inkLL_cyclic;

type

 tTests_inkLLc_11_Count= class(tTSTCTC_CORE_inkLLc)
  published
    procedure Count_Nil;
    procedure Count_One;
    procedure Count_Two;
    procedure Count_SiX;
  end;

implementation

procedure  tTests_inkLLc_11_Count.Count_Nil;
begin
    LIST:=TST_list_crt_NIL;
    //--
    AssertEquals(TST_LIST_Count,inkLLc_clcCount(LIST));
end;

procedure  tTests_inkLLc_11_Count.Count_One;
begin
    LIST:=TST_list_crt_One;
    //--
    AssertEquals(TST_LIST_Count,inkLLc_clcCount(LIST));
end;

procedure  tTests_inkLLc_11_Count.Count_Two;
begin
    LIST:=TST_list_crt_Two;
    //--
    AssertEquals(TST_LIST_Count,inkLLc_clcCount(LIST));
end;

procedure  tTests_inkLLc_11_Count.Count_SiX;
begin
    LIST:=TST_list_crt_Six;
    //--
    AssertEquals(TST_LIST_Count,inkLLc_clcCount(LIST));
end;

initialization
    RegisterTest(cTestSuitePath__inkLLc,tTests_inkLLc_11_Count);
end.

