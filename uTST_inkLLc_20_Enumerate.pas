unit uTST_inkLLc_20_Enumerate;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses uTST_CORE_inkLLc;

type

 rTSTCTC_inkLLc_20_Enumerate_DATA=record
   owner  :tTSTCTC_CORE_inkLLc;
   counter:NativeInt;   //< столько штук обработали
  end;
 pTSTCTC_inkLLc_20_Enumerate_DATA=^rTSTCTC_inkLLc_20_Enumerate_DATA;

 tTSTCTC_inkLLc_20_Enumerate= class(tTSTCTC_CORE_inkLLc)
  protected
    procedure _enumData_FILL_CORE(const Data:pointer);
    function  _enumData_getCount (const Data:pointer):NativeInt;
  public
    procedure enumData_incCounter(const Data:pointer);
  end;

implementation

procedure tTSTCTC_inkLLc_20_Enumerate._enumData_FILL_CORE(const Data:pointer);
begin
    with pTSTCTC_inkLLc_20_Enumerate_DATA(data)^ do begin
        owner  :=Self;
        counter:=0;
    end;
end;

function tTSTCTC_inkLLc_20_Enumerate._enumData_getCount(const Data:pointer):NativeInt;
begin
    result:=pTSTCTC_inkLLc_20_Enumerate_DATA(data)^.counter;
end;

procedure tTSTCTC_inkLLc_20_Enumerate.enumData_incCounter(const Data:pointer);
begin
    inc(pTSTCTC_inkLLc_20_Enumerate_DATA(data)^.counter);
end;

end.

