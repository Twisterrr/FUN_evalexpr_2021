--
-- EPITECH PROJECT, 2021
-- B-FUN-500-NCE-5-1-funEvalExpr-clement1.berard
-- File description:
-- ManagementParser of the EvalExpr
--

module ManagementParser ( management ) where

import Control.Exception ( throw )
import Text.Read ( readMaybe )

import Recognition ( Symboll(..) )
import Lib ( Exceptions(Error) )
import ManageData ( Computable(compute) )
import UtilsData ( Operation(..), BinaryOperations(..), SingleOperations(..) )

manageUnaryContexts :: SingleOperations -> ([Symboll], [Symboll]) -> Operation
manageUnaryContexts o (inner, after) = parseOperation after . SingleOperations o $ SingleOperations Parenthesis $ management inner

parseInner :: [Symboll] -> Operation
parseInner (OParenthesis     :xs)   = (manageContexts . manageParantesis) xs
parseInner (Recognition.Value v:xs) = parseOperation xs $ managementAllNumbers v
parseInner _                        = throw $ Error "invalid operation member"

-- These functions is to identify the symbol of the operation.
isMin :: Symboll -> Bool
isMin Recognition.Substraction = True
isMin _                        = False

isAdd :: Symboll -> Bool
isAdd Recognition.Add = True
isAdd _               = False

isMul :: Symboll -> Bool
isMul Recognition.Multiplication = True
isMul _                          = False

isDiv :: Symboll -> Bool
isDiv Recognition.Div = True
isDiv _               = False

isPow :: Symboll -> Bool
isPow Recognition.Pow = True
isPow _               = False

-- Find the symbols of the operations.
parseOperation :: [Symboll] -> Operation -> Operation
parseOperation []                sym = sym
parseOperation (a: xs) sym | isMin a = assemble UtilsData.BMinus sym (parseInner xs)
                           | isAdd a = assemble UtilsData.BPlus  sym (parseInner xs)
                           | isMul a = assemble UtilsData.Mult   sym (parseInner xs)
                           | isDiv a = assemble UtilsData.Div    sym (parseInner xs)
                           | isPow a = assemble UtilsData.Pow    sym (parseInner xs)
parseOperation _                   _ = throw $ Error "invalid operation member"

-- Function that do the operation between numbers.
assemble :: BinaryOperations -> Operation -> Operation -> Operation
assemble o v1 v2 | isCalc v1 v2                                                   = BinaryOperations o v1 v2
assemble o v1@SingleOperations {} (BinaryOperations ope iop1 iop2)                = BinaryOperations ope (BinaryOperations o v1 iop1) iop2
assemble o v1@(UtilsData.Value _) v2@(BinaryOperations ope iop1 iop2) | o >= ope  = BinaryOperations ope (BinaryOperations o v1 iop1) iop2
                                                                      | otherwise = BinaryOperations o v1 v2

-- Function to see if it is a calcul between 2 numbers.
isCalc :: Operation -> Operation -> Bool
isCalc v1@(UtilsData.Value _) v2@(UtilsData.Value _) = True
isCalc v1@SingleOperations {} v2@(UtilsData.Value _) = True
isCalc v1@SingleOperations {} v2@SingleOperations {} = True
isCalc v1@(UtilsData.Value _) v2@SingleOperations {} = True
isCalc _ _                                           = False

manageContexts :: ([Symboll], [Symboll]) -> Operation
manageContexts (inner, after) = parseOperation (tail after) . SingleOperations Parenthesis $ management inner

-- Function to see everything inside the paranthesis
manageParantesis :: [Symboll] -> ([Symboll], [Symboll])
manageParantesis tabb = splitAt (secondManageParantesis 0 0 tabb) tabb

-- Function that return the number when he found the second parantesis
secondManageParantesis :: Int -> Int -> [Symboll] -> Int
secondManageParantesis 0   0 (CParenthesis :_)  = throw $ Error "parenthesis incoherence"
secondManageParantesis _   _ []                 = throw $ Error "parenthesis incoherence"
secondManageParantesis 0   i (CParenthesis :_)  = i
secondManageParantesis nbr i (OParenthesis :xs) = secondManageParantesis (nbr + 1) (i + 1) xs
secondManageParantesis nbr i (CParenthesis :xs) = secondManageParantesis (nbr - 1) (i + 1) xs
secondManageParantesis nbr i (_         :xs)    = secondManageParantesis  nbr (i + 1) xs

-- Change the String in Symboll (Value) into a Float
managementAllNumbers :: String -> Operation
managementAllNumbers value = UtilsData.Value (read value)

-- Start the parsing
management :: [Symboll] -> Operation
management []                                                       = throw $ Error "No operation are given"
management (Recognition.Substraction :(Recognition.Value x):xs)     = parseOperation xs . SingleOperations UtilsData.Minus $ managementAllNumbers x
management (Recognition.Add          :(Recognition.Value x):xs)     = parseOperation xs . SingleOperations UtilsData.Plus  $ managementAllNumbers x
management (Recognition.Substraction :Recognition.OParenthesis :xs) = manageUnaryContexts UtilsData.Minus  $ manageParantesis xs
management (Recognition.Add          :Recognition.OParenthesis :xs) = manageUnaryContexts UtilsData.Plus   $ manageParantesis xs
management string                                                   = parseInner string