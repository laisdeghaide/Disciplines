#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

struct no {
    int info;
    struct no *ant;
    struct no *prox;
};

Lista cria_lista(){
    return NULL;
}

int lista_vazia(Lista lst) {
    if(lst == NULL)
        return 1;
    else
        return 0;
}

int insere_elem(Lista *lst, int elem) { ///insere no inicio
    Lista N = (Lista)malloc(sizeof(struct no));
    if(N == NULL)
        return 0;

    N->info = elem;
    N->ant = NULL;
    N->prox = *lst;

    if(lista_vazia(*lst) == 0) ///se nao estiver vazia
        (*lst)->ant = N;

    (*lst) = N;
    return 1;
}

int remove_elem(Lista *lst, int elem) {
    if(lista_vazia(*lst) == 1)
        return 0;

     Lista aux = *lst;
     while(aux->prox != NULL && aux->info != elem)
            aux = aux->prox;

     if(aux->info != elem) ///elemento nao esta na lista
        return 0;

     if(aux->prox != NULL)
        aux->prox->ant = aux->ant;
     if(aux->ant != NULL)
        aux->ant->prox = aux->prox;
     if(aux == (*lst))
        *lst = aux->prox;
     free(aux);

     return 1;
}

void imprime_lista(Lista *lst){
    if(lista_vazia(*lst) == 1)
        printf("Vazia. \n");

    else{
        Lista aux = (*lst);
        while(aux != NULL){
            printf("%d ", aux->info);
            aux = aux->prox;
        }
    }
    printf("\n");
}

int tamanho(Lista lst) {
    Lista aux = lst;
    int tam = 0;
    while(aux != NULL){
        tam ++;
        aux = aux->prox;
    }
    return tam;
}


int maior(Lista *lst){
    if(lista_vazia(*lst) == 1)
        return 0;

    int maior;
    maior = (*lst)->info;
    Lista aux = *lst;

    while(aux != NULL){
        if(maior < aux->info)
            maior = aux->info;
        aux = aux->prox;
    }
    aux = *lst;
    while(aux->prox != NULL && aux->info != maior)
        aux = aux->prox;

    if(aux->prox != NULL)
        aux->prox->ant = aux->ant;
     if(aux->ant != NULL)
        aux->ant->prox = aux->prox;
     if(aux == (*lst))
        *lst = aux->prox;
     free(aux);
     return 1;

}







