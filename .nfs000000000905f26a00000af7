
section .text
  global invert_complex
  extern malloc, free, scanf, printf

; ==== Invert complex ====
invert_complex:
  push rbp
  mov rbp, rsp

  ; Save registers.
  push r10
  push r11

  ; Get pointer.
  mov rax, [rbp+8]
  ; Get first value (real number)
  mov r10, [rax]
  ; Get second value (imaginery)
  mov r11, [rax+8]

  ; Number of bytes to allocate.
  mov rdi, 16
  call malloc
  ; Copy number.
  mov [rax], r10
  neg r11
  mov [rax+8], r11

  ; Restore registers.
  pop r11
  pop r10

  ; Return.
  pop rbp
  ret
