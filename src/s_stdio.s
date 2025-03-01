.global s_puts

; Fonction s_puts: Affiche une chaîne suivie d'un saut de ligne
s_puts:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %esi   ; Adresse de la chaîne
    movl $4, %eax        ; sys_write
    movl $1, %ebx        ; File descriptor (stdout)

print_loop:
    movb (%esi), %al     ; Charger un octet de la chaîne
    cmpb $0, %al         ; Vérifier la fin de chaîne
    je end_puts
    int $0x80            ; Appel système pour afficher l'octet
    incl %esi
    jmp print_loop

end_puts:
    movb $'\n', %al      ; Ajouter un saut de ligne
    int $0x80

    popl %ebp
    ret

