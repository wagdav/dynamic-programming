import System.Environment (getArgs)
import Text.Printf (printf)

import Coin (change)

main :: IO ()
main = do
    args <- getArgs

    if length args /= 1 then
        putStrLn "Invalid number of arguments"
    else do
        let value = read (head args)
        print $ change value 4
