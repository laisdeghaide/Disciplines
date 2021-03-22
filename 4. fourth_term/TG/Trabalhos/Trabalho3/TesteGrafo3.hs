import Grafo
import GrafoListAdj

--Teste
g = novoGrafo 4 [(1,2),(1,4),(2,3),(3,4)]

estrela = novoGrafo 4 [(1,2),(1,3),(1,4)]

iso = novoGrafo 3 []

binaria = novoGrafo 9 [(1,2),(1,3),(2,4),(3,5),(3,6),(4,7),(5,8),(5,9)]

estrita = novoGrafo 3 [(1,2), (1,3)]


--Exemplos de uso

--1)
--éDisjuntoVértices g [1,2,3] [3,4]
--True

--éDisjuntoVértices estrela [1,2] [1,2]
--False

--éDisjuntoVértices binaria [1,2,4,7] [3,5,8,9]
--False

--éDisjuntoVértices binaria [1,2,4,7] [3,5,8]
--True


--2)
--éEstrela g
--False

--éEstrela estrela
--True

--éEstrela binaria
--False

--éEstrela estrita
--True


--3)
--éFolha g 1
--False

--éFolha estrela 1
--False

--éFolha estrela 4
--True

--éFolha estrita 3
--True


--4)
--éBinária g
--False

--éBinária binaria
--True

--éBinária estrita
--True

--éBinária iso
--False


--5)
--éBináriaEstrita estrita
--True

--éBináriaEstrita binaria
--False

--éBináriaEstrita g
--False

--éBináriaEstrita estrela
--False


--6)
--éÁrvM_ária estrita 2
--True

--éÁrvM_ária binaria 1
--False

--éÁrvM_ária binaria 2
--True

--éÁrvM_ária g 3
--False


--7)
--codPrufer estrita
--[1,1]

--codPrufer binaria
--[3,4,2,1,3,5,5,5]

--codPrufer estrela
--[1,1,1]

--codPrufer g
--[]


--8)
--decodPrufer [3,4,2,1,3,5,5,5]
--LsAdj (fromList [(1,[3,2]),(2,[1,4]),(3,[5,1,6]),(4,[2,7]),(5,[10,9,8,3]),(6,[3]),(7,[4]),(8,[5]),(9,[5]),(10,[5])])

--decodPrufer [1,1,1]
--LsAdj (fromList [(1,[5,4,3,2]),(2,[1]),(3,[1]),(4,[1]),(5,[1])])

--decodPrufer [1,1,2]
--LsAdj (fromList [(1,[2,4,3]),(2,[5,1]),(3,[1]),(4,[1]),(5,[2])])

--decodPrufer [1,1,2,2,3]
--LsAdj (fromList [(1,[2,5,4]),(2,[3,6,1]),(3,[7,2]),(4,[1]),(5,[1]),(6,[2]),(7,[3])])


--9)
--éSeqVálida [3,4,2,1,3,5,5,5]
--False

--éSeqVálida [1,1,1]
--False

--éSeqVálida [1,1]
--True

--éSeqVálida [1,1,3,3,2]
--False

--éSeqVálida [1,1,1,1,2,3,3]
--True


--10)
--numÁrvoresRot [1,1,1,1,2,3,3]
--30

--numÁrvoresRot [1,1,1,1,2]
--6

--numÁrvoresRot [1,1,3,3,4]
--0

--numÁrvoresRot [3,4,2,1,3,5,5,5]
--0


--11)
--coberturaVértices g
--[3,4,1,2]

--coberturaVértices estrita
--[1,2]

--coberturaVértices binaria
--[5,8,4,7,3,6,1,2]

--coberturaVértices iso
--[]


