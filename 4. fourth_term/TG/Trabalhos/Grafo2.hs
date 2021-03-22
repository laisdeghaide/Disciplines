import Grafo
import GrafoListAdj
import Data.List 

g = novoGrafo 4 [(1,2),(2,3),(3,4)]
estrela = novoGrafo 4 [(1,2),(1,3),(1,4)]

--1)

--Função que forma as arestas a partir dos vértices dados
formaAresta [] = []
formaAresta [_] = []
formaAresta (x:y:t) = [(x, y)] ++ formaAresta (y:t) 

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
semExtremidade :: [a] -> [a]
semExtremidade [] = []
semExtremidade [h] = []
semExtremidade t = tail (init t)

ultimo :: [a] -> a
ultimo = foldr1 (\_ a -> a)




