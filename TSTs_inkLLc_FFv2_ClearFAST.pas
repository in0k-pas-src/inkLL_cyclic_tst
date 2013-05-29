unit TSTs_inkLLc_FFv2_ClearFAST;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLLc,
     inkLLcyclic;

type

  tTests_inkLLc_FFv2_ClearFAST= class(tTSTCTC_CORE_inkLLc)
  published
    procedure Clear_Nil;
    procedure Clear_One;
    procedure Clear_Two;
    procedure Clear_Six;
  end;

implementation

procedure  tTests_inkLLc_FFv2_ClearFAST.Clear_Nil;
begin
    inkLLc_CLEAR_fast(LIST,@TST_node_DESTROY);
    //---
    AssertNull(LIST);
end;

procedure  tTests_inkLLc_FFv2_ClearFAST.Clear_One;
begin
    LIST:=TST_list_crt_One;
    //--
    inkLLc_CLEAR_fast(LIST,@TST_node_DESTROY);
    //--
    AssertNull(LIST);
end;

procedure  tTests_inkLLc_FFv2_ClearFAST.Clear_Two;
begin
    LIST:=TST_list_crt_Two;
    //--
    inkLLc_CLEAR_fast(LIST,@TST_node_DESTROY);
    //--
    AssertNull(LIST);
end;

procedure  tTests_inkLLc_FFv2_ClearFAST.Clear_Six;
begin
    LIST:=TST_list_crt_Six;
    //--
    inkLLc_CLEAR_fast(LIST,@TST_node_DESTROY);
    //--
    AssertNull(LIST);
end;

initialization
    RegisterTest(cTestSuitePath__inkLLc,tTests_inkLLc_FFv2_ClearFAST);
end.

