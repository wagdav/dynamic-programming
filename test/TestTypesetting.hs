{-# LANGUAGE OverloadedStrings #-}
module TestTypesetting
    ( specTypesetting
    ) where

import Test.Hspec
import Data.List

import qualified Typesetting

specTypesetting = describe "Typesetting (naive implementation)" $ do
    it "put everyting in one long line" $
        Typesetting.justify 10 (words "a bb ccc") `shouldBe` "a  bb  ccc"

    it "puts the longest word in a separate line" $
        Typesetting.justify 3 (words "a bb ccc") `shouldBe` "a\nbb\nccc"

    it "distributes spaces" $
        Typesetting.justify 5 (words "a bb ccc") `shouldBe` "a  bb\nccc"

    it "solves the example from the book" $
        Typesetting.justify 25 sample `shouldBe`
        intercalate "\n" [ "Daddy,    please    buy"
                         , "me   a   little   baby"
                         , "humuhummunukunukuspua!" 
                         ]

sample = words "Daddy, please buy me a little baby humuhummunukunukuspua!"
