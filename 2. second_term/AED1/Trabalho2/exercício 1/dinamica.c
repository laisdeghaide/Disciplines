#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

struct no{
    struct no *prox;
    int info;
};

Lista cria_lista(){
    return NULL;
}

int lista_vazia(Lista lst){
    if(lst == NULL)
        return 1;
    else
        return 0;
}


int insere_elem(Lista *lst, int elem) { //insere no final
    Lista N = (Lista)malloc(sizeof(struct no));
    if(N == NULL) //falha na alocacao
        return 0;

    N->info = elem;
    if(lista_vazia(*lst) == 1){
        N->prox = N; //novo nó aponta para ele mesmo
        *lst = N; //faz o lst apontar pra o novo nó
    }
    else{
        N->prox = (*lst)->prox;
        (*lst)->prox = N;
        *lst = N;
    }

    return 1;
}


int remove_elem(Lista *lst, int *elem) { //remove no inicio
    if(lista_vazia(*lst) == 1)
        return 0;
    Lista aux = (*lst)->prox;
    *elem = aux->info;
    if(*lst == (*lst)->prox)
        *lst = NULL;

    else{
        (*lst)->prox = aux->prox;
        free(aux);
    }
    return 1;
}


void imprime_lista(Lista *lst) {
    if(lista_vazia(*lst) == 1)
        printf("Lista vazia.");

    else{
        Lista aux = (*lst)->prox;
        while(aux != (*lst)){
            printf("%d ", aux->info);
            aux = aux->prox;
        }
        printf("%d\n", (*lst)->info);
    }
    printf("\n");
}


int maior(Lista lst) {
    int maior = lst->prox->info; //o maior comeca com o valor do primeiro elemento da lista
    Lista aux = lst->prox;
    do{
        aux = aux->prox; //avanca o aux
        if(maior < aux->info) //se a informacao do aux for maior que o maior elemento
            maior = aux->info; // maior recebe a informacao
        }
    while(aux != lst->prox);

    return maior;
}


int tamanho(Lista lst){
    Lista aux = lst->prox;
    int tam = 0;
    while(aux != lst){
        tam++;
        aux=aux->prox;
    }
    if(aux == lst)
        tam++;

    return tam;
}









