#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

struct no{
	int info;
	struct no *prox;
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


int insere_elem (Lista *lst, int elem) { // Aloca um novo nó
	Lista N = (Lista)malloc(sizeof(struct no));
	if (N == NULL) {
		return 0;
	} // Falha: nó não alocado

	// Preenche os campos do novo nó
	N->info = elem; // Insere o conteúdo (valor do elem)
	N->prox = *lst; // Aponta para o 1o nó atual da lista
	*lst = N; // Faz a lista apontar para o novo nó
		return 1;
}


int remove_elem (Lista *lst, int elem) {
	if (lista_vazia(*lst) == 1)
		return 0; // Falha

    Lista aux = *lst; // Ponteiro auxiliar para o 1o nó

	// Trata elemento = 1o nó da lista
	if (elem == (*lst)->info) {
		*lst = aux->prox; // Lista aponta para o 2o nó

	free(aux); // Libera memória alocada
	return 1;
 	}
	// Percorrimento até achar o elem ou final de lista
	while (aux->prox != NULL && aux->prox->info != elem)
		aux = aux->prox;
	if (aux->prox == NULL) // Trata final de lista
		return 0; // Falha
	// Remove elemento ? 1o nó da lista
	Lista aux2 = aux->prox; // Aponta nó a ser removido
	aux->prox = aux2->prox; // Retira nó apontado p/ aux2 da lista
	free(aux2); // Libera memória alocada
	return 1;
}


int menor(Lista *lst){
    int menor;
    menor = (*lst)->info; //o menor comeca com o valor do primeiro elemento da lista
    Lista aux = *lst;
    while(aux != NULL){
        if(menor > aux->info) //se a informacao de aux for menor que o menor elemento
            menor = aux->info; //menor recebe a informacao
        aux = aux->prox; //avanca o aux
    }
    aux = *lst;

    if(aux->info == menor){ //se aux->info for o menor elemnto
        (*lst) = (*lst)->prox; //mudo o ponteiro lst para proxima posicao
        free(aux); //libero aux
        return 1;
    }
    //enquanto o aux for diferente de NULL e a informacao do no da frente nao for o menor
    while(aux != NULL && aux->prox->info != menor)
        aux= aux->prox;

    if(aux->prox == NULL)
        return 0;

    Lista aux2 = aux->prox;
    aux->prox = aux2->prox;
    free(aux2);

    return 1;
}

int tamanho(Lista *lst){
    Lista aux= *lst;
    int tam=0;
    while(aux != NULL){
        tam++;
        aux=aux->prox;
    }
    return tam;
}


int imprime_lista(Lista *lst){
    Lista aux = *lst;
    if(aux == NULL){
        return 0;
    }
    while (aux != NULL){
        printf("%d ",aux->info);
        aux=aux->prox;
    }
    return 1;
}

int insere_fim(Lista *lst, int elem){ //insere no final
    Lista N = (Lista)malloc(sizeof(struct no));
	if (N == NULL)
		return 0;
    Lista aux = *lst;
    if(aux == NULL){ //lista vazia
        int verifica = insere_elem(lst,elem); //insere como se fosse o primeiro elemento normalmente
        if(verifica == 0){
           printf("Erro.");
           return 0;
        }
        else
            return 1;
    }
    while(aux->prox != NULL) //percorrimento
        aux=aux->prox;

    N->info = elem;
    N->prox = aux->prox;
    aux->prox = N; //a ultima posicao agora eh o N

    return 1;
}


int remove_todos(Lista *lst, int elem){
    if(lista_vazia(*lst) == 1)
        return 0;
    Lista aux = *lst; //Ponteiro auxiliar para o 1o nó
    //Trata elemento = 1o no da lista

    while((*lst) != NULL && elem == (*lst)->info){
        *lst = aux->prox; //lista aponta  para o 2o no
        free(aux); //libera memoria alocada
        aux = *lst;
    }

    while(aux->prox != NULL){
        if(aux->prox->info == elem){
            Lista aux2 = aux->prox; //aponta pro no a ser removido
            aux->prox = aux2->prox; //retira no apontado para aux2 da lista
            free(aux2); //libera memoria alocada
        } else{
            aux = aux->prox;
        }
    }

    return 1;
}

Lista concatena(Lista *lst1, Lista *lst2){

    Lista d;
    d = cria_lista();
    Lista aux = *lst1;
    Lista aux2 = *lst2;

    while(aux != NULL){ //enquanto o ponteiro for != de NULL
        insere_fim(&d, aux->info); //lista concatenada d recebera o valor de aux->info
        aux = aux->prox;
    }

    while(aux2 != NULL){
        insere_fim(&d, aux2->info); //mesma coisa do while a cima
        aux2 = aux2->prox;
    }

    return d;
}
