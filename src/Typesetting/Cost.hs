module Typesetting.Cost
    where

type Width = Int
type Words = [String]

cost :: Width -> Words -> Float
cost lw ws
    | totalWidth ws > lw = read "Infinity"
    | otherwise          = (num / denom) ^ 3
  where
    num = fromIntegral $ extraRoom lw ws
    denom = fromIntegral $ length ws

totalWidth :: Words -> Width
totalWidth ws = widthWords + widthSpaces
  where
   widthWords = sum $ map length ws
   widthSpaces = length ws - 1

extraRoom :: Width -> Words -> Width
extraRoom lw ws = lw - totalWidth ws

factor :: Width -> Words -> Float
factor lw ws = fromIntegral (extraRoom lw ws + 1) / fromIntegral (length ws - 1)
