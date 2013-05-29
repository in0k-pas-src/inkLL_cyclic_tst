unit TSTs_inkLLc_C2_cutNodeSecond;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLLc,
     inkLLcyclic;

type

 tTests_inkLLc_C2_cutNodeSecond= class(tTSTCTC_CORE_inkLLc)
  published
    procedure Count_Two;
    procedure Count_SiX;
  end;

implementation

procedure  tTests_inkLLc_C2_cutNodeSecond.Count_Two;
var lst:pointer;
begin
    LIST:=TST_list_crt_Two;
    //--
    lst:=inkLLc_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',1,TST_node_Namber(lst));
   _node_DST(lst);
    //--
    AssertNotNull('wrong LIST',LIST);
    AssertSame   ('wrong LIST Cyclic',LIST,TST_node_Next(LIST));
end;

procedure  tTests_inkLLc_C2_cutNodeSecond.Count_SiX;
var lst:pointer;
begin
    LIST:=TST_list_crt_Six;
    //--
    lst:=inkLLc_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',1,TST_node_Namber(lst));
   _node_DST(lst);
    //--
    lst:=inkLLc_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',2,TST_node_Namber(lst));
   _node_DST(lst);
    //--
    lst:=inkLLc_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',3,TST_node_Namber(lst));
   _node_DST(lst);
    //--
    lst:=inkLLc_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',4,TST_node_Namber(lst));
   _node_DST(lst);
    //--
    lst:=inkLLc_cutNodeSecond(LIST);
    AssertNotNull('wrong CUTed node',lst);
    AssertEquals ('wrong CUTed node namber',5,TST_node_Namber(lst));
   _node_DST(lst);
    //---
    AssertNotNull('wrong LIST',LIST);
    AssertSame   ('wrong LIST Cyclic',LIST,TST_node_Next(LIST));
end;

initialization
    RegisterTest(cTestSuitePath__inkLLc,tTests_inkLLc_C2_cutNodeSecond);
end.

