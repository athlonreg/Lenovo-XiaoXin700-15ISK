//
// In config ACPI, _Q1C to XQ1C
// Find:     5f51 3143
// Replace:  5851 3143

// In config ACPI, _Q1D to XQ1D
// Find:     5f51 3144
// Replace:  5851 3144
//
DefinitionBlock("", "SSDT", 2, "OCLT", "BKEY", 0)
{
    External(_SB.PCI0.LPCB.KBD0, DeviceObj)
    External(_SB.PCI0.LPCB.EC0, DeviceObj)
    External(_SB.PCI0.LPCB.EC0.XQ1C, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ1D, MethodObj)
    
    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (_Q1C, 0, NotSerialized)//up
        {
            If (_OSI ("Darwin"))
            {
                Notify(\_SB.PCI0.LPCB.KBD0, 0x0406)
                Notify(\_SB.PCI0.LPCB.KBD0, 0x10)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ1C()
            }
        }
        
        Method (_Q1D, 0, NotSerialized)//down
        {
            If (_OSI ("Darwin"))
            {
                Notify(\_SB.PCI0.LPCB.KBD0, 0x0405)
                Notify(\_SB.PCI0.LPCB.KBD0, 0x20)
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ1D()
            }
        }
    }
}
//EOF
