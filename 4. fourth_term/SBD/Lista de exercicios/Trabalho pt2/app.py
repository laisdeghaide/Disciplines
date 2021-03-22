import psycopg2

# connect to the db
con = psycopg2.connect(
    host="200.131.206.13",
    database="laisdeghaide",
    user="laisdeghaide",
    password="laissbd",
    port=5432)

cur = con.cursor()

cur.execute("SET SEARCH_PATH TO agencia")

while True:

    # mostrar a tabela cidade
    # mostrar tabela local
    x = int(input("selecione uma operação: "))
    print("1 para cidade e 2 para local")
    o = int(input("selecione a tabela: "))

    if x == 2:
        # 2 = excluir
        if o == 1:
            idcid = int(input("Digite o id da cidade a qual deseja excluir: "))
            num_linhas = cur.execute(
                "SELECT * FROM cidade WHERE idcid=%s", [idcid])
            if (num_linhas) != 1:
                print("Esse id não existe")
                break
            #cur.execute("DELETE FROM local WHERE idcid=:idcid", idcid=idcid)
            cur.execute("DELETE FROM cidade WHERE idcid=%s", [idcid])
            break
        else:
            idlocal = int(
                input("Digite o id do local a qual deseja excluir: "))
            cur.execute("DELETE FROM local WHERE idlocal= %s",
                        [idlocal])
            break

cur.close()
con.close()
