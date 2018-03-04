module Dynamic
    ( change
    ) where

import qualified Data.Map.Strict as M
import Data.Maybe
import Control.Applicative
import Control.Monad.Trans.State


-- Available coin denominators.
-- Example suggested by: http://www.algorithmist.com/index.php/Min-Coin_Change
coins = [1, 5, 10, 20, 25]

type Change = Maybe Int
type Dyn = State (M.Map (Int, Int) Change)

change :: Int -> Int -> Change
change m n = evalState (changeD m n) M.empty

changeD :: Int -> Int -> Dyn Change
changeD n m
  | n == 0            = return $ Just 0
  | n < 0             = return $ Nothing
  | n >= 1 && m <= 0  = return $ Nothing
  | otherwise         = do

    left <- memorize n (m - 1)
    right <- memorize (n - sm) m 
    return $ minOf left (fmap (+1) right)

    where
      sm = coins !! m


memorize :: Int -> Int -> Dyn Change
memorize n m = do
    val <- do
        elem <- gets $ M.lookup (n, m)
        case elem of
            Just x  -> return x
            Nothing -> changeD n m

    modify $ M.insert (n, m) val
    return val


minOf :: Change -> Change -> Change
minOf x y = case (x, y) of
  (Just a, Just b) -> Just (min a b)
  _                -> x <|> y

