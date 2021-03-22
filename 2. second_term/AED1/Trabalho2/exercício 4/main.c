#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"
int main()
{
    Pilha t, p;
    t = cria_pilha();
    p = cria_pilha();
    char str[50];
    printf("Digite a string: ");
    gets(str);
    palindromo(t,str);

    setbuf(stdin, NULL);
    push(&p,5);
    push(&p,4);
    push(&p,6);
    push(&p,3);
    push(&p,4);
    pares_impares(p);
    return 0;
}
