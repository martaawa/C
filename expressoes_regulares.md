
# TP1 - GreenScript

## 1. Expressoes Regulares

### Palavras reservadas

LIGAR|DESLIGAR|ABRIR|FECHAR|AQUECER|PARAR|REGAR|ESPERAR|SE|SENAO|HUMIDADE|REPETIR

### Identificadores de estufa

EST-[A-Z][A-Z][0-9][0-9]

### Numeros inteiros

0|[1-9][0-9]*

### Delimitadores

\(
\)
\{
\}

,
;

### Operadores relacionais

<|<=|>|>=|==|!=

### Espacos e tabulacoes

[ \t]+

### Mudancas de linha

\r\n|\n

### Comentarios

#[^\r\n]*

### Candidatos lexicais

[A-Za-z0-9_-]+
