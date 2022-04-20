Definitions.
N = [0-9]

Rules.
\s\n                : skip_token.
(\#).*              : {token, {comentario, TokenChars}}.
\'\'\'[^']*\'\'\'   : {token, {comentario_largo, TokenChars}}.
{N}+                : {token, {int, TokenChars}}.
{N}+(\.){N}+        : {token, {float, TokenChars}}.
(\").*(\")          : {token, {string, TokenChars}}.
True|False          : {token, {boolean, TokenChars}}.
[+-/%]|\*|\*\*|//   : {token, {operador, TokenChars}}.

Erlang code.