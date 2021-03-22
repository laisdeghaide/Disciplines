import pandas as pd
import random
import sys
import numpy as np
from statistics import mean
from sklearn.cluster import KMeans
from funcoes import *

print("Insira abaixo o nome do arquivo que será utilizado, com extensão(exemplo.csv).\nEle deve estar na mesma pasta do programa.")

input_name = input("Nome do arquivo:")
try:
    df = pd.read_csv(input_name)
except:
    print("Arquivo não é um csv ou não foi encontrado")
    sys.exit()

classe_csv = input("Insira o nome da coluna que representa a classe: ")

frases = []

for k in range(2,5):
  # Convert DataFrame to matrix
  df_aux = df.copy()
  df_aux.drop([classe_csv],axis=1,inplace= True)
  mat = df_aux.values
  # Using sklearn
  km = KMeans(n_clusters=k, max_iter=100)
  km.fit(mat)
  # Get cluster assignment labels
  labels = km.labels_
  # Format results as a DataFrame
  df["cluster"] = labels

  count = df.groupby(["cluster",classe_csv]).count()
  count = count['sepal.length']
  count = pd.DataFrame(count)
  count.columns = ['quantidade']
  count.reset_index(inplace=True)
  
  resultado = pureza_total(count)

  frase = f'Para o k-means com k = {k} a pureza total foi de: {resultado}'

  frases.append(frase)

grava_arquivo(frases)
