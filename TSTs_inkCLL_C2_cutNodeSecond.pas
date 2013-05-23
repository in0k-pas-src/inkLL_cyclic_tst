unit TSTs_inkCLL_C2_cutNodeSecond;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkCLL,
     inkCLL;

type

 tTests_inkCLL_C2_cutNodeSecond= class(tTSTCTC_CORE_inkCLL)
  published
    procedure Count_Two;
    procedure Count_SiX;
  end;

implementation

procedure  tTests_inkCLL_C2_cutNodeSecond.Count_Two;
var lst:pointer;
begin
    LIST:=_list_crt_Two;
    //--
    lst:=inkCLL_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',1,node_Namber(lst));
   _node_DST(lst);
    //--
    AssertNotNull('wrong LIST',LIST);
    AssertSame   ('wrong LIST Cyclic',LIST,node_Next(LIST));
end;

procedure  tTests_inkCLL_C2_cutNodeSecond.Count_SiX;
var lst:pointer;
begin
    LIST:=_list_crt_Six;
    //--
    lst:=inkCLL_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',1,node_Namber(lst));
   _node_DST(lst);
    //--
    lst:=inkCLL_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',2,node_Namber(lst));
   _node_DST(lst);
    //--
    lst:=inkCLL_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',3,node_Namber(lst));
   _node_DST(lst);
    //--
    lst:=inkCLL_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',4,node_Namber(lst));
   _node_DST(lst);
    //--
    lst:=inkCLL_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',5,node_Namber(lst));
   _node_DST(lst);
    //---
    AssertNotNull('wrong LIST',LIST);
    AssertSame   ('wrong LIST Cyclic',LIST,node_Next(LIST));
end;

initialization
    RegisterTest(cTestSuitePath__inkCLL,tTests_inkCLL_C2_cutNodeSecond);
end.

