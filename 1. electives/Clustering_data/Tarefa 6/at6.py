import pandas as pd
import random
import sys
import numpy as np
from funcoes import *
from statistics import mean

 
print("Insira abaixo o nome do arquivo que será utilizado, com extensão(exemplo.csv).\nEle deve estar na mesma pasta do programa.")

input_name = input("Nome do arquivo:")
try:
    df = pd.read_csv(input_name)
except:
    print("Arquivo não é um csv ou não foi encontrado")
    sys.exit()

k = int(input("Numero de centroides: "))

grupos = KMeans(k, df, max_interacao=100)

output_txt(grupos)