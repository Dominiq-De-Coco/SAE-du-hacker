.global s_strlen
.global s_strcpy
.global s_strncmp

; Fonction s_strlen: Calcule la longueur d'une chaîne
s_strlen:
    pushl %ebp
    movl %esp, %ebp
    movl 8(%ebp), %esi   ; Charger l'adresse de la chaîne
    xorl %eax, %eax      ; Initialiser la longueur à 0

loop_strlen:
    cmpb $0, (%esi, %eax)  ; Vérifier si on atteint '\0'
    je end_strlen
    incl %eax               ; Incrémenter la longueur
    jmp loop_strlen

end_strlen:
    popl %ebp
    ret

; Fonction s_strcpy: Copie une chaîne source dans une destination
s_strcpy:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %edi    ; Adresse de destination
    movl 12(%ebp), %esi   ; Adresse source

copy_loop:
    movb (%esi), %al      ; Charger un octet de source
    movb %al, (%edi)      ; Copier dans destination
    incl %esi
    incl %edi
    cmpb $0, %al          ; Si fin de chaîne ('\0')
    jne copy_loop

    movl 8(%ebp), %eax    ; Retourner adresse de destination
    popl %ebp
    ret

; Fonction s_strncmp: Compare deux chaînes sur n caractères
s_strncmp:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %esi    ; Adresse de str1
    movl 12(%ebp), %edi   ; Adresse de str2
    movl 16(%ebp), %ecx   ; Longueur n

compare_loop:
    cmpl $0, %ecx
    je equal              ; Si n == 0, c'est égal

    movb (%esi), %al
    movb (%edi), %bl

    cmpb $0, %al
    je equal
    cmpb $0, %bl
    je equal

    cmpb %al, %bl
    jne not_equal

    incl %esi
    incl %edi
    decl %ecx
    jmp compare_loop

equal:
    movl $0, %eax         ; str1 == str2
    jmp end_strncmp

not_equal:
    movl $1, %eax         ; str1 != str2

end_strncmp:
    popl %ebp
    ret

