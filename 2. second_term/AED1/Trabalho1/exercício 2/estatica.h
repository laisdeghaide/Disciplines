typedef struct lista *Lista;
typedef struct lista2 *Lista2;
Lista cria_lista();
int lista_vazia(Lista lst);
int lista_cheia(Lista lst);
int insere_elem(Lista lst, int elem);
int insere_inicio(Lista lst, int elem);
int remove_elem(Lista lst, int elem);
Lista remove_todos(Lista lst, int elem) ;
void imprime_lista(Lista lst);
void tamanho(Lista lst);
void menor(Lista lst);
Lista2 cria_lista2();
void imprime_lista2(Lista2 lst);
Lista2 concatena(Lista lst1, Lista lst2);



