#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

struct no {
    int info;
    struct no *prox;
};

struct fila {
    struct no *ini, *fim;
};

Fila cria_fila(){
    Fila f = (Fila)malloc(sizeof(struct fila));
    if(f != NULL){
        f->ini = NULL;
        f->fim = NULL;
    }
    return f;
}

int fila_vazia(Fila f){
    if(f->ini == NULL)
        return 1;
    else
        return 0;
}

int insere_ord(Fila f, int elem){
    struct no* N;
    N = (struct no*)malloc(sizeof(struct no));

    if(N == NULL)
        return 0;

    N->info = elem;
    N->prox = NULL;

    struct no *aux = (f)->ini;
    if(fila_vazia(f) == 1 || elem >= aux->info){
        N->prox = (f)->ini;
        (f)->ini = N;
        return 1;
    }

    else{
        while(aux->prox != NULL && aux->prox->info > elem)
            aux = aux->prox;
        N->prox = aux->prox;
        aux->prox = N;
    }
    return 1;
}


int insere_fim(Fila f, int elem){
    struct no *N = (struct no*)malloc(sizeof(struct no));
    if(N == NULL)
        return 0;
    N->info = elem;
    N->prox = NULL;
    if(fila_vazia(f) ==1)
        f->ini = N;
    else
        f->fim->prox = N;
    f->fim = N;
    return 1;

}

int remove_ini(Fila f, int *elem){
    if(fila_vazia(f)==1)
        return 0;

    struct no* aux = f->ini;
    f->ini = aux->prox;

    if(f->ini == f->fim)
        f->fim = NULL;

    *elem = aux->info;
    free(aux);

    return 1;
}

int remove_nord(Fila f, int *elem){
    if(fila_vazia(f) == 1)
        return 0;

     struct no *aux = f->ini;

     if(f->ini == f->fim)
        f->fim = NULL;

    *elem = aux->info;
    while(aux->prox != NULL){
        if(*elem < aux->prox->info)
            *elem = aux->prox->info;
        aux = aux->prox;
        }
    aux = f->ini;
    if(*elem == aux->info){
        f->ini = aux->prox;
        free(aux);
        return 1;
        }
    while(aux->prox != NULL && aux->prox->info != *elem)
        aux = aux->prox;

    if(aux == NULL)
        return 0;

    struct no *aux2 = aux->prox;
    aux->prox = aux2->prox;
    free(aux2);

    return 1;
}

void imprime(Fila f){
    if(fila_vazia(f)){
            printf("oudd\n");
        return;
        }

    struct no* aux = f->ini;
    while(aux != NULL){
        printf("%d ", aux->info);
        aux = aux->prox;
    }
    printf("\n");
}



