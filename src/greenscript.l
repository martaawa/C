
%option noyywrap noinput nounput

%{
#include <stdio.h>

extern char *yytext;

int linha = 1, tokens = 0, erros = 0;

void token(const char *categoria) {
    printf("%d %-14s %s\n", linha, categoria, yytext);
    tokens++;
}

void erro(void) {
    printf("Erro lexical na linha %d: %s\n", linha, yytext);
    erros++;
}
%}

CAND    [A-Za-z0-9_-]+
ESTUFA  EST-[A-Z]{2}[0-9]{2}
INTEIRO 0|[1-9][0-9]*

%%

"#"[^\r\n]*   { }
[ \t]+        { }
\r\n|\n|\r    { linha++; }

"LIGAR"|"DESLIGAR"|"ABRIR"|"FECHAR"|"AQUECER"|"PARAR"|"REGAR"|"ESPERAR"|"SE"|"SENAO"|"HUMIDADE"|"REPETIR"  { token(yytext); }

{ESTUFA}      { token("ID_ESTUFA"); }
{INTEIRO}     { token("INTEIRO"); }

"("           { token("ABRE_PAR"); }
")"           { token("FECHA_PAR"); }
"{"           { token("ABRE_CHAV"); }
"}"           { token("FECHA_CHAV"); }
","           { token("VIRGULA"); }
";"           { token("PONTO_VIRG"); }

"<="          { token("MENOR_IGUAL"); }
">="          { token("MAIOR_IGUAL"); }
"=="          { token("IGUAL"); }
"!="          { token("DIFERENTE"); }
"<"           { token("MENOR"); }
">"           { token("MAIOR"); }

{CAND}        { erro(); }
.             { erro(); }

%%

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Uso: %s ficheiro.txt\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "rb");

    if (yyin == NULL) {
        perror("Erro ao abrir ficheiro");
        return 1;
    }

    yylex();
    fclose(yyin);

    printf("Tokens: %d | Erros lexicais: %d\n", tokens, erros);

    return 0;
}
