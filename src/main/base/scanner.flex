package com.codigo;
import java_cup.runtime.Symbol;
%%
%public
%class Lexer
%line
%column
%type java_cup.runtime.Symbol
%cup

%{
    private java_cup.runtime.Symbol symbol(int type) {
        return new java_cup.runtime.Symbol(type, yyline, yycolumn);
    }
    private java_cup.runtime.Symbol symbol(int type, Object value) {
        return new java_cup.runtime.Symbol(type, yyline, yycolumn, value);
        }
%}

LineTerminator = \r | \n | \r\n
Whitespace = {LineTerminator} | [ \t\f ]

//Tokens

Por = "For"
Mientras = "While"
Hacer = "Do"
Porcada = "Foreach"
Tipo_Numerico = "i32" | "u32" | "f64" | "BigInteger" | "byte" | "decimal" | "double" | "float" | "int" | "long" | "sbyte" | "short" | "uint" | "ulong" | "ushort" | "_BitInt" | "_Complex" | "_Decimal128" | "_Decimal32" | "_Decimal64" | "_Imaginary"
Operador_Aritmetico = "+" | "-" | "*" | "/" | "**" | "?"
Operador_Relacional = ">" | "<" | "==" | ">=" | "<=" | "<>" | "*>"
Operador_Asignamiento = "="
Operador_Desplazamiento = ">>"
Parametro_Entrada = "in"

Literal = \"([^\"\\]|\\[\"\\/bfnrt]|\\u[0-9a-fA-F]{4})*\"
Identificador = [a-zA-Z_][a-zA-Z0-9_]*
Numerico = [0-9]+
Punto = \.
puntocoma = \;
puntodoble = \:
LlaveAbierta = \{
LlaveCerrada = \}
ParentesisAbierto = \(
ParentesisCerrado = \)
CorcheteAbierto = \[
CorcheteCerrado = \]

%%

//reglas
{Por} { 
    return new Symbol(sym.POR, yytext()); 
}
{Hacer} { 
    return new Symbol(sym.HACER, yytext()); 
}
{Mientras} { 
    return new Symbol(sym.MIENTRAS, yytext()); 
}
{Porcada} { 
    return new Symbol(sym.PORCADA, yytext()); 
}
{Operador_Aritmetico} { 
    return new Symbol(sym.OPERADORARITMETICO, yytext()); 
}
{Operador_Relacional} { 
    return new Symbol(sym.OPERADORRELACIONAL, yytext()); 
}
{Operador_Asignamiento} { 
    return new Symbol(sym.OPERADORASIGNAMIENTO, yytext()); 
}
{Operador_Desplazamiento} { 
    return new Symbol(sym.OPERADORDESPLAZAMIENTO, yytext()); 
}
{Tipo_Numerico} { 
    return new Symbol(sym.TIPONUMERICO, yytext()); 
}
{Parametro_Entrada} {
    return new Symbol(sym.PARAMETROENTRADA, yytext());
}

{CorcheteAbierto} { 
    return new Symbol(sym.CORCHETEABIERTO, yytext());
}
{CorcheteCerrado} { 
    return new Symbol(sym.CORCHETECERRADO, yytext());
}
{LlaveAbierta} { 
    return new Symbol(sym.LLAVEABIERTA, yytext());
}
{LlaveCerrada} { 
    return new Symbol(sym.LLAVECERRADA, yytext());
}
{ParentesisAbierto} { 
    return new Symbol(sym.PARENTESISABIERTO, yytext());
}
{ParentesisCerrado} { 
    return new Symbol(sym.PARENTESISCERRADO, yytext());
}
{Numerico} { 
    return new Symbol(sym.NUMERICO, yytext());
}
{puntocoma} { 
    return new Symbol(sym.PUNTOCOMA, yytext());
}
{Punto} { 
    return new Symbol(sym.PUNTO, yytext());
}
{puntodoble} { 
    return new Symbol(sym.PUNTODOBLE, yytext());
}
{Literal} { 
    return new Symbol(sym.LITERAL, yytext());
}
{Identificador} {
    return new Symbol(sym.ID, yytext());
}

{Whitespace} { /* ignorar */ }

[^] { 
    return new Symbol(sym.ERROR, yytext());
}
