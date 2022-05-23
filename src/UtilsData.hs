--
-- EPITECH PROJECT, 2021
-- B-FUN-500-NCE-5-1-funEvalExpr-clement1.berard
-- File description:
-- UtilsData of the EvalExpr.
--

module UtilsData ( SingleOperations (..), BinaryOperations (..), Operation (..) ) where

import Numeric ( showFFloat )

-- Data of normal operators: Additions and Subtractions.
data SingleOperations  = Minus  | Plus  | Parenthesis deriving (Eq, Show)

-- Data of binary operators: Additions, Subtractions, Multiplications, Divisions and Powers.
data BinaryOperations = BMinus | BPlus | Pow | Mult | Div deriving (Eq, Show)

-- Computable, Num, Floating, Fractional.
data Operation = SingleOperations SingleOperations Operation
               | BinaryOperations BinaryOperations Operation Operation
               | Value Float deriving (Eq)

-- Lexique :
-- GT : Greater Than
-- EQ : EQual
-- LT : Less Than
instance Ord BinaryOperations where
    compare Div Pow       = LT
    compare Mult Div      = LT
    compare Mult Pow      = LT
    compare BPlus BMinus  = LT
    compare BPlus Pow     = LT
    compare BPlus Mult    = LT
    compare BMinus Pow    = LT
    compare BMinus Div    = LT
    compare BMinus Mult   = LT
    compare BPlus Div     = LT
    compare BPlus BPlus   = EQ
    compare BMinus BMinus = EQ
    compare Mult Mult     = EQ
    compare Pow Pow       = EQ
    compare Div Div       = EQ
    compare BMinus BPlus  = GT
    compare Mult BPlus    = GT
    compare Mult BMinus   = GT
    compare Pow Div       = GT
    compare Pow BPlus     = GT
    compare Pow BMinus    = GT
    compare Pow Mult      = GT
    compare Div Mult      = GT
    compare Div BPlus     = GT
    compare Div BMinus    = GT

instance Floating Operation where
    (Value a) ** (Value b) = Value $ a ** b

instance Num Operation where
    (Value a) - (Value b) = Value $ a - b
    (Value a) + (Value b) = Value $ a + b
    (Value a) * (Value b) = Value $ a * b
    abs (Value a)         = Value $ abs a
    signum (Value a)      = Value $ signum a
    fromInteger a         = Value $ fromInteger a

instance Fractional Operation where
    (Value a) / (Value b) = Value $ a / b
    fromRational a        = Value $ fromRational a

instance Show Operation where
    show (Value a)                          = showFFloat (Just 2) a ""
    show (BinaryOperations operator op op2) = "(" ++ show op ++ " " ++ show operator ++ " " ++ show op2 ++ ")"
    show (SingleOperations operator op )    = "(" ++ show operator ++ " " ++ show op ++ ")"