#include <stdio.h>
#include <stdlib.h>
#include "estatica.h"

int main()
{
    int num, x;
    printf("Selecione a opcao de conversao: \n");
    printf("1: Decimal para Binario\n");
    printf("2: Decimal para Octal\n");
    printf("3: Decimal para Hexadecimal\n");
    scanf("%d", &num);
    printf("Digite o valor: ");
    scanf("%d", &x);

    switch(num){
        case 1:
            converte_dec_bin(x);
             break;
        case 2:
            converte_dec_octal(x);
             break;
        case 3:
            converte_dec_hexa(x);
            break;

        default: printf("Opcao invalida.\n");
    }
    return 0;
}
