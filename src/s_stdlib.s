.global s_atoi

s_atoi:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %esi   ; Adresse de la chaîne
    xorl %eax, %eax       ; Résultat
    xorl %ebx, %ebx       ; Signe (0 = positif, 1 = négatif)

    cmpb $'-', (%esi)     ; Vérifier si signe négatif
    jne parse_digits
    incl %esi
    movl $1, %ebx         ; Marquer comme négatif

parse_digits:
    movb (%esi), %cl
    cmpb $0, %cl
    je end_atoi

    subb $'0', %cl
    cmpb $9, %cl
    ja end_atoi

    imull $10, %eax
    addl %ecx, %eax
    incl %esi
    jmp parse_digits

end_atoi:
    cmpl $0, %ebx
    je end
    negl %eax

end:
    popl %ebp
    ret

