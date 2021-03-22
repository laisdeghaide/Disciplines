typedef struct no *Lista;

Lista cria_lista();
int lista_vazia(Lista lst);
int insere_elem (Lista *lst, int elem);
int remove_elem (Lista *lst, int elem);
int menor(Lista *lst);
int tamanho(Lista *lst);
int imprime_lista(Lista *lst);
int insere_fim(Lista *lst, int elem);
int remove_todos(Lista *lst, int elem);
Lista concatena(Lista *lst1, Lista *lst2);
