#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "TAD Ponto.h"

int main()
{
    float x,y,d12,d13,d14,d23,d24,d34;
    Ponto p1,p2,p3,p4;

    printf("Digite a abcissa do primeiro ponto: ");
    scanf("%f",&x);
    printf("Digite a ordenada do primeiro ponto: ");
    scanf("%f",&y);

    p1=cria_ponto(x,y);

    printf("Digite a abcissa do segundo ponto: ");
    scanf("%f",&x);
    printf("Digite a ordenada do segundo ponto: ");
    scanf("%f",&y);

    p2=cria_ponto(x,y);

    printf("Digite a abcissa do terceiro ponto: ");
    scanf("%f",&x);
    printf("Digite a ordenada do terceiro ponto: ");
    scanf("%f",&y);

    p3=cria_ponto(x,y);

    printf("Digite a abcissa do quarto ponto: ");
    scanf("%f",&x);
    printf("Digite a ordenada do quarto ponto: ");
    scanf("%f",&y);

    p4=cria_ponto(x,y);

    d12=distancia(p1,p2);
    printf("A distancia entre p1 e p2 eh: %.2f\n", d12);

    d13=distancia(p1,p3);
    printf("A distancia entre p1 e p3 eh: %.2f\n", d13);

    d14=distancia(p1,p4);
    printf("A distancia entre p1 e p4 eh: %.2f\n", d14);

    d23=distancia(p2,p3);
    printf("A distancia entre p2 e p3 eh: %.2f\n", d23);

    d24=distancia(p2,p4);
    printf("A distancia entre p2 e p4 eh: %.2f\n", d24);

    d34=distancia(p3,p4);
    printf("A distancia entre p3 e p4 eh: %.2f\n", d34);

    float v[6]={d12,d13,d14,d23,d24,d34};
    maior(v);
    menor(v);

    return 0;
}








