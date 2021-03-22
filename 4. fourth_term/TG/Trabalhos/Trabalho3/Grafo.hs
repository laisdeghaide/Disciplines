module Grafo
   (Grafo,
    éTrivial,      
    éIsolado,       
    éTerminal,    
    éPar,  
    éImpar,      
    seqGraus,          
    grauMax,       
    grauMin,       
    éRegular,        
    éKRegular,      
    éVazio,     
    éNulo,
    éCompleto,
    éKn,
    grafoCompleto,
    grafoComplemento,
    éSubgrafo,
    éSubgrafoPróprio,
    éSubgrafoInduzidoVértices,
    éSubgrafoInduzidoArestas,
    éClique,
    éCjIndependenteVértices,
    união,
    interseção,
    soma,
    fundeVértices,
    contraiVértices,
    contraiAresta,
    éPasseio,
    éPasseioAberto,
    éPasseioFechado,
    éTrilha,
    éCaminho,
    éCiclo,
    éGrafoCíclico,
    éCn,
    éGrafoCaminho,
    éPn,
    éGrafoBipartido,
    éTrilhaEuleriana,
    éGrafoEuleriano,
    éSemiEuleriano,
    éHamiltonianoOre,
    éHamiltonianoDirac,
    fecho,
    buscaGenérica,
    buscaLargura,
    buscaProfundidade,
    menorCaminho,
    distância,
    excentricidade,
    raio,
    éDisjuntoVértices, 
    éEstrela,
    éFolha,
    éBinária,
    éBináriaEstrita,
    éÁrvM_ária,
    codPrufer,
    decodPrufer,
    éSeqVálida,
    numÁrvoresRot,
    coberturaVértices
   ) where

import GrafoListAdj
import Data.List 


-- Exercícios
--1)
éTrivial g = length(vértices g) == 1
 
--2)
éIsolado g v = (vizinhos g v) == []

--3)
éTerminal g v = length(vizinhos g v) == 1

--4)
éPar g v = mod (length(vizinhos g v)) 2 == 0

--5) 
éImpar g v = mod (length(vizinhos g v)) 2 /= 0 

--6)
seqGraus g = (sort [length(vizinhos g v)| v <- (vértices g)])

--7)
grauMax g = maximum(seqGraus g)

--8)
grauMin g = head(seqGraus g)

--9)
iguais :: (Eq a) => [a] -> Bool
iguais xs = and $ map (== head xs) (tail xs)

éRegular g = iguais (seqGraus g)

--10)
éKRegular g k = iguais (seqGraus g) && head(seqGraus g) == k

--11)
éVazio g = length(vértices g) > 0 && length(arestas g) == 0

--12)
éNulo g = length(vértices g) == 0

--13)
éCompleto g = iguais (seqGraus g) && (head(seqGraus g) == (length(vértices g) - 1))
 
--14)
éKn g n = iguais (seqGraus g) && (head(seqGraus g) == (length(vértices g) - 1)) && (length(vértices g) == n)
 
--15)
aresta :: Int -> [(Int,Int)]
aresta 0 = []
aresta n = [(a1, a2) | a1 <- [1..n], a2 <- [a1..n], a1 /= a2]

grafoCompleto n = novoGrafo n (aresta n)

--16)
aresta2 :: Int -> Grafo -> [(Int,Int)]
aresta2 0 g = []
aresta2 n g = [(a1, a2) | a1 <- [1..n], a2 <- [a1..n], a1 /= a2, not (adjacente g a1 a2)]

grafoComplemento g = novoGrafo (length(vértices g)) (aresta2 (length(vértices g)) g)

--17)
éSubgrafo h g = pert && adj
 where
 pert = foldr (&&) True [pertence g v | v <- vértices h]
 adj = foldr (&&) True [adjacente g x y | (x,y) <- arestas h]

--18) 
éSubgrafoPróprio h g = sub && tam
 where
 sub = éSubgrafo h g 
 tam = length(arestas h) <= length(arestas g) && length(vértices h) < length(vértices g)
 
--19)
éSubgrafoInduzidoVértices h g vh = sub && pert && adj
 where 
 sub = (éSubgrafo h g) 
 pert = (foldr (&&) True [pertence g v | v <- vh]) 
 adj = (foldr (&&) True [adjacente h v1 v2 | v1 <- vh, v2 <- vh, adjacente g v1 v2])

--20) 
éSubgrafoInduzidoArestas h g ah = sub && adj && pert
 where 
 sub = éSubgrafo h g 
 adj = (foldr (&&) True [adjacente g a1 a2 | (a1, a2) <- ah])
 pert = (foldr (&&) True [(pertence h v1) && (pertence h v2)| (v1, v2) <- ah, pertence g v1, pertence g v2])

--21)
éClique h g = (éSubgrafo h g) && (éCompleto h)
 
--22)
éCjIndependenteVértices h g = (éSubgrafo h g) && (éVazio h)

--23)
união h g = novoGrafo v a
 where 
 v = max (maximum(vértices g)) (maximum(vértices h))
 a = union (arestas h) (arestas g)

--24)
interseção g h = novoGrafo v a 
 where 
 v = min (maximum(vértices g)) (maximum(vértices h))
 a = intersect (arestas h) (arestas g)

--25) 
ad (x, y) (w, z) = ((x, y) /= (w, z)) && ((x, y) /= (z, w))

removeRepetidos [] = []
removeRepetidos (x:xs) = x:(removeRepetidos (filter (ad x) xs))

soma h g = novoGrafo v (union (union (union soEmG soEmH) nemHnemG) (intersect (arestas g) (arestas h)))
 where 
 u = união h g
 vg = vértices g
 vh = vértices h
 v = length(union vg vh) 
 soEmG = [(a1, a2) | (a1, a2) <- arestas g, not (adjacente h a1 a2)]
 soEmH = [(a1, a2) | (a1, a2) <- arestas h, not (adjacente g a1 a2)]
 nemHnemG = removeRepetidos ([(a1, a2) | a1 <- vh, a2 <- vg, a1 /= a2, not(adjacente u a1 a2)])
 
 
------------------------------------------------------------------------------------------------------
--                                 PARTE 2

--1)
fundeVértices g v w = removeVértice (novoGrafo ve (a++arFilt)) maximo
 where
 ve = length(vértices g) - 1
 minimo = min v w
 maximo = max v w
 a = [(a1, minimo) | a1 <- vizinhos g maximo]
 ar = [(a1, a2) | (a1, a2) <- arestas g]
 arFilt = filter (\(x,y) -> x /= maximo && y /= maximo) ar


--2)
contraiVértices g v w = removeVértice (novoGrafo ve fusão) (max v w)
 where 
 fusão = arestas (fundeVértices g v w)
 ve = length(vértices g) - 1
 
 
--3)
contraiAresta g (v,w) = novoGrafo ve fusão
 where
 arestaRemovida = removeAresta g (v,w)
 fusão = arestas (fundeVértices arestaRemovida v w)
 ve = length(vértices g) - 1
 
 
--4)
--função que checa se todos os vértices são adjacentes
checa g [x] = True
checa g [] = True
checa g (x:y:t)  
 |not (adjacente g x y) = False
 |otherwise = checa g (y:t)

éPasseio g vs = checa g vs


--5)
ultimo :: [a] -> a
ultimo = foldr1 (\_ a -> a)

éPasseioAberto g vs = (éPasseio g vs) && head(vs) /= ultimo(vs)
 
 
--6)
éPasseioFechado g vs = (éPasseio g vs) && head(vs) == ultimo(vs)

 
--7)
--função que forma as arestas a partir dos vértices, unidos dois a dois sequencialmente
formaAresta [] = []
formaAresta [_] = []
formaAresta (x:y:t) = [(x, y)] ++ formaAresta (y:t) 

--função que checa se as arestas são diferentes
arestasDiferentes :: [(Int, Int)] -> Bool
arestasDiferentes [] = True
arestasDiferentes [_] = True
arestasDiferentes ((x, h):t) 
 |elem (x, h) t || elem (h, x) t = False
 |otherwise = arestasDiferentes t


éTrilha g vs = (éPasseio g vs) && a
 where 
 a = arestasDiferentes (formaAresta vs)
 

--8)
--Função que checa se todos os vértices são diferentes
verticesDiferentes :: [Int] -> Bool
verticesDiferentes [] = True
verticesDiferentes [_] = True
verticesDiferentes (h:t) 
 |elem h t = False
 |otherwise = verticesDiferentes t

éCaminho g vs = (éTrilha g vs) && (verticesDiferentes vs)
 
 
--9)
--Função que retira as extremidades 
semExtremidade :: [a] -> [a]
semExtremidade [] = []
semExtremidade [h] = []
semExtremidade t = tail (init t)

éCiclo g vs = (éTrilha g s) && extremosIguais
 where 
 extremosIguais = (head(vs) == ultimo(vs))
 s = semExtremidade vs
 
 
--10)
éGrafoCíclico c = éKRegular c 2
 
 
--11)
éCn g n = (éGrafoCíclico g) && length(vértices g) == n
 
 
--12) 
éGrafoCaminho g = éCaminho g (vértices g)


--13) 
éPn p n = (éGrafoCaminho p) && length(vértices p) == n
 
 
--14)
--função que forma todas as possiveis arestas a partir dos vértices
formaArestasPossiveis [] = []
formaArestasPossiveis [_] = []
formaArestasPossiveis (x:y:t) = [(x, y)] ++ formaArestasPossiveis (x:t) ++ formaArestasPossiveis (y:t) 

éGrafoBipartido g v1 v2 = adj && (naoadj v1) || (naoadj v2)
 where
 adj = foldr (&&) True [adjacente g x y | x <- v1, y <- v2]
 naoadj v = foldr (&&) True [not (adjacente g x y) | (x, y) <- (formaArestasPossiveis v)]
 
 
--15)
--será trilha euleriana se for trilha e todas as arestas do grafo participarem
éTrilhaEuleriana g t = (éTrilha g t) && (foldr (&&) True trilha) && (length(trilha) == length (arestas g))
 where
 trilha = [adjacente g x y | (x, y) <- (formaAresta t)]


--16)
éGrafoEuleriano g = par
 where
 par = foldr (&&) True [even x | x <- seqGraus g]


--17)
contaImpar  [] = 0
contaImpar  (x:y)
 |odd x == True = 1 + (contaImpar y)
 |otherwise = contaImpar y

éSemiEuleriano g = contaImpar (seqGraus g) == 2


--18)
éHamiltonianoOre g = qtdvertice >= 3 && soma
 where 
 qtdvertice = length(vértices g)
 naoAdj = removeRepetidos[(v,w) | v <- vértices g, w <- vértices g, v /= w, not(adjacente g v w)]
 soma = foldr (&&) True [(length(vizinhos g v) + length(vizinhos g w)) >= qtdvertice | (v,w) <-naoAdj]


--19)
éHamiltonianoDirac g = qtdvertice >= 3 && grau
 where
 qtdvertice = length(vértices g)
 grau = foldr (&&) True [length(vizinhos g v) >= (div qtdvertice 2) | v <- vértices g]


--20)
--função que retorna a lista de arestas para serem inseridas no fecho
naoAdjacentes g = removeRepetidos[(v,w) | v <- vértices g, w <- vértices g, v /= w, not(adjacente g v w)]

--função que insere as arestas que faltam para formar o fecho
recebe [] g = g
recebe (na:t) g = recebe t (novaAresta g na)

fecho g 
 |éCompleto g = g 
 |otherwise = recebe (naoAdjacentes g) g


--21)
--Função auxiliar que faz toda a recursão marcando os vértices como visitados e retornando a ordem da busca
busca g visitados [] = visitados
busca g visitados (x:y) = busca g novosVisitados fila
 where
 fila = [adj | adj <- vizinhos g x, not (elem adj visitados)] 
 novosVisitados = if not (elem x visitados) then visitados ++ y ++ [x]  
 else visitados

buscaGenérica g = busca g [head (vértices g)] [head (vértices g)] 


--22)
--Função auxiliar que faz toda a recursão marcando os vértices como visitados e retornando a ordem da busca
bfs g visitados [] = visitados
bfs g visitados (x:y) = bfs g novosVisitados fila
 where
 fila = y ++ [adj | adj <- vizinhos g x, not (elem adj visitados)]
 novosVisitados = if not (elem x visitados) then visitados ++ [x] 
 else visitados

buscaLargura g = bfs g [head (vértices g)] [head (vértices g)] 


--23)
--Função auxiliar que faz toda a recursão marcando os vértices como visitados e retornando a ordem da busca
dfs g visitados [] = visitados
dfs g visitados (x:y) = dfs g novosVisitados pilha
 where
 pilha = [adj | adj <- vizinhos g x, not (elem adj visitados)] ++ y
 novosVisitados = if not (elem x visitados) then visitados ++ [x] 
 else visitados

buscaProfundidade g = dfs g [head (vértices g)] [head (vértices g)] 


--24)
bfsMC g menorCaminho [] v = menorCaminho 
bfsMC g menorCaminho (x:y) v 
 |x == v = menorCaminho ++ [v]
 |otherwise = bfsMC g novosVisitados fila v
  where
  fila = y ++ [adj | adj <- vizinhos g x, not (elem adj menorCaminho)]
  novosVisitados = if not (elem x menorCaminho) && (adjacente g x v) && (checa g v menorCaminho) then menorCaminho ++ [x] 
  else menorCaminho
   where 
   checa g x [] = True
   checa g x (y:z) = if (adjacente g x y) then False
   else checa g x z

menorCaminho g u v = bfsMC g [u] [u] v

--25)
distância g u v = length(menorCaminho g u v) - 1


--27)
excentricidade g v =  maximum (map (distância g v) [x | x <- vértices g, x /= v && (elem x (vértices g))])

--28)
minElem g [] = 0
minElem g [x] = x
minElem g (x:y:xs) 
 |(excentricidade g x) > (excentricidade g y) = minElem g (y:xs)
 |(excentricidade g x) < (excentricidade g y) = minElem g (x:xs)
 |(excentricidade g x) == (excentricidade g y) = minElem g (x:xs)

raio g = minElem g (vértices g)

---------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------- 		
--					 			PARTE 3

--1)
--checa se alguma tupla de c1 é igual a c2
checaDiferentes a [] = True
checaDiferentes a (x:xs) = if a == x then False else checaDiferentes a xs

--checa se c1 é disjunto de c2
checaDisjunção [] _ = True
checaDisjunção _ [] = False
checaDisjunção (x:xs) y = if not (checaDiferentes x y) then False else checaDisjunção xs y

éDisjuntoVértices g c1 c2 = (éSubgrafo (h c1) g) && (éSubgrafo (h c2) g) && éDisjunto
 where
 criaArestas c = [(x, y) | (x, y) <- (formaAresta c)]
 h c = novoGrafo (length (criaArestas c)) (criaArestas c)
 éDisjunto = checaDisjunção (criaArestas c1) (criaArestas c2)


--2)
éEstrela g = primeiro && meio && n
 where
 n = (ultimo (seqGraus g)) == (length (vértices g) - 1)
 primeiro = head(seqGraus g) == 1
 meio = foldr (&&) True (map (== 1) (semExtremidade(seqGraus g)))


--3) 
éFolha g v = length(vizinhos g v) <= 1


--4)
--Função que checa se não é/não contém circuito
nãoéCircuito g visitados [] = True
nãoéCircuito g visitados (x:y) 
 |(elem x visitados) = False
 |otherwise = nãoéCircuito g novosVisitados pilha
  where
  pilha = [adj | adj <- vizinhos g x, not (elem adj visitados)] ++ y
  novosVisitados = visitados ++ [x]

--Função que retorna graus sem estar odernado
graus t = [length(vizinhos t v)| v <- (vértices t)]

--Função que checa se é árvore
éArvore t = éConexo && (nãoéCircuito t [] [head(vértices t)])
 where
 éConexo = foldr (&&) True [not(éIsolado t v) | v <- vértices t] 
 

éBinária t = éArvore t && sequencia
 where
 ult = (ultimo (graus t)) == 1
 primeiro = head((graus t)) == 2
 meio = foldr (&&) True (map (<= 3) (semExtremidade(graus t)))
 sequencia = primeiro && ult && meio
 
 
--5)
estrito g visitados [] = True
estrito g visitados (x:y)
 |((checa_vizinhos) == False) = False
 |otherwise = estrito g novosVisitados fila
 where
 filhos = [adj | adj <- vizinhos g x, not (elem adj visitados)]
 tamanho = length(filhos)
 checa_vizinhos = (tamanho == 0 || tamanho == 2) 
 fila = filhos ++ y
 novosVisitados = if not (elem x visitados) then visitados ++ [x]  
 else visitados

éBináriaEstrita t = (éArvore t) && (estrito t [] [head(vértices t)])


--6)
m_aria m g visitados [] = True
m_aria m g visitados (x:y)
 |((checa_vizinhos) == False) = False
 |otherwise = m_aria m g novosVisitados fila
 where
 filhos = [adj | adj <- vizinhos g x, not (elem adj visitados)]
 tamanho = length(filhos)
 checa_vizinhos = (tamanho <= m) 
 fila = filhos ++ y
 novosVisitados = if not (elem x visitados) then visitados ++ [x]  
 else visitados

éÁrvM_ária t m = (éArvore t) && (m_aria m t [head(vértices t)] [head(vértices t)])


--7)
--Função que retorna as folhas de uma árvore
folhas g = [v | v <- (vértices g), (length(vizinhos g v) == 1)]

codPrufer t = prufer t [] 
 where 
 prufer t lista 
  |not(éArvore t) = []
  |(length(vértices t) == 2) = [head(vértices t)] ++ []
  |otherwise = k ++ (prufer novo_g nova_lista)
   where
   j = minimum(folhas t)
   k = (vizinhos t j)
   novo_g = (removeVértice t j)
   nova_lista = (lista ++ [j])


--8)
decodPrufer c =
 let n = length(c) + 2 in novoGrafo n (decod c [1..n])
 where
 decod [] (x:xs:[]) = [(x,xs)]
 decod v l = 
  let 
  i = minimum(filter (\y -> not(elem y v)) l)
  j = head(v) in [(i,j)] ++ decod (tail v) (filter (/= i) l)


--9)
éSeqVálida s = (sum s) == (2*(length s) - 2)


--10)
--Função que calcula fatorial
fatorial 0 = 1
fatorial n = fatorial (n - 1) * n

--Função que calcula fatorial do divisor
fatorial_baixo [x] = fatorial (x-1)
fatorial_baixo (x:xs) =  (fatorial (x-1)) * (fatorial_baixo xs)

--Função que calcula fatorial do dividendo
fatorial_cima x = fatorial (x-2)

numÁrvoresRot s = div (fatorial_cima (length s)) (fatorial_baixo s)


--11)
cobertura g [] = []
cobertura g ((x,y):xs) = [x,y] ++ (cobertura novo_g nova_a) 
 where 
 g_semX = (removeVértice g x)
 novo_g = (removeVértice g_semX y)
 nova_a = (arestas novo_g)

coberturaVértices g = (cobertura g (arestas g))
