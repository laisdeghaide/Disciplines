import pandas as pd
import statistics


def exclui_brancos(coluna):
    for item in coluna:
        if item == "?":
            coluna.remove(item)
    pass

def replaced_itens(coluna,moda):
    for i in range(0,len(coluna)):
        if coluna[i] == "?":
            coluna[i] = moda
    pass

input_name = "userprofile.csv"
df = pd.read_csv(input_name)
print(df)
output_name = input_name[:-4] + '_output.csv'
df_output = pd.DataFrame()
for i in df.columns:
    coluna = list(df[i])
    aux = coluna.copy()
    exclui_brancos(aux)
    moda = statistics.mode(aux)
    replaced_itens(coluna,moda)
    df_output[i] = coluna
df_output.to_csv(output_name)
    
    
