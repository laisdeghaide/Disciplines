#include <stdio.h>
#include <stdlib.h>
#include "estatica.h"
#include <string.h>
#define max 100

struct pilha {
    int vetor[max];
    int topo;
    char topochar;
};

Pilha cria_pilha(){
    Pilha p;
    p = (Pilha)malloc(sizeof(struct pilha));
    if(p != NULL)
        p->topo = -1;

    return p;
}

int pilha_vazia(Pilha p) {
    if(p->topo == -1)
        return 1;
    else
        return 0;
}

int pilha_cheia(Pilha p) {
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

int pop(Pilha p, int *elem) {
    if(p == NULL || pilha_vazia(p) == 1)
        return 0;

    *elem = p->vetor[p->topo];
    p->topo--;
    return 1;
}

int le_topo(Pilha p, int *elem){
    if(p == NULL || pilha_vazia(p) == 1)
        return 0;
    *elem = p->vetor[p->topo];
    return 1;
}


Pilha cria_pilhachar(){
    Pilha p;
    p = (Pilha)malloc(sizeof(struct pilha));
    if(p != NULL)
        p->topochar = -1;

    return p;
}

int pilha_vaziachar(Pilha p) {
    if(p->topochar == -1)
        return 1;
    else
        return 0;
}

int pilha_cheiachar(Pilha p) {
    if(p->topochar == max-1)
        return 1;
    else
        return 0;
}

int pushchar(Pilha p, char elem){
    if(p == NULL || pilha_cheia(p) == 1)
        return 0;

    p->topo++;
    p->vetor[p->topo] = elem;
    return 1;
}

int popchar(Pilha p, char *elem) {
    if(p == NULL || pilha_vazia(p) == 1)
        return 0;

    *elem = p->vetor[p->topo];
    p->topo--;
    return 1;
}

int le_topochar(Pilha p, char *elem){
    if(p == NULL || pilha_vazia(p) == 1)
        return 0;
    *elem = p->vetor[p->topochar];
    return 1;
}

void imprime(Pilha p){
    if(pilha_vazia(p) == 1)
        printf("Pilha Vazia.");
    else{
        for(int i = 0; i <= p->topo; i++)
            printf("%d ", p->vetor[i]);
    }
    printf("\n");
}

void imprime_reversa(Pilha p){
    if(pilha_vazia(p) == 1)
        printf("Pilha Vazia.");
    else{
        printf("Reversa: ");
        for(int i = p->topo; i >= 0; i--)
            printf("%d ", p->vetor[i]);
    }
    printf("\n");
}


void palindromo(Pilha p, char str[100]){
    char c;
    for (int i = 0; i < strlen(str); i++){///empilha na pilha p cada caractere da string
            pushchar(p,str[i]);
        }

    for(int i = 0; i< strlen(str); i++){
        popchar(p,&c);
        if(c != str[i]){ ///desempilha e compara com os elementos da string
            printf("Nao eh palindromo.");
            return;
        }
     }
    printf("Eh palindromo.");

}








