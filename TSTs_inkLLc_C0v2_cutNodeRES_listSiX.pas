unit TSTs_inkLLc_C0v2_cutNodeRES_listSiX;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLLc,
    uTST_inkLLc_C0v2_cutNodeRES;

type

 tTests_inkLLc_C0v2_cutNodeRES_ListSiX=class(tTSTCTC_inkLLc_C0v2_cutNodeRES)
  protected
    procedure SetUp; override;
  published
    procedure cutNodeIndex_0;
    procedure cutNodeIndex_1;
    procedure cutNodeIndex_4;
    procedure cutNodeIndex_5;
  end;

implementation

procedure tTests_inkLLc_C0v2_cutNodeRES_ListSiX.SetUp;
begin
   inherited;
   LIST:=TST_list_crt_Six;
end;

//------------------------------------------------------------------------------

procedure tTests_inkLLc_C0v2_cutNodeRES_ListSiX.cutNodeIndex_0;
begin
   _TEST_(0);
end;

procedure tTests_inkLLc_C0v2_cutNodeRES_ListSiX.cutNodeIndex_1;
begin
   _TEST_(1);
end;

procedure tTests_inkLLc_C0v2_cutNodeRES_ListSiX.cutNodeIndex_4;
begin
   _TEST_(4);
end;

procedure tTests_inkLLc_C0v2_cutNodeRES_ListSiX.cutNodeIndex_5;
begin
   _TEST_(5);
end;


initialization
    RegisterTest(cTestSuitePath__inkLLc,tTests_inkLLc_C0v2_cutNodeRES_ListSiX);
end.

