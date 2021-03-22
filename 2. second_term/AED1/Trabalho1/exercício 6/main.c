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
    insere_ord(&p,1);
    insere_ord(&p,2);
    insere_ord(&p,3);
    insere_ord(&p,5);
    insere_ord(&p,5);
    insere_ord(&p,6);

    printf("tamanho: %d\n", tamanho(&p));
    imprime_lista(&p);
    printf("\n");

    remove_impares(&p);
    printf("tamanho: %d\n", tamanho(&p));
    int tam_lst1 = tamanho(&p);
    imprime_lista(&p);
    printf("\n");



    insere_ord(&c,1);
    insere_ord(&c,2);
    insere_ord(&c,8);
    insere_ord(&c,23);
    insere_ord(&c,55);
    insere_ord(&c,6);


    printf("tamanho: %d\n", tamanho(&c));
    int tam_lst2 = tamanho(&c);
    imprime_lista(&c);
    printf("\n");



    //maior(&c);
    //maior(&c);
    //maior(&c);

    /*printf("tamanho: %d\n", tamanho(&c));
    imprime_lista(&c);
    printf("\n");
    */

    intercalada = intercala(&p,&c, tam_lst1, tam_lst2);
    printf("tamanho: %d\n", tamanho(&intercalada));
    imprime_lista(&intercalada);

    iguais(&p,&c);
    printf("\n");

    return 0;

}
