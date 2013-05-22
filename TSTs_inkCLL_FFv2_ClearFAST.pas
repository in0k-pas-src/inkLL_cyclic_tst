unit TSTs_inkCLL_FFv2_ClearFAST;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkCLL,
     inkCLL;

type

  tTests_inkCLL_FFv2_ClearFAST= class(tTSTCTC_CORE_inkCLL)
  published
    procedure Clear_Nil;
    procedure Clear_One;
    procedure Clear_Two;
    procedure Clear_Six;
  end;

implementation

procedure  tTests_inkCLL_FFv2_ClearFAST.Clear_Nil;
begin
    inkCLL_clean_fast(LIST);
    //---
    AssertNull(LIST);
end;

procedure  tTests_inkCLL_FFv2_ClearFAST.Clear_One;
begin
    LIST:=_list_crt_One;
    //--
    inkCLL_clean_fast(LIST);
    //--
    AssertNull(LIST);
end;

procedure  tTests_inkCLL_FFv2_ClearFAST.Clear_Two;
begin
    LIST:=_list_crt_Two;
    //--
    inkCLL_clean_fast(LIST);
    //--
    AssertNull(LIST);
end;

procedure  tTests_inkCLL_FFv2_ClearFAST.Clear_Six;
begin
    LIST:=_list_crt_Six;
    //--
    inkCLL_clean_fast(LIST);
    //--
    AssertNull(LIST);
end;

initialization
    RegisterTest(cTestSuitePath__inkCLL,tTests_inkCLL_FFv2_ClearFAST);
end.

