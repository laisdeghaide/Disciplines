#include <stdio.h>
#include <stdlib.h>
#include "estatica.h"

#define max 10 // Tamanho máximo
struct lista {
    int no[max];
    int Fim;
 };

 struct lista2{ //lista que sera a concatena, portanto deve ter o dobro de espaco
    int no[2*max];
    int Fim;
 };

 Lista cria_lista(){
    Lista lst;
    lst=(Lista)malloc(sizeof(struct lista));

    if(lst != NULL)
        lst->Fim=0;

    return lst;
 }

 Lista2 cria_lista2(){
    Lista2 lst;
    lst=(Lista2)malloc(sizeof(struct lista2));
     if(lst != NULL)
        lst->Fim=0;

    return lst;
 }

 int lista_vazia(Lista lst){
    if(lst->Fim == 0)
        return 1; //lista vazia
    else
        return 0; //nao esta vazia
 }


 int lista_cheia(Lista lst){
    if(lst->Fim == max)
        return 1; //lista cheia
    else
        return 0; //lista nao cheia
 }

 int insere_elem(Lista lst, int elem){
    if(lst == NULL || lista_cheia(lst) == 1)
        return 0;
    lst->no[lst->Fim] = elem; //insere elemento no fim
    lst->Fim++; //avança fim

    return 1;
 }

 int remove_elem(Lista lst, int elem){
    if(lst == NULL || lista_vazia(lst) == 1)
        return 0;

    int i, aux=0;

    //Percorrimento até achar o elem ou o final da lista
    while(aux < lst->Fim && lst->no[aux] != elem)
        aux++;
    if(aux == lst->Fim) //Final da lista, o elemento nao esta na lista
        return 0;
    //Se o elemento existir, entao deslocamento a esquerda do sucessor ate o final da lista
    for(i = aux+1; i < lst->Fim; i++) //comeca no elemento depois do elemento a ser removido
        lst->no[i-1] = lst->no[i];

    lst->Fim--;

    return 1;
 }


void imprime_lista(Lista lst){
    for(int i=0; i<lst->Fim; i++){
        printf("%d ", lst->no[i]);
    }
    printf("\n");
}


void imprime_lista2(Lista2 lst){
    for(int i=0; i<lst->Fim; i++){
        printf("%d ", lst->no[i]);
    }
    printf("\n");
}


void tamanho(Lista lst){
    printf("tamanho da lista: %d\n", lst->Fim); //o tamanho da lista eh o proprio tamanho do lst que percorre a lista toda
}

void menor(Lista lst){
    int menor, pos;
    if(lst->Fim != 0) {
            pos=0; // se o menor for o primeiro elemento, entao a posiciao a ser removida eh o pos=0
            menor = lst->no[0];
        for(int i = 0; i < lst->Fim; i++){
            if(menor > lst->no[i]){
                menor = lst->no[i];
                 pos=i;   //posicao que se encontra o menor elemento
            }
        }
    }

    for(int j = pos+1; j < lst->Fim; j++)
        lst->no[j-1]=lst->no[j]; //a posicao de tras recebe a da frente

    lst->Fim--; //decremento
}


int insere_inicio(Lista lst, int elem){
    if(lst == NULL || lista_cheia(lst) == 1)
        return 0;

    for (int i = lst->Fim; i > 0; i--){ // Deslocamento
        lst->no[i] = lst->no[i-1];  //posicao mais a frente recebe o elemento da posicao de tras
    }

    lst->no[0] = elem; //Insere na primeira posicao da lista
    lst->Fim++; // Avança o Fim
    return 1; // Sucesso
}


 Lista remove_todos(Lista lst, int elem) {

    if (lst == NULL || lista_vazia(lst) == 1)
        return NULL; // Falha

    Lista aux;
    aux=cria_lista(); //lista aux que recebera todos os elementos que n deseja ser removido

    for(int i=0; i < lst->Fim; i++){
        if(lst->no[i] != elem){
            aux->no[aux->Fim] = lst->no[i]; //a posicao aux->Fim de lista aux recebera o elemento da lista lst
            aux->Fim++; //vai pra proxima posicao da lista aux
        }
    }

    free(lst);
    return aux;
 }


Lista2 concatena(Lista lst1, Lista lst2){
    Lista2 d;

  for(int i = 0; i < lst1->Fim; i++){ //percorre a primeira lista inteira
    d->no[i] = lst1->no[i]; //atribui a d os valores de lst1
    d->Fim++;
  }
  for(int j = 0; j < lst2->Fim; j++){ //percorre a segunda lista inteira
      d->no[d->Fim] = lst2->no[j]; //atribui a d os valosres de lst2
      d->Fim++;
  }
  return d;
}









