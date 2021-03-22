#include <stdio.h>
#include <stdlib.h>
#include "estatica.h"

int main()
{
    Lista p;
    p=cria_lista();

    insere_ord(p,3);
    insere_ord(p,3);
    insere_ord(p,5);
    insere_ord(p,6);
    insere_ord(p,3);
    insere_ord(p,4);
    menor(p);
    printf("tamanho: %d\n", tamanho(p));
    imprime_lista(p);
    remove_ord(p,5);
    menor(p);
    printf("tamanho: %d\n", tamanho(p));
    imprime_lista(p);
    p=remove_pares(p);
    imprime_lista(p);

     printf("\n");

    Lista q;
    q=cria_lista();
    insere_ord(q,6);
    insere_ord(q,18);
    insere_ord(q,22);
    insere_ord(q,2);
    insere_ord(q,9);
    insere_ord(q,5);
    insere_ord(q,7);
    printf("tamanho: %d\n",tamanho(q));
    menor(q);
    imprime_lista(q);

    if(iguais(p,q))
        printf("Sao iguais.\n");
    else
        printf("Sao diferentes.\n");

    Lista interc;
    interc = cria_lista_intercalada();
    interc = intercala(p,q);
    imprime_lista_intercalada(interc);

    return 0;
}
