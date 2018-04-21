section .data
  neg_1:
    dq -1.0
section .text
  global invert_complex
  extern malloc, free, scanf, printf

; ==== Invert complex ====
invert_complex:
  push rbp
  mov rbp, rsp

  ; Save registers.

  ; Get pointer.
  mov rax, [rbp+8]
  ; Get first value (real number)
  movq xmm0, [rax]
  ; Get second value (imaginery)
  movq xmm6, [rax+8]

  ; Number of bytes to allocate.
  mov rdi, 16
  call malloc
  ; Copy number.
  movq [rax], xmm0
  ; Load a register with all 1s
  mulss xmm6, [neg_1]
  movq [rax + 8], xmm6

  ; Restore registers.

  ; Return.
  pop rbp
  ret
