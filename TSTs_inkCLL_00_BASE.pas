unit TSTs_inkCLL_00_BASE;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses testregistry,
    uTST_CORE_inkCLL,
     inkCLL;

type

 tTests_inkCLL_00_BASE=class(tTSTCTC_CORE_inkCLL)
  published
    procedure Init;
    procedure isEmpty;
  end;

implementation

procedure tTests_inkCLL_00_BASE.isEmpty;
begin
    LIST:=@self;
    AssertFalse(inkCLL_isEmpty(LIST));
    //---
    LIST:=nil;
    AssertTrue (inkCLL_isEmpty(LIST));
end;

procedure tTests_inkCLL_00_BASE.Init;
begin
    LIST:=@self;
    //---
    inkCLL_INIT(LIST);
    //---
    AssertNull (LIST);
end;

initialization
    RegisterTest(cTestSuitePath__inkCLL,tTests_inkCLL_00_BASE);
end.

