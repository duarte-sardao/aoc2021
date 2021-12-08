--fish :: [Int] -> Int -> [Int]
--fish school days | days == 0 = school
--                 | otherwise =  fish (breed school) (days-1)
				 
fish :: [Int] -> Int -> [Int]
fish school days | days == 0 = school
                 | otherwise =  fish ((map (reset) x)++ (take (length (filter (<0) x)) (repeat 8))) (days-1)
				 where x = (map (subtract 1) school)
				 
breed :: [Int] -> [Int] --yikes! too slow!! downvote not wholesome 
breed [] = []
breed (x:xs) | x < 0 = [6] ++ (breed xs) ++ [8]
             | otherwise = [x] ++ (breed xs)
			 
breed2 :: [Int] -> [Int] --maybe better? idk
breed2 [] = []
breed2 (x:xs) | newx < 0 = [6] ++ (breed xs) ++ [8]
              | otherwise = [newx] ++ (breed xs)
			  where newx = x - 1
			 
reset :: Int -> Int
reset bad | bad < 0 = 6
        | otherwise = bad
		
set :: Int -> Int
set x = 8

--too slow for 256 so lets think
--theres 1-5 values at the start, so we could do length fish [1] 256, fish[2] 256 and then simply traverse to get the full size tho it still seems quite slow at least its not super exponential just regular
--presumably theres some math formula idfk
--fish [1] 256 == fish [2] 257 etc, well, fish [5] 260 would also do fish[4] 259, fish[3] 258 etc so we could get the 5 vals in an array and assign from there so from 5 256 calcs we go to 1 260

fisharrays :: ([Int], [Int]) -> Int -> ([Int], [Int])
fisharrays (schools, school) days | days == 0 = ([length school], school)
                                  | otherwise =  (pee++[length school], newval)
				                  where
									x = (map (subtract 1) school)
									(pee, newval) = fisharrays ((schools, (map (reset) x)++ (take (length (filter (<0) x))) (repeat 8))) (days-1)
--keep a list of sizes going so in their example, at the end we have [26,22,21,20,20,19,17,15,12,11,10,10,10,10,9,7,6,5,5]
-- we can then take first 5 and acess
fishYugeSize :: [Int] -> Int -> Int
fishYugeSize school days = foldr (+) 0 (map (vals !!) school)
						where
							vals = [0] ++ (take 5 list) --index 0 should never be accessed
							(list, x) = fisharrays ([],[5]) (days+4)
--is it still too slow? i think it crashed LMFAO
--yep it def crashes
--trying without doing the twice map and 1 filter but it seems mostly the same makes sense ig its just more or less n doesnt rlly change o notation idk im defeated!!!