import pandas as pd

def grava_arquivo(frases):
  arquivo = open('resultado.txt', 'w')

  for frase in frases:
    arquivo.write(frase+'\n')

  arquivo.close()
  
def pega_clusters(count):
  lista = []
  for coluna, dados in count.iteritems():
    if coluna == 'cluster':
      for valor in dados:
        if valor not in lista:
          lista.append(valor)
  return lista

def pega_total(count):
    return count.quantidade.sum()

def pega_somas(count, lista):
  somas = {}
  for i in lista:
    somas.update({i: count.loc[count.cluster==i].quantidade.sum()})
  
  return somas

def pureza_clusters(count, lista):
  pureza = {}
  for i in lista:
    pureza.update({i: count.loc[count.cluster==i].quantidade.max()/count.loc[count.cluster==i].quantidade.sum()})
  
  return pureza

def pureza_total(count):
  clusters = pega_clusters(count)
  pureza = pureza_clusters(count, clusters)
  somas = pega_somas(count, clusters)
  
  lista1 = list(pureza.values())
  lista2 = list(somas.values())

  resultado = []

  for i, j in zip(lista1, lista2):
    resultado.append(i*j)

  resultado = sum(resultado)

  resultado = resultado/count.quantidade.sum()

  return round(resultado, 2)
