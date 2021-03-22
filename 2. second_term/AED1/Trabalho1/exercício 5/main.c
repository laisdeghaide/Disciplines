#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

int main()
{
    Lista p;
    Lista c;
    Lista intercalada;
    p=cria_lista();
    c=cria_lista();
    intercalada=cria_lista();
    insere_ord(&p,3);
    insere_ord(&p,3);
    insere_ord(&p,5);
    insere_ord(&p,6);
    insere_ord(&p,3);
    insere_ord(&p,4);

    printf("tamanho: %d\n", tamanho(&p));
    imprime_lista(&p);
    printf("\n");

    maior(&p);
    maior(&p);
    remove_impares(&p);
    printf("tamanho: %d\n", tamanho(&p));
    imprime_lista(&p);
    printf("\n");


    insere_ord(&c,3);
    insere_ord(&c,3);
    insere_ord(&c,5);
    insere_ord(&c,6);
    insere_ord(&c,3);
    insere_ord(&c,4);
    imprime_lista(&c);
    intercalada = intercala(&p,&c);
    imprime_lista(&intercalada);
    printf("tamanho: %d\n", tamanho(&intercalada));

    iguais(&p,&c);
    printf("\n");

    return 0;

}
