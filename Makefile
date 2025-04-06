all: custom_op

custom_op: custom_op.c custom_op.l main.c
	flex -o lex.yy.c custom_op.l
	gcc -o custom_op custom_op.c lex.yy.c main.c -lm

clean:
	rm -f custom_op lex.yy.c
