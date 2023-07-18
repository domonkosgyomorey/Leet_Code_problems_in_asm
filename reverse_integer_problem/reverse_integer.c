#include <stdio.h>
__attribute__((naked)) int reverse(int x){
    // ecx: newNum
    __asm__(
        "push %%rdi\n\t"
        "xorl %%ecx, %%ecx\n\t"
        "mov %%edi, %%eax\n\t"
        "cmpl $-2147483648, %%eax\n\t"
        "je end\n\t"
        "testl %%eax, %%eax\n\t"
        "jge positive\n\t"
        "negl %%eax\n\t"
    "positive:\n\t"
        "testl %%eax, %%eax\n\t"
        "je end\n\t"
        "cmpl $214748364, %%ecx\n\t"
        "jg earlyend\n\t"
        "cmpl $-214748364, %%ecx\n\t"
        "jl earlyend\n\t"
        "imul $10, %%ecx\n\t"
        "movl $10, %%ebx\n\t"
        "xorl %%edx, %%edx\n\t"
        "divl %%ebx\n\t"
        "addl %%edx, %%ecx\n\t"
        "jmp positive\n\t"
    "earlyend:\n\t"
        "movl $0, %%ecx\n\t"
    "end:\n\t"
        "mov %%ecx, %%eax\n\t"
        "pop %%rdi\n\t"
        "test %%edi, %%edi\n\t"
        "jg out\n\t"
        "negl %%eax\n\t"
    "out:\n\t"
        "ret\n\t"
    :::"%rdi", "%rbx", "%rax");

}
int reverse1(int x){
    char sig = (x<0);
    if(x==-2147483648){
        return 0;
    }
    x *= sig?-1:1;
    int newNum = 0;
    while(x>0){
        if(newNum>214748364||newNum<-214748364){
            return 0;
        }
        newNum = newNum*10+x%10;
        x /= 10;
    }
    return newNum*(sig?-1:1);
}
__attribute__((naked)) int ten(int a){
    __asm__(
        "lea (%%edi, %%edi, 8), %%edi\n\t"
        "movl %%edi, %%eax\n\t"
        "ret\n\t"
    :::"%edi", "%eax");
}

int main(){
    printf("%d\n", reverse(-120));
    return 0;
}