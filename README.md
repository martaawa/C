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

### 3.Analisador lexical em FLEX.

Foi implementado um analisador lexical em FLEX no ficheiro src/greenscript.l.

O programa permite:

- Ler um ficheiro de entrada passado como argumento.
- Reconhecer palavras reservadas, identificadores de estufa, números inteiros, operadores e delimitadores.
- Apresentar os tokens com o número da linha, categoria e lexema.
- Ignorar espaços, tabulações, mudanças de linha e comentários.
- Identificar erros lexicais sem interromper a análise.

Apresentar o total de tokens e erros lexicais no final.

### Compilação e execução

Para compilar e executar o analisador lexical no Ubuntu ou WSL, é necessário ter o FLEX e o GCC instalados.

### Instalação

`sudo apt update
sudo apt install flex gcc libfl-dev`

### Compilação

Na pasta principal do projeto:

`flex -o lex.yy.c src/greenscript.l
gcc -Wall -Wextra lex.yy.c -o greenscript -lfl`

### Execução

`./greenscript caminho/do/ficheiro.txt`

O programa recebe o caminho do ficheiro a analisar como argumento.

Foram realizados dois testes iniciais para verificar o funcionamento do analisador.

### Testes realizados

Entrada:

`LIGAR(EST-AA01);`

Resultado:

```text
1 LIGAR          LIGAR
1 ABRE_PAR       (
1 ID_ESTUFA      EST-AA01
1 FECHA_PAR      )
1 PONTO_VIRG     ;
Tokens: 5 | Erros lexicais: 0
```

### Teste 2 — Erros lexicais e continuação da análise

Entrada:

```text
LIGARX
EST-AA001
REGAR(2,15);
```

Resultado:

```text
Erro lexical na linha 1: LIGARX
Erro lexical na linha 2: EST-AA001
4 REGAR          REGAR
4 ABRE_PAR       (
4 INTEIRO       2
4 VIRGULA        ,
4 INTEIRO       15
4 FECHA_PAR      )
4 PONTO_VIRG     ;
Tokens: 7 | Erros lexicais: 2
```

Os testes confirmaram que o programa reconhece tokens válidos, identifica erros lexicais, ignora comentários e continua a análise após encontrar erros.

## Ficheiros

- `expressoes_regulares.md` — Expressões regulares utilizadas na análise lexical.
- `DFA_Estufa.drawio` — Diagrama editável do DFA.
- `DFA__Estufa.drawio.png` — Imagem do DFA.
- `src/greenscript.l` — Implementação do analisador lexical em FLEX.


### Testes

Foram preparados nove ficheiros.

| Ficheiro | O que verifica | Totais esperados (tokens/erros) |
|---|---|---:|
| `01_comandos_simples.txt` | Comandos simples, comentário, identificador válido e delimitadores. | 33/0 |
| `02_espera_repeticao_condicao.txt` | `ESPERAR` e `REPETIR` com condição `SE`/`SENAO`. | 37/0 |
| `03_operadores_relacionais.txt` | Os seis operadores relacionais, sem espaços junto aos números. | 68/0 |
| `04_tokens_sem_sintaxe.txt` | Tokens válidos em comandos incompletos, incluindo `LIGAR()`. | 13/0 |
| `05_erros_lexicais_identificadores.txt` | Caracteres malformados, `@` e continuação da análise após erros. | 2/6 |
| `06_erros_lexicais_operadores.txt` | `=` e `!` isolados, `+`, `*` e operadores compostos. | 3/7 |
| `07_apenas_comentarios_e_separadores.txt` | Comentários, espaços, tabulações e linhas vazias. | 0/0 |
| `08_vazio.txt` | Ficheiro vazio e fim imediato da entrada. | 0/0 |
| `09_linhas_lf_crlf.txt` | Contagem de linhas com LF e CRLF. | 13/0 |

## Estado do projeto

- Expressões regulares — Concluídas.

- DFA dos identificadores de estufa — Concluído.

- Implementação do analisador lexical em FLEX — Concluída.

- Testes iniciais de funcionamento — Realizados com sucesso.

- Restantes testes e relatório final — Por concluir.
