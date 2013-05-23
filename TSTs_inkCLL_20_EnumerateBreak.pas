unit TSTs_inkCLL_20_EnumerateBreak;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkCLL,
    uTST_inkCLL_20_Enumerate,
     inkCLL;

type

 rTests_inkCLL_20_enumerateBREAK_DATA=record{rTSTCTC_inkCLL_20_Enumerate_DATA}
   owner  :tTSTCTC_inkCLL_20_Enumerate;
   counter:NativeInt;
   breakND:NativeInt;  //< на нем ДОЛЖНЫ остановиться
  end;
 pTests_inkCLL_20_enumerateBREAK_DATA=^rTests_inkCLL_20_enumerateBREAK_DATA;

 tTests_inkCLL_20_EnumerateBREAK= class(tTSTCTC_inkCLL_20_Enumerate)
  protected
    procedure _enumData_FILL (const Data:pointer; breakND:NativeInt);
  published
    procedure Enumerate_One;
    procedure Enumerate_Two;
    procedure Enumerate_SiX;
  end;

implementation

function _Enumerate_FNC_(const Data:pointer; const NODE:pointer):boolean;
begin //номера узлов ДОЛЖНЫ приходить в порядке [0,1..n]
    with pTests_inkCLL_20_enumerateBREAK_DATA(Data)^ do begin
        owner.enumData_incCounter(Data);
        result:=NOT(owner.node_Namber(NODE)=breakND); //< условие остановки
    end;
end;

//------------------------------------------------------------------------------

procedure tTests_inkCLL_20_EnumerateBREAK._enumData_FILL(const Data:pointer; breakND:NativeInt);
begin
   _enumData_FILL_CORE(Data);
    pTests_inkCLL_20_enumerateBREAK_DATA(Data)^.breakND:=breakND;
end;

//------------------------------------------------------------------------------

procedure tTests_inkCLL_20_EnumerateBREAK.Enumerate_One;
var lst:pointer;
   data:rTests_inkCLL_20_enumerateBREAK_DATA;
begin
    LIST:=_list_crt_One;
    //--
   _enumData_FILL(@data,0);
    lst:=inkCLL_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong Enum FINISH',lst);
    AssertEquals ('wrong Enum Count' ,0,node_Namber(lst));
end;

procedure tTests_inkCLL_20_EnumerateBREAK.Enumerate_Two;
var lst:pointer;
   data:rTests_inkCLL_20_enumerateBREAK_DATA;
begin
    LIST:=_list_crt_Two;
    //--
   _enumData_FILL(@data,0);
    lst:=inkCLL_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong START-list-break Enum FINISH'     ,lst);
    AssertEquals ('wrong START-list-break Enum FINISH node',0,node_Namber(lst));
    //--
   _enumData_FILL(@data,1);
    lst:=inkCLL_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong END-list-break Enum FINISH'     ,lst);
    AssertEquals ('wrong END-list-break Enum FINISH node',1,node_Namber(lst));
end;

procedure tTests_inkCLL_20_EnumerateBREAK.Enumerate_SiX;
var lst:pointer;
   data:rTests_inkCLL_20_enumerateBREAK_DATA;
begin
    LIST:=_list_crt_Six;
    //--
   _enumData_FILL(@data,0);
    lst:=inkCLL_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong START-list-break Enum FINISH'     ,lst);
    AssertEquals ('wrong START-list-break Enum FINISH node',0,node_Namber(lst));
    //--
   _enumData_FILL(@data,3);
    lst:=inkCLL_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong half-list-break Enum FINISH'     ,lst);
    AssertEquals ('wrong half-list-break Enum FINISH node',3,node_Namber(lst));
    //--
   _enumData_FILL(@data,1);
    lst:=inkCLL_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong END-list-break Enum FINISH'     ,lst);
    AssertEquals ('wrong END-list-break Enum FINISH node',1,node_Namber(lst));
end;

initialization
    RegisterTest(cTestSuitePath__inkCLL_20_Enumerate,tTests_inkCLL_20_EnumerateBREAK);
end.

