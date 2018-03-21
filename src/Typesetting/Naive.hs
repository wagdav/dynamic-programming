module Typesetting.Naive
    ( nextBreak 
    ) where

import Data.Ord     (comparing)
import Data.List    (minimumBy)

import Typesetting.Cost

nextBreak :: Width -> Words -> (Words, Words)
nextBreak lw ws = snd $ go ws
  where
    go []  = (0, ([], []))
    go ws = minimum' $ map costOf (splits ws)

    costOf (p1, p2) = (cost lw p1 + fst (go p2), (p1, p2))

    splits ws = [splitAt i ws | i <- [1..length ws]]
    minimum' = minimumBy (comparing fst)
