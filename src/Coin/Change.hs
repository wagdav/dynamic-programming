module Coin.Change
    ( Change
    , minOf
    ) where

import Control.Applicative ((<|>))

type Change = Maybe Int

minOf :: Change -> Change -> Change
minOf (Just i) (Just j) = Just (min i j)
minOf c1 c2             = c1 <|> c2
