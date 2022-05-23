--
-- EPITECH PROJECT, 2021
-- B-FUN-500-NCE-5-1-funEvalExpr-clement1.berard
-- File description:
-- ManageData for the EvalExpr
--

module ManageData ( Computable (..) ) where

import Control.Exception ( throw )

import Lib ( Exceptions(Error) )
import UtilsData ( SingleOperations (..), BinaryOperations (..), Operation (..) )

class Computable a where
    compute :: a -> a

instance Computable Operation where
    compute v@(Value _)                        = v
    compute (SingleOperations Minus o)         = -(compute o)
    compute (SingleOperations _ o)             = compute o
    compute (BinaryOperations BMinus o1 o2)    = compute o1 - compute o2
    compute (BinaryOperations BPlus o1 o2)     = compute o1 + compute o2
    compute (BinaryOperations Pow o1 o2)       = compute o1 ** compute o2
    compute (BinaryOperations Mult o1 o2)      = compute o1 * compute o2
    compute (BinaryOperations Div _ (Value 0)) = throw $ Error "Floating point exception"
    compute (BinaryOperations Div o1 o2)       = compute o1 / compute o2