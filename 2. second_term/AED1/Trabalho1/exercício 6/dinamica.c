#include <stdio.h>
#include <stdlib.h>
#include "dinamica.h"

struct no{
    int info;
    struct no *prox;
};

Lista cria_lista(){
    //Aloca nó cabeçalho
    Lista cab;
    cab = (Lista)malloc(sizeof(struct no));
    //coloca a lista no estado vazia
    if(cab != NULL){ //só se a alocaçao nao falhar
        cab->prox = NULL;
    }
    return cab;
}

int lista_vazia(Lista lst) {
    if (lst->prox == NULL)
        return 1; // Lista vazia
    else
        return 0; // Lista NÃO vazia
}

int insere_ord(Lista *lst, int elem) { // Aloca um novo nó
    Lista N = (Lista) malloc(sizeof(struct no));

    if (N == NULL) {
        return 0;
    } // Falha: nó não alocado

    N->info = elem; // Insere o conteúdo (valor do elem)

//    if (lista_vazia(*lst) == 1 || elem <= (*lst)->info) {
//        (*lst)->prox = N; // Faz a lista apontar para o novo nó
//        return 1;
//    }

    // Percorrimento da lista (elem > 1o nó da lista)
    Lista aux = *lst; // Faz aux apontar para 1o nó
    while (aux->prox != NULL && aux->prox->info < elem)
        aux = aux->prox; // Avança
    // Insere o novo elemento na lista
    N->prox = aux->prox; // Se aux é o último, N->prox=NULL
    aux->prox = N;

    (*lst)->info++;
    return 1;
}

int remove_ord (Lista *lst, int elem) {
    if (lista_vazia(*lst) == 1)
        return 0; // Falha
    Lista aux = *lst; // Ponteiro auxiliar para nó cabeçalho
    while (aux->prox != NULL && aux->prox->info < elem)// Percorrimento
        aux = aux->prox; // até o final de lista, achar elem ou nó maior
        if (aux->prox == NULL || aux->prox->info > elem)
            return 0; // Falha
    // Remove elemento da lista
    Lista aux2 = aux->prox; // Aponta nó a ser removido
    aux->prox = aux2->prox; // Retira nó da lista
    free(aux2); // Libera memória alocada
    (*lst)->info--; // Opcional: Decrementa qtde de nós na lista

    return 1;
}


void imprime_lista(Lista *lst){
    Lista aux;
    aux = (*lst)->prox;//Alterar para aux = (*lst)
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

    if(lista_vazia(*lst) == 1) //Se lista vazia, retorna 0
        return 0;
    Lista aux;
    Lista anterior;

    aux = (*lst)->prox; //Inicia a busca pulando o no de cabecalho
    anterior = (*lst); //Anterior para poder controlar o novo ultimo elemento

    while(aux->prox != NULL){ //Enquanto aux nao for o ultimo elemento
        anterior = aux;
        aux = aux->prox;
    } //Passa ate chegar no fim

    free(aux->prox); //Libera o ultimo no
    anterior->prox = NULL; //Faz o anterior ao ultimo apontar para NULL (FIM da lista)

    return 1;
}

int tamanho(Lista *lst){
    return (*lst)->info;
}

int remove_impares(Lista *lst){

    Lista aux = (*lst)->prox; //Pula o no de cabecalho e pega o primeiro no
    Lista aux2;
    Lista anterior = *lst; //anterior comeca no no de cabecalho

    while(aux != NULL && aux->info % 2 == 1){ //Se for remover o no do comeco (o que esta logo depois do no' cabeca)
        (*lst)->prox = aux->prox; //O proximo do no cabeca recebe o segundo no'
        free(aux); //Libera o primeiro
        aux = (*lst)->prox; //Aux vai para o novo primeiro no' (o que o no cabeca aponta agora)
    }

    //Nao se altera nada aqui em relacao ao exercicio anterior, visto que remover no meio de uma lista que possui um no cabeça
    //ou remover no meio de uma que nao possui um no cabeça é a mesma coisa
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

Lista concatena(Lista *lst1, Lista *lst2, int tam1, int tam2){

    Lista d;
    d = cria_lista(); //Como ao criar a lista ja se adiciona o no cabeca à lista nova, portanto, nao há necessidade de copiar o nó cabeca das outras
    Lista aux = (*lst1)->prox; //Pula-se o no cabeça (Justifica-se acima)
    Lista aux2 = (*lst2)->prox; //Pula-se o no cabeça (Justifica-se acima)
    int count = 0;

    //Realiza-se a copia, como no exercicio anterior
    while(count < tam1){
        insere_ord(&d, aux->info);
        aux = aux->prox;
        count++;
    }

    count = 0;
    while(count < tam2){
        insere_ord(&d, aux2->info);
        aux2 = aux2->prox;
        count++;
    }

    return d;
}

Lista intercala(Lista *lst1, Lista *lst2, int tam1, int tam2){

    Lista d = concatena(lst1, lst2, tam1, tam2);

    Lista intercalada = cria_lista();

    Lista aux = d->prox; //Auxiliar para percorrer a lista concatenada "d" pula o no cabeça, pois nao precisa copia-lo

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



