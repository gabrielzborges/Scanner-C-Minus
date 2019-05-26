all: flex gcc

flex: scanner.l
	flex scanner.l

gcc: lex.yy.c
	gcc lex.yy.c -o trab1

clean:
	@rm -f trab1 lex.yy.c
