#include <stdio.h>
#include <stdlib.h>
#include "estatica.h"

#define max 10
struct lista{
    int no[max];
    int Fim;
};

struct lista_intercalada{
    int no[2*max];
    int Fim;
};

Lista cria_lista(){
    Lista lst;
    lst = (Lista)malloc(sizeof(struct lista));
    if (lst != NULL)
        lst->Fim = 0; // Lista vazia
    return lst;
}

Lista_intercalada cria_lista_intercalada(){
    Lista_intercalada lst;
    lst = (Lista_intercalada)malloc(sizeof(struct lista_intercalada));
    if (lst != NULL)
        lst->Fim = 0; // Lista vazia
    return lst;
}

int lista_vazia(Lista lst){
    if(lst->Fim == 0)
        return 1; //lista vazia
    else
        return 0;
}

int lista_cheia(Lista lst){
    if(lst->Fim == max)
        return 1;
    else
        return 0;
}


int insere_ord(Lista lst, int elem){
    if(lst == NULL || lista_cheia(lst) == 1)
        return 0;

   //trata lista vazia ou elemento maior que o ultimo da lista
   if(lista_vazia(lst) == 1 || elem >= lst->no[lst->Fim-1])
        lst->no[lst->Fim] = elem; //insere no final

   else{
    int aux=0;

    while(elem >= lst->no[aux]) //percorrimento
        aux++;

    for(int i = lst->Fim; i > aux; i--)
        lst->no[i] = lst->no[i-1];
    lst->no[aux] = elem;
   }

   lst->Fim++;

   return 1;
}


int remove_ord(Lista lst, int elem){
    if(lst == NULL || lista_vazia(lst) == 1 || elem < lst->no[0] || elem >= lst->no[lst->Fim-1])
        return 0;

    int aux=0;
    while(aux < lst->Fim && lst->no[aux] < elem)
        aux++;

    if(aux == lst->Fim || lst->no[aux] > elem) //o elemento nao existe na lista
        return 0;

    for(int i = aux+1; i < lst->Fim; i++)
        lst->no[i-1] = lst->no[i]; //a posicao de tras recebe o elemento da posicao da frente

    lst->Fim--;
    return 1;
}

void imprime_lista(Lista lst){
    for(int i=0; i < lst->Fim; i++)
        printf("%d ", lst->no[i]);
    printf("\n");
}

void imprime_lista_intercalada(Lista_intercalada lst){
    for(int i=0; i < lst->Fim; i++)
        printf("%d ", lst->no[i]);
    printf("\n");
}

int tamanho(Lista lst){
    return lst->Fim;
}

int menor(Lista lst){
    for(int i = 0; i < lst->Fim; i++)
        lst->no[i] = lst->no[i+1];

    lst->Fim--;
    return 1;
}


 Lista remove_pares(Lista lst) {

    if (lst == NULL || lista_vazia(lst) == 1)
        return NULL; // Falha

    Lista aux;
    aux=cria_lista(); //lista aux que recebera todos os elementos que n deseja ser removido

    for(int i=0; i < lst->Fim; i++){
        if(lst->no[i] % 2 != 0){
            aux->no[aux->Fim] = lst->no[i]; //a posicao aux->Fim de lista aux recebera o elemento da lista lst
            aux->Fim++; //vai pra proxima posicao da lista aux
        }
    }
    free(lst);
    return aux;
 }

Lista_intercalada intercala(Lista lst1, Lista lst2){
    Lista_intercalada d;
    d = cria_lista_intercalada();
    for(int i = 0; i < lst1->Fim; i++){
    d->no[i] = lst1->no[i];
    d->Fim++;
  }
  for(int j = 0; j < lst2->Fim; j++){
      d->no[d->Fim] = lst2->no[j];
      d->Fim++;
  }
  int aux;
  for(int w=0; w < d->Fim; w++){
    aux = w+1;
        if(d->no[w] > d->no[aux]){
           d->no[aux] = d->no[w];
           aux++;
        }
    }

    return d;
}


int iguais(Lista lst1, Lista lst2){
    if(tamanho(lst1) == tamanho(lst2)){
        for(int i=0; i < lst1->Fim; i++){
            if(lst1->no[i] != lst2->no[i])
                return 0;
        } return 1;
    } else
        return 0;
}












