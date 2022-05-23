##
## EPITECH PROJECT, 2021
## B-FUN-500-NCE-5-1-funEvalExpr-clement1.berard
## File description:
## Makefile for EvalExpr
##

SRC            =    ./app/Main.hs				\
					./src/Lib.hs				\
					./src/Recognition.hs 		\
					./src/ManageData.hs 		\
					./src/ManagementParser.hs 	\
					./src/Utils.hs				\
					./src/UtilsRecognition.hs	\
					./src/UtilsData.hs 			\


NAME        = funEvalExpr


all            :    $(NAME)


$(NAME)        : $(SRC)
				stack build --copy-bins --local-bin-path .
				@mv $(NAME)-exe $(NAME)


clean       :
			stack clean
			rm .stack-work funEvalExpr.cabal -rf


fclean        :    clean
			rm -f $(NAME)


re            :    fclean clean all


.PHONY        :    re fclean clean all