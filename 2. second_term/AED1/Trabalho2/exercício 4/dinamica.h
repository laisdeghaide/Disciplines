typedef struct no *Pilha;
Pilha cria_pilha();
int pilha_vazia(Pilha p);
int push(Pilha *p, int elem);
int pop(Pilha *p, int *elem);
int le_topo(Pilha *p, int *elem);
void pares_impares(Pilha p);
void imprime(Pilha p);
int palindromo(Pilha p, char str[50]);
int pushchar(Pilha *p, char elem);
int popchar(Pilha *p, char *elem);
void imprimechar(Pilha p);
int le_topochar(Pilha *p, char *elem);

