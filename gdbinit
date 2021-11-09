define hf_bt
 set $pc = ((uint32_t*)$psp)[6]
 set $lr = ((uint32_t*)$psp)[5]
 set $r12 = ((uint32_t*)$psp)[4]
 set $r3 = ((uint32_t*)$psp)[3]
 set $r2 = ((uint32_t*)$psp)[2]
 set $r1 = ((uint32_t*)$psp)[1]
 set $r0 = ((uint32_t*)$psp)[0]
        # Use 4*26 with FPU, 4*8 without FPU
 set $sp = $psp + 4*8
 bt
end
