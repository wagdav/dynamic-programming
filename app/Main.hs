module Main where

import Criterion.Main
import Naive

changeAmount amount = change amount 4

main :: IO ()
main = defaultMain [
    bgroup "min-coin-change" [ bench "40"  $ whnf changeAmount 40
                             , bench "100" $ whnf changeAmount 100
                             , bench "150" $ whnf changeAmount 150
                             , bench "200" $ whnf changeAmount 200
                             ]
    ]
