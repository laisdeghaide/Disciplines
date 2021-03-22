#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

int main()
{
    Lista *p, *c, *b;

    p=cria_lista();
    c =cria_lista();

    insere_fim(&p,3);
    insere_fim(&p,3);
    insere_fim(&p,5);
    insere_fim(&p,6);
    insere_fim(&p,3);
    insere_fim(&p,4);

    printf("tamanho: %d\n", tamanho(&p));
    imprime_lista(&p);
    printf("\n");

    menor(&p);
    menor(&p);
    menor(&p);
    menor(&p);
    menor(&p);
    menor(&p);
    printf("tamanho: %d\n", tamanho(&p));
    imprime_lista(&p);
    printf("\n");

    //remove_todos(&p,3);
    //menor(p);

    insere_fim(&c,3);
    insere_fim(&c,3);
    insere_fim(&c,5);
    insere_fim(&c,6);
    insere_fim(&c,3);
    //insere_fim(&c,4);
    printf("tamanho: %d\n", tamanho(&c));
    imprime_lista(&c);
    printf("\n");

    b = concatena(&p, &c);

    printf("tamanho: %d\n", tamanho(&b));
    imprime_lista(&b);
    printf("\n");

    return 0;

}
