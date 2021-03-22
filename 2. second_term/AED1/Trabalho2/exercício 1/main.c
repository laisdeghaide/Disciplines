#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"


int main()
{
    Lista p;
    p = cria_lista();
    int x;
    insere_elem(&p,24);
    insere_elem(&p,21);
    insere_elem(&p,14);
    insere_elem(&p,5);
    insere_elem(&p,4);
    insere_elem(&p,7);
    insere_elem(&p,2);
    insere_elem(&p,10);
    insere_elem(&p,2);
    insere_elem(&p,12);
    insere_elem(&p,20);
    insere_elem(&p,22);
    insere_elem(&p,26);
    insere_elem(&p,25);

    imprime_lista(&p);
    printf("Maior : %d\n", maior(p));
    printf("Tamanho: %d\n", tamanho(p));
    remove_elem(&p,&x);
    printf("%d\n",x);
    imprime_lista(&p);
    return 0;
}
