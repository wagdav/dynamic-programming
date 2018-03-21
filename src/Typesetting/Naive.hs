module Typesetting.Naive
    ( justify
    ) where

import Data.Ord     (comparing)
import Data.List    (intercalate, minimumBy)

type Width = Int
type Words = [String]

totalWidth :: Words -> Width
totalWidth ws = widthWords + widthSpaces
  where
   widthWords = sum $ map length ws
   widthSpaces = length ws - 1

cost :: Width -> Words -> Float
cost lw ws
    | totalWidth ws > lw = read "Infinity"
    | otherwise          = (num / denom) ^ 3
  where
    num = fromIntegral $ extraRoom lw ws
    denom = fromIntegral $ length ws

extraRoom :: Width -> Words -> Width
extraRoom lw ws = lw - totalWidth ws

factor :: Width -> Words -> Float
factor lw ws = fromIntegral (extraRoom lw ws + 1) / fromIntegral (length ws - 1)

nextBreak :: Width -> Words -> (Words, Words)
nextBreak lw ws = snd $ go ws
  where
    go []  = (0, ([], []))
    go ws = minimum' $ map costOf (splits ws)

    costOf (p1, p2) = (cost lw p1 + fst (go p2), (p1, p2))

    splits ws = [splitAt i ws | i <- [1..length ws]]
    minimum' = minimumBy (comparing fst)

justify :: Width -> Words -> String
justify lw ws = go $ nextBreak lw ws
  where
    go (next, [])   = unwords' next
    go (next, rest) = unwords' next  ++ "\n" ++ go (nextBreak lw rest)

    unwords' ws = intercalate (spaces ws) ws
    spaces ws = replicate (max 1 $ round $ factor lw ws) ' '

printResult :: String -> Int -> IO ()
printResult text lineWidth = do
    putStrLn $ replicate lineWidth '='
    putStrLn $ justify lineWidth (words text)
    putStrLn $ replicate lineWidth '='
