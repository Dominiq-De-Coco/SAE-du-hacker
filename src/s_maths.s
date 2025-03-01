.global s_abs
.global s_pow

; Fonction s_abs: Retourne la valeur absolue d’un entier
s_abs:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %eax   ; Charger l'argument
    cmpl $0, %eax
    jge end_abs           ; Si >= 0, retourner directement
    negl %eax             ; Sinon, changer le signe

end_abs:
    popl %ebp
    ret

; Fonction s_pow: Calcule la puissance d’un nombre
s_pow:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %eax   ; Base
    movl 12(%ebp), %ecx  ; Exposant
    movl $1, %ebx        ; Résultat

pow_loop:
    cmpl $0, %ecx
    je end_pow
    imull %eax, %ebx     ; Multiplier résultat par la base
    decl %ecx
    jmp pow_loop

end_pow:
    movl %ebx, %eax      ; Placer le résultat dans %eax
    popl %ebp
    ret

