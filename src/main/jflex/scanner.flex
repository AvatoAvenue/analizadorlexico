%%
%class Lexer              // Nombre de la clase
%standalone
%public                    // Hacer la clase pública
%unicode
%line
%column

// Palabras reservadas
RESERVADA = "if"|"else"|"while"|"for"

// Identificadores
ID = [a-zA-Z_][a-zA-Z0-9_]*

%%
{RESERVADA}   { System.out.println("Palabra reservada: " + yytext()); }
{ID}          { System.out.println("Identificador: " + yytext()); }
[ \t\n\r]     { /* Ignorar espacios */ }
.             { System.out.println("Carácter no válido: " + yytext()); }
