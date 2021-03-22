data Tree a = Tree [a] [(a, a)]
               deriving Show

prufer :: Tree Int -> [Int]
prufer tree = 
    prufer' tree []
    where prufer' t s | size t <= 2     = []
                      | otherwise       =
                          let j         = minimum (leaves t) 
                              k         = adjacent t j 
                              new_t     = rm t j 
                              new_s     = s ++ [j] in
                          [k] ++ prufer' new_t new_s

unprufer :: [Int] -> Tree Int
unprufer list = 
    let n = length list + 2 in
    Tree [1..n] (unprufer' list [1..n])
    where unprufer' [] (x:y:[]) = [(x, y)]
          unprufer' c l = 
              let i = minimum (filter (\y -> not (elem y c)) l) 
                  j = head c in
              [(i, j)] ++ unprufer' (tail c) (filter (/= i) l)

size :: Tree a -> Int
size (Tree a _) = length a

rm :: (Eq a) => Tree a -> a -> Tree a
rm (Tree a x) n =
    Tree (filter (/= n) a) (filter (not . contains n) x)

degree :: (Eq a) => Tree a -> a -> Int
degree (Tree a x) n = 
    foldr (+) 0 (map (\y -> if contains n y then 1 else 0) x)

leaves :: (Eq a) => Tree a -> [a]
leaves (Tree a x) = 
    filter (\y -> degree (Tree a x) y == 1) a

adjacent :: (Eq a) => Tree a -> a -> a
adjacent (Tree a x) n = 
    let pair = head (filter (contains n) x) in
    if fst pair == n
    then snd pair
    else fst pair

contains :: (Eq a) => a -> (a, a) -> Bool
contains x (y, z) = 
    x == y || x == z

test :: Tree Int
test = Tree [1,2,3,4,5,6] [(1,5),(3,5),(2,5),(5,4),(4,6)]