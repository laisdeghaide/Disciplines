import pandas as pd
import numpy as np
import sys
import math
from completar_dados import *

print(
    "Insira abaixo o nome do arquivo que será utilizado, com extensão(exemplo.csv).\nEle deve estar na mesma pasta do programa."
)

input_name = input("Nome do arquivo: ")
try:
    df = pd.read_csv(input_name,header=0)
except:
    print("Arquivo não é um csv ou não foi encontrado")
    sys.exit()

#Computa a primeira matriz
matriz = distancia_todos(df)
print(matriz)
print("Escolha o tipo de output:")
print("0 - Sem output de texto")
print("1 - Apenas os grupos que foram formados a cada interacao")
print("2 - Matriz inicial e grupos formados a cada interacao")
output = int(input())
single_link(matriz,output)
