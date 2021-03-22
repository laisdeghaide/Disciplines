#include <stdio.h>
#include <stdlib.h>
#include "estatica.h"

int main(){
    Pilha p, t;
    p = cria_pilha();
    t = cria_pilha();
    int c;
    char str[100];

    imprime(p);
    push(p,32);
    push(p,3);
    push(p,3);
    push(p,1);
    push(p,2);
    imprime(p);
    imprime_reversa(p);
    pop(p,&c);
    printf("Elemento removido: %d\n", c);
    imprime(p);
    imprime_reversa(p);

    printf("Digite a string: ");
    scanf("%s",str);
    palindromo(t,str);

    return 0;
}

