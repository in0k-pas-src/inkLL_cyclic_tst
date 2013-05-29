unit TSTs_inkLLc_20_Enumerate;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLLc,
    uTST_inkLLc_20_Enumerate,
     inkLLcyclic;

type

 rTests_inkLLc_20_Enumerate_DATA=record{rTSTCTC_inkLLc_20_Enumerate_DATA}
   owner  :tTSTCTC_inkLLc_20_Enumerate;
   counter:NativeInt;
   number :NativeInt; //< которое мы ДОЛЖНЫ увидеть
  end;
 pTests_inkLLc_20_Enumerate_DATA=^rTests_inkLLc_20_Enumerate_DATA;

 tTests_inkLLc_20_Enumerate= class(tTSTCTC_inkLLc_20_Enumerate)
  protected
    procedure _enumData_FILL (const Data:pointer);
  published
    procedure Enumerate_Nil;
    procedure Enumerate_One;
    procedure Enumerate_Two;
    procedure Enumerate_SiX;
  end;

implementation

function _Enumerate_FNC_(const Data:pointer; const NODE:pointer):boolean;
begin //номера узлов ДОЛЖНЫ приходить в порядке [0,1..n]
    with pTests_inkLLc_20_Enumerate_DATA(Data)^ do begin
        owner.enumData_incCounter(Data);
        //---
        owner.AssertEquals('wrong Enumerate ORDER',number,owner.TST_node_Namber(NODE));
        inc(number);
    end;
    result:=true;
end;

//------------------------------------------------------------------------------

procedure tTests_inkLLc_20_Enumerate._enumData_FILL(const Data:pointer);
begin
   _enumData_FILL_CORE(Data);
    pTests_inkLLc_20_Enumerate_DATA(Data)^.number:=0;
end;

//------------------------------------------------------------------------------

procedure tTests_inkLLc_20_Enumerate.Enumerate_Nil;
var lst:pointer;
   data:rTests_inkLLc_20_Enumerate_DATA;
begin
    LIST:=TST_list_crt_NIL;
   _enumData_FILL(@data);
    //--
    lst:=inkLLc_Enumerate(LIST,@data,@_Enumerate_FNC_);
    //--
    AssertNull  ('wrong Enum FINISH',  lst);
    AssertEquals('wrong Enum Count' , TST_LIST_Count,_enumData_getCount(@data));
end;

procedure tTests_inkLLc_20_Enumerate.Enumerate_One;
var lst:pointer;
   data:rTests_inkLLc_20_Enumerate_DATA;
begin
    LIST:=TST_list_crt_One;
   _enumData_FILL(@data);
    //--
    lst:=inkLLc_Enumerate(LIST,@data,@_Enumerate_FNC_);
    //--
    AssertNull  ('wrong Enum FINISH',  lst);
    AssertEquals('wrong Enum Count' , TST_LIST_Count,_enumData_getCount(@data));
end;

procedure tTests_inkLLc_20_Enumerate.Enumerate_Two;
var lst:pointer;
   data:rTests_inkLLc_20_Enumerate_DATA;
begin
    LIST:=TST_list_crt_Two;
   _enumData_FILL(@data);
    //--
    lst:=inkLLc_Enumerate(LIST,@data,@_Enumerate_FNC_);
    //--
    AssertNull  ('wrong Enum FINISH',  lst);
    AssertEquals('wrong Enum Count' , TST_LIST_Count,_enumData_getCount(@data));
end;

procedure tTests_inkLLc_20_Enumerate.Enumerate_SiX;
var lst:pointer;
   data:rTests_inkLLc_20_Enumerate_DATA;
begin
    LIST:=TST_list_crt_Six;
   _enumData_FILL(@data);
    //--
    lst:=inkLLc_Enumerate(LIST,@data,@_Enumerate_FNC_);
    //--
    AssertNull  ('wrong Enum FINISH',  lst);
    AssertEquals('wrong Enum Count' , TST_LIST_Count,_enumData_getCount(@data));
end;

initialization
    RegisterTest(cTestSuitePath__inkLLc,tTests_inkLLc_20_Enumerate);
end.

