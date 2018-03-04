module Main where

import Criterion.Main
import qualified Dynamic
import qualified Naive

changeNaive amount = Naive.change amount 4
changeDynamic amount = Dynamic.change amount 4

main :: IO ()
main = defaultMain
    [ bgroup "naive" [ bench "40"  $ whnf changeNaive 40
                     , bench "100" $ whnf changeNaive 100
                     , bench "150" $ whnf changeNaive 150
                     , bench "200" $ whnf changeNaive 200
                     ]
    , bgroup "dynamic" [ bench "40"  $ whnf changeDynamic 40
                       , bench "100" $ whnf changeDynamic 100
                       , bench "150" $ whnf changeDynamic 150
                       , bench "200" $ whnf changeDynamic 200
                       ]
    ]
