module Typesetting
    (
    ) where

import Data.Ord
import Data.List

type LineWidth = Int
type Words = [String]

inputWords = words "Daddy, please buy me a little baby humuhummunukunukuspua!"
lineWidth = 25

totalWidth ws i j = widthWords + widthSpaces
  where
   widthWords = sum $ map length (slice i j ws)
   widthSpaces = j - i

cost ws lw i j
    | totalWidth ws i j > lw = 1/0
    | otherwise              = (fromIntegral num / fromIntegral denom) ^ 3
  where
    num = extraRoom ws lw i j
    denom = j - i


extraRoom ws lw i j = lw - totalWidth ws i j

factor ws lw i j = fromIntegral (extraRoom ws lw i j) / fromIntegral (j - i)

--f :: Int -> Float
f i
    | i >= n     = (0, i)
    | otherwise  = (minCost, index + i)
  where
    (minCost, index) = mini [ c i j + (fst $ f (j + 1)) | j <- [i..n]]
    c = cost inputWords lineWidth
    n = length inputWords - 1

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

mini xs = minimumBy (comparing fst) (zip xs [0..])

printResult :: IO ()
printResult = do
    putStrLn $ replicate lineWidth '='
    putStrLn $ intercalate (spaces 0 2) (slice 0 2 inputWords)
    putStrLn $ intercalate (spaces 3 6) (slice 3 6 inputWords)
    putStrLn $ intercalate (spaces 7 7) (slice 7 7 inputWords)
  where
   spaces i j = replicate (round $ 1 + factor inputWords lineWidth i j) ' '
