unit TSTs_inkLLc_C0v1_cutNode_listOne;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLLc,
    uTST_inkLLc_C0v1_cutNode;

type

 tTests_inkLLc_C0v1_cutNode_ListOne=class(tTSTCTC_inkLLc_C0v1_cutNode)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
  end;

implementation

procedure tTests_inkLLc_C0v1_cutNode_ListOne.SetUp;
begin
   inherited;
   LIST:=TST_list_crt_One;
end;

//------------------------------------------------------------------------------

procedure tTests_inkLLc_C0v1_cutNode_ListOne.cutNodeIndex_0;
begin
   _TEST_(0);
end;

initialization
    RegisterTest(cTestSuitePath__inkLLc,tTests_inkLLc_C0v1_cutNode_ListOne);
end.

