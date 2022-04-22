Definitions.

D = [0-9]
L = [a-z|A-Z|\_]

Rules.

% FUNCIONES Y MÉTODOS
print|input|type    : {token, {funcion, TokenChars}}.
list|set|tuple      : {token, {funcion, TokenChars}}.
lambda              : {token, {funcion, TokenChars}}.
def|return          : {token, {funcion, TokenChars}}.
\.[^\(]+            : {token, {metodo, TokenChars}}.

%CICLOS
while|for           : {token, {ciclo, TokenChars}}.

%CONDICIONALES
if|elif|else        : {token, {condicionales, TokenChars}}.

% COMENTARIOS
(\#).*              : {token, {comentario, TokenChars}}.
\'\'\'[^']*\'\'\'   : {token, {comentario_largo, TokenChars}}.

% DATOS
{D}+                : {token, {int, TokenChars}}.
{D}+(\.){D}+        : {token, {float, TokenChars}}.
(\").*(\")          : {token, {string, TokenChars}}.
True|False          : {token, {boolean, TokenChars}}.

% OPERADORES
[<>]|==|!=          : {token, {operador_logico, TokenChars}}.
and|or|not|in|is    : {token, {operador_logico, TokenChars}}.
[+-/%]|\|\\*|//   : {token, {operador_aritmetico, TokenChars}}.
[=]|[+=]|[-=]|[\*=] : {token, {operador_asignacion, TokenChars}}.

% PUNTUACIÓN
,                   : {token, {coma, TokenChars}}.
\:                  : {token, {dos_puntos, TokenChars}}.
\(|\)               : {token, {parentesis, TokenChars}}.
{|}                 : {token, {llaves, TokenChars}}.
\[|\]               : {token, {corchetes, TokenChars}}.

% PALABRAS RESERVADAS
continue|break      : {token, {palabra_reservada, TokenChars}}.
class|del           : {token, {palabra_reservada, TokenChars}}.

% SINTAXIS BÁSICA
{L}+                : {token, {identificador, TokenChars}}.
\s|\n               : skip_token.

Erlang code.