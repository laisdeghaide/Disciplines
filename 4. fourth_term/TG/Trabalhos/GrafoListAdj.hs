module GrafoListAdj
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
    lista_adj,      -- Grafo -> [(Int, [Int])]
    novaAresta,     -- Grafo -> (Int, Int) -> Grafo
    removeAresta    -- Grafo -> (Int, Int) -> Grafo
   ) where

import Data.IntMap.Strict (IntMap)        -- Isto apenas importa o nome do tipo
import qualified Data.IntMap.Strict as IntMap -- Importa tudo, mas com os nomes
                                              -- prefixados com `IntMap`
import Data.List

data Grafo = LsAdj (IntMap [Int])
   deriving (Show,Eq)


-- Cria um grafo com n vértices e arestas `as` usando uma
-- lista de adjacência

novoGrafo :: Int -> [(Int,Int)] -> Grafo
novoGrafo n as = LsAdj (insere vazio as)
   where
      vazio = IntMap.fromList [(i,[]) | i <- [1..n]]
      insere mapa [] = mapa
      insere mapa ((u,v):as)= insere (IntMap.insertWith (++) u [v] novoMapa) as
         where
            novoMapa = IntMap.insertWith (++) v [u] mapa

--- Operações sobre vértices

-- Devolve a lista de vértices
vértices (LsAdj mapa) = IntMap.keys mapa


-- Adiciona um vértice ao grafo
novoVértice (LsAdj mapa) v
   | IntMap.member v mapa =  LsAdj mapa
   | otherwise = LsAdj (IntMap.insert v [] mapa)


-- Remove um vértice do grafo e todas as arestas nele incidentes
removeVértice (LsAdj mapa) v = LsAdj novoMapa
   where
      f mapa k = IntMap.adjust (filter (/= v)) k mapa
      novoMapa = case IntMap.lookup v mapa of
                    Nothing -> mapa
                    Just vizinhos -> IntMap.delete v (foldl f mapa vizinhos)

-- Testa se o vértice u é adjacente ao vértice v
adjacente (LsAdj mapa) u v =
   case IntMap.lookup u mapa of
      Nothing -> False
      Just vz -> elem v vz


-- Grau de um vértice
grau (LsAdj mapa) v =
   case IntMap.lookup v mapa of
      Nothing -> -1
      Just vz -> length vz

-- Devolve a lista de vértices vizinhos ao vértice dado
vizinhos (LsAdj mapa) v = sort (IntMap.findWithDefault [] v mapa)

-- Verifica se um dado vértice está no grafo
pertence (LsAdj mapa) v = IntMap.member v mapa

--- Operações sobre arestas

-- Devolve a lista de adjacência do grafo
lista_adj (LsAdj mapa) = IntMap.assocs mapa

-- Devolve a lista de arestas
arestas (LsAdj mapa) = procuraArestas lista []
   where
      lista = IntMap.assocs mapa
      geraArestas u as [] = as
      geraArestas u as (v:vs)
         | elem (u,v) as || elem (v,u) as = geraArestas u as vs
         | otherwise = geraArestas u ((u,v):as) vs
      procuraArestas [] as = as
      procuraArestas ((v,vz):ls) as =
         procuraArestas ls (geraArestas v as vz)


-- Adiciona uma nova aresta ao grafo. As pontas das arestas já devem existir no
-- grafo
novaAresta (LsAdj mapa) (u,v) = LsAdj (IntMap.insertWith (++) u [v] novoMapa)
   where
      novoMapa = IntMap.insertWith (++) v [u] mapa


-- Remove uma aresta do grafo
removeAresta (LsAdj mapa) (u,v) = LsAdj novoMapa
   where
      mapa' = IntMap.adjust (filter (/= v)) u mapa
      novoMapa = IntMap.adjust (filter (/= u)) v mapa'
