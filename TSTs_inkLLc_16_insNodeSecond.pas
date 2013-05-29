unit TSTs_inkLLc_16_insNodeSecond;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLLc,
     inkLLcyclic;

type

 tTests_inkLLc_16_insNodeSecond= class(tTSTCTC_CORE_inkLLc)
  published
    procedure insNodeSecond_NIL;
    procedure insNodeSecond_One;
    procedure insNodeSecond_Two;
    procedure insNodeSecond_SiX;
  end;

implementation

procedure tTests_inkLLc_16_insNodeSecond.insNodeSecond_NIL;
var tmp:pointer;
begin
    LIST:=TST_list_crt_NIL;
    tmp :=TST_node_Create(222);
    //---
    inkLLc_insNodeSecond(LIST,tmp);
    //---
    AssertNotNull(    LIST);
    AssertEquals (  1,TST_LIST_Count);
    AssertEquals (222,TST_node_Namber(LIST));
end;

procedure tTests_inkLLc_16_insNodeSecond.insNodeSecond_One;
var tmp:pointer;
begin
    LIST:=TST_list_crt_One;
    tmp :=TST_node_Create(222);
    //---
    inkLLc_insNodeSecond(LIST,tmp);
    //---
    AssertNotNull(    LIST);
    AssertEquals (  2,TST_LIST_Count);
    // проверим что именно вротым встал )))
    tmp:=TST_node_Next(LIST);
    AssertEquals (222,TST_node_Namber(tmp));
end;

procedure tTests_inkLLc_16_insNodeSecond.insNodeSecond_Two;
var tmp:pointer;
begin
    LIST:=TST_list_crt_Two;
    tmp :=TST_node_Create(222);
    //---
    inkLLc_insNodeSecond(LIST,tmp);
    //---
    AssertNotNull(    LIST);
    AssertEquals (  3,TST_LIST_Count);
    // проверим что именно вротым встал )))
    tmp:=TST_node_Next(LIST);
    AssertEquals (222,TST_node_Namber(tmp));
end;

procedure tTests_inkLLc_16_insNodeSecond.insNodeSecond_SiX;
var tmp:pointer;
begin
    LIST:=TST_list_crt_Six;
    tmp :=TST_node_Create(222);
    //---
    inkLLc_insNodeSecond(LIST,tmp);
    //---
    AssertNotNull(    LIST);
    AssertEquals (  7,TST_LIST_Count);
    // проверим что именно вротым встал )))
    tmp:=TST_node_Next(LIST);
    AssertEquals (222,TST_node_Namber(tmp));
end;

initialization
    RegisterTest(cTestSuitePath__inkLLc,tTests_inkLLc_16_insNodeSecond);
end.

