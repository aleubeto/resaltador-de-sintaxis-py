Definitions.
N = [0-9]

Rules.
\s      : skip_token.
(\#).*  : {token, {comentario, TokenChars}}.
{N}+    : {token, {int, TokenChars}}.
{N}+(\.){N}+  : {token, {float, TokenChars}}.

Erlang code.