l1=[1..1000]
l2=[1000,999..1]
l3=l1++[0]
l4=[0]++l2
l5=l1++[0]++l2
l6=l2++[0]++l1
l7=l2++[0]++l2
x1=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
x2=[20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]
x3=[11,12,13,14,15,16,17,18,19,20,1,2,3,4,5,6,7,8,9,10]
x4=[10,9,8,7,6,5,4,3,2,1,20,19,18,17,16,15,14,13,12,11]
x5=[11,12,13,14,15,5,4,3,2,1,16,17,18,19,20,10,9,8,7,6]
x6=[1,12,3,14,5,15,4,13,2,11,6,17,8,19,20,10,9,18,7,16]
x7 = [20,8,2,11,13,3,7,18,14,4,16,10,15,1,9,17,19,12,5,6]

lst1 = [l1,l2,l3,l4,l5,l6,l7]
lst2 = [x1,x2,x3,x4,x5,x6,x7]

sel0 = map selectionsortcont lst2
sel2 = map selectionsort2cont lst2
s0 = map snd (map selectionsortcont lst2)
s2 = map snd (map selectionsort2cont lst2)
q5 = map snd (map quicksortcont lst1)
q6 = map snd (map quicksort2cont lst1)

bubblesort [] = []
bubblesort lista = bolhaOrd lista (length lista)

bolhaOrd lista 0 = lista
bolhaOrd lista n = bolhaOrd (troca lista) (n-1)

troca [x] = [x]
troca (x:y:z)
 |x > y = y:troca(x:z)
 |otherwise = x:troca(y:z)
 
 
--BUBBLESORTCOMCONTADOR
bubblesortcont :: [Integer] -> ([Integer], Int)
bubblesortcont [] = ([], 0)
bubblesortcont lista = bolhaOrdcont lista (length lista)

bolhaOrdcont :: [Integer]->Int->([Integer], Int)
bolhaOrdcont lista 0 = (lista, 0)
bolhaOrdcont lista n = (m, a + b)
 where
 (aux, b) = trocacont lista
 (m, a) = bolhaOrdcont aux (n-1)

trocacont :: [Integer] -> ([Integer], Int)
trocacont [x] = ([x],0)
trocacont (x:y:z) 
 |x > y = (y:m, a + 1)
 |otherwise = (x:n, b + 1)
 
 where
 (m, a) = trocacont(x:z)
 (n, b) = trocacont(y:z)


--EX01
--Variação1
bubblesort1 :: [Integer] -> [Integer]
bubblesort1 [] = []
bubblesort1 lista = bolhaOrd1 lista 1


bolhaOrd1 lista 0 = lista
bolhaOrd1 lista n = a
 where
 (aux, num) = troca1 lista
 a = bolhaOrd1 aux num


troca1 :: [Integer] -> ([Integer],Integer)
troca1 [x] = ([x],0)
troca1 (x:y:z)
 |x > y = (x1, num1 + 1)
 |otherwise = (x2, num2)
 where
 (aux1, num1) = troca1(x:z)
 x1 = y:aux1
 (aux2, num2) = troca1(y:z)
 x2 = x:aux2


--Variação2
bubblesort2 :: [Integer] -> [Integer]
bubblesort2 [] = []
bubblesort2 lista = bolhaOrd2 lista (length lista)

bolhaOrd2 :: [Integer]-> Int -> [Integer]
bolhaOrd2 lista 0 = lista
bolhaOrd2 lista n = bolhaOrd2 (troca2 lista n) (n-1)


troca2 :: [Integer] -> Int -> [Integer]
troca2 l 1 = l
troca2 (x:y:z) n 
 |x > y = y:troca2(x:z) (n-1)
 |otherwise = x:troca2(y:z) (n-1)


--Variação3
bubblesort3 :: [Integer] -> [Integer]
bubblesort3 [] = []
bubblesort3 lista = bolhaOrd3 lista 1 (length lista)


bolhaOrd3 :: [Integer]-> Int -> Int -> [Integer]
bolhaOrd3 lista 0 _ = lista
bolhaOrd3 lista _ 0 = lista
bolhaOrd3 lista cont tamanho = a
 where
 (aux, num) = troca3 lista tamanho
 a = bolhaOrd3 aux num (tamanho-1)
 

troca3 :: [Integer] -> Int -> ([Integer],Int)
troca3 l 1 = (l,0)
troca3 (x:y:z) n
 |x > y = (x1, num1 + 1) 
 |otherwise = (x2, num2)
 where
 (aux1, num1) = troca3 (x:z) (n-1)
 x1 = y:aux1
 (aux2, num2) = troca3 (y:z) (n-1)
 x2 = x:aux2


--Variação1comContador
bubblesort1cont :: [Integer] -> ([Integer], Int)
bubblesort1cont [] = ([], 0)
bubblesort1cont lista = bolhaOrd1cont lista 1

bolhaOrd1cont :: [Integer] -> Integer -> ([Integer], Int)
bolhaOrd1cont lista 0 = (lista, 0)
bolhaOrd1cont lista n = (m, a + b)
 where
 (aux, num, b) = troca1cont lista
 (m, a) = bolhaOrd1cont aux num 


troca1cont :: [Integer] -> ([Integer],Integer, Int)
troca1cont [x] = ([x], 0, 0)
troca1cont (x:y:z)
 |x > y = (x1, num1 + 1, a + 1)
 |otherwise = (x2, num2, a2 + 1)
 where
 (aux1, num1, a) = troca1cont(x:z)
 x1 = y:aux1
 (aux2, num2, a2) = troca1cont(y:z)
 x2 = x:aux2


--Variação2comContador
bubblesort2cont :: [Integer] -> ([Integer], Int)
bubblesort2cont [] = ([], 0)
bubblesort2cont lista = bolhaOrd2cont lista (length lista)

bolhaOrd2cont :: [Integer]-> Int -> ([Integer], Int)
bolhaOrd2cont lista 0 = (lista, 0)
bolhaOrd2cont lista n = (m, a + b)
 where
 (aux, b) = troca2cont lista n 
 (m, a) = bolhaOrd2cont aux (n-1)


troca2cont :: [Integer] -> Int -> ([Integer], Int)
troca2cont l 1 = (l, 0)
troca2cont (x:y:z) t 
 |x > y = (y:m, a + 1)
 |otherwise = (x:n, b + 1)
 
 where
 (m, a) = troca2cont(x:z) (t - 1)
 (n, b) = troca2cont(y:z) (t - 1)


--Variação3comContador
bubblesort3cont :: [Integer] -> ([Integer], Int)
bubblesort3cont [] = ([], 0)
bubblesort3cont lista = bolhaOrd3cont lista 1 (length lista)


bolhaOrd3cont :: [Integer]-> Int -> Int -> ([Integer], Int)
bolhaOrd3cont lista 0 _ = (lista, 0)
bolhaOrd3cont lista _ 0 = (lista, 0)
bolhaOrd3cont lista cont tamanho = (n, a + b)
 where
 (aux, num, b) = troca3cont lista tamanho
 (n, a) = bolhaOrd3cont aux num (tamanho-1) 
 

troca3cont :: [Integer] -> Int -> ([Integer],Int, Int)
troca3cont l 1 = (l, 0, 0)
troca3cont (x:y:z) n
 |x > y = (x1, num1 + 1, a+1) 
 |otherwise = (x2, num2, b+1)
 where
 (aux1, num1, a) = troca3cont (x:z) (n-1)
 x1 = y:aux1
 (aux2, num2, b) = troca3cont (y:z) (n-1)
 x2 = x:aux2

--Escolhendo o l7 para fazer as comparações visto que é uma lista totalmente desordenada e de pior tempo de execução. 
--Analisando o l7 com o código original e as 3 variações cheguei que: algoritimo original realizou 4002000,
--V1 realizou 3998000 comparações, V2 realizou 2001000 e V3 realizou 200999.
--Logo o melhor algoritmo, com minima diferença é o V3.


--EX02
selectionsort :: (Ord a) => [a] -> [a]
selectionsort [] = []
selectionsort x = [y] ++ selectionsort (remove y x)
 where
 y = minimo x
 
remove :: (Ord a) => a->[a]->[a]
remove a [] = []
remove a (x:y)
 |a == x = y
 |otherwise = x:(remove a y)
 
minimo :: (Ord a) => [a]->a
minimo [] = undefined
minimo [x] = x
minimo (x:y)
 |x <= (minimo y) = x
 |otherwise = minimo y
 
 
--SELECTIONSORTCOMCONTADOR
selectionsortcont :: (Ord a) => [a] -> ([a],Int)
selectionsortcont [] = ([],0)
selectionsortcont x = ([m] ++ o, a+b+c) 
 where
 (m, a) = minimocont x
 (n, b) = removecont m x
 (o, c) = selectionsortcont n
 
removecont :: (Ord a) => a->[a]->([a], Int)
removecont a [] = ([], 0)
removecont a (x:y)
 |a == x = (y, b+1)
 |otherwise = (x:m, b+1)
 where
 (m, b) = removecont a y

 
minimocont :: (Ord a) => [a]->(a, Int)
minimocont [] = undefined
minimocont [x] = (x, 0)
minimocont (x:y)
 |x <= m = (x, a+1)
 |otherwise = (m, a+1)
 where
 (m, a) = minimocont y 
 
--Variação1
selectionsort1 :: (Ord a)=>[a]->[a]
selectionsort1 [] = []
selectionsort1 xs = x:selectionsort1 (remove1 x xs)
 where 
 x = minimo xs
 
remove1 :: (Ord a) => a->[a]->[a]
remove1 a [] = []
remove1 a (x:xs)
 |a == x = xs
 |otherwise = x:(remove1 a xs)

minimo1 :: (Ord a) => [a]->a
minimo1 [] = undefined
minimo1 [x] = x
minimo1 (x:xs)
 |x <= (minimo1 xs) = x
 |otherwise = minimo1 xs
 
 
--Variação2
selectionsort2 :: (Ord a) => [a]->[a]
selectionsort2 [] = []
selectionsort2 xs = x:selectionsort2 resto 
 where
 (resto, x) = remove_menor xs
 
 
remove_menor :: (Ord a) => [a]->([a], a)
remove_menor [] = undefined
remove_menor [x] = ([], x)
remove_menor (x:xs)
 |x <= menor = (menor:lista, x)
 |otherwise = (x:lista, menor)
 where
 (lista, menor) = remove_menor xs
 
 
--Variação2comContador
selectionsort2cont :: (Ord a) => [a]->([a], Int)
selectionsort2cont [] = ([], 0)
selectionsort2cont xs = (x:m, a+b) 
 where
 (resto, x, a) = remove_menorcont xs
 (m, b) = selectionsort2cont resto
 
 
remove_menorcont :: (Ord a) => [a]->([a], a, Int)
remove_menorcont [] = undefined
remove_menorcont [x] = ([], x, 0)
remove_menorcont (x:xs)
 |x <= menor = (menor:lista, x, a+1)
 |otherwise = (x:lista, menor, a+1)
 where
 (lista, menor, a) = remove_menorcont xs

--Escolhendo o l7 para fazer as comparações visto que é uma lista totalmente desordenada e de pior tempo de execução.
--Com a V2 foram feitas 2001000 comparações, enquanto a selectionsortcont realizou 4004001, sendo muito melhor a variação.

--EX03
insertionsort :: (Ord a) => [a]->[a]
insertionsort [] = []
insertionsort (x:y) = insereOrd x (insertionsort y)

insereOrd :: (Ord a) => a->[a]->[a]
insereOrd x [] = [x]
insereOrd x (y:z)
 |x <= y = (x:y:z)
 |otherwise = y:(insereOrd x z)
 

--INSERTIONSORTCOMCONTADOR
insertionsortcont :: (Ord a) => [a]->([a],Int)
insertionsortcont [] = ([], 0)
insertionsortcont (x:y) = (n, a + b)
 where
 (m, a) =  insertionsortcont y
 (n, b) = insereOrdcont x m

insereOrdcont :: (Ord a) => a->[a]->([a],Int)
insereOrdcont x [] = ([x], 0)
insereOrdcont x (y:z)
 |x <= y = (x:y:z, 1)
 |otherwise = (y:lista, cont+1)
 where
 (lista, cont) = insereOrdcont x z


--Variação1
insertionsort1 :: Ord a => [a]->[a]
insertionsort1 [] = []
insertionSort1 (x:y) = foldr (insereOrd1) [x] (insertionsort1 y)

insereOrd1 :: Ord a => a -> [a] -> [a]
insereOrd1 x [] = [x]
insereOrd1 x (y:z)
 | x <= y = (x:y:z)
 | otherwise = y:(insereOrd1 x z)


--Variação1comContador
insertionsort1cont :: (Ord a) => [a]->([a], Int)
insertionsort1cont [] = ([], 0)
insertionsort1cont (x:y) = (m, a)
 where
 (m, a) = foldr (insereOrd1cont) ([x], 0)y

insereOrd1cont :: (Ord a) => a->([a], Int)->([a], Int)
insereOrd1cont x ([], m) = ([x], m)
insereOrd1cont x ((y:ys), m)
 |x <= y = (x:y:ys, m+1) 
 |otherwise = (y:n, m1+1)
 where
 (n, m1) = insereOrd1cont x (ys, m)


--Escolhendo o l7 para fazer as comparações visto que é uma lista totalmente desordenada e de pior tempo de execução.
--O algoritmo normal de insertion executou 1500501 comparações, enquanto a variação realizou 1499501.


--EX04
quicksort :: (Ord a) =>[a]->[a]
quicksort [] = []
quicksort (x:y) = quicksort [z | z <- y, z < x] ++ [x] ++ quicksort [z | z <- y, z >= x]


--QUICKSORTCOMCONTADOR
quicksortcont :: (Ord a) =>[a]->([a], Int)
quicksortcont [] = ([], 0)
quicksortcont (x:y) = (m ++ [x] ++ n, a + b + 2*(length y))
 where
 (m, a) = quicksortcont [z | z <- y, z < x]
 (n, b) = quicksortcont [z | z <- y, z >= x]

--Variação1
quicksort1 :: (Ord a) => [a]->[a]
quicksort1 [] = []
quicksort1 (s:xs) = menorPivo ++ [s] ++ maiorPivo
 where
 menorPivo = quicksort1(filter (<= s) xs)
 maiorPivo = quicksort1(filter (> s) xs)


--Variação2
quicksort2 :: (Ord a) => [a]->[a]
quicksort2 [] = []
quicksort2 [x] = [x]
quicksort2 (x:y) = l1 ++ [x] ++ l2
 where
 (m, n) = dividequick x y
 l1 = quicksort2 m
 l2 = quicksort2 n 
 
dividequick :: (Ord a) =>a->[a]->([a],[a])
dividequick _ [] = ([],[])
dividequick x l = (filter (<= x) l, filter (> x) l)


--Variação3
quicksort3 :: (Ord a) => [a]->[a]
quicksort3 [] = []
quicksort3 [x] = [x]
quicksort3 [x,y] 
 |x > y = [y,x]
 |otherwise = [x,y]
quicksort3 l = l1 ++ [m] ++ l2
 where 
 (m, a) = pivo l 
 (n, o) = dividequick m a
 l1 = quicksort3 n
 l2 = quicksort3 o

pivo :: (Ord a) => [a]->(a,[a])
pivo (x:y:z:t)
 |x <= y && x >= z = (x, (y:z:t))
 |x <= z && x >= y = (x, (y:z:t))
 |y <= x && y >= z = (y, (x:z:t))
 |y >= x && y <= z = (y, (x:z:t))
 |z <= x && z >= y = (z, (x:y:t))
 |z <= y && z >= x = (z, (x:y:t))
 

--Variação1comContador
quicksort1cont :: (Ord a) =>[a]->([a], Int)
quicksort1cont [] = ([], 0)
quicksort1cont (s:xs) = (m ++ [s] ++ n, a+b+2*(length xs))
 where
 (m, a) = quicksort1cont(filter (<= s) xs)
 (n, b) = quicksort1cont(filter (> s) xs)


--Variação2comContador
quicksort2cont :: (Ord a) => [a]->([a], Int)
quicksort2cont [] = ([], 0)
quicksort2cont [x] = ([x], 0)
quicksort2cont (x:y) = (lista1 ++ [x] ++ lista2, a)
 where
 (m, n, a) = dividequick2cont x y
 (lista1, b) = quicksort2cont m 
 (lista2, c) = quicksort2cont n 

dividequick2cont :: (Ord a) =>a->[a]->([a],[a], Int)
dividequick2cont _ [] = ([],[], 0)
dividequick2cont x l = (filter (<= x) l, filter (> x) l, 2*(length l))


--Variação3comContador
quicksort3cont :: (Ord a) => [a]->([a], Int)
quicksort3cont [] = ([], 0)
quicksort3cont [x] = ([x], 0)
quicksort3cont [x,y] 
 |x > y = ([y,x], 1)
 |otherwise = ([x,y], 1)
quicksort3cont l = (l1 ++ [m] ++ l2, b+c+d)
  where 
 (m, a, b) = pivo3cont l 
 (n, o) = dividequick m a
 (l1, c) = quicksort3cont n
 (l2, d) = quicksort3cont o
 
pivo3cont :: (Ord a) => [a]->(a,[a], Int)
pivo3cont (x:y:z:t)
 |x <= y && x >= z = (x, (y:z:t), 2)
 |x <= z && x >= y = (x, (y:z:t), 2)
 |y <= x && y >= z = (y, (x:z:t), 2)
 |y >= x && y <= z = (y, (x:z:t), 2)
 |z <= x && z >= y = (z, (x:y:t), 2)
 |z <= y && z >= x = (z, (x:y:t), 2)
 
--Escolhendo o l7 para fazer as comparações visto que é uma lista totalmente desordenada e de pior tempo de execução.
--O algoritmo normal do quicksort excutou 2002000 comparações, a V1 executou 2004000, a V2 executou 4000 e a V3 executou 2000, sendo portanto o melhor algoritmo.


--EX05
mergesort :: (Ord a) =>[a]->[a]
mergesort [] = []
mergesort [x] = [x]
mergesort xs = merge (mergesort ys) (mergesort zs)
 where 
 (ys, zs) = divide xs

divide :: (Ord a) =>[a]->([a],[a])
divide [] = ([],[])
divide [x] = ([x], [])
divide (x:y:z) = ((x:ys), (y:zs))
 where
 (ys, zs) = divide z

merge :: (Ord a) =>[a]->[a]->[a]
merge x [] = x
merge [] x = x
merge (x:xs) (y:ys)
 |x < y = x:(merge xs (y:ys))
 |otherwise = y:(merge (x:xs) ys)


--MERGESORTCOMCONTADOR
mergesortcont :: (Ord a) =>[a]->([a], Int)
mergesortcont [] = ([], 0)
mergesortcont [x] = ([x], 0)
mergesortcont xs =  (o, a + b + c)
 where 
 (ys, zs) = dividecont xs
 (m, a) = mergesortcont ys
 (n, b) = mergesortcont zs
 (o, c) = mergecont m n

dividecont :: (Ord a) =>[a]->([a],[a])
dividecont [] = ([],[])
dividecont [x] = ([x], [])
dividecont (x:y:z) = ((x:ys), (y:zs))
 where
 (ys, zs) = dividecont z

mergecont :: (Ord a) =>[a]->[a]->([a], Int)
mergecont x [] = (x, 0)
mergecont [] x = (x, 0)
mergecont (x:xs) (y:ys)
 |x < y = (x:m, a+1)
 |otherwise = (y:n, b+1)
 where
 (m, a) = mergecont xs (y:ys)
 (n, b) = mergecont (x:xs) ys

--O algoritmo de mergesort executou 19075 comparações com a lista l7.
--Comparando todos os algoritmos e suas variações, concluimos que o quicksort com a variação 3 
--e o insertionSort com a variação 1 tiveram o melhor desempenho.



