{-# LANGUAGE OverloadedStrings #-}

import Test.Hspec

import Lib

spec = describe "Min Coin Exchange" $ do
    it "solves the example" $
       change 40 4 `shouldBe` Just 2

main :: IO ()
main = hspec $ do
    spec
