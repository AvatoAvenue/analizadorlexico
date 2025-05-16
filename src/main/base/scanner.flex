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
Por = "fur"
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
    return new Symbol(sym.AGRUPACIONPRINCIPAL, yytext()); 
}
{Agrupacion_Secundaria} { 
    return new Symbol(sym.AGRUPACIONSECUNDARIA, yytext()); 
}
{Declaracion_Funcion} { 
    return new Symbol(sym.DECLARACIONFUNCION, yytext()); 
}
{Agrupacion_Estructura} { 
    return new Symbol(sym.AGRUPACIONESTRUCTURA, yytext()); 
}
{Agrupacion_Enumerator} { 
    return new Symbol(sym.AGRUPACIONENUMERATOR, yytext()); 
}
{Agrupacion_Interfaz} { 
    return new Symbol(sym.AGRUPACIONINTERFAZ, yytext()); 
}

{Lista} { 
    return new Symbol(sym.LISTA, yytext()); 
}

{Si} { 
    return new Symbol(sym.SI, yytext()); 
}
{Sino} { 
    return new Symbol(sym.SINO, yytext()); 
}
{Sinohacer} { 
    return new Symbol(sym.SINOHACER, yytext()); 
}
{Por} { 
    return new Symbol(sym.POR, yytext()); 
}
{Hacer} { 
    return new Symbol(sym.HACER, yytext()); 
}
{Mientras} { 
    return new Symbol(sym.MIENTRAS, yytext()); 
}
{Selector} { 
    return new Symbol(sym.SELECTOR, yytext()); 
}
{Caso} { 
    return new Symbol(sym.CASO, yytext()); 
}
{Defecto} { 
    return new Symbol(sym.DEFECTO, yytext()); 
}
{Porcada} { 
    return new Symbol(sym.PORCADA, yytext()); 
}
{Intentar} { 
    return new Symbol(sym.INTENTAR, yytext()); 
}
{Atrapar} { 
    return new Symbol(sym.ATRAPAR, yytext()); 
}
{Terminar} { 
    return new Symbol(sym.TERMINAR, yytext()); 
}
{Imprimir} { 
    return new Symbol(sym.IMPRIMIR, yytext()); 
}
{Escanear} { 
    return new Symbol(sym.ESCANEAR, yytext()); 
}

{Retornar} { 
    return new Symbol(sym.RETORNAR, yytext()); 
}
{Parar} { 
    return new Symbol(sym.PARAR, yytext()); 
}

{Mas} { 
    return new Symbol(sym.MAS, yytext()); 
}
{Menos} { 
    return new Symbol(sym.MENOS, yytext()); 
}
{Multi} { 
    return new Symbol(sym.MULTI, yytext()); 
}
{Div} { 
    return new Symbol(sym.DIV, yytext()); 
}

{Operador_Relacional} { 
    return new Symbol(sym.OPERADORRELACIONAL, yytext()); 
}
{Operador_Asignamiento} { 
    return new Symbol(sym.OPERADORASIGNAMIENTO, yytext()); 
}
{Operador_Resultado} { 
    return new Symbol(sym.OPERADORRESULTADO, yytext()); 
}
{Operador_Desplazamiento} { 
    return new Symbol(sym.OPERADORDESPLAZAMIENTO, yytext()); 
}
{Operador_ternario} { 
    return new Symbol(sym.OPERADORTERNARIO, yytext()); 
}
{Operador_ConLogico} { 
    return new Symbol(sym.OPERADORCONLOGICO, yytext()); 
}

{Tipo_Numerico} { 
    return new Symbol(sym.TIPONUMERICO, yytext()); 
}
{Tipo_Caracter} { 
    return new Symbol(sym.TIPOCARACTER, yytext()); 
}
{Tipo_Logico} { 
    return new Symbol(sym.TIPOLOGICO, yytext()); 
}
{Tipo_Cadena} { 
    return new Symbol(sym.TIPOCADENA, yytext()); 
}
{Tipo_Inferido} { 
    return new Symbol(sym.TIPOINFERIDO, yytext()); 
}

{Dec} {
    return new Symbol(sym.DEC, yytext());
}
{Parametro_Entrada} {
    return new Symbol(sym.PARAMETROENTRADA, yytext());
}
{Gestion_Recursos} {
    return new Symbol(sym.GESTIONRECURSOS, yytext());
}
{Modificador_Acceso} {
    return new Symbol(sym.MODIFICADORACCESO, yytext());
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
{Coma} { 
    return new Symbol(sym.COMA, yytext());
}
{PuntoComa} { 
    return new Symbol(sym.PUNTOCOMA, yytext());
}
{Punto} { 
    return new Symbol(sym.PUNTO, yytext());
}
{PuntoDoble} { 
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
    return new Symbol(sym.ERRORL, yytext());
}
