{-# LANGUAGE OverloadedStrings #-}

import Test.Hspec

import Lib

spec = describe "Min Coin Exchange" $ do
    it "solves the example" $
       change [1, 5, 10, 20, 25] 40 `shouldBe` [20, 20] 

main :: IO ()
main = hspec $ do
    spec
