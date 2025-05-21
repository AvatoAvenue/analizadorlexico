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

Agrupacion_Principal = "namespace"
Agrupacion_Secundaria = "class"
Declaracion_Funcion = "function"
Agrupacion_Estructura = "struct"
Agrupacion_Enumerator = "enum"
Agrupacion_Interfaz = "interface"

Lista = "List"

Si = "if"
Sino = "else"
Sinohacer = "elif"
Por = "for"
Mientras = "while"
Hacer = "dow"
Selector = "switch"
Caso = "case"
Defecto = "default"
Porcada = "foreach"
Intentar = "try"
Atrapar = "catch"
Terminar = "finally"
Imprimir = "printo"
Escanear = "scani"

Retornar = "return"
Parar = "break"

Tipo_Numerico = "i32" | "u32" | "f64" | "BigInteger" | "byte" | "decimal" | "double" | "float" | "int" | "long" | "sbyte" | "short" | "uint" | "ulong" | "ushort" | "_BitInt" | "_Complex" | "_Decimal128" | "_Decimal32" | "_Decimal64" | "_Imaginary"
Tipo_Logico = "bool"
Tipo_Caracter = "char"
Tipo_Cadena = "string"
Tipo_Inferido = "var"

Mas = "+"
Menos = "-"
Multi = "*"
Div = "/"

Operador_Relacional = ">" | "<" | "==" | ">=" | "<=" | "<>" | "*>"
Operador_Asignamiento = "="
Operador_Resultado = "=>"
Operador_Desplazamiento = ">>"
Operador_ternario = "?"
Operador_ConLogico = "&&" | "||"

Dec = "let"
Parametro_Entrada = "in"
Gestion_Recursos = "using"
Modificador_Acceso = "internal" | "private" | "protected" | "public"

Literal = \"([^\"\\]|\\[\"\\/bfnrt]|\\u[0-9a-fA-F]{4})*\"
Identificador = [a-zA-Z_][a-zA-Z0-9_]*
Numerico = [0-9]+
Punto = \.
Coma = \,
PuntoComa = \;
PuntoDoble = \:
LlaveAbierta = \{
LlaveCerrada = \}
ParentesisAbierto = \(
ParentesisCerrado = \)
CorcheteAbierto = \[
CorcheteCerrado = \]

%%

//reglas
{Agrupacion_Principal} { 
    return new Symbol(sym.AGRUPACIONPRINCIPAL, yyline+1, yycolumn+1, yytext()); 
}
{Agrupacion_Secundaria} { 
    return new Symbol(sym.AGRUPACIONSECUNDARIA, yyline+1, yycolumn+1, yytext()); 
}
{Declaracion_Funcion} { 
    return new Symbol(sym.DECLARACIONFUNCION, yyline+1, yycolumn+1, yytext()); 
}
{Agrupacion_Estructura} { 
    return new Symbol(sym.AGRUPACIONESTRUCTURA, yyline+1, yycolumn+1, yytext()); 
}
{Agrupacion_Enumerator} { 
    return new Symbol(sym.AGRUPACIONENUMERATOR, yyline+1, yycolumn+1, yytext()); 
}
{Agrupacion_Interfaz} { 
    return new Symbol(sym.AGRUPACIONINTERFAZ, yyline+1, yycolumn+1, yytext()); 
}

{Lista} { 
    return new Symbol(sym.LISTA, yyline+1, yycolumn+1, yytext()); 
}

{Si} { 
    return new Symbol(sym.SI, yyline+1, yycolumn+1, yytext()); 
}
{Sino} { 
    return new Symbol(sym.SINO, yyline+1, yycolumn+1, yytext()); 
}
{Sinohacer} { 
    return new Symbol(sym.SINOHACER, yyline+1, yycolumn+1, yytext()); 
}
{Por} { 
    return new Symbol(sym.POR, yyline+1, yycolumn+1, yytext()); 
}
{Hacer} { 
    return new Symbol(sym.HACER, yyline+1, yycolumn+1, yytext()); 
}
{Mientras} { 
    return new Symbol(sym.MIENTRAS, yyline+1, yycolumn+1, yytext()); 
}
{Selector} { 
    return new Symbol(sym.SELECTOR, yyline+1, yycolumn+1, yytext()); 
}
{Caso} { 
    return new Symbol(sym.CASO, yyline+1, yycolumn+1, yytext()); 
}
{Defecto} { 
    return new Symbol(sym.DEFECTO, yyline+1, yycolumn+1, yytext()); 
}
{Porcada} { 
    return new Symbol(sym.PORCADA, yyline+1, yycolumn+1, yytext()); 
}
{Intentar} { 
    return new Symbol(sym.INTENTAR, yyline+1, yycolumn+1, yytext()); 
}
{Atrapar} { 
    return new Symbol(sym.ATRAPAR, yyline+1, yycolumn+1, yytext()); 
}
{Terminar} { 
    return new Symbol(sym.TERMINAR, yyline+1, yycolumn+1, yytext()); 
}
{Imprimir} { 
    return new Symbol(sym.IMPRIMIR, yyline+1, yycolumn+1, yytext()); 
}
{Escanear} { 
    return new Symbol(sym.ESCANEAR, yyline+1, yycolumn+1, yytext()); 
}

{Retornar} { 
    return new Symbol(sym.RETORNAR, yyline+1, yycolumn+1, yytext()); 
}
{Parar} { 
    return new Symbol(sym.PARAR, yyline+1, yycolumn+1, yytext()); 
}

{Mas} { 
    return new Symbol(sym.MAS, yyline+1, yycolumn+1, yytext()); 
}
{Menos} { 
    return new Symbol(sym.MENOS, yyline+1, yycolumn+1, yytext()); 
}
{Multi} { 
    return new Symbol(sym.MULTI, yyline+1, yycolumn+1, yytext()); 
}
{Div} { 
    return new Symbol(sym.DIV, yyline+1, yycolumn+1, yytext()); 
}

{Operador_Relacional} { 
    return new Symbol(sym.OPERADORRELACIONAL, yyline+1, yycolumn+1, yytext()); 
}
{Operador_Asignamiento} { 
    return new Symbol(sym.OPERADORASIGNAMIENTO, yyline+1, yycolumn+1, yytext()); 
}
{Operador_Resultado} { 
    return new Symbol(sym.OPERADORRESULTADO, yyline+1, yycolumn+1, yytext()); 
}
{Operador_Desplazamiento} { 
    return new Symbol(sym.OPERADORDESPLAZAMIENTO, yyline+1, yycolumn+1, yytext()); 
}
{Operador_ternario} { 
    return new Symbol(sym.OPERADORTERNARIO, yyline+1, yycolumn+1, yytext()); 
}
{Operador_ConLogico} { 
    return new Symbol(sym.OPERADORCONLOGICO, yyline+1, yycolumn+1, yytext()); 
}

{Tipo_Numerico} { 
    return new Symbol(sym.TIPONUMERICO, yyline+1, yycolumn+1, yytext()); 
}
{Tipo_Caracter} { 
    return new Symbol(sym.TIPOCARACTER, yyline+1, yycolumn+1, yytext()); 
}
{Tipo_Logico} { 
    return new Symbol(sym.TIPOLOGICO, yyline+1, yycolumn+1, yytext()); 
}
{Tipo_Cadena} { 
    return new Symbol(sym.TIPOCADENA, yyline+1, yycolumn+1, yytext()); 
}
{Tipo_Inferido} { 
    return new Symbol(sym.TIPOINFERIDO, yyline+1, yycolumn+1, yytext()); 
}

{Dec} {
    return new Symbol(sym.DEC, yyline+1, yycolumn+1, yytext());
}
{Parametro_Entrada} {
    return new Symbol(sym.PARAMETROENTRADA, yyline+1, yycolumn+1, yytext());
}
{Gestion_Recursos} {
    return new Symbol(sym.GESTIONRECURSOS, yyline+1, yycolumn+1, yytext());
}
{Modificador_Acceso} {
    return new Symbol(sym.MODIFICADORACCESO, yyline+1, yycolumn+1, yytext());
}

{CorcheteAbierto} { 
    return new Symbol(sym.CORCHETEABIERTO, yyline+1, yycolumn+1, yytext());
}
{CorcheteCerrado} { 
    return new Symbol(sym.CORCHETECERRADO, yyline+1, yycolumn+1, yytext());
}
{LlaveAbierta} { 
    return new Symbol(sym.LLAVEABIERTA, yyline+1, yycolumn+1, yytext());
}
{LlaveCerrada} { 
    return new Symbol(sym.LLAVECERRADA, yyline+1, yycolumn+1, yytext());
}
{ParentesisAbierto} { 
    return new Symbol(sym.PARENTESISABIERTO, yyline+1, yycolumn+1, yytext());
}
{ParentesisCerrado} { 
    return new Symbol(sym.PARENTESISCERRADO, yyline+1, yycolumn+1, yytext());
}
{Numerico} { 
    return new Symbol(sym.NUMERICO, yyline+1, yycolumn+1, yytext());
}
{Coma} { 
    return new Symbol(sym.COMA, yyline+1, yycolumn+1, yytext());
}
{PuntoComa} { 
    return new Symbol(sym.PUNTOCOMA, yyline+1, yycolumn+1, yytext());
}
{Punto} { 
    return new Symbol(sym.PUNTO, yyline+1, yycolumn+1, yytext());
}
{PuntoDoble} { 
    return new Symbol(sym.PUNTODOBLE, yyline+1, yycolumn+1, yytext());
}
{Literal} { 
    return new Symbol(sym.LITERAL, yyline+1, yycolumn+1, yytext());
}
{Identificador} {
    return new Symbol(sym.ID, yyline+1, yycolumn+1, yytext());
}

{Whitespace} { /* ignorar */ }

[^] { 
    return new Symbol(sym.ERRORL, yyline+1, yycolumn+1, yytext());
}
