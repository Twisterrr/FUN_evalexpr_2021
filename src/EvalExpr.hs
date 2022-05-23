--
-- EPITECH PROJECT, 2021
-- B-FUN-500-NCE-5-1-funEvalExpr-clement1.berard
-- File description:
-- Main function for EvalExpr.
--

module EvalExpr ( start ) where

import Control.Exception ( handle, throw )
import System.Environment ( getArgs )
import System.Exit ( exitWith, ExitCode(ExitFailure) )

import Lib ( Exceptions(PrintHelp), gestAllErrors )
import Recognition ( recognition )
import ManageData ( Computable(compute) )
import ManagementParser (management)

-- This function allows you to check which input is to be entered.
checkAllArguments :: [String] -> IO ()
checkAllArguments ["--help"] = throw PrintHelp
checkAllArguments ["-help"] = throw PrintHelp
checkAllArguments ["-h"] = throw PrintHelp
checkAllArguments [s] = print $ compute $ (management . recognition) s
checkAllArguments _ = exitWith $ ExitFailure 84

-- Start function which will allow you to enter error management 
-- and retrieve the arguments to enter input and send them to "checkAllArguments".
start :: IO ()
start = handle gestAllErrors $ getArgs >>= checkAllArguments