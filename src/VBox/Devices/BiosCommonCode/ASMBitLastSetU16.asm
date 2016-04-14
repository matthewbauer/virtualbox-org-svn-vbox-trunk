; $Id$
;; @file
; BiosCommonCode - ASMBitLastSetU16() - borrowed from IPRT.
;

;
; Copyright (C) 2006-2016 Oracle Corporation
;
; This file is part of VirtualBox Open Source Edition (OSE), as
; available from http://www.virtualbox.org. This file is free software;
; you can redistribute it and/or modify it under the terms of the GNU
; General Public License (GPL) as published by the Free Software
; Foundation, in version 2 as it comes in the "COPYING" file of the
; VirtualBox OSE distribution. VirtualBox OSE is distributed in the
; hope that it will be useful, but WITHOUT ANY WARRANTY of any kind.
;
; The contents of this file may alternatively be used under the terms
; of the Common Development and Distribution License Version 1.0
; (CDDL) only, as it comes in the "COPYING.CDDL" file of the
; VirtualBox OSE distribution, in which case the provisions of the
; CDDL are applicable instead of those of the GPL.
;
; You may elect to license modified versions of this file under the
; terms and conditions of either the GPL or the CDDL or both.
;


;*******************************************************************************
;* Header Files                                                                *
;*******************************************************************************
public _ASMBitLastSetU16

        .8086

_TEXT   segment public 'CODE' use16
        assume cs:_TEXT


;;
; Finds the last bit which is set in the given 16-bit integer.
;
; Bits are numbered from 1 (least significant) to 16.
;
; @returns (ax)     index [1..16] of the last set bit.
; @returns (ax)     0 if all bits are cleared.
; @param   u16      Integer to search for set bits.
;
; @cproto DECLASM(unsigned) ASMBitLastSetU16(uint32_t u16);
;
_ASMBitLastSetU16   proc
        .8086
        push    bp
        mov     bp, sp

        mov     cx, [bp + 2 + 2]
        test    cx, cx                  ; check if zero (eliminates checking dec ax result)
        jz      return_zero

        mov     ax, 16
next_bit:
        shl     cx, 1
        jc      return
        dec     ax
        jmp     next_bit

return_zero:
        xor     ax, ax
return:
        pop     bp
        ret
_ASMBitLastSetU16   endp

_TEXT           ends
                end

