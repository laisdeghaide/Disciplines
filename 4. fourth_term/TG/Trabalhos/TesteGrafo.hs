import Grafo
import GrafoListAdj
  
-- Testes
g1 = novoGrafo 1 []

g2 = novoGrafo 2 []

g3 = novoGrafo 3 [(1,2), (1,3), (2,3)]

g4 = novoGrafo 2 [(1,2)]

g5 = novoGrafo 6 [(1,4), (2,3), (2,4), (3,4), (4,5), (4,6), (5,6)]

g6 = novoGrafo 0 []

-- Exemplos de uso

--1)
-- éTrivial g1
-- True

-- éTrivial g2
-- False

-- éTrivial g3
-- False


--2)
-- éIsolado g2 1
-- True

-- éIsolado g1 1
-- True

-- éIsolado g3 3
-- False


--3)
-- éTerminal g4 1
-- True

-- éTerminal g1 1
-- False

-- éTerminal g3 3
-- False


--4)
-- éPar g3 3
-- True

-- éPar g4 1
-- False

-- éPar g1 1
--True


--5)
-- éImpar g3 3
-- False

-- éImpar g4 1
-- True

-- éImpar g1 1
-- False


--6)
-- seqGraus g3
-- [2,2,2]

-- seqGraus g4
-- [1,1]

-- seqGraus g2
-- [0,0]


--7)
-- grauMax g3
-- 2

-- grauMax g4
-- 1

-- grauMax g2
-- 0


--8)
-- grauMin g3
-- 2

-- grauMin g4
-- 1

-- grauMin g2
-- 0


--9)
-- éRegular g2
-- True

-- éRegular g3
-- True

--éRegular g5
--False


--10)
-- éKRegular g3 2
-- True

-- éKRegular g4 1
-- True

-- éKRegular g5 4
-- False


--11)
-- éVazio g2
-- True

-- éVazio g1
-- True

-- éVazio g5
-- False


--12)
-- éNulo g6
-- True

-- éNulo g1
-- False

-- éNulo g4
--False


--13)
-- éCompleto g4
-- True

-- éCompleto g3
--True

-- éCompleto g5
--False


--14)
-- éKn g4 2
-- True

-- éKn g3 2
-- False

-- éKn g1 1
-- True


--15)
-- grafoCompleto 4
-- LsAdj (fromList [(1,[4,3,2]),(2,[4,3,1]),(3,[4,2,1]),(4,[3,2,1])])

-- grafoCompleto 6
-- LsAdj (fromList [(1,[6,5,4,3,2]),(2,[6,5,4,3,1]),(3,[6,5,4,2,1]),(4,[6,5,3,2,1]),(5,[6,4,3,2,1]),(6,[5,4,3,2,1])])

-- grafoCompleto 2
--LsAdj (fromList [(1,[2]),(2,[1])])


--16)
-- grafoComplemento g3
--LsAdj (fromList [(1,[]),(2,[]),(3,[])])

-- grafoComplemento g5
-- LsAdj (fromList [(1,[6,5,3,2]),(2,[6,5,1]),(3,[6,5,1]),(4,[]),(5,[3,2,1]),(6,[3,2,1])])

-- grafoComplemento g2
-- LsAdj (fromList [(1,[2]),(2,[1])])


--17)
-- éSubgrafo g4 g3
-- True

-- éSubgrafo g3 g3
--True

-- éSubgrafo g3 g5
-- False


--18)
-- éSubgrafoPróprio g4 g3
-- True

-- éSubgrafoPróprio g3 g3
-- False

-- éSubgrafoPróprio g3 g5
--False


--19)
-- éSubgrafoInduzidoVértices g4 g3 [1,2]
--True

-- éSubgrafoInduzidoVértices g1 g3 [1,2]
-- False

-- éSubgrafoInduzidoVértices g3 g5 [1,2]
--False


--20)
-- éSubgrafoInduzidoArestas g4 g5 [(1,2)]
-- False

-- éSubgrafoInduzidoArestas g4 g3 [(1,2)]
-- True

-- éSubgrafoInduzidoArestas g1 g3 [(1,2)]
--False


--21)
-- éClique g4 g3
-- True

-- éClique g2 g3
--False

-- éClique g3 g5
-- False


--22)
-- éCjIndependenteVértices g2 g3
-- True

-- éCjIndependenteVértices g2 g1
--False

-- éCjIndependenteVértices g3 g5
-- False


--23)
-- união g4 g3
--LsAdj (fromList [(1,[3,2]),(2,[3,1]),(3,[1,2])])

-- união g4 g5
--LsAdj (fromList [(1,[4,2]),(2,[4,3,1]),(3,[2,4]),(4,[1,2,3,6,5]),(5,[4,6]),(6,[4,5])])

-- união g2 g3
-- LsAdj (fromList [(1,[3,2]),(2,[1,3]),(3,[1,2])])


--24)
-- interseção g2 g3
-- LsAdj (fromList [(1,[]),(2,[])])

-- interseção g4 g3
-- LsAdj (fromList [(1,[2]),(2,[1])])

-- interseção g4 g5
-- LsAdj (fromList [(1,[]),(2,[])])


--25)
-- soma g3 g5
-- LsAdj (fromList [(1,[6,5,3,2,4]),(2,[3,6,5,1,4]),(3,[2,6,5,1,4]),(4,[1,2,3,6,5]),(5,[3,2,1,4,6]),(6,[3,2,1,4,5])])

-- soma g4 g3
-- LsAdj (fromList [(1,[2,3]),(2,[1,3]),(3,[1,2])])

-- soma g2 g3
-- LsAdj (fromList [(1,[3,2]),(2,[1,3]),(3,[1,2])])