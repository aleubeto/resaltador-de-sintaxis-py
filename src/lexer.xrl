Definitions.
D = [0-9]
L = [a-zA-Z]

Rules.
\s\n                : skip_token.
{L}+                : {token, {identificador, TokenChars}}.
(\#).*              : {token, {comentario, TokenChars}}.
\'\'\'[^']*\'\'\'   : {token, {comentario_largo, TokenChars}}.
{D}+                : {token, {int, TokenChars}}.
{D}+(\.){D}+        : {token, {float, TokenChars}}.
(\").*(\")          : {token, {string, TokenChars}}.
True|False          : {token, {boolean, TokenChars}}.
[+-/%]|\*|\*\*|//   : {token, {operador, TokenChars}}.

Erlang code.