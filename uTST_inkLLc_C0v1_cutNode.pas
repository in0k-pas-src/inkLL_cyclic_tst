unit uTST_inkLLc_C0v1_cutNode;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses
   uTST_CORE_inkLLc,
    inkLL_cyclic;

type

 tTSTCTC_inkLLc_C0v1_cutNode= class(tTSTCTC_CORE_inkLLc)
  protected
    procedure _TEST_(index:integer);
  published
    procedure cutNode_OVER;
  end;

implementation

procedure tTSTCTC_inkLLc_C0v1_cutNode.cutNode_OVER;
var cnt:NativeUint;
begin
    cnt:=TST_LIST_Count;
    //----
    inkLLc_cutNode(LIST,self);
    AssertEquals('wrong lng afte CUT',cnt,TST_LIST_Count);
end;

//------------------------------------------------------------------------------

procedure tTSTCTC_inkLLc_C0v1_cutNode._TEST_(index:integer);
var tmp:pointer;
    cnt:NativeUint;
begin
    cnt:=TST_LIST_Count;
    tmp:=TST_LIST_getNode(index);
    //--
    inkLLc_cutNode(LIST,tmp);
    //--
    AssertEquals(cnt-1,TST_LIST_Count);
    AssertEquals(cnt-1,TST_LIST_getIndex(tmp));
    //--
   _node_DST(tmp);
end;

end.

