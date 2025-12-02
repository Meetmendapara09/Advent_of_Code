import Data.List
import Data.Char
import System.IO

repTwice :: Integer -> Bool
repTwice n =
  let s = show n
      l = length s
  in even l &&
     let (a,b) = splitAt (l `div` 2) s
     in a == b

rangeInvalids :: (Integer,Integer) -> [Integer]
rangeInvalids (a,b) = filter repTwice [a..b]

parseRange :: String -> (Integer,Integer)
parseRange xs =
  let (x,_:y) = break (=='-') xs
  in (read x, read y)

main :: IO ()
main = do
  s <- getLine
  let ranges = map parseRange (splitOnComma s)
  print $ sum $ concatMap rangeInvalids ranges

splitOnComma :: String -> [String]
splitOnComma [] = [""]
splitOnComma (',':xs) = "":splitOnComma xs
splitOnComma (x:xs) = let (y:ys) = splitOnComma xs in (x:y):ys
