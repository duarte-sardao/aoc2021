dist :: Int -> Int -> Int
dist x y = abs (x - y) --pt1

cooldist :: Int -> Int -> Int
cooldist x y = foldr (+) 0 [0..z] where z = dist x y --pt2

commulativeDist :: [Int] -> Int -> Int
commulativeDist l i = foldr (+) 0 (map (cooldist i) l)

--lets be stupid

getMaxAndCall :: [Int] -> Int
getMaxAndCall l = cumRec l (maximum' l)

maximum' :: Ord a => [a] -> a
maximum' = foldr1 (\x y ->if x >= y then x else y)

minimum' :: Ord a => (a,a) -> a
minimum' (x,y) | x > y = y
			   | otherwise = x

cumRec :: [Int] -> Int -> Int
cumRec l i | i <= 0 = 9999999999999999999999999
		   | otherwise = minimum' (commulativeDist l i, cumRec l (i-1)) --i should go to jail for doing it like this
		   
avg :: [Int] -> Int
avg li = cooldiv (foldr (+) 0 li) (length li)

cooldiv :: Int -> Int -> Int
cooldiv a b = round ((fromIntegral a) / (fromIntegral b))

--taking a guess here but avg is the spot (atleast avg of example is 4.9 and spot is 5 so good assumption to cut time)
--ok fair try back to bruteforcing it like an ape
--i am a barbarian