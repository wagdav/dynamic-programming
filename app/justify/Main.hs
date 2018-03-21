module Main where

import System.Environment (getArgs)

import Typesetting (justify)

printResult :: Int -> String -> IO ()
printResult lineWidth text = do
    putStrLn $ replicate lineWidth '='
    putStrLn $ justify lineWidth (words text)
    putStrLn $ replicate lineWidth '='

main :: IO ()
main = do
    args <- getArgs

    if length args /= 2 then
        putStrLn "Invalid number of arguments"
    else do
        let [width, text] = args
        printResult (read width) text

