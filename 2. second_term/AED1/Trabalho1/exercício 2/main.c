#include <stdio.h>
#include <stdlib.h>
#include "estatica.h"

int main()
{
    Lista p;
    p=cria_lista();

    insere_inicio(p,3);
    insere_inicio(p,3);
    insere_inicio(p,5);
    insere_inicio(p,6);
    insere_inicio(p,3);
    insere_inicio(p,4);
    tamanho(p);
    menor(p);
    imprime_lista(p);
    p=remove_todos(p,3);
    menor(p);
    tamanho(p);
    imprime_lista(p);

    printf("\n");

    Lista q;
    q=cria_lista();
    insere_inicio(q,6);
    insere_inicio(q,18);
    insere_inicio(q,22);
    insere_inicio(q,2);
    insere_inicio(q,9);
    insere_inicio(q,5);
    insere_inicio(q,7);
    tamanho(q);
    menor(q);
    imprime_lista(q);

    Lista2 dobrada;
    dobrada=cria_lista2();
    dobrada = concatena(p,q);
    imprime_lista2(dobrada);

    return 0;
}




