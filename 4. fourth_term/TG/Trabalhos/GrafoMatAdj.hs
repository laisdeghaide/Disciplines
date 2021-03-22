module GrafoMatAdj
   (Grafo,
    novoGrafo,      -- Int -> [(Int, Int)] -> Grafo
    vértices,       -- Grafo -> [Int]
    novoVértice,    -- Grafo -> Int -> Grafo
    removeVértice,  -- Grafo -> Int -> Grafo
    adjacente,      -- Grafo -> Int -> Int -> Bool
    grau,           -- Grafo -> Int -> Int
    vizinhos,       -- Grafo -> Int -> [Int]
    pertence,       -- Grafo -> Int -> Bool
    arestas,        -- Grafo -> [(Int, Int)]
    matriz_adj,     -- Grafo -> Matriz Int
    novaAresta,     -- Grafo -> (Int, Int) -> Grafo
    removeAresta    -- Grafo -> (Int, Int) -> Grafo
   ) where

import Control.Monad
import Control.Monad.ST
import Data.Array.ST
import Data.Array.Unboxed
import Data.List


type Matriz e = UArray (Int, Int) e

data Grafo = GrAdj [Int] (Matriz Int)
   deriving Show

-- Cria um grafo com n vértices e arestas `as` usando uma
-- matriz de adjacência

novoGrafo ::  Int -> [(Int, Int)] -> Grafo
novoGrafo n as = GrAdj [1 .. n] matriz
 where
    matriz = runSTUArray $ do
       m <- newArray ((1, 1), (n, n)) 0
       forM_ as $ \(i,j) -> do
          writeArray m (i,j) 1
          writeArray m (j,i) 1
       return m

--- Operações sobre vértices

-- Devolve a lista de vértices
vértices (GrAdj vs as) = vs

-- Adiciona um vértice ao grafo
novoVértice (GrAdj vs as) v
   | v <= n   = GrAdj (adiciona v vs) as
   | v == n+1 = GrAdj (adiciona v vs) as'
   | otherwise = error "O vértice é maior que o número de vértices atual mais um"
   where
      n = (fst . snd . bounds) as
      as' = runSTUArray $ do
         m <- newArray ((1, 1), (v, v)) 0
         forM_ [1..n] $ \i -> do
            forM_ [i..n] $ \j -> do
               let e = as ! (i,j)
               writeArray m (i,j) e
               writeArray m (j,i) e
         return m

-- Remove um vértice do grafo e todas as arestas nele incidentes
removeVértice (GrAdj vs as) v = GrAdj vs' as'
   where
      n = (fst . snd . bounds) as
      vs' = filter (/= v) vs
      as' = runSTUArray $ do
         stM <- thaw as
         forM_ [1..n] $ \i -> do
            writeArray stM (v,i) 0
            writeArray stM (i,v) 0
         return stM


-- Testa se o vértice u é adjacente ao vértice v
adjacente (GrAdj vs as) u v = as!(u,v) /= 0

-- Grau de um vértice
grau (GrAdj vs as) v = sum [as ! (v,j) | j <- [1 .. n] ]
   where
      n = (fst . snd . bounds) as

-- Devolve a lista de vértices vizinhos ao vértice dado
vizinhos (GrAdj vs as) v = [ j | j <- [1 .. n],  as ! (v,j) /= 0]
   where
      n = (fst . snd . bounds) as


-- Verifica se um dado vértice está no grafo
pertence (GrAdj vs as) v = elem v vs


--- Operações sobre arestas

-- Devolve a matriz de adjacência do grafo
matriz_adj (GrAdj vs as) = as

-- Devolve a lista de arestas
arestas (GrAdj vs as) = arestas 1 1 []
   where
      n = (fst . snd . bounds) as
      arestas i j acc | i > n = acc
                      | j > n = arestas (i+1) (i+1) acc
                      | otherwise = let paralelas = replicate (as!(i,j)) (i,j)
                                    in arestas i (j+1) (paralelas ++ acc)

-- Adiciona uma nova aresta ao grafo. As pontas das arestas já devem existir no
-- grafo
novaAresta (GrAdj vs as) (u,v) = GrAdj vs as'
   where
      as' = runSTUArray $ do
         stM <- thaw as
         writeArray stM (u,v) 1
         writeArray stM (v,u) 1
         return stM


-- Remove uma aresta do grafo
removeAresta (GrAdj vs as) (u,v) = GrAdj vs as'
   where
      as' = runSTUArray $ do
         stM <- thaw as
         writeArray stM (u,v) 0
         writeArray stM (v,u) 0
         return stM


-- Funções auxiliares
adiciona x xs =
   if elem x xs
   then xs
   else sort (x:xs)
