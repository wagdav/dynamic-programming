import Test.Hspec

import TestCoin
import TestTypesetting


main :: IO ()
main = hspec $ do
    specCoin
    specTypesetting
