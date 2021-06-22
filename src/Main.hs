module Main where

import System.Environment (getArgs)



-- MAIN


main :: IO ()
main = getArgs >>= putStrLn . ("❯❯❯ " ++) . calc



-- CALC


calc :: [String] -> String
calc args = 
  case eval [] $ map parse args of
    Left message -> message
    Right double -> show double



-- PARSE


data Atom = Op Op | Num Double


type Op = Double -> Double -> Double


parse :: String -> Atom
parse "+" = Op (+)
parse "-" = Op (-)
parse "x" = Op (*)
parse "/" = Op (/)
parse num = Num $ read num



-- EVAL


eval :: [Double] -> [Atom] -> Either String Double

-- No more atoms.
eval []       [] = Left "empty stack"
eval [result] [] = Right result
eval stack    [] = Left $ "incomplete calculation: " ++ show (reverse stack)

-- Number incoming => push to stack.
eval stack (Num n : atoms) = eval (n : stack) atoms

-- Operator incoming => pop two values off stack and compute.
eval (x : y : stack) (Op op : atoms) = eval (op y x : stack) atoms

