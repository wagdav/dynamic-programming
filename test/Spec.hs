{-# LANGUAGE OverloadedStrings #-}

import Test.Hspec

import qualified Dynamic
import qualified Naive

specNaive = describe "Min Coin Exchange (naive implementation)" $ do
    it "40 = 2 x 20" $
       Naive.change 40 4 `shouldBe` Just 2

    it "13 = 10 + 3 x 1" $
       Naive.change 13 4 `shouldBe` Just 4

specDynamic = describe "Min Coin Exchange (dynamic programming)" $ do
    it "40 = 2 x 20" $
       Dynamic.change 40 4 `shouldBe` Just 2

    it "13 = 10 + 3 x 1" $
       Dynamic.change 13 4 `shouldBe` Just 4


main :: IO ()
main = hspec $ do
    specDynamic
    specNaive
