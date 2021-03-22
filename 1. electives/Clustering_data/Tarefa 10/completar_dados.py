import pandas as pd
import numpy as np


def distancia(obj1, obj2):

    lista = []

    for (valor1, valor2) in zip(obj1, obj2):
        resultado = abs(valor1 - valor2) ** 2
        lista.append(resultado)

    resultado = sum(lista)
    resultado = resultado ** (1 / 2)

    return round(resultado, 2)


def distancia_todos(df):
    listas = []
    for i, (nome_col, dados_row) in enumerate(df.iterrows()):
        lista = dados_row.values.tolist()
        listas.append(lista)

    resultado = []
    for i, l1 in enumerate(listas):
        r = []
        for j, l2 in enumerate(listas):
            result = distancia(l1, l2)
            if result == 0.0:
              result = np.nan
            r.append(result)
        resultado.append(r)
    resultado = pd.DataFrame(resultado)
    
    return resultado


def single_link(matriz,output):
    if output == 1 or output == 2:
        f = open("output.txt","w")
        if output > 1 :
            f.write("Matriz inicial\n") #Escreve a matriz inicial no arquivo txt, caso 
            f.write(matriz.to_string())
            f.write("\n\n")
    while len(matriz) != 1:
        indice_menor_valor = np.unravel_index(np.nanargmin(matriz, axis=None), matriz.shape)
        ind1 = indice_menor_valor[1]
        ind2 = indice_menor_valor[0]
        if output == 1 or output == 2:
            f.write("Grupos unidos: "+str(matriz.index[ind1])+" e "+str(matriz.index[ind2])+"\n")
        #Unir os grupos do menor valor
        for i,c in enumerate(matriz.columns):
            minimo = min(matriz.iloc[ind1][c],matriz.iloc[ind2][c])
            if ind1 < ind2: #Coloca os menores valores no grupo de menor indice
                matriz.iloc[ind1][c] = minimo
                matriz.iloc[i][matriz.columns[ind1]] = minimo
            else:
                matriz.iloc[ind2][c] = minimo
                matriz.iloc[i][matriz.columns[ind2]] = minimo
        #Atualizar a matriz
        if ind1 < ind2:#Verifica o menor indice
            matriz.iloc[ind1][ind1] = float('nan') #Trata um bug causado pela funcao de minimo que substituia o
            #NaN pelo menor valor 
            #Renomeia o grupo
            matriz.rename(columns = {matriz.columns[ind1]: str(matriz.columns[ind1])+","+str(matriz.columns[ind2])},inplace= True)
            matriz.rename(index = {matriz.index[ind1]: str(matriz.index[ind1])+","+str(matriz.index[ind2])},inplace = True)
            #Remove a linha e a coluna do mair índice do menor valor
            matriz.drop([matriz.index[ind2]],axis=0,inplace=True)
            matriz.drop([matriz.columns[ind2]],axis=1,inplace=True)
        else:
            matriz.iloc[ind2][ind2] = float('nan')
            matriz.rename(columns = {matriz.columns[ind2]: str(matriz.columns[ind2])+","+str(matriz.columns[ind1])},inplace= True)
            matriz.rename(index = {matriz.index[ind2]: str(matriz.index[ind2])+","+str(matriz.index[ind1])},inplace= True)
            matriz.drop([matriz.index[ind1]],axis=0,inplace=True)
            matriz.drop([matriz.columns[ind1]],axis=1,inplace=True)
    if output == 1 or output == 2:
        f.close()


def output_txt(listas):
    f = open("output.txt", "w")
    for lista in listas:
        f.write(str(lista[0]))
        for i in lista[1:]:
            f.write("," + str(i))
        f.write("\n")
    f.close()
