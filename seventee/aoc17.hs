--targ x 241-275, targ y -75..-49

moveY :: (Int, Int) -> (Int, Int)
moveY (pos, speed) = (pos+speed, speed-1)

checkYRange :: (Int, Int) -> Bool
checkYRange (pos, speed) | newpos < -75 = False
                         | newpos <= -49 && newpos >= -75 = True
					     | otherwise = checkYRange(newpos, newsp)
					     where (newpos, newsp) = moveY(pos, speed)
						 
checkYWrap :: Int -> Bool
checkYWrap n = checkYRange (0, n)
						 
goodYs :: [Int] -> [Int]
goodYs x = reverse (filter checkYWrap x)

moveX :: (Int, Int) -> (Int, Int)
moveX (pos, speed) = (pos+speed, newsp) where newsp = if speed < 0 then speed+1 else (if speed > 0 then speed-1 else 0)

						 
checkXRange :: (Int, Int) -> Bool
checkXRange (pos, 0) | pos >= 241 && pos <= 275 = True 
                     | otherwise = False
checkXRange (pos, speed) | newpos > 275 = False
                         | newpos >= 241 && newpos <= 275 = True
	                  -- | otherwise = checkYRange(newpos, newsp) --BRUH
					     | otherwise = checkXRange(newpos, newsp) --there there
					     where (newpos, newsp) = moveX(pos, speed)
						 
checkXWrap :: Int -> Bool
checkXWrap n = checkXRange (0, n)
						 
goodXs :: [Int] -> [Int]
goodXs x = reverse (filter checkXWrap x)

checkBoth :: (Int, Int) -> (Int, Int) -> Bool
checkBoth (posX, speedX) (posY, speedY) | newposX > 275 || newposY < -75 = False
                                         | newposX < 241 || newposY > -49 = checkBoth (newposX, newspX) (newposY, newspY) 
										 | otherwise = True
										 where 
											(newposX, newspX) = moveX(posX, speedX)
											(newposY, newspY) = moveY(posY, speedY)
											
thisYGood :: [Int] -> Int -> (Int, Bool)
thisYGood [] _ = (0, False)
thisYGood (x:xs) y | checkBoth (0, x) (0, y) = (x, True)
				   | otherwise = thisYGood xs y
											
getHighestY :: [Int] -> [Int] -> (Int, Int)
getHighestY (y:ys) xs | res = (x, y)
                      | otherwise = getHighestY ys xs
					  where (x, res) = thisYGood xs y
					  
moveXAmount :: (Int, Int) -> Int -> (Int, Int)
moveXAmount (p, s) 0 = (p, s)
moveXAmount (p, s) n = moveXAmount (np, ns) (n-1) where (np, ns) = moveX (p, s) 
moveYAmount :: (Int, Int) -> Int -> (Int, Int)
moveYAmount (p, s) 0 = (p, s)
moveYAmount (p, s) n = moveYAmount (np, ns) (n-1) where (np, ns) = moveY (p, s) 
					  
printAtPos :: (Int, Int) -> Int -> ((Int, Int), (Int, Int))
printAtPos (x, y) n = ((px, sx), (py, sy)) 
					  where 
						(px, sx) = moveXAmount (0, x) n 
						(py, sy) = moveYAmount (0, y) n
						
thisYOptions :: [Int] -> Int -> Int -> Int
thisYOptions [] _ n =  n
thisYOptions (x:xs) y n | checkBoth (0, x) (0, y) = thisYOptions xs y (n+1)
						| otherwise = thisYOptions xs y n
						
getAllGoods :: [Int] -> [Int] -> Int -> Int --for some reason "getAllGoods [-200..200] [0..300] 0" prints correct "getAllGoods (goodYs [-200..200]) (goodXs [0..300]) 0" idk the reason why the filtering would fail but w/e
getAllGoods [] _ n = n --figured it out LMAO i left my mistake commented classic ig it didnt affect the first part
getAllGoods (y:ys) xs n = getAllGoods ys xs (n+num) where num = thisYOptions xs y 0