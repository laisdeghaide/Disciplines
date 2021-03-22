--EX06
data Bilhete = Trem Cidade Cidade String | Onibus Cidade Cidade | Aviao Cidade Cidade String deriving(Show)
type Cidade = String
type Viagem = [Bilhete]

p1 = Trem "Uberlandia" "Ribeirao" "Primeira"
p2 = Onibus "Ribeirao" "SP" 
p3 = Aviao "SP" "Lima" "Economica"
p4 :: Viagem
p4 = [p1,p2,p3]
p5 = [p1,p3]

b1 = Onibus "Uberlandia" "SP"
b2 = Aviao "SP" "Paris" "Executiva"
b3 = Trem "Paris" "Londres" "Segunda"
v1 = [b1,b2,b3]

bb1 = Aviao "Uberlandia" "BH" "Executiva"
bb2 = Trem "Ouro Preto" "Mariana" "Segunda"
v2 = [bb1,bb2]

cidadePartida (Trem t1 _ _) = t1
cidadePartida (Onibus o1 _) = o1
cidadePartida (Aviao a1 _ _) = a1 

cidadeDestino (Trem _ t2 _) = t2
cidadeDestino (Onibus _ o2)  = o2
cidadeDestino (Aviao _ a2 _) = a2 


valida :: Viagem->Bool
valida [] = True
valida [x] = True
valida (x:y:z)
 |c1 == c2 = True && valida (y:z)
 |otherwise = False
 where
 c1 = cidadeDestino x
 c2 = cidadePartida y 

--EX07
--a)
data Exp a = Val a -- um numero
 |Add (Exp a) (Exp a) -- soma de duas expressoes
 |Sub (Exp a) (Exp a) -- subtração
 |Neg (Exp a)
 |Mult (Exp a) (Exp a)
 |Div (Exp a) (Exp a)
 deriving (Show)

x :: Exp Float
x = Div (Mult (Add (Val 3) (Val 12)) (Sub (Val 15) (Val 5))) (Neg (Neg (Div (Val 10) (Val 2))))

y :: Exp Float
y = Neg (Mult (Sub (Add (Val 8) (Val 6)) (Add (Val 5) (Val 1))) (Add (Val 2) (Div (Val 6) (Val 2))))

avalia :: (Floating a) => Exp a -> a
avalia (Val x) = x
avalia (Add exp1 exp2) = (avalia exp1) + (avalia exp2)
avalia (Sub exp1 exp2) = (avalia exp1) - (avalia exp2)
avalia (Neg exp1) = - (avalia exp1)
avalia (Mult exp1 exp2) = (avalia exp1) * (avalia exp2)
avalia (Div exp1 exp2) = (avalia exp1) / (avalia exp2)


--EX08
data LL = Latitude Int Int Int |Longitude Int Int Int deriving (Eq)
instance Show LL 
 where
 show (Latitude a b c) = "Lat " ++ show a ++"o " ++ show b ++"'"++ show c ++"''" 
 show (Longitude a b c) = "Lon " ++ show a ++"o " ++ show b ++"'"++ show c ++"''"

type PosicaoLocal = (String, LL, LL)
type Cidades = [PosicaoLocal]

-- Exemplos c1 e c2
c1,c2 :: PosicaoLocal
c1 = ("Brasilia", Latitude (-15) 46 47, Longitude 47 55 47)
c2 = ("Uberlandia", Latitude (-18) 55 07, Longitude 48 16 38)

-- Exemplo de lista
lcidades :: Cidades
lcidades = [("Rio Branco", Latitude 09 58 29, Longitude 67 48 36),("Brasilia", Latitude (-15) 46 47, Longitude 47 55 47),("Torres", Latitude (-29) 20 07, Longitude 49 43 37),("Joao Pessoa", Latitude (-07) 06 54, Longitude 34 51 47),("Uberlandia", Latitude (-18) 55 07, Longitude 48 16 38)]

--a)
extraiLat :: PosicaoLocal->(Cidade, LL)
extraiLat (nome, latitude, _) = (nome, latitude)

extraiLon :: PosicaoLocal->(Cidade, LL)
extraiLon (nome, _, longitude) = (nome, longitude)

--b)
norteDe :: PosicaoLocal->PosicaoLocal->Bool
norteDe (_, (Latitude a b c), _) (_, (Latitude a2 b2 c2), _) = if (comparaLat >= 0) then True
 else False
 where
 comparaLat = l1 - l2
 l1 = transfLL(Latitude a b c)
 l2 = transfLL(Latitude a2 b2 c2)

transfLL :: LL->Int
transfLL (Latitude x y z) = (x * 3600) + (y * 60) + z
transfLL (Longitude x y z) = (x * 3600) + (y * 60) + z

sulDe :: PosicaoLocal->PosicaoLocal->Bool
sulDe x y = not(norteDe x y)

lesteDe :: PosicaoLocal->PosicaoLocal->Bool
lesteDe (_, _, (Longitude a b c)) (_, _, (Longitude a2 b2 c2)) = if (comparaLong >= 0) then True
 else False
 where
 comparaLong = l1 - l2
 l1 = transfLL(Longitude a b c)
 l2 = transfLL(Longitude a2 b2 c2)

oesteDe :: PosicaoLocal->PosicaoLocal->Bool
oesteDe x y  = not(lesteDe x y)


--c
transfLLabaixoEq :: PosicaoLocal->Int
transfLLabaixoEq (_,(Latitude x y z), _) = (x * 3600) + (y * 60) + z

abaixoEq :: Cidades->Int
abaixoEq [] = 0
abaixoEq (x:y)
 |l < 0 = (abaixoEq y + 1)
 |otherwise = abaixoEq y
 where
 l = transfLLabaixoEq x


cidades :: Cidades->Int->Int->Cidades
cidades [] _ _ = []
cidades ((a, b, long):x) long2 long3
 |l1 <= long2 && l1 >= long3 = (a, b, long) : cidades x long2 long3
 |otherwise = cidades x long2 long3
 where 
 l1 = transfLL long
 


--EX09
--a)
data ArvoreBinInt = Nulo | No Int ArvoreBinInt ArvoreBinInt deriving Show

arvEx :: ArvoreBinInt
arvEx =  (No 7 (No 3 (No 1 Nulo Nulo)(No 6 (No 4 Nulo Nulo)(No 6 Nulo Nulo)))(No 10 Nulo (No 14 (No 13 Nulo Nulo)Nulo)))


internos :: ArvoreBinInt->[Int]
internos Nulo = []
internos (No x Nulo Nulo) = []
internos (No x esq dir) = [x] ++ internos esq ++ internos dir
 
--b)
somaNos :: ArvoreBinInt->Int
somaNos Nulo = 0
somaNos (No x Nulo Nulo) = x
somaNos (No x esq dir) = x + somaNos esq + somaNos dir

--c)
pertence :: Int->ArvoreBinInt->Bool
pertence x Nulo = False
pertence x (No y esq dir) = if x == y then True 
 else if x < y then pertence x esq else  pertence x dir

--EX10
data ArvBinEA a = Vazia | Folha a | NoEA (Char, ArvBinEA a, ArvBinEA a) deriving (Show)

ea :: ArvBinEA Float
ea = NoEA ('+', NoEA ('*', Folha 10, Folha 5), Folha 7) 

calcula :: ArvBinEA Float->Float 
calcula (Vazia) = 0
calcula (Folha x) = x
calcula (NoEA (x, esq, dir))
 |[x] == "+" || x == '+' = calcula esq + calcula dir
 |[x] == "-" || x == '-' = calcula esq - calcula dir
 |[x] == "*" || x == '*' = calcula esq * calcula dir
 |otherwise = calcula esq / calcula dir


--EX11
--a)
data ArvBinGen a = NuloGen | NoGen a (ArvBinGen a) (ArvBinGen a) deriving (Eq, Show)
 
arvG1= (NoGen 20 (NoGen 9 (NoGen 6 NuloGen NuloGen)(NoGen 12 (NoGen 10 NuloGen NuloGen)(NoGen 15 NuloGen NuloGen)))(NoGen 25 NuloGen (NoGen 40 (NoGen 30 NuloGen NuloGen) NuloGen)))

removeGen :: Ord a=> a->ArvBinGen a->ArvBinGen a
removeGen val NuloGen = NuloGen
removeGen val (NoGen v esq dir)
 |val < v = NoGen v (removeGen val esq) dir
 |val > v = NoGen v esq (removeGen val dir)
 |esq == NuloGen = dir
 |dir == NuloGen = esq
 |otherwise = juntaGen esq dir

juntaGen :: Ord a => ArvBinGen a->ArvBinGen a->ArvBinGen a
juntaGen esq dir = NoGen maior novaesq dir
 where
 maior = maiorGen esq
 novaesq = removeGen maior esq

maiorGen :: Ord a => ArvBinGen a->a
maiorGen NuloGen = undefined
maiorGen (NoGen x esq dir)
 |dir == NuloGen = x
 |otherwise = maiorGen dir
 

--b)
pertenceGen :: (Ord a) => a->ArvBinGen a->Bool
pertenceGen x NuloGen = False
pertenceGen x (NoGen y esq dir)
 |x == y = True 
 |x < y = pertenceGen x esq 
 |otherwise = pertenceGen x dir
 
 
--EX12
--a)
type NumConta = String
type DataCompra = (Int, Int, Int)
type Valor = Int
type TituloCapit = (NumConta, DataCompra, Valor) 

data ArvTituloCap = NuloTC | NoTC TituloCapit ArvTituloCap ArvTituloCap deriving(Show,Eq)

arvTC :: ArvTituloCap
arvTC = (NoTC ("689232",(25,10,2011), 1000)(NoTC ("546544", (08,11,2011), 1500)(NoTC ("236333", (27,10,2011), 300) NuloTC NuloTC) NuloTC)(NoTC ("975457", (16,11,2011), 1000) NuloTC NuloTC))

insereTCaux :: TituloCapit->ArvTituloCap->ArvTituloCap
insereTCaux x NuloTC = (NoTC x NuloTC NuloTC)
insereTCaux (numConta, dataCompram, valor) (NoTC (x, y, z) esq dir)
 |numConta == x = error "Correntista ja cadastrado"
 |numConta < x = NoTC (x, y, z) (insereTCaux (numConta, dataCompram, valor) esq) dir
 |otherwise = NoTC (x, y, z) esq (insereTCaux (numConta, dataCompram, valor) dir)
 
insereTC :: TituloCapit->ArvTituloCap->ArvTituloCap
insereTC x NuloTC = (NoTC x NuloTC NuloTC)
insereTC (x, y, z) (NoTC w esq dir)
 |z == 300 || z == 500 || z == 1000 || z == 1500 = insereTCaux (x, y, z) (NoTC w esq dir)
 |otherwise = error "Valores invalidos"
 

--b)
posOrdem :: ArvTituloCap->[String]
posOrdem NuloTC = []
posOrdem (NoTC (x, y, z) esq dir) = posOrdem esq ++ posOrdem dir ++ [x]

enesimo :: Int->[String]->String
enesimo 1 (x:y) = x
enesimo 0 (x:y) = x
enesimo x (y:z) = enesimo (x-1) z

sorteio :: Int->[String]->String
sorteio x [] = undefined
sorteio x y = enesimo(mod x (length y)) y

lista = ["689232", "546544", "236333", "975457"]

removeTC :: NumConta->ArvTituloCap->ArvTituloCap
removeTC x NuloTC = NuloTC
removeTC x (NoTC (y,z,w) esq dir)
 |x < y = NoTC (y, z, w) (removeTC x esq) dir
 |x > y = NoTC (y, z, w) esq (removeTC x dir)
 |esq == NuloTC = dir
 |dir == NuloTC = esq
 |otherwise = juntaTC esq dir

juntaTC :: ArvTituloCap->ArvTituloCap->ArvTituloCap
juntaTC esq dir = NoTC (menor, date, valor) esq novadir
 where
 (menor, date, valor) = menorTC dir
 novadir = removeTC menor dir

menorTC :: ArvTituloCap->TituloCapit
menorTC NuloTC = undefined
menorTC (NoTC x esq dir)
 |esq == NuloTC = x
 |otherwise = menorTC esq

sorteioOficial :: Int->[String]->ArvTituloCap
sorteioOficial x y = removeTC (sorteio x y) arvTC




