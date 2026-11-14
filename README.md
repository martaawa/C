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

<img width="539" height="491" alt="DFA_estufa drawio" src="https://github.com/user-attachments/assets/ea051ebd-e94f-489e-be31-d8b33c2772d6" />

## Ficheiros

- `expressoes_regulares.md` — Expressões regulares utilizadas na análise lexical.
- `DFA_Estufa.drawio` — Diagrama editável do DFA.
- `DFA__Estufa.drawio.png` — Imagem do DFA.

## Estado do projeto

Em desenvolvimento.
