--
-- EPITECH PROJECT, 2021
-- B-FUN-500-NCE-5-1-funEvalExpr-clement1.berard
-- File description:
-- Utils for EvalExpr.
--

module Utils ( success, failure) where

import System.Exit ( exitSuccess, exitWith, ExitCode(ExitFailure) )

-- Function that indicates that the output is good.
success :: IO ()
success = exitSuccess

-- Function that indicates that the output is bad.
failure :: IO ()
failure = exitWith $ ExitFailure 84