unit TSTs_inkLLc_20_EnumBreak;
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

 rTests_inkLLc_20_enumBREAK_DATA=record{rTSTCTC_inkLLc_20_Enumerate_DATA}
   owner  :tTSTCTC_inkLLc_20_Enumerate;
   counter:NativeInt;
   breakND:NativeInt;  //< на нем ДОЛЖНЫ остановиться
  end;
 pTests_inkLLc_20_enumBREAK_DATA=^rTests_inkLLc_20_enumBREAK_DATA;

 tTests_inkLLc_20_EnumBREAK= class(tTSTCTC_inkLLc_20_Enumerate)
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
    with pTests_inkLLc_20_enumBREAK_DATA(Data)^ do begin
        owner.enumData_incCounter(Data);
        result:=NOT(owner.TST_node_Namber(NODE)=breakND); //< условие остановки
    end;
end;

//------------------------------------------------------------------------------

procedure tTests_inkLLc_20_EnumBREAK._enumData_FILL(const Data:pointer; breakND:NativeInt);
begin
   _enumData_FILL_CORE(Data);
    pTests_inkLLc_20_enumBREAK_DATA(Data)^.breakND:=breakND;
end;

//------------------------------------------------------------------------------

procedure tTests_inkLLc_20_EnumBREAK.Enumerate_One;
var lst:pointer;
   data:rTests_inkLLc_20_enumBREAK_DATA;
begin
    LIST:=TST_list_crt_One;
    //--
   _enumData_FILL(@data,0);
    lst:=inkLLc_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong Enum FINISH',lst);
    AssertEquals ('wrong Enum Count' ,0,TST_node_Namber(lst));
end;

procedure tTests_inkLLc_20_EnumBREAK.Enumerate_Two;
var lst:pointer;
   data:rTests_inkLLc_20_enumBREAK_DATA;
begin
    LIST:=TST_list_crt_Two;
    //--
   _enumData_FILL(@data,0);
    lst:=inkLLc_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong START-list-break Enum FINISH'     ,lst);
    AssertEquals ('wrong START-list-break Enum FINISH node',0,TST_node_Namber(lst));
    //--
   _enumData_FILL(@data,1);
    lst:=inkLLc_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong END-list-break Enum FINISH'     ,lst);
    AssertEquals ('wrong END-list-break Enum FINISH node',1,TST_node_Namber(lst));
end;

procedure tTests_inkLLc_20_EnumBREAK.Enumerate_SiX;
var lst:pointer;
   data:rTests_inkLLc_20_enumBREAK_DATA;
begin
    LIST:=TST_list_crt_Six;
    //--
   _enumData_FILL(@data,0);
    lst:=inkLLc_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong START-list-break Enum FINISH'     ,lst);
    AssertEquals ('wrong START-list-break Enum FINISH node',0,TST_node_Namber(lst));
    //--
   _enumData_FILL(@data,3);
    lst:=inkLLc_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong half-list-break Enum FINISH'     ,lst);
    AssertEquals ('wrong half-list-break Enum FINISH node',3,TST_node_Namber(lst));
    //--
   _enumData_FILL(@data,1);
    lst:=inkLLc_Enumerate(LIST,@data,@_Enumerate_FNC_);
    AssertNotNull('wrong END-list-break Enum FINISH'     ,lst);
    AssertEquals ('wrong END-list-break Enum FINISH node',1,TST_node_Namber(lst));
end;

initialization
    RegisterTest(cTestSuitePath__inkLLc,tTests_inkLLc_20_EnumBREAK);
end.

