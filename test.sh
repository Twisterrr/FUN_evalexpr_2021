##
## EPITECH PROJECT, 2021
## B-FUN-500-NCE-5-1-funEvalExpr-clement1.berard
## File description:
## Automatic tests for EvalExpr
##

#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# COMPILATION
make re

echo '-----------------------------------------'
echo 'Entrée: 2+2 = 4'
./funEvalExpr "2+2"
if [ $? == 0 ]; then
    echo "${GREEN}SUCCESS${NC}"
else
    echo "${RED}ERROR"
fi

echo '-----------------------------------------'
echo 'Entrée: 2-2 = 0'
./funEvalExpr "2-2"
if [ $? == 0 ]; then
    echo "${GREEN}SUCCESS"
else
    echo "${RED}ERROR"
fi

echo '-----------------------------------------'
echo 'Entrée: 2^2 = 4'
./funEvalExpr "2^2"
if [ $? == 0 ]; then
    echo "${GREEN}SUCCESS"
else
    echo "${RED}ERROR"
fi

echo '-----------------------------------------'
echo 'Entrée: 2*2 = 4'
./funEvalExpr "2*2"
if [ $? == 0 ]; then
    echo "${GREEN}SUCCESS"
else
    echo "${RED}ERROR"
fi

echo '-----------------------------------------'
echo 'Entrée: 2/2 = 1'
./funEvalExpr "2/2"
if [ $? == 0 ]; then
    echo "${GREEN}SUCCESS"
else
    echo "${RED}ERROR"
fi

echo '-----------------------------------------'
echo 'Entrée: 2.45+2.55 = 5'
./funEvalExpr "2.45+2.55"
if [ $? == 0 ]; then
    echo "${GREEN}SUCCESS"
else
    echo "${RED}ERROR"
fi

echo '-----------------------------------------'
echo 'Entrée: 2.45-2.55 = 0.10'
./funEvalExpr "2.45-2.55"
if [ $? == 0 ]; then
    echo "${GREEN}SUCCESS"
else
    echo "${RED}ERROR"
fi

echo '-----------------------------------------'
echo 'Entrée: 2.45^2.55 = 9.82'
./funEvalExpr "2.45^2.55"
if [ $? == 0 ]; then
    echo "${GREEN}SUCCESS"
else
    echo "${RED}ERROR"
fi

echo '-----------------------------------------'
echo 'Entrée: 2.45*2.55 = '
./funEvalExpr "2.45*2.55"
if [ $? == 0 ]; then
    echo "${GREEN}SUCCESS"
else
    echo "${RED}ERROR"
fi

echo '-----------------------------------------'
echo 'Entrée: 2.45/2.55 = 0.96'
./funEvalExpr "2.45/2.55"
if [ $? == 0 ]; then
    echo "${GREEN}SUCCESS"
else
    echo "${RED}ERROR"
fi

echo '-----------------------------------------'
echo 'Entrée: 2/0 = Error'
./funEvalExpr "2/0"
if [ $? == 84 ]; then
    echo "${GREEN}SUCCESS"
else
    echo "${RED}ERROR"
fi

echo '-----------------------------------------'
echo 'TEST PDF'
echo 'Entrée: (0.345+ 5 )*( -2-1) / 3 = -5.34'
./funEvalExpr "(0.345+ 5 )*( -2-1) / 3"
if [ $? == 0 ]; then
    echo "SUCCESS"
else
    echo "ERROR"
fi