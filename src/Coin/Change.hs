module Coin.Change
    ( Change
    , minOf
    ) where

import Control.Applicative ((<|>))

type Change = Maybe Int

minOf :: Change -> Change -> Change
minOf x y = case (x, y) of
  (Just a, Just b) -> Just (min a b)
  _                -> x <|> y

