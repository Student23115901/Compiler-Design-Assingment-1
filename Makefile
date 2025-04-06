# Makefile for building custom_operation_unique

all: custom_operation_unique

custom_operation_unique: unique_op_logic.c lex.yy.c main_unique.c
	gcc -o custom_operation_unique unique_op_logic.c lex.yy.c main_unique.c -lm

lex.yy.c: unique_op.l
	flex -o lex.yy.c unique_op.l

clean:
	rm -f custom_operation_unique lex.yy.c
