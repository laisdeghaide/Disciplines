typedef struct deque *Deque;
Deque cria_deque();
int deque_vazio(Deque d);
int insere_ini(Deque *d, int elem);
int insere_fim(Deque *d, int elem);
int remove_ini(Deque *d, int *elem);
int remove_fim (Deque *d, int *elem);
void imprime(Deque d);
