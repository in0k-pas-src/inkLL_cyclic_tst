unit uTST_CORE_inkCLL;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses fpcunit;

const
 cTestSuitePath__inkCLL='ink Cyclic Linked List';

type

  {[Type TeST Core Test Case] узел списка над которым издеваемся}
 pTST_inkCLL_Node=^rTST_inkCLL_Node;
 rTST_inkCLL_Node=record
    next:pTST_inkCLL_Node;   //< ссылка-указатель на следующий элемент очереди
    nmbr:NativeInt;          //< просто число (индекс)
  end;

  {[Type TeST Core Test Case] САМ РОДОначальник тестов}
 tTSTCTC_CORE_inkCLL=class(TTestCase)
  protected
    procedure _node_DST(Node:pTST_inkCLL_Node);
    function  _node_CRT(Nmbr:NativeInt; Next:pTST_inkCLL_Node):pTST_inkCLL_Node; overload;
    function  _node_CRT(Next:pTST_inkCLL_Node):pTST_inkCLL_Node;                 overload;
    function  _node_CRT(Nmbr:NativeInt):pTST_inkCLL_Node;                        overload;
  public
    function   node_Namber(Node:pointer):NativeInt;
    function   node_Next  (Node:pointer):pointer;
  protected
    procedure _list_DESTOY (var   list:pTST_inkCLL_Node);
    function  _list_Count  (const list:pointer):NativeInt;
    function  _list_Count  :NativeInt;
  protected
    function  _list_crt_NIL(out last:pTST_inkCLL_Node):pTST_inkCLL_Node;   overload;
    function  _list_crt_One(out last:pTST_inkCLL_Node):pTST_inkCLL_Node;   overload;
    function  _list_crt_Two(out last:pTST_inkCLL_Node):pTST_inkCLL_Node;   overload;
    function  _list_crt_Six(out last:pTST_inkCLL_Node):pTST_inkCLL_Node;   overload;
    function  _list_crt_NIL:pTST_inkCLL_Node;                              overload;
    function  _list_crt_One:pTST_inkCLL_Node;                              overload;
    function  _list_crt_Two:pTST_inkCLL_Node;                              overload;
    function  _list_crt_Six:pTST_inkCLL_Node;                              overload;
  protected
    LIST:pointer;
  protected
    procedure SetUp;    override;
    procedure TearDown; override;
  end;

implementation

procedure tTSTCTC_CORE_inkCLL.SetUp;
begin
    LIST:=NIL;
end;

procedure tTSTCTC_CORE_inkCLL.TearDown;
begin
   _list_DESTOY(LIST);
end;

//------------------------------------------------------------------------------

procedure tTSTCTC_CORE_inkCLL._node_DST(Node:pTST_inkCLL_Node);
begin
    dispose(Node)
end;

function tTSTCTC_CORE_inkCLL._node_CRT(Nmbr:NativeInt; Next:pTST_inkCLL_Node):pTST_inkCLL_Node;
begin
    new(result);
    result^.next:=Next;
    result^.nmbr:=Nmbr;
end;

function tTSTCTC_CORE_inkCLL._node_CRT(Next:pTST_inkCLL_Node):pTST_inkCLL_Node;
begin
    result:=_node_CRT(000,Next);
end;

function tTSTCTC_CORE_inkCLL._node_CRT(Nmbr:NativeInt):pTST_inkCLL_Node;
begin
    result:=_node_CRT(Nmbr,nil);
end;

//------------------------------------------------------------------------------

function tTSTCTC_CORE_inkCLL.node_Namber(Node:pointer):NativeInt;
begin
    result:=pTST_inkCLL_Node(node)^.nmbr;
end;

function tTSTCTC_CORE_inkCLL.node_Next(Node:pointer):pointer;
begin
    result:=pTST_inkCLL_Node(node)^.next;
end;

//------------------------------------------------------------------------------

procedure tTSTCTC_CORE_inkCLL._list_DESTOY(var list:pTST_inkCLL_Node);
var tmp:pTST_inkCLL_Node;
begin
    if list<>nil then begin
        tmp:=list^.next;
        list^.next:=NIL;
        //---
        list:=tmp;
        while list<>nil do begin
          tmp:=list^.next;
         _node_DST(list);
          //--
          list:=tmp;
        end;
    end;
end;

function tTSTCTC_CORE_inkCLL._list_Count(const list:pointer):NativeInt;
var tmp:pTST_inkCLL_Node;
begin
    result:=0;
    if list<>nil then begin
        result:=1;
        tmp:=pTST_inkCLL_Node(list)^.next;
        while tmp<>list do begin
            inc(result);
            tmp:=tmp^.next;
        end;
    end;
end;

function tTSTCTC_CORE_inkCLL._list_Count:NativeInt;
begin
    result:=_list_Count(LIST);
end;

//------------------------------------------------------------------------------

function tTSTCTC_CORE_inkCLL._list_crt_NIL(out last:pTST_inkCLL_Node):pTST_inkCLL_Node;
begin
    result:=nil;
    last  :=nil;
end;

function tTSTCTC_CORE_inkCLL._list_crt_One(out last:pTST_inkCLL_Node):pTST_inkCLL_Node;
begin
    last:=_node_CRT(0);
    last^.next:=last;   //< закольцевали
    //-
    result:=last;
end;

function tTSTCTC_CORE_inkCLL._list_crt_Two(out last:pTST_inkCLL_Node):pTST_inkCLL_Node;
begin
    //-- создаем ПОСЛЕДНИЙ элемент
    last  :=_node_CRT(1);
    result:=last;
    //-- промежуточные
    result:=_node_CRT(0,result);
    //-- КОЛЬЦУЕМ
    last^.next:=result;
end;

function tTSTCTC_CORE_inkCLL._list_crt_Six(out last:pTST_inkCLL_Node):pTST_inkCLL_Node;
begin
    //-- создаем ПОСЛЕДНИЙ элемент
    last  :=_node_CRT(5);
    result:=last;
    //-- промежуточные
    result:=_node_CRT(4,result);
    result:=_node_CRT(3,result);
    result:=_node_CRT(2,result);
    result:=_node_CRT(1,result);
    result:=_node_CRT(0,result);
    //-- КОЛЬЦУЕМ
    last^.next:=result;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tTSTCTC_CORE_inkCLL._list_crt_NIL:pTST_inkCLL_Node;
var lst:pointer;
begin
    result:=_list_crt_NIL(lst);
end;

function tTSTCTC_CORE_inkCLL._list_crt_One:pTST_inkCLL_Node;
var lst:pointer;
begin
    result:=_list_crt_One(lst);
end;

function tTSTCTC_CORE_inkCLL._list_crt_Two:pTST_inkCLL_Node;
var lst:pointer;
begin
    result:=_list_crt_Two(lst);
end;

function tTSTCTC_CORE_inkCLL._list_crt_Six:pTST_inkCLL_Node;
var lst:pointer;
begin
    result:=_list_crt_Six(lst);
end;

end.

