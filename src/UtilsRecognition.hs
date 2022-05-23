--
-- EPITECH PROJECT, 2021
-- B-FUN-500-NCE-5-1-funEvalExpr-clement1.berard
-- File description:
-- Utils for Recogition function.
--

module UtilsRecognition ( ifItsAValidFloatNumber, ifItsAPartOfNumber, ifThetupleIsAFloat, TupleStr ) where

import Control.Exception ( throw )
import Data.Char ( isDigit )
import Lib ( Exceptions(Error) )

type TupleStr = (String, String)

-- Check if its a valid number float.
ifItsAValidFloatNumber :: String -> Bool
ifItsAValidFloatNumber []       = True
ifItsAValidFloatNumber [',']    = False
ifItsAValidFloatNumber ['.']    = False
ifItsAValidFloatNumber (_:xs)   = ifItsAValidFloatNumber xs

-- Check if the character can be considered as a number.
-- '.' & ',' is True because of the float
ifItsAPartOfNumber :: Char -> Bool
ifItsAPartOfNumber x    | isPoint x = True
                        | otherwise = isDigit x

isPoint :: Char -> Bool
isPoint '.' = True
isPoint ',' = True
isPoint _   = False

-- Check if the first nuber of the tuple is a valid number or float.
ifThetupleIsAFloat :: TupleStr -> TupleStr
ifThetupleIsAFloat ([], _) = throw $ Error "Invalid Symbol"
ifThetupleIsAFloat t@(a, _) | ifItsAValidFloatNumber a = t
                            | otherwise = throw $ Error (a ++ " is not a float.")