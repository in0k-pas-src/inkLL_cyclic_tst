unit uTST_CORE_inkCLL;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses fpcunit,
     inkCLL;

const
 cTestSuitePath__inkCLL='ink Cyclic Linked List';

type

  {[Type TeST Core Test Case] САМ РОДОначальник тестов}
 tTSTCTC_CORE_inkCLL=class(TTestCase)
  protected
    procedure _node_DST(Node:pQueueNode);
    function  _node_CRT(Next:pQueueNode=nil):pQueueNode;
  protected
    function  _list_crt_NIL(out last:pQueueNode):pQueueNode;   overload;
    function  _list_crt_One(out last:pQueueNode):pQueueNode;   overload;
    function  _list_crt_Two(out last:pQueueNode):pQueueNode;   overload;
    function  _list_crt_Six(out last:pQueueNode):pQueueNode;   overload;
    function  _list_crt_NIL:pQueueNode;                        overload;
    function  _list_crt_One:pQueueNode;                        overload;
    function  _list_crt_Two:pQueueNode;                        overload;
    function  _list_crt_Six:pQueueNode;                        overload;
  protected
    LIST:pointer;
  protected
    procedure SetUp;    override;
    procedure TearDown; override;
  end;

implementation

procedure tTSTCTC_CORE_inkCLL.SetUp;
begin
    inkCLL_INIT(LIST);
end;

procedure tTSTCTC_CORE_inkCLL.TearDown;
begin
    if LIST<>nil then inkCLL_clean_fast(LIST);
end;

//------------------------------------------------------------------------------

procedure tTSTCTC_CORE_inkCLL._node_DST(Node:pQueueNode);
begin
    dispose(Node)
end;

function tTSTCTC_CORE_inkCLL._node_CRT(Next:pQueueNode=nil):pQueueNode;
begin
    new(result);
    result^.next:=Next;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tTSTCTC_CORE_inkCLL._list_crt_NIL(out last:pQueueNode):pQueueNode;
begin
    result:=nil;
    last  :=nil;
end;

function tTSTCTC_CORE_inkCLL._list_crt_One(out last:pQueueNode):pQueueNode;
begin
    result:=_node_CRT;
    result^.next:=result;
    last:=result;
end;

function tTSTCTC_CORE_inkCLL._list_crt_Two(out last:pQueueNode):pQueueNode;
begin
    last:=_node_CRT;
    //---
    result:=last;
    result:=_node_CRT(result);
    //--
    last^.next:=result;
end;

function tTSTCTC_CORE_inkCLL._list_crt_Six(out last:pQueueNode):pQueueNode;
begin
    last:=_node_CRT;
    //---
    result:=last;
    result:=_node_CRT(result);
    result:=_node_CRT(result);
    result:=_node_CRT(result);
    result:=_node_CRT(result);
    result:=_node_CRT(result);
    //--
    last^.next:=result;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tTSTCTC_CORE_inkCLL._list_crt_NIL:pQueueNode;
var lst:pointer;
begin
    result:=_list_crt_NIL(lst);
end;

function tTSTCTC_CORE_inkCLL._list_crt_One:pQueueNode;
var lst:pointer;
begin
    result:=_list_crt_One(lst);
end;

function tTSTCTC_CORE_inkCLL._list_crt_Two:pQueueNode;
var lst:pointer;
begin
    result:=_list_crt_Two(lst);
end;

function tTSTCTC_CORE_inkCLL._list_crt_Six:pQueueNode;
var lst:pointer;
begin
    result:=_list_crt_Six(lst);
end;

end.

