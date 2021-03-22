#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

struct no{
    int info;
    struct no *prox;
};

Lista cria_lista() {
return NULL;
}

int lista_vazia(Lista lst){
   if(lst == NULL)
    return 1;
   else
    return 0;
}

int insere_ord(Lista *lst, int elem) { // Aloca um novo nó
Lista N = (Lista) malloc(sizeof(struct no));
if (N == NULL) {
	return 0;
	} // Falha: nó não alocado
N->info = elem; // Insere o conteúdo (valor do elem)
if (lista_vazia(*lst) == 1 || elem <= (*lst)->info) {
N->prox = *lst; // Aponta para o 1o nó atual da lista
*lst = N; // Faz a lista apontar para o novo nó
	return 1;
	}
// Percorrimento da lista (elem > 1o nó da lista)
Lista aux = *lst; // Faz aux apontar para 1o nó
	while (aux->prox != NULL && aux->prox->info < elem)
		aux = aux->prox; // Avança
	// Insere o novo elemento na lista
	N->prox = aux->prox; // Se aux é o último, N->prox=NULL
	aux->prox = N;

	return 1;
}

int remove_ord(Lista *lst, int elem) {
	if (lista_vazia(*lst) == 1 || elem < (*lst)->info)
		return 0; // Falha
    Lista aux = *lst; // Ponteiro auxiliar para o 1o nó
	if (elem == (*lst)->info) { // Remove elemento 1o nó da lista
		*lst = aux->prox; // Lista aponta para o 2o nó

	free(aux); // Libera memória alocada
	return 1;
 }

	// Percorrimento até final de lista ou achar elem ou nó maior
	while (aux->prox != NULL && aux->prox->info < elem)
		aux = aux->prox;
	if (aux->prox == NULL || aux->prox->info > elem)
		return 0; // Falha
	// Remove elemento (após o 1o nó da lista)
	Lista aux2 = aux->prox; // Aponta nó a ser removido
	aux->prox = aux2->prox; // Retira nó da lista
	free(aux2); // Libera memória alocada
		return 1;
}

void imprime_lista(Lista *lst){
    Lista aux;
    aux = *lst;
    if(lista_vazia(*lst) == 1)
       printf("Lista vazia.\n");

    else{
        while(aux != NULL){
            printf("%d ", aux->info);
            aux=aux->prox;
    }
    }
     printf("\n");
}

int maior(Lista *lst){
  if(lista_vazia(*lst) == 1)
    return 0;

  Lista aux = *lst;

  if(aux->prox == NULL){ //trata lista de apenas um elemento
    *lst == NULL;
    free(aux);
    return 1;
  }

  Lista aux2 = aux->prox;
  while(aux2->prox != NULL){
    aux2 = aux2->prox;
    aux = aux->prox;
  }
  aux->prox = aux2->prox;
  free(aux2);

  return 1;
}

int remove_impares(Lista *lst){

    Lista aux = *lst;
    Lista aux2;
    Lista anterior = *lst;

    while(aux != NULL && aux->info % 2 == 1){
        *lst = (*lst)->prox;
        free(aux);
        aux = *lst;
    }

    anterior = aux;
    while(aux != NULL){
        if(aux->info % 2 == 1){
            Lista aux2;
            aux2 = aux;
            anterior->prox = aux->prox;
            free(aux);
            aux = aux2->prox;
        }
        else{
            anterior = aux;
            aux = aux->prox;
        }
    }

    return 1;
}


int tamanho(Lista *lst){
    Lista aux = *lst;
    int tam=0;
    while(aux != NULL){
        tam++;
        aux = aux->prox;
    }
    return tam;
}


Lista concatena(Lista *lst1, Lista *lst2){

    Lista d;
    d = cria_lista();
    Lista aux = *lst1;
    Lista aux2 = *lst2;

    while(aux != NULL){
        insere_ord(&d, aux->info);
        aux = aux->prox;
    }

    while(aux2 != NULL){
        insere_ord(&d, aux2->info);
        aux2 = aux2->prox;
    }

    return d;
}


Lista intercala(Lista *lst1, Lista *lst2){

    Lista d = concatena(lst1, lst2);
    Lista intercalada = cria_lista();


    Lista aux = d;

    while(aux != NULL){
        insere_ord(&intercalada, aux->info);
        aux = aux->prox;
    }
    return intercalada;

}



int iguais(Lista *lst1, Lista *lst2){
    if(lista_vazia(*lst1) == 1 && lista_vazia(*lst2) == 1){
        printf("Sao iguais.");
        return 0;
    }

    Lista aux1 = *lst1;
    Lista aux2 = *lst2;

    while(aux1 != NULL){
        if(aux1->info != aux2->info){
            printf("Sao diferentes.");
            return 0;
        }
        aux1 = aux1->prox;
        aux2 = aux2->prox;
    }
    printf("Sao iguais.");
    return 1;
}




