module Naive
    ( change
    ) where

import Change
import Denominators

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
