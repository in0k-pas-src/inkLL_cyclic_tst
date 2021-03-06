unit ALL_Tests_inkLLcyclic;
(*$define testCase -- пометка для gitExtensions-Statickics что это файл ТЕСТ
  [Test
*)
{$mode objfpc}{$H+}
interface

uses
  //ALL_Tests_inkSLL,
  //---
  TSTs_inkLLc_00_BASE,
  TSTs_inkLLc_FFv2_ClearFAST,
  TSTs_inkLLc_E4_Erase,
  TSTs_inkLLc_11_Count,
  //---
  TSTs_inkLLc_20_Enumerate,
  TSTs_inkLLc_20_EnumBreak,
 { TSTs_inkSLL_69_Invert,
  //---
  TSTs_inkSLL_05v1_getLast,
  TSTs_inkSLL_05v2_getLast,
  }
  //---
  //---
  TSTs_inkLLc_C2_cutNodeSecond,
  TSTs_inkLLc_16_insNodeSecond,
  //---
  TSTs_inkLLc_C0v1_cutNode_listOne,
  TSTs_inkLLc_C0v1_cutNode_listTwo,
  TSTs_inkLLc_C0V1_cutNode_listSiX,
  //---
  TSTs_inkLLc_C0v2_cutNodeRES_listOne,
  TSTs_inkLLc_C0v2_cutNodeRES_listTwo,
  TSTs_inkLLc_C0v2_cutNodeRES_listSiX;
  //---
  {
  TSTs_inkSLL_C1_cutNodeFirst,
  TSTs_inkSLL_07_insListFirst,
  //---
  TSTs_inkSLL_CFv1_cutNodeLast,
  TSTs_inkSLL_CFv2_cutNodeLast,
  TSTs_inkSLL_08v1_insNodeLast,
  TSTs_inkSLL_08v2_insNodeLast,
  TSTs_inkSLL_09v1_insListLast,
  TSTs_inkSLL_09v2_insListLast,
  //---
  TSTs_inkSLL_A1v1_getNode,
  TSTs_inkSLL_A1v2_getNodeOrLast,
  TSTs_inkSLL_A2_getIndex,
  //---
  TSTs_inkSLL_A3_insNodeIndex_listNIL,
  TSTs_inkSLL_A3_insNodeIndex_listONE,
  TSTs_inkSLL_A3_insNodeIndex_listSiX,
  //---
  TSTs_inkSLL_A5v1_cutNodeIndex_listONE,
  TSTs_inkSLL_A5v1_cutNodeIndex_listTWO,
  TSTs_inkSLL_A5v1_cutNodeIndex_listSiX; }

implementation

end.

