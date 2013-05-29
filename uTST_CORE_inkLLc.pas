unit uTST_CORE_inkLLc;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses uTST_CORE_inkLL_node;

const
 cTestSuitePath__inkLLc='ink Cyclic Linked List';

type

  {[Type TeST Core Test Case] САМ РОДОначальник тестов}
 tTSTCTC_CORE_inkLLc=class(tTSTCTC_CORE_inkLL)
  protected
    procedure _list_DESTOY  (var   lst:pTST_inkLL_Node);                                           override;
    function  _list_Create  (const Count:NativeInt;     out last:pTST_inkLL_Node):pTST_inkLL_Node; override;
    function  _list_clcCount(const lst:pTST_inkLL_Node; out last:pTST_inkLL_Node):NativeInt;       override;
  protected
    procedure SetUp;    override;
    procedure TearDown; override;
  protected
    function  TST_list_crt_NIL(out last:pointer):pointer;   overload;
    function  TST_list_crt_One(out last:pointer):pointer;   overload;
    function  TST_list_crt_Two(out last:pointer):pointer;   overload;
    function  TST_list_crt_Six(out last:pointer):pointer;   overload;
    function  TST_list_crt_NIL:pointer;                     overload;
    function  TST_list_crt_One:pointer;                     overload;
    function  TST_list_crt_Two:pointer;                     overload;
    function  TST_list_crt_Six:pointer;                     overload;
  public
    function  TST_list_clcCount(const lst:pointer):NativeInt;
    function  TST_list_getNode (const lst:pointer; index:NativeInt):pointer;
    function  TST_list_getIndex(const lst:pointer; Node :pointer  ):NativeInt;
    function  TST_LIST_Count:NativeInt;
    function  TST_LIST_getNode (index:NativeInt):pointer;
    function  TST_LIST_getIndex(Node :pointer  ):NativeInt;
  end;

implementation

procedure tTSTCTC_CORE_inkLLc.SetUp;
begin
    inherited;
end;

procedure tTSTCTC_CORE_inkLLc.TearDown;
begin
    if LIST<>nil then _list_DESTOY(LIST);
end;

//------------------------------------------------------------------------------

procedure tTSTCTC_CORE_inkLLc._list_DESTOY(var lst:pTST_inkLL_Node);
var tmp:pTST_inkLL_Node;
begin
    if lst<>nil then begin
        tmp:=lst^.next;
        lst^.next:=NIL;
        //---
        lst:=tmp;
        while lst<>nil do begin
          tmp:=lst^.next;
         _node_DST(lst);
          //--
          lst:=tmp;
        end;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tTSTCTC_CORE_inkLLc._list_Create(const Count:NativeInt; out last:pTST_inkLL_Node):pTST_inkLL_Node;
var i:NativeInt;
begin
    result:=NIL;
    last  :=NIL;
    if Count>0 then begin;
        last  :=_node_CRT(Count-1,NIL);
        result:=last;
        if Count>1 then begin
            for i:= (Count-2) downto (0) do begin
               result:=_node_CRT(i,result);
            end;
        end;
    end;
    //--- делаем ЦИКЛ
    if last<>nil then begin
        last^.next:=result;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tTSTCTC_CORE_inkLLc._list_clcCount(const lst:pTST_inkLL_Node; out last:pTST_inkLL_Node):NativeInt;
begin
    result:=0;
    last  :=nil;
    if lst<>nil then begin
        result:=1;
        last  :=lst;
        while last^.next<>lst do begin
            inc(result);
            last:=last^.next;
        end;
    end;
end;

//------------------------------------------------------------------------------

function tTSTCTC_CORE_inkLLc.TST_list_crt_NIL(out last:pointer):pointer;
begin
    result:=_list_Create(0,last);
end;

function tTSTCTC_CORE_inkLLc.TST_list_crt_One(out last:pointer):pointer;
begin
    result:=_list_Create(1,last);
end;

function tTSTCTC_CORE_inkLLc.TST_list_crt_Two(out last:pointer):pointer;
begin
    result:=_list_Create(2,last);
end;

function tTSTCTC_CORE_inkLLc.TST_list_crt_Six(out last:pointer):pointer;
begin
    result:=_list_Create(6,last);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tTSTCTC_CORE_inkLLc.TST_list_crt_NIL:pointer;
var lst:pointer;
begin
    result:=TST_list_crt_NIL(lst);
end;

function tTSTCTC_CORE_inkLLc.TST_list_crt_One:pointer;
var lst:pointer;
begin
    result:=TST_list_crt_One(lst);
end;

function tTSTCTC_CORE_inkLLc.TST_list_crt_Two:pointer;
var lst:pointer;
begin
    result:=TST_list_crt_Two(lst);
end;

function tTSTCTC_CORE_inkLLc.TST_list_crt_Six:pointer;
var lst:pointer;
begin
    result:=TST_list_crt_Six(lst);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tTSTCTC_CORE_inkLLc.TST_list_clcCount(const lst:pointer):NativeInt;
var l:pointer;
begin
    result:=_list_clcCount(lst,l);
end;

function tTSTCTC_CORE_inkLLc.TST_list_getNode(const lst:pointer; index:NativeInt):pointer;
var i:NativeInt;
begin
    result:=lst;
    if index>0 then begin
        for i:=0 to index-1 do begin
            result:=TST_node_Next(result);
            if result=lst then begin
                result:=nil;
                BREAK;
            end;
        end;
    end;
end;

function tTSTCTC_CORE_inkLLc.TST_list_getIndex(const lst:pointer; Node:pointer):NativeInt;
var tmp:pointer;
begin
    if lst=nil then result:=0
    else begin
        result:=0;
        tmp:=lst;
        while tmp<>node do begin
            inc(result);
            tmp:=TST_node_Next(tmp);
            if tmp=lst then break;
        end;
    end
end;

function tTSTCTC_CORE_inkLLc.TST_LIST_Count:NativeInt;
var l:pointer;
begin
    result:=_list_clcCount(LIST,l);
end;

function tTSTCTC_CORE_inkLLc.TST_LIST_getNode(index:NativeInt):pointer;
begin
    result:=TST_list_getNode(LIST,index);
end;

function tTSTCTC_CORE_inkLLc.TST_LIST_getIndex(Node:pointer):NativeInt;
begin
    result:=TST_LIST_getIndex(LIST,node);
end;


end.

