/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20171110 (64-bit version)(RM)
 * Copyright (c) 2000 - 2017 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-x8_4-Cpu0Hwp.aml, Wed Dec  6 16:13:02 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000008E (142)
 *     Revision         0x02
 *     Checksum         0x2E
 *     OEM ID           "PmRef"
 *     OEM Table ID     "Cpu0Hwp"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20130117 (538116375)
 */
DefinitionBlock ("", "SSDT", 2, "PmRef", "Cpu0Hwp", 0x00003000)
{
    External (_PR_.CPU0, ProcessorObj)
    External (_PR_.CPU0.CPC1, PkgObj)
    External (_PR_.CPU0.CPC2, PkgObj)
    External (_PR_.HWPA, FieldUnitObj)
    External (_PR_.HWPV, FieldUnitObj)

    Scope (\_PR.CPU0)
    {
        Method (_CPC, 0, NotSerialized)  // _CPC: Continuous Performance Control
        {
            Store (RefOf (CPC1), Local0)
            Store (\_PR.HWPA, Index (DerefOf (Index (DerefOf (Local0), 0x06)), 0x07))
            ShiftRight (\_PR.HWPA, 0x08, Local1)
            Store (Local1, Index (DerefOf (Index (DerefOf (Local0), 0x06)), 0x08))
            If (LEqual (HWPV, One))
            {
                Return (CPC1)
            }
            ElseIf (LEqual (HWPV, 0x02))
            {
                Return (CPC2)
            }
        }
    }
}

