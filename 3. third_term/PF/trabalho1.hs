--Ex01
triangulo :: Int->Int->Int->String
triangulo x y z 
 |x > y+z || y > x+z || z > x+y = "Nao eh triangulo"
 |x == y && y == z = "Equilatero"
 |x == y || x == z || y == z = "Isosceles"
 |otherwise = "Escaleno"


--Ex02
equacao :: Float->Float->Float->(Float,Float)
equacao a b c
 |(b^2 - 4*a*c) < 0 = error "Raízes negativas!"
 | otherwise = ((-b - sqrt(b^2 - 4*a*c)) / (2*a), (-b + sqrt(b^2 - 4*a*c)) / (2*a))
 

--Ex03
passagem :: Float->Int->Float
passagem x y
 |y >= 60 = 0.6*x
 |y > 2 && y <= 10 = 0.5*x
 |y < 2 = 0.1*x
 |otherwise = x


--Ex04
quatro_a = [n*n | n <- [1..10], even n] --[4,16,36,64,100]
quatro_b = [7 |n <- [1..4]] --[7,7,7,7]
quatro_c = [ (x,y) | x<-[1..3], y<-[4..7]] -- [(1,5),(1,6),(1,7),(2,5),(2,6),(2,7),(3,5),(3,6),(3,7)]
quatro_d = [ (m,n) | m<-[1..3], n<-[1..m]] --[(1,1),(2,1),(2,2),(3,1),(3,2),(3,3)]
quatro_e = [j | i <- [1,-1,2,-2], i>0, j <- [1..i]] --[1,1,2]
quatro_f = [a+b | (a,b) <- [(1,2),(3,4),(5,6)]] --[3,7,11]


--Ex05
conta :: [t]->Int
conta [] = 0
conta (a:x) = 1 + conta x

listaNeg :: [Int]->Int
listaNeg xs = conta [x |x <- xs, x < 0]


--Ex06
distancias :: [(Float,Float)] -> [Float]
distancias l = [sqrt(x^2+y^2) | (x,y)<-l]


--Ex07
divisores x = [y | y <- [1..x], mod x y == 0]
primo x = (divisores x) == [1,x]

primos :: Int->Int->[Int]
primos x y = [z | z <- [x..y], primo z]


--Ex08
disponiveis = [1,2,5,10,20,50,100]
notasTroco :: Int->[[Int]]
notasTroco 0 = [[]]
notasTroco x = [y:z | y <- disponiveis, y <= x, z <- notasTroco (x-y)] 


--Ex09
mdc :: Int->Int-> Int
mdc x y
 | y == 0 = x
 | otherwise = mdc y (mod x y)

mmc2 :: Int->Int->Int
mmc2 x y = div (x*y) (mdc x y)

mmc :: Int->Int->Int->Int
mmc x y z = mmc2 x (mmc2 y z)


--Ex10
soma_cima :: Float->Int->[Float]
soma_cima x y = [(/) x (fromIntegral (z)) | z<-[1..y], even z]

soma_baixo :: Float->Int->[Float]
soma_baixo x y = [(/) (fromIntegral (z)) x | z <-[1..y], not (even z)]

somaTotal :: [Float]->Float
somaTotal [] = 0
somaTotal (h:t) = h + somaTotal t

somaSerie :: Float->Int->Float
somaSerie m n = somaTotal((soma_baixo m n) ++ (soma_cima m n))

--Ex11
verifica :: Int->String
verifica n 
 |mod n 3 == 0 && mod n 5 == 0 = "FizzBuzz"
 |mod n 3 == 0 = "Fizz"
 |mod n 5 == 0 = "Buzz"
 |otherwise = show n

fizzbuzz :: Int->[String]
fizzbuzz n = [verifica y |y <- [1..n]]


--Ex12
conta_ocorrencias :: Int->[Int]->Int
conta_ocorrencias _ [] = 0
conta_ocorrencias x (y:z) = if (x == y) then 1 + (conta_ocorrencias x z)
 else conta_ocorrencias x z


--Ex13
unica_ocorrencia :: Int->[Int]->Bool
unica_ocorrencia _ [] = False
unica_ocorrencia x (y:z) = if (conta_ocorrencias x (y:z) == 1) then True
 else False
 

--Ex14
intercala :: [Int]->[Int]->[Int]
intercala x [] = x
intercala [] x = x
intercala (x:y) (h:t) = x:h : intercala y t


--Ex15
type Nome = String
type Endereco = String 
type Telefone = String
type Email = String
type Contato = (Nome,Endereco,Telefone,Email)
type AgendaTelefonica = [Contato]

recupera :: Telefone->AgendaTelefonica->Nome
recupera x [] = "Telefone desconhecido"
recupera x ((y,_,z,_):t)
 |x == z = y
 |otherwise = recupera x t


--Ex16
type Pessoa = (String, Int, Float, Char)
pessoas :: [Pessoa]
pessoas = [ ("Rosa", 27, 1.66,'F'),("João", 26, 1.85,'M'),("Maria", 67, 1.55,'F'),("Jose", 48, 1.78, 'M'),("Paulo", 24, 1.93, 'M'),("Clara", 38, 1.70,'F'), ("Bob", 12, 1.45, 'M'),("Rosana", 31, 1.58,'F'),("Daniel", 75, 1.74, 'M'),("Jocileide", 21, 1.69,'F') ]

alturaTotal :: [Pessoa]->Float
alturaTotal [] = 0
alturaTotal ((_,_,x,_):y) = x + alturaTotal y

altura_media :: [Pessoa]->Float
altura_media x  =  (alturaTotal x) / (fromIntegral(conta x))

idade :: [Pessoa]->Int
idade [(_,x,_,_)] = x
idade ((a,x,b,c):(d,y,e,f):z) 
 |x <= y = idade ((d,x,e,f):z)
 |otherwise = idade ((d,y,e,f):z)

nome :: [Pessoa]->String
nome [(w,_,_,_)] = w
nome ((a,x,b,c):(d,y,e,f):z) 
 |x <= y = nome ((d,y,e,f):z)
 |otherwise = nome ((a,x,b,c):z)

anos :: [Pessoa]->[Pessoa]
anos [] = []
anos ((a,x,b,c):z)
 |x >= 60 = (a,x,b,c) : anos z
 |otherwise = anos z

qtd :: [Pessoa]->Int
qtd [] = 0
qtd ((a,x,b,c):z)
 |x > 18 = 1 + qtd z
 |otherwise = qtd z


--Ex17
insere_ord :: (Ord t)=>t->[t]->[t]
insere_ord x [] = [x]
insere_ord x (y:z) = if x < y then x:y:z
 else y:(insere_ord x z)

--Ex18
reverte :: [t]->[t]
reverte [] = []
reverte (x:y) = reverte y ++ [x]


--Ex19
exclui :: Eq t =>t->[t]->[t]
exclui x [] = []
exclui x (y:z) = [w | w <- (y:z), w/= x]

sem_repetidos :: Eq t=>[t]->[t]
sem_repetidos [] = []
sem_repetidos (x:y) = [x] ++ sem_repetidos (exclui x y)


--Ex20
vinte_a = (\x -> x + 3) 5  -- 8
vinte_b = (\x -> \y -> x * y + 5) 3 4 --17
vinte_c = (\(x,y) -> x * y^2) (3,4) --48
vinte_d = (\(x,y,_) -> x * y^2) (3,4,2) --48


--Ex21
--USANDO WHERE
conta_maior5 :: [Int]->([Int],Int)
conta_maior5 [] = ([],0)
conta_maior5 (x:y)
 |x > 5 = (x:z, a+1) 
 |otherwise = (z,a)

 where 
 (z,a) = conta_maior5 y

--Ex23
--USANDO LET
conta_maior5let :: [Int]->([Int],Int)
conta_maior5let [] = ([],0) 
conta_maior5let (x:y) =
 let (z,a) = conta_maior5let y in 
 if x > 5 then (x:z, a+1)
 else (z,a)


--Ex22
busca_multN :: [Int]->Int->(Int,Int)
busca_multN [] _ = (-1,0)
busca_multN _ 0 = (0,0)
busca_multN (x:y) a 
 |((mod x a) == 0) = (x,1)
 |otherwise = (z, w+1)
 where
 (z,w) = (busca_multN y a)

--Ex23
--USANDO LET
busca_multNlet :: [Int]->Int->(Int,Int)
busca_multNlet [] _ = (-1,0)
busca_multNlet _ 0 = (0,0)
busca_multNlet (x:y) a =
 let (z,w) = busca_multNlet y a in 
 if mod x a == 0 then (x, 1)
 else (z, w+1)
 

























