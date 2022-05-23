# EvalExpr
Epitech Project, EvalExpr

You all know the very famous Battleship game. Well, I hope so. You must code a terminal version of this game. The two players are ONLY allowed to comunicate using the signals SIGUSER1 and SIGUSER2. The map size is 8x8. On each turn, you must display your positions, and then your enemy’s positions. At the end of the game (when all the ships of a player have been hit), you must display whether “I won” (and return 0) or “Enemy won” (and return 1).

## Operators 

Support:
| Operator | Description         |
| -------- | ------------------- |
| `+`      | Plus sign           |
| `-`      | Minus sign          |
| `*`      | Multiplication sign |
| `/`      | Division sign       |
| `^`      | Exponent sign       |

## How to use EvalExpr ?

<p align="justify"> 
Compile the makefile (make) and add some arithmetic expression like this !
</p>
<pre>
 $> ./funEvalExpr "6 * 12 / 2 * (1 - 2 - (2 - 4 - 5) - 10) ^ 2 * (2 - 7 - 4) ^ 3"
 $> -419904.00
</pre>

## How to run the Unit Test ?

<p align="justify"> 
 <pre>
 > make && test_run
 </pre>

## Authors

* **Clément Bérard** ([GitHub](https://github.com/Twisterrr) / [LinkedIn](https://www.linkedin.com/in/clementberard/))
* **Robert Harakaly** ([GitHub](https://github.com/RobertSparadrap) / [LinkedIn](https://www.linkedin.com/in/robert-harakaly-3b19391a1/))
