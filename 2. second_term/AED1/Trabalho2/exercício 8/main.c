#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

int main()
{
    Fila f = cria_fila();
    Fila d = cria_fila();
    int x;
//    insere_ord(f,5);
//    insere_ord(f,3);
//    insere_ord(f,10);
//    insere_ord(f,2);
//
//    imprime(f);
//    remove_ini(f,&x);
//    imprime(f);
//    remove_ini(f,&x);
//    imprime(f);
//    remove_ini(f,&x);
//    imprime(f);
//    remove_ini(f,&x);
//    imprime(f);
//    remove_ini(f,&x);
//    imprime(f);

    insere_fim(d,5);
    insere_fim(d,7);
    insere_fim(d,10);
    imprime(d);
    remove_nord(d,&x);
    imprime(d);
    remove_nord(d,&x);
    imprime(d);

   remove_nord(d,&x);
    imprime(d);

   remove_nord(d,&x);
    imprime(d);

    return 0;
}
