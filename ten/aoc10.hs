import Data.List

data Stack a = Stk [a] deriving Show -- implementação usando listas

getWordsFromFile :: String -> IO [String]
getWordsFromFile file = readFile file >>= return . words

main = do
  wordList <- getWordsFromFile "aoc10input.txt"
  mapM_ putStrLn wordList
  print(valueContest wordList)
  print(fixContest wordList)

push :: a -> Stack a -> Stack a
push x (Stk xs) = Stk (x:xs)

pop :: Stack a -> Stack a
pop (Stk (_:xs)) = Stk xs
pop _ = error "Stack.pop: empty stack"

top :: Stack a -> a
top (Stk (x:_)) = x
top _ = error "Stack.top: empty stack"

empty :: Stack a
empty = Stk []

isEmpty :: Stack a -> Bool
isEmpty (Stk [])= True
isEmpty (Stk _) = False

toString :: Stack Char -> String
toString (Stk xs) = xs

fixContest :: [String] -> Int
fixContest li = head (drop (div (length newl) 2) newl) where newl = sort (filter (>0) (map fixScore li)) --this line is so cool haskell is based


fixScore :: String -> Int
fixScore str | not (isEmpty sta) && nstr == "" = completionToScore sta
             | otherwise = 0
		     where (nstr, sta) = decompose (str, empty)

completionToScore :: Stack Char -> Int --fold my beloved
completionToScore st = foldl (\n r->n*5+r) 0 (map inverse (toString st))

inverse :: Char -> Int --we rlly dont care about inverse thing just its value
inverse ch | ch == '{' = 3
           | ch == '(' = 1
           | ch == '[' = 2
           | ch == '<' = 4

valueContest :: [String] -> Int
valueContest list = foldr (+) 0 (map getVal list)

getVal :: String -> Int
getVal str | not (isEmpty sta) && not (nstr == "") = cashOut (head nstr)
           | otherwise = 0
		   where (nstr, sta) = decompose (str, empty)
		   
cashOut :: Char -> Int
cashOut ch | ch == '>' = 25137
           | ch == '}' = 1197
           | ch == ']' = 57
           | ch == ')' = 3

decompose :: (String, Stack Char) -> (String, Stack Char) --both empty - good, string empty - incomplete, stack empty - bad sign
decompose ([],s) = ([],s)
decompose ((x:xs),s) | x == '(' || x == '{' || x == '[' || x == '<' = decompose (xs,(push x s))
                       | isEmpty s = ([x]++xs, s)
                       | x == ')' && top s == '(' = decompose (xs,pop s)
                       | x == '}' && top s == '{' = decompose (xs,pop s)
                       | x == ']' && top s == '[' = decompose (xs,pop s)
				       | x == '>' && top s == '<' = decompose (xs,pop s)
				       | otherwise = ([x]++xs, s)
				   
