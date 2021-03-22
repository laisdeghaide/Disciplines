#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

int main(){

    Deque p = cria_deque();
    Deque q = cria_deque();
    int x;
    insere_ini(&p,1);
    insere_ini(&p,5);
    insere_ini(&p,2);
    insere_ini(&p,3);
    imprime(p);
    remove_ini(&p,&x);
    imprime(p);
    remove_ini(&p,&x);
    imprime(p);
      remove_ini(&p,&x);
    imprime(p);
      remove_ini(&p,&x);
    imprime(p);
      remove_ini(&p,&x);
    imprime(p);


    insere_fim(&q,1);
    insere_fim(&q,5);
    insere_fim(&q,2);
    insere_fim(&q,3);
    imprime(q);
    remove_fim(&q,&x);
    imprime(q);
      remove_fim(&q,&x);
    imprime(q);
      remove_fim(&q,&x);
    imprime(q);
      remove_fim(&q,&x);
    imprime(q);
      remove_fim(&q,&x);
    imprime(q);

    return 0;
}


