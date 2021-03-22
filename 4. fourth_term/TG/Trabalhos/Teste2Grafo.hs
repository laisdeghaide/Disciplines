import Grafo
import GrafoListAdj

--Testes
g1 = novoGrafo 4 [(1,2), (1,3), (1,4), (3,4)]

g2 = novoGrafo 3 [(1,2), (1,3), (2,3)] 

g3 = novoGrafo 4 [(1,2), (1,3), (1,4), (2,3), (2,4), (3,4)]

g4 = novoGrafo 5 [(1,3), (1,2), (1,4), (1,5), (2,3), (2,4), (2,5)]

g5 = novoGrafo 5 [(1,3), (1,4), (1,5), (2,3), (2,4), (2,5)]

g6 = novoGrafo 4 [(1,2), (1,4), (3,4)]

trilhaeuleriana = novoGrafo 7 [(1,2), (1,7), (2,3), (2,6), (2,7), (3,4), (3,5), (3,6), (4,5), (5,6), (5,7), (6,7)]

semieu = novoGrafo 6 [(1,2), (1,5), (1,6), (2,3), (2,4), (2,6), (3,4), (4,5), (4,6), (5,6)]

hal = novoGrafo 6 [(1,2), (1,3), (1,6), (2,3), (2,4), (3,5), (4,5), (4,6), (5,6)]

fec = novoGrafo 6 [(1,2), (1,6), (2,3), (2,4), (3,4), (4,5), (4,6), (5,6)]

--Exemplos de uso

--1) 
--fundeVértices g1 2 3
--LsAdj (fromList [(1,[4,2,2]),(2,[1,4,1]),(4,[1,2])])

--fundeVértices g2 1 2
--LsAdj (fromList [(1,[3,3,1,1]),(3,[1,1])])

--fundeVértices g3 1 2
--(fromList [(1,[4,3,4,3,1,1]),(3,[1,4,1]),(4,[1,3,1])])


--2)
--contraiVértices g1 2 3
--LsAdj (fromList [(1,[4,2]),(2,[1,4]),(4,[1,2])])

--contraiVértices g2 1 2
--LsAdj (fromList [(1,[3,1,1]),(3,[1])])

--contraiVértices g3 1 2
--LsAdj (fromList [(1,[4,3,1,1]),(3,[1,4]),(4,[1,3])])


--3)
--contraiAresta g1 (1,2)
--LsAdj (fromList [(1,[4,3]),(2,[]),(3,[1,4]),(4,[1,3])])

--contraiAresta g2 (1,2)
--LsAdj (fromList [(1,[3]),(2,[]),(3,[1])])

--contraiAresta g3 (1,3)
--LsAdj (fromList [(1,[4,2]),(2,[1,4]),(3,[]),(4,[1,2])])


--4)
--éPasseio g5 [1,3,2,5]
--True

--éPasseio g4 [1,2,3]
--True

--éPasseio g3 [1,4,5]
--False


--5)
--éPasseioAberto g5 [1,3,2,5]
--True

--éPasseioAberto g2 [1,3,2,1]
--False

--éPasseioAberto g3 [1,3,2]
--True


--6)
--éPasseioFechado g5 [1,3,2,5]
--False

--éPasseioFechado g3 [1,3,2]
--False

--éPasseioFechado g2 [1,3,2,1]
--True


--7)
--éTrilha g2 [1,2,3,1]
--True

--éTrilha g3 [1,2,1]
--False

--éTrilha g5 [1,2,4]
--False


--8)
--éCaminho g2 [1,2,3,1]
--False

--éCaminho g3 [1,2,1]
--False

--éCaminho g5 [1,3,2]
--True


--9)
--éCiclo g2 [1,2,3,1]
--True

--éCiclo g5 [1,3,2]
--False

--éCiclo g3 [1,2,1]
--True


--10)
--éGrafoCíclico g3
--False

--éGrafoCíclico g2
--True

--éGrafoCíclico g1
--False


--11)
--éCn g3 2
--False

--éCn g2 3
--True

--éCn g5 5
--False


--12) 
--éGrafoCaminho g3
--True

--éGrafoCaminho semieu
--True

--éGrafoCaminho g4
--False


--13) 
--éPn semieu 6
--True

--éPn g3 4
--True

--éPn g4 5
--False

--14)
--éGrafoBipartido g5 [1,2] [3,4,5]
--True

--éGrafoBipartido g2 [2,1] [3]
--False

--éGrafoBipartido g6 [1,3] [2,4]
--True


--15)
--éTrilhaEuleriana trilhaeuleriana [1,2,3,4,5,7,2,6,3,5,6,7,1]
--True

--éTrilhaEuleriana g2 [1,2,3,1]
--True

--éTrilhaEuleriana g3 [1,2,3,1]
--False


--16)
--éGrafoEuleriano trilhaeuleriana
--True

--éGrafoEuleriano g3
--False

--éGrafoEuleriano g2
--True


--17)
--éSemiEuleriano semieu
--True

--éSemiEuleriano trilhaeuleriana
--False

--éSemiEuleriano g5
--True


--18)
--éHamiltonianoOre hal
--True

--éHamiltonianoOre g5
--False

--éHamiltonianoOre g6
--False


--19)
--éHamiltonianoDirac hal
--True

--éHamiltonianoDirac g5
--True

--éHamiltonianoDirac g6
--False


--20)
--fecho g3
--LsAdj (fromList [(1,[4,3,2]),(2,[4,3,1]),(3,[4,2,1]),(4,[3,2,1])])

--fecho g2
--LsAdj (fromList [(1,[3,2]),(2,[3,1]),(3,[2,1])])

--fecho g4
--LsAdj (fromList [(1,[5,4,2,3]),(2,[5,4,3,1]),(3,[5,4,2,1]),(4,[5,3,2,1]),(5,[4,3,2,1])])


--21)
--buscaGenérica g3
--[1,3,4,2]

--buscaGenérica g4
--[1,3,4,5,2]

--buscaGenérica g5
--[1,4,5,3,2]


--22)
--buscaLargura g1
--[1,2,3,4]

--buscaLargura g6
--[1,2,4,3]

--buscaLargura semieu
--[1,2,5,6,3,4]


--23)
--buscaProfundidade g1
--[1,2,3,4]

--buscaProfundidade g6
--[1,2,4,3]

--buscaProfundidade semieu
--[1,2,3,4,5,6]


--24)
--menorCaminho g1 2 3
--[2,1,3]

-- menorCaminho semieu 5 4
--[5,4]

--menorCaminho g5 4 5
--[4,1,5]


--25)
--distância g1 2 3
--2

--distância semieu 5 4
--1

--distância g5 4 5
--2


--26) DIKSTRA


--27)
--excentricidade g1 3
--2

--excentricidade g2 1
--1

--excentricidade trilhaeuleriana 7
--2


--28)
-- raio g3
--1

--raio g2
--1

--raio g4
--1
