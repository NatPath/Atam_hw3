.global hook

.section .data
msg: .ascii "This code was hacked by Noa Killa's gang\n"
endmsg: .quad . - msg

.section .text
hook:
  movq $_start, %rdx     # copy _start addr
  add $0x1e, %rdx        # set offset for injection
  lea print, %r8
  movl $0x90d0ff41, (%rdx)
  jmp _start
             
print: 
  movq $0x01, %rax
  movq $0x01, %rdi
  movq $msg, %rsi
  movq (endmsg), %rdx
  syscall
  retq


