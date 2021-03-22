#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

struct no {
    int info;
    struct no *prox;
    struct no *ant;
};

struct deque{
    struct no *ini;
    struct no *fim;
};

Deque cria_deque(){
    Deque d = (Deque)malloc(sizeof(struct deque));
    if(d != NULL){
        d->ini = NULL;
        d->fim = NULL;
    }
    return d;
}

int deque_vazio(Deque d){
    if(d->ini == NULL)
        return 1;
    else
        return 0;
}

int insere_ini(Deque *d, int elem){
    struct no* N = (struct no*)malloc(sizeof(struct no));
    if(N == NULL)
        return 0;

    N->info = elem;
    N->prox = (*d)->ini;
    N->ant = NULL;

    if((*d)->ini == NULL) /// se o deque estiver vazio
        (*d)->fim = N;
    else
        (*d)->ini->ant = N;
    (*d)->ini = N;
    return 1;
}

int insere_fim(Deque *d, int elem){
    struct no* N = (struct no*)malloc(sizeof(struct no));
    if(N == NULL)
        return 0;

    N->info = elem;
    N->prox = NULL;

    if((*d)->fim == NULL){ ///se deque estiver vazio
        N->ant = NULL;
        (*d)->ini = N;
    }
    else{
        N->ant = (*d)->fim;
        (*d)->fim->prox = N;
    }
    (*d)->fim = N;
    return 1;
}


int remove_ini(Deque *d, int *elem){
    if(deque_vazio(*d) == 1)
        return 0;

    struct no *aux = (*d)->ini;
    *elem = aux->info;
    (*d)->ini = aux->prox;

    if((*d)->ini == NULL) /// se o deque ficou vazio
        (*d)->fim = NULL;
    else
        (*d)->ini->ant = NULL;

    free(aux);
    return 1;
}


int remove_fim (Deque *d, int *elem){
    if(deque_vazio(*d) == 1)
        return 0;

    struct no *aux = (*d)->fim;
    *elem = aux->info;
    (*d)->fim = aux->ant;

    if((*d)->fim == NULL) /// se o deque estiver vazio
        (*d)->ini = NULL;
    else
        (*d)->fim->prox = NULL;

    free(aux);
    return 1;
}

void imprime(Deque d){
    if(deque_vazio(d) == 1){
        printf("Deque vazio.\n");
        return;
    }
    else{
        struct no *aux;
        aux = d->ini;
        while(aux != NULL){
            printf("%d ", aux->info);
            aux = aux->prox;
        }
    }
    printf("\n");
}














