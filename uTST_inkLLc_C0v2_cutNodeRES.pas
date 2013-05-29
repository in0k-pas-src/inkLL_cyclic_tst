unit uTST_inkLLc_C0v2_cutNodeRES;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses
   uTST_CORE_inkLLc,
    inkLLcyclic;

type

 tTSTCTC_inkLLc_C0v2_cutNodeRES= class(tTSTCTC_CORE_inkLLc)
  protected
    procedure _TEST_(index:integer);
  published
    procedure cutNode_OVER;
  end;

implementation

procedure tTSTCTC_inkLLc_C0v2_cutNodeRES.cutNode_OVER;
var cnt:NativeUint;
begin
    cnt:=TST_LIST_Count;
    //----
    AssertFalse (inkLLc_cutNodeRes(LIST,self));
    AssertEquals(cnt,TST_LIST_Count);
end;

//------------------------------------------------------------------------------

procedure tTSTCTC_inkLLc_C0v2_cutNodeRES._TEST_(index:integer);
var tmp:pointer;
    cnt:NativeUint;
begin
    cnt:=TST_LIST_Count;
    tmp:=TST_LIST_getNode(LIST,index);
    //--
    AssertTRUE  (inkLLc_cutNodeRes(LIST,tmp));
    //--
    AssertEquals(cnt-1,TST_LIST_Count);
    AssertEquals(cnt-1,TST_LIST_getIndex(tmp));
    //--
   _node_DST(tmp);
end;

end.

