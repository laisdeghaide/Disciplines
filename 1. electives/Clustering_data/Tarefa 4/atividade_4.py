import pandas as pd
import numpy as np
import sys
from completar_dados import *

print("Insira abaixo o nome do arquivo que será utilizado, com extensão(exemplo.csv).\nEle deve estar na mesma pasta do programa.")

input_name = input("Nome do arquivo:")
try:
    df = pd.read_csv(input_name)
except:
    print("Arquivo não é um csv ou não foi encontrado")
    sys.exit()
print("Qual distância será utilizada?")
print("Digite 1 para - Distância Euclidiana")
print("Digite 2 para - Distância Manhattan")
distancia = int(input("Distância: "))


#Removendo colunas que não são numéricas
df.drop(df.select_dtypes(include=[object]), axis=1, inplace=True)
df.dropna(inplace=True)

#Imputando a média nos valores que estão faltando
df.fillna(df.mean(), inplace=True)

output_txt(distancia_todos(df,distancia))