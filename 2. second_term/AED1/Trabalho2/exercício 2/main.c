#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"


int main()
{
    Lista p = cria_lista();
    insere_elem(&p,1);
    insere_elem(&p,5);
    insere_elem(&p,2);
    insere_elem(&p,3);
    insere_elem(&p,10);
    imprime_lista(&p);

    printf("Tamanho: %d\n", tamanho(p));
    maior(&p);
    maior(&p);
    imprime_lista(&p);
     maior(&p);
    maior(&p);
    imprime_lista(&p);

    maior(&p);
    imprime_lista(&p);
    maior(&p);
    imprime_lista(&p);

    return 0;
}
