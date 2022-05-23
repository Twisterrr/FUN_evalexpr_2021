--
-- EPITECH PROJECT, 2021
-- B-FUN-500-NCE-5-1-funEvalExpr-clement1.berard
-- File description:
-- Recognition function for EvalExpr.
--

module Recognition ( recognition, Symboll(..) ) where

import Data.Char ( isSpace )
import UtilsRecognition ( ifItsAPartOfNumber, ifThetupleIsAFloat, TupleStr )

-- All operators / symbols are contained in a "Data".
data Symboll = OParenthesis | CParenthesis | Add | Substraction | Multiplication | Div | Pow | Value String deriving (Show)

-- Continuation of the main function: "Recognition".
secondRecognition :: TupleStr -> [Symboll]
secondRecognition (number, xs) = Value number : recognition xs

-- Recognition of symbols with all possible operations in the EvalExpr and create a vector of "Symboll".
-- + : Addition
-- - : Substraction
-- * : Multiplication
-- / : Division
-- ^ : Power
-- Numbers
-- Spaces
recognition :: String -> [Symboll]
recognition [] = []
recognition (a:xs)  | isOPar  a = OParenthesis   : recognition xs
                    | isCPar  a = CParenthesis   : recognition xs
                    | isPow   a = Pow            : recognition xs
                    | isMul   a = Multiplication : recognition xs
                    | isMin   a = Substraction   : recognition xs
                    | isAdd   a = Add            : recognition xs
                    | isDiv   a = Div            : recognition xs
                    | isSpace a =                  recognition xs
recognition number              = secondRecognition (recupAllNumbers number)

-- Each Operations.
isOPar :: Char -> Bool
isOPar '(' = True
isOPar _   = False

isCPar :: Char -> Bool
isCPar ')' = True
isCPar _   = False

isPow :: Char -> Bool
isPow '^' = True
isPow _   = False

isMul :: Char -> Bool
isMul '*' = True
isMul _   = False

isMin :: Char -> Bool
isMin '-' = True
isMin _   = False

isAdd :: Char -> Bool
isAdd '+' = True
isAdd _   = False

isDiv :: Char -> Bool
isDiv '/' = True
isDiv _   = False

-- Take the number and watch if it is a valid number.
recupAllNumbers :: String -> TupleStr
recupAllNumbers string = ifThetupleIsAFloat (span ifItsAPartOfNumber string)