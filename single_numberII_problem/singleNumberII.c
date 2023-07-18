#include <stdio.h>
#include <stdlib.h>

__attribute__((naked)) int singleNumber(int* nums, int numsSize){
    // rdi: nums
    // rsi: numsSize / outerloop iterator
    // rbx: newNums
    // rdx: newNumsDB (amount of each newNums element)
    // rax: count (how many items in the newNums) / finalloop iterator
    // rcx: innerloop iterator
    __asm__(
        "push %%rbx\n\t"
        
        "push %%rdi\n\t"
        "push %%rsi\n\t"
        
        "mov $10000, %%edi\n\t"
        "mov $4, %%esi\n\t"
        "call calloc\n\t"
        "mov %%rax, %%rbx\n\t"
        
        "push %%rbx\n\t"

        "mov $10000, %%rdi\n\t"
        "mov $4, %%rsi\n\t"
        "call calloc\n\t"
        "mov %%rax, %%rdx\n\t"

        "pop %%rbx\n\t"
        "pop %%rsi\n\t"
        "pop %%rdi\n\t"
        
        "xor %%rax, %%rax\n"

    "outerloop:\n\t"
        "dec %%rsi\n\t"
        "cmp $0, %%rsi\n\t"
        "jl finalloop\n\t"
        
        "xor %%rcx, %%rcx\n"
    "innerloop:\n\t"
        "cmp %%rcx, %%rax\n\t"
        "je innerloop_end\n\t"

        "push %%rax\n\t"

        "mov (%%rbx, %%rcx, 4), %%eax\n\t"
        "cmp %%eax, (%%rdi, %%rsi, 4)\n\t"
        
        "pop %%rax\n\t"
    
        "je innerloop_end\n\t"
        "inc %%rcx\n\t"
        "jmp innerloop\n"
    
    "innerloop_end:\n\t"
        "cmp %%rcx, %%rax\n\t"
        "jne skipnew\n\t"
    
        "push %%rdx\n\t"
    
        "mov (%%rdi, %%rsi, 4), %%edx\n\t"
        "mov %%edx, (%%rbx, %%rax, 4)\n\t"
    
        "pop %%rdx\n\t"
    
        "inc %%rax\n"

    "skipnew:\n\t"
        "incl (%%rdx, %%rcx, 4)\n\t"
        "jmp outerloop\n"

    "finalloop:\n\t"
        "cmp $0, %%rax\n\t"
        "je out\n\t"
    
        "cmpl $1, (%%rdx, %%rax, 4)\n\t"
        "je out\n\t"

        "dec %%rax\n\t"
        "jmp finalloop\n\t"

    "out:\n\t"
        "mov (%%rbx, %%rax, 4), %%eax\n\t"

        "pop %%rbx\n\t"
        "ret\n\t"
        :
        :
        : "%rax", "%rbx", "%rcx", "%rdx", "%rdi", "%rsi"
    );
}

int main(){
    int* a = malloc(4*sizeof(int));
    a[0] = 0;
    a[1] = 0;
    a[2] = 1;
    a[3] = 0;
    printf("%d\n", singleNumber(a, 4));
    free(a);
    return 0;
}