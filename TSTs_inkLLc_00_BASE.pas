unit TSTs_inkLLc_00_BASE;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkLLc,
     inkLLcyclic;

type

 tTests_inkLLc_00_BASE=class(tTSTCTC_CORE_inkLLc)
  published
    procedure Init;
    procedure isEmpty;
  end;

implementation

procedure tTests_inkLLc_00_BASE.isEmpty;
begin
    LIST:=@self;
    AssertFalse(inkLLc_isEmpty(LIST));
    //---
    LIST:=nil;
    AssertTrue (inkLLc_isEmpty(LIST));
end;

procedure tTests_inkLLc_00_BASE.Init;
begin
    LIST:=@self;
    //---
    inkLLc_INIT(LIST);
    //---
    AssertNull (LIST);
end;

initialization
    RegisterTest(cTestSuitePath__inkLLc,tTests_inkLLc_00_BASE);
end.

