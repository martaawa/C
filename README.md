# GreenScript - TP1 de Compiladores

Trabalho prático de Compiladores sobre a análise lexical da linguagem GreenScript.

## Trabalho realizado

### 1. Expressões regulares
Foram definidas expressões regulares para reconhecer os elementos da linguagem GreenScript:

- Palavras reservadas
- Identificadores de estufa
- Números inteiros
- Delimitadores
- Operadores relacionais
- Espaços, tabulações e mudanças de linha
- Comentários

### 2. Autómato Finito Determinístico (DFA)
Foi construído um DFA para reconhecer identificadores de estufa com o formato:

`EST-[A-Z][A-Z][0-9][0-9]`

O autómato inclui um estado inicial, um estado final e um estado de erro para sequências inválidas.

### DFA Construído

<img width="539" height="491" alt="DFA_Identificadores_Estufa drawio" src="https://github.com/user-attachments/assets/2e41cc3b-de55-4208-a7fb-2664a43fb476" />

## Ficheiros

- `expressoes_regulares.md` — Expressões regulares utilizadas na análise lexical.
- `DFA_Identificadores_Estufa.drawio` — Diagrama editável do DFA.
- `DFA_Identificadores_Estufa.drawio.png` — Imagem do DFA.

## Estado do projeto

Em desenvolvimento.
