#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "TAD Ponto.h"

struct ponto{ //estrutura com as coordenadas do ponto
    float x;
    float y;
};

Ponto cria_ponto(float x, float y){
    Ponto pto;
    pto=(Ponto*)malloc(sizeof(struct ponto)); //cria um ponto
    if(pto == NULL)
        return NULL;
    else{
        pto->x=x; //atribui o primeiro valor digitado a primeira coordenada do ponto, ou seja, atribui x a posicao x
        pto->y=y; //mesma coisa do pto->x
        return pto;
    }
}

void libera(Ponto pto){
    free(pto);
}

float distancia(Ponto p1, Ponto p2){
    float dx = (p2->x) - (p1->x); //distancia entre as abcissas dos pontos
    float dy = (p2->y) - (p1->y); //distancia entre as ordenadas dos pontos

        return sqrt((dx*dx) + (dy*dy)); //distancia final
}

void maior(float v[6]){
    float maior=-12134452; //atribuo o maior a um valor pequeno para inicializar
    for(int i=0; i<6; i++){
        if(v[i]>maior)
            maior=v[i];
    }
    printf("O maior elemento eh: %f\n", maior);
}

void menor(float v[6]){
    float menor = 13425366; // atribuo o menor a um valor grande para inicializar
    for(int i=6; i>0; i--){
        if(v[i]<menor)
            menor=v[i];
    }
    printf("O maior elemento eh: %f\n", menor);
}







