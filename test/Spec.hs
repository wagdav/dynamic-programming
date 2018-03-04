{-# LANGUAGE OverloadedStrings #-}

import Test.Hspec

import qualified Dynamic
import qualified Naive

spec = describe "Min Coin Exchange" $ do
    it "solves the example" $
       Naive.change 40 4 `shouldBe` Just 2

    it "solves the example" $
       Dynamic.change 40 4 `shouldBe` Just 2

main :: IO ()
main = hspec $ do
    spec
