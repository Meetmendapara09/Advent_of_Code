import Data.Char

rep :: Integer -> Bool
rep n =
  let s = show n
      l = length s
      ks = [k | k <- [1..l `div` 2], l `mod` k == 0]
  in any (\k -> let (a,b) = splitAt k s
                in all (==a) (chunks k s)) ks

chunks :: Int -> [a] -> [[a]]
chunks _ [] = []
chunks k xs = let (a,b) = splitAt k xs in a : chunks k b

rangeInvalids :: (Integer,Integer) -> [Integer]
rangeInvalids (a,b) = filter rep [a..b]

parseRange :: String -> (Integer,Integer)
parseRange xs =
  let (x,_:y) = break (=='-') xs
  in (read x, read y)

splitOnComma :: String -> [String]
splitOnComma [] = [""]
splitOnComma (',':xs) = "":splitOnComma xs
splitOnComma (x:xs) = let (y:ys) = splitOnComma xs in (x:y):ys

main :: IO ()
main = do
  s <- getLine
  let ranges = map parseRange (splitOnComma s)
  print $ sum $ concatMap rangeInvalids ranges
