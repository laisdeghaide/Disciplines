#include <stdio.h>
#include <stdlib.h>
#include "estatica.h"
#define max 20

struct pilha{
    int vetor[max];
    int topo;
};

Pilha cria_pilha(){
    Pilha p;
    p = (Pilha)malloc(sizeof(struct pilha));
    if(p != NULL)
        p->topo = -1;
    return p;
}

int pilha_vazia(Pilha p){
    if(p->topo == -1)
        return 1;
    else
        return 0;
}

int pilha_cheia(Pilha p){
    if(p->topo == max-1)
        return 1;
    else
        return 0;
}

int push(Pilha p, int elem){
    if(p == NULL || pilha_cheia(p) == 1)
        return 0;

    p->topo++;
    p->vetor[p->topo] = elem;
    return 1;
}

int pop(Pilha p, int *elem){
    if(p == NULL || pilha_vazia(p) == 1)
        return 0;

    *elem = p->vetor[p->topo];
    p->topo--;
    return 1;
}

int le_topo(Pilha p, int *elem){
     if(p == NULL || pilha_vazia(p))
        return 0;

    *elem = p->vetor[p->topo];
    return 1;
}

void converte_dec_bin(int dec){
    Pilha p = cria_pilha();
    int r;

    while( dec != 0 && pilha_cheia(p) == 0){
         r = dec % 2;
         dec = dec/2;
         push(p,r);
    }

    if(pilha_cheia(p) == 1)
        printf("Estouro de Pilha");

    else{
        while(pilha_vazia(p) == 0){
            pop(p,&r);
            printf("%d",r);
        }
    }
}


void converte_dec_octal(int dec){
    Pilha p = cria_pilha();
    int r;

    while( dec != 0 && pilha_cheia(p) == 0){
         r = dec % 8;
         dec = dec/8;
         push(p,r);
    }

    if(pilha_cheia(p) == 1)
        printf("Estouro de Pilha");

    else{
        while(pilha_vazia(p) == 0){
            pop(p,&r);
            printf("%d",r);
        }
    }
}

void converte_dec_hexa(int dec) {
    Pilha p = cria_pilha();
    int r;

    while(dec != 0 && pilha_cheia(p) == 0){
        r = dec % 16;
        dec = dec/16;

        if(r == 10)
            push(p, 'A');
        else if(r == 11)
            push(p, 'B');
        else if(r == 12)
            push(p, 'C');
        else if(r == 13)
            push(p, 'D');
        else if(r == 14)
            push(p, 'E');
        else if(r == 15)
            push(p, 'F');
        else
            push(p,r);
    }
      if(pilha_cheia(p) == 1)
        printf("Estouro de Pilha");

    else{
        while(pilha_vazia(p) == 0){
            pop(p,&r);
        if(r >= 'A' && r <= 'F')
            printf("%c",r);
        else
            printf("%d",r);
        }
    }
}






