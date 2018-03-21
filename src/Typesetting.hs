module Typesetting
    ( justify
    ) where

import Typesetting.Cost
import Typesetting.Naive

import Data.List    (intercalate)

justify :: Width -> Words -> String
justify lw ws = go $ nextBreak lw ws
  where
    go (next, [])   = unwords' next
    go (next, rest) = unwords' next  ++ "\n" ++ go (nextBreak lw rest)

    unwords' ws = intercalate (spaces ws) ws
    spaces ws = replicate (max 1 $ round $ factor lw ws) ' '
