#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

struct no{
    int info;
    char infochar;
    struct no *prox;
};

Pilha cria_pilha(){
    return NULL;
}

int pilha_vazia(Pilha p){
    if(p == NULL)
        return 1;
    else
        return 0;
}

int pushchar(Pilha *p, char elem){
    Pilha N = (Pilha)malloc(sizeof(struct no));
    if(N == NULL)
        return 0;
    N->infochar = elem;
    N->prox = *p;
    *p = N;
    return 1;
}

int push(Pilha *p, int elem){
    Pilha N = (Pilha)malloc(sizeof(struct no));
    if(N == NULL)
        return 0;
    N->info = elem;
    N->prox = *p;
    *p = N;
    return 1;
}

int popchar(Pilha *p, char *elem){
    if(pilha_vazia(*p) == 1)
        return 0;
    Pilha aux = *p;
    *elem = aux->infochar;
    *p = aux->prox;
    free(aux);
    return 1;
}

int pop(Pilha *p, int *elem){
    if(pilha_vazia(*p) == 1)
        return 0;
    Pilha aux = *p;
    *elem = aux->info;
    *p = aux->prox;
    free(aux);
    return 1;
}

int le_topochar(Pilha *p, char *elem){
    if(pilha_vazia(*p) == 1)
        return 0;
    *elem = (*p)->infochar;
    return 1;
}

int le_topo(Pilha *p, int *elem){
    if(pilha_vazia(*p) == 1)
        return 0;
    *elem = (*p)->info;
    return 1;
}

void imprime(Pilha p){
    if(pilha_vazia(p) == 1)
        return;
    Pilha aux = p;
    while(aux != NULL){
        printf("%d ", aux->info);
        aux = aux->prox;
    }
    printf("\n");
}

void imprimechar(Pilha p){
    if(pilha_vazia(p) == 1)
        return;

    Pilha aux = p;
    while(aux != NULL){
        printf("%c ", aux->infochar);
        aux = aux->prox;
    }
    printf("\n");
}

int palindromo(Pilha p, char str[50]){
    int i = 0;
    char c;
    for(i; i < strlen(str); i++){
//        if(str[i] == '\0')
//            break;
        pushchar(&p, str[i]); ///empilho cada caractere na pilha p
    }
    i = 0;
    while(pilha_vazia(p) != 1){ ///enquanto a lista nao estiver vazia
        popchar(&p,&c); ///desempilha
        if(c != str[i]){
            printf("Nao eh palindromo.\n");
            return 0;
        }
        i++;
    }
    printf("Eh palindromo.\n");

    return 1;
}



void pares_impares(Pilha p){
    Pilha a = cria_pilha();
    Pilha b = cria_pilha();

    int topo;

    while(pilha_vazia(p) != 1){
        pop(&p,&topo);
        if(topo % 2 == 0)
            push(&a, topo);
        else
            push(&b, topo);
    }
    Pilha aux = a;
    printf("Pilha de pares: ");
    while(aux != NULL){
        printf("%d ", aux->info);
        aux = aux->prox;
    }
    aux = b;
    printf("\nPilha de impares: ");
    while(aux != NULL){
       printf("%d ", aux->info);
        aux = aux->prox;
    }
    printf("\n");
}








