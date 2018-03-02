module Lib
    ( change
    ) where

import Control.Applicative


coins = [1, 5, 10, 20, 25]

type Change = Maybe Int

change :: Int -> Int -> Change
change n m
  | n == 0            = Just 0
  | n < 0             = Nothing
  | n >= 1 && m <= 0  = Nothing
  | otherwise         = minOf left right

  where
    left = change n (m - 1)
    right = (+1) `fmap` change (n - sm) m
    sm = coins !! m

minOf :: Change -> Change -> Change
minOf x y = case (x, y) of
  (Just x, Just y) -> Just (min x y)
  _                -> x <|> y

