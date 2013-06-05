unit TSTs_inkLLc_E4_Erase;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLL_node,
    uTST_CORE_inkLLc,
     inkLL_node,
     inkLL_cyclic;

type

 tTests_inkLLc_E4_Erase= class(tTSTCTC_CORE_inkLLc)
  protected
    procedure _enumData_CLR(const DATA:pointer);
    function  _aTest_cmpFNC_(const Data:pointer; const NODE:pointer):boolean;
    procedure _aTest_dspPRC_(const NODE:pointer);
  published
    procedure Erase_SiX;
  end;

implementation

type
 rTests_cmpCXT=record
    owner  :tTests_inkLLc_E4_Erase;
    counter:NativeInt;
  end;
 pTest_CmpCXT=^rTests_cmpCXT;

function _fTest_cmpFNC_(const Data:pointer; const NODE:pointer):boolean;
begin
    with pTest_CmpCXT(DATA)^ do begin
      result:=(owner.TST_node_Namber(NODE) and 1 )=0;
      counter:=counter+1;
    end;
end;

procedure _fTest_dspPRC_(const NODE:pointer);
begin
    TST_inkLL_Node_DESTRoY(NODE);
end;

function tTests_inkLLc_E4_Erase._aTest_cmpFNC_(const Data:pointer; const NODE:pointer):boolean;
begin
    with pTest_CmpCXT(DATA)^ do begin
      result:=(owner.TST_node_Namber(NODE) and 1 )=0;
      counter:=counter+1;
    end;
end;

procedure tTests_inkLLc_E4_Erase._aTest_dspPRC_(const NODE:pointer);
begin
    TST_inkLL_Node_DESTRoY(NODE);
end;


//------------------------------------------------------------------------------

procedure tTests_inkLLc_E4_Erase._enumData_CLR(const DATA:pointer);
begin
    with pTest_CmpCXT(DATA)^ do begin
      owner  :=SELF;
      counter:=0;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tTests_inkLLc_E4_Erase.Erase_SiX;
var _cmpCXT:rTests_cmpCXT;
begin
    LIST:=TST_list_crt_Six;
   _enumData_CLR(@_cmpCXT);
    //---
    inkLLc_Erase_fast(LIST,@_cmpCXT,@_fTest_cmpFNC_,fInkNodeLL_doDispose(@_fTest_dspPRC_));
    //--
    AssertEquals('wrong enum count', 6             , _cmpCXT.counter);
    AssertEquals('wrong LIST count', TST_LIST_Count,3);
end;

initialization
    RegisterTest(cTestSuitePath__inkLLc,tTests_inkLLc_E4_Erase);
end.

