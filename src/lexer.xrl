Definitions.

D = [0-9]
L = [a-z|A-Z|\_]

Rules.

% FUNCIONES Y MÉTODOS
print|input|type    : {token, {funcion, TokenLine, TokenChars}}.
list|set|tuple      : {token, {funcion, TokenLine, TokenChars}}.
lambda              : {token, {funcion, TokenLine, TokenChars}}.
def|return          : {token, {funcion, TokenLine, TokenChars}}.
\.[^\(]+            : {token, {metodo, TokenLine, TokenChars}}.

% CICLOS
while|for           : {token, {ciclo, TokenLine, TokenChars}}.

% CONDICIONAL
if|elif|else        : {token, {condicional, TokenLine, TokenChars}}.

% COMENTARIOS
(\#).*              : {token, {comentario, TokenLine, TokenChars}}.
\'\'\'[^']*\'\'\'   : {token, {comentario_largo, TokenLine, TokenChars}}.

% DATOS
{D}+                : {token, {int, TokenLine, TokenChars}}.
{D}+(\.){D}+        : {token, {float, TokenLine, TokenChars}}.
(\").*(\")          : {token, {string, TokenLine, TokenChars}}.
(\').*(\')          : {token, {string, TokenLine, TokenChars}}.
True|False          : {token, {boolean, TokenLine, TokenChars}}.

% PUNTUACIÓN
\,|\:|\.            : {token, {puntuacion, TokenLine, TokenChars}}.
\(|\)               : {token, {parentesis, TokenLine, TokenChars}}.
{|}                 : {token, {llaves, TokenLine, TokenChars}}.
\[|\]               : {token, {corchetes, TokenLine, TokenChars}}.
\s                  : {token, {espacio, TokenLine, TokenChars}}.
\s\s\s\s|\t         : {token, {tab, TokenLine, TokenChars}}.

% OPERADORES
[<>]|==|!=          : {token, {operador_logico, TokenLine, TokenChars}}.
and|or|not|in|is    : {token, {operador_logico, TokenLine, TokenChars}}.
[+-/%]|\|\\*|//   : {token, {operador_aritmetico, TokenLine, TokenChars}}.
[=]|[+=]|[-=]|[\*=] : {token, {operador_asignacion, TokenLine, TokenChars}}.

% PALABRAS RESERVADAS
continue|break      : {token, {palabra_reservada, TokenLine, TokenChars}}.
class|del           : {token, {palabra_reservada, TokenLine, TokenChars}}.

% SINTAXIS BÁSICA
{L}+                : {token, {identificador, TokenLine, TokenChars}}.
\n                  : skip_token.

Erlang code.