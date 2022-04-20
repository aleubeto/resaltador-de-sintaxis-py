Definitions.
D = [0-9]
L = [a-zA-Z]
IMPRIMIR = print
CONDICIONALES = if|elif|else
OPERADORES_LOGICOS = and|or|not
BUCLES = while|for|continue|break
LISTAS = list|set|tuple
FUNCIONES = def|return|lambda
CLASES = class
PERTENENCIA_E_INDENTIDAD = in|is
ELIMINAR_VARIABLES = del

Rules.
\s|\n               : skip_token.
{L}+                : {token, {identificador, TokenChars}}.
(\#).*              : {token, {comentario, TokenChars}}.
\'\'\'[^']*\'\'\'   : {token, {comentario_largo, TokenChars}}.
{D}+                : {token, {int, TokenChars}}.
{D}+(\.){D}+        : {token, {float, TokenChars}}.
(\").*(\")          : {token, {string, TokenChars}}.
True|False          : {token, {boolean, TokenChars}}.
[+-/%]|\*|\*\*|//   : {token, {operador, TokenChars}}.
\(|\)               : {token, {parentesis, TokenChars}}.
{|}                 : {token, {llaves, TokenChars}}.
\[|\]               : {token, {corchetes, TokenChars}}.

Erlang code.