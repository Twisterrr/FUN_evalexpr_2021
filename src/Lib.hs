--
-- EPITECH PROJECT, 2021
-- B-FUN-500-NCE-5-1-funEvalExpr-clement1.berard
-- File description:
-- Main function for EvalExpr.
--

module Lib ( Exceptions (..), gestAllErrors ) where

import Control.Exception ( Exception )
import Utils ( success, failure )

data Exceptions = PrintHelp | Error String deriving (Show)

instance Exception Exceptions

-- Function which prints the "Help" function.
printHelp :: IO ()
printHelp = putStrLn "USAGE: ./funEvalExpr arguments\nWrite a valid mathematical expression and wait for the result ! \n\nExample: (0.345+ 5 )*( -2-1) / 3"

-- Function that handles errors.
gestAllErrors :: Exceptions -> IO ()
gestAllErrors PrintHelp = printHelp >> success
gestAllErrors (Error s) = putStrLn ("Error : " ++ s) >> failure