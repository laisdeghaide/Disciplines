import pandas as pd
import numpy as np
import random


def KMeans(k, df, max_interacao):
  centroids = centroides(k, df)
  agrupamento = agrup(centroids, df, k)
  for i in range(max_interacao):
    novos_centroids = media_novos_centroides(agrupamento)
    if centroids == novos_centroids:
      break
    else:
      centroids = novos_centroids
    agrupamento = agrup(centroids, df, k)
  return agrupamento 

# Função que calcula os primeiros centroides aleatoriamente
def centroides(k, df):
  centroides = {}

  for i in range(k):
    valores = []
    for c in df.columns:
      valores.append(round(random.uniform(min(df[c]), max(df[c])),2))

    centroides[i+1] = valores

  return centroides

# Função que calcula os novos centroides a partir da média
def media_novos_centroides(centroids):
    # Colocando os valores de mesmo index das sublistas nas mesmas sublistas para fazer a média
    for i in centroids.keys():
        lista = {}
        for key, values in (centroids.items()):
            res = [list(x) for x in zip(*values)] 
            lista[key] = res

    # Fazendo a média de cada nova sublista dos centroides
    novos_centroides = {}
    for key, value in lista.items():
        sub_medias = []
        for v in value:
            m = round(np.mean(v), 2)
            sub_medias.append(m)

            if len(sub_medias) == len(value): 
                novos_centroides.update({key: sub_medias})

    return novos_centroides

# Função que calcula a distancia euclidiana
def distancia(obj1, obj2, dist=1):
  lista = []

  for (valor1, valor2) in zip(obj1, obj2):
    resultado = abs(valor1 - valor2) ** int(dist)
    lista.append(resultado)

  resultado = sum(lista)
  resultado = resultado ** (1/int(dist))

  return round(resultado, 2)


# Função que realiza o agrupamento dos pontos da base de dados 
def agrup(centroides, df, k):
  clusters = {}
  for z in range(1,k+1):
    for r in range(k):
      lista = [[]]
    clusters[z] = lista
  for m in range(k):
    for i in range(df.shape[0]):
      menor = menor_dist(centroides, i, df)
      for k1, v in enumerate(clusters.values()):
        if menor[0] == k1:
          if [] in v:
              v.remove([])
          if df.iloc[i].values.tolist() not in v:
            v.append(df.iloc[i].values.tolist())
            clusters[k1+1] = v
        
  return clusters


# Função que retorna o indice do centroide e a menor distancia do objeto a esse centroide
def menor_dist(centroides, i, df):
  distancias = []
  for e, c in enumerate(centroides.values()):
    dist = distancia(df.iloc[i], c)
    distancias.append(dist)
  for j, d in enumerate(distancias):
    if j == 0:
      menor = (j, d)
    elif (d < menor[1]):
      menor = (j, d)

  return menor

# Função final que escreve no arquivo
def output_txt(listas):
  f = open("output.txt", "w")
  for lista in listas:
    f.write(("Grupo " + str(lista) +": "+ str(listas[lista])))
    f.write("\n\n")
  f.close()

