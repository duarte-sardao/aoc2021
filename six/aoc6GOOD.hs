module Main where

main :: IO ()
main = do
	print (fishSex [1,1,3,5,1,3,2,1,5,3,1,4,4,4,1,1,1,3,1,4,3,1,2,2,2,4,1,1,5,5,4,3,1,1,1,1,1,1,3,4,1,2,2,5,1,3,5,1,3,2,5,2,2,4,1,1,1,4,3,3,3,1,1,1,1,3,1,3,3,4,4,1,1,5,4,2,2,5,4,5,2,5,1,4,2,1,5,5,5,4,3,1,1,4,1,1,3,1,3,4,1,1,2,4,2,1,1,2,3,1,1,1,4,1,3,5,5,5,5,1,2,2,1,3,1,2,5,1,4,4,5,5,4,1,1,3,3,1,5,1,1,4,1,3,3,2,4,2,4,1,5,5,1,2,5,1,5,4,3,1,1,1,5,4,1,1,4,1,2,3,1,3,5,1,1,1,2,4,5,5,5,4,1,4,1,4,1,1,1,1,1,5,2,1,1,1,1,2,3,1,4,5,5,2,4,1,5,1,3,1,4,1,1,1,4,2,3,2,3,1,5,2,1,1,4,2,1,1,5,1,4,1,1,5,5,4,3,5,1,4,3,4,4,5,1,1,1,2,1,1,2,1,1,3,2,4,5,3,5,1,2,2,2,5,1,2,5,3,5,1,1,4,5,2,1,4,1,5,2,1,1,2,5,4,1,3,5,3,1,1,3,1,4,4,2,2,4,3,1,1] 256)

count :: [Int] -> Int -> Int
count l num = length(filter (==num) l)

decomposeSchool :: [Int] -> [Int]
decomposeSchool l = [count l 0] ++ [count l 1] ++ [count l 2] ++ [count l 3] ++ [count l 4] ++ [count l 5] ++ [count l 6] ++ [count l 7] ++ [count l 8] ++ [0]


rotate1 :: [Int] -> [Int]
rotate1 l = tail l ++ [head l]

poopBabies :: [Int] -> [Int]
poopBabies l = (take 6 l) ++ [l!!6 + l!!9] ++ [l!!7] ++ [l!!8 + l!!9] ++ [0] --jank engaged :sunglasses:


breed :: [Int] -> [Int]
breed l = poopBabies (rotate1 l)

breedloop :: [Int] -> Int -> [Int]
breedloop l n | n == 0 = l
			  | otherwise = breedloop (breed l) (n-1)

fishSex :: [Int] -> Int -> Int
fishSex l n = foldr (+) 0 (breedloop (decomposeSchool l) n)