package com.codigo;
%%
%public
%class Lexer
%type Token

%{
    public class Token {
        public String token;
        public String valor;
        public boolean MultiLex;

        public Token(String token, String valor, Boolean MultiLex) {
            this.token = token;
            this.valor = valor;
            this.MultiLex = MultiLex;
        }
    }
    java.util.List<Token> listaDeTokens = new java.util.ArrayList<>();
%}

%{
    private java.util.HashMap<String, Integer> identificadores = new java.util.HashMap<>();
    private int contadorId = 0;
%}

%{
    public java.util.List<Token> getTokens() {
        return listaDeTokens;
    }
%}

LineTerminator = \r | \n | \r\n
Whitespace = {LineTerminator} | [ \t\f ]

// Definiciones de Token
Pregunta = "if" | "switch"
Sino = "else" | "elif" | "ifdef" | "ifndef" | "elifdef" | "elifndef" | "unless"
Patron_Coincidencia = "match" | "case" | "when"
Ciclo = "for" | "while" | "loop" | "do" | "foreach" | "until" | "FOR"
Tipo_Compuesto = "struct" | "union"
Tipo_Enumeracion = "enum"
Declaracion_Funcion = "fn" | "def" | "function"
Declaracion_Variable = "let"
Tipo_Numerico = "i32" | "u32" | "f64" | "BigInteger" | "byte" | "decimal" | "double" | "float" | "int" | "long" | "sbyte" | "short" | "uint" | "ulong" | "ushort" | "_BitInt" | "_Complex" | "_Decimal128" | "_Decimal32" | "_Decimal64" | "_Imaginary"
Tipo_Logico = "bool" | "boolean" | "_Bool"
Tipo_Caracter = "char"
Tipo_Referencia = "Span" | "Memory" | "delegate" | "interface"
Modificador_Referencia = "ref" | "ref mut"
Operador_Modulo = "mod"
Modificador_Constante = "const"
Modificador_Alcance = "static" | "file"
Operador_Aritmetico = "+" | "-" | "*" | "/" | "**" | "=" | "?"
Operador_Comparacion = ">" | "<" | ">=" | "<=" | "*>"
Operador = "=="
Operador_Diferencia = "<>"
Operador_Desplazamiento = ">>"
Modificador_Clase = "abstract" | "sealed"
Conversion_Tipo = "as"
Referencia_Clase_Base = "base"
Miembro_Clase = "property" | "indexer" | "event" | "field"
Manejo_Excepciones = "catch" | "finally" | "try" | "except"
Alto = "break" | "ESCAPE"
Contexto_Verificacion = "checked"
Clase = "class"
Salto = "continue" | "goto"
Valor_Predeterminado = "default"
Unidad_Compilacion = "assembly" | "module"
Conversion_Explicita = "explicit"
Interoperabilidad = "extern" | "foreign"
Literal_Booleano = "FALSE" | "TRUE" | "True" | "False"
Anclaje_Memoria = "fixed"
Ambito_Variable = "global" | "golobal" | "nonlocal"
Informacion_Depuracion = "StackTrace"
Conversion_Implicita = "implicit"
Parametro_Entrada = "in"
Modificador_Acceso = "internal" | "private" | "protected" | "public"
Verificacion_Tipo = "is" | "instanceof" | "istanceOf"
Sincronizacion = "lock" | "Monitor" | "synchronized"
Agrupacion_Logica = "namespace"
Instanciacion = "new"
Literal_Referencia = "null" | "None" | "nil"
Tipo_Base = "object"
Sobrecarga_Operador = "operator"
Parametro_Salida = "out"
Redefinicion_Miembro = "override"
Parametro_Variable = "params"
Modificador_Inmutabilidad = "readonly" | "final"
Tipo_Excepcion = "Exception"
Retorno = "return"
Metadato_Tamano = "sizeof"
Asignacion_Pila = "stackalloc"
Excepcion_Argumento = "ArgumentException"
Tipo_Cadena = "string"
Excepcion_Estado = "InvalidOperationException"
Referencia_Instancia = "this" | "self"
Lanzamiento_Excepcion = "throw" | "raise"
Reflexion_Tipo = "typeof" | "typeof_unqual"
Contexto_No_Verificado = "unchecked"
Contexto_No_Seguro = "unsafe"
Gestion_Recursos = "using"
Modificador_Herencia = "virtual"
Tipo_Retorno = "void"
Modificador_Hilos = "volatile"
Metadato_Nombre = "nameof"
Operador_Agregacion = "add" | "ADD"
Modificador_Permiso = "allows"
Definicion_Alias = "alias"
Operador_Logico = "and" | "not" | "or"
Ordenamiento = "ascending" | "descending" | "orderby"
Parametro_Programa = "args"
Programacion_Asincrona = "async"
Espera_Asincrona = "await"
Tipo_Asincrono = "Task"
Tipo_Dinamico = "dynamic"
Comparacion_Igualdad = "equals"
Origen_Datos = "from"
Acceso_Propiedad = "get"
Agrupacion = "group"
Inicializacion = "init"
Continuacion = "into"
Combinacion = "join"
Gestion_Hilos = "Thread"
Gestion_Memoria = "managed" | "unmanaged"
Tipo_Nativo = "nint" | "nuint"
Restriccion_Tipo = "notnull"
Condicion_Combinacion = "on"
Definicion_Parcial = "partial"
Tipo_Estructura = "record"
Operador_Eliminacion = "remove"
Modificador_Inicializacion = "required"
Modificador_Vida_Util = "scoped"
Proyeccion = "select"
Asignacion_Propiedad = "set"
Contexto_Asignacion = "value"
Tipo_Inferido = "var"
Filtro = "where"
Operacion_Atomica = "Interlocked"
Inicializacion_Objeto = "with"
Generador = "yield"
Iteracion_Argumentos = "ArgIterator"
Igualador = "=>"
Operador_Nulo = "??"
Acceso_Indexado_Nulable = "?["
Acceso_Miembro_Nulable = "?."
Asignacion_Fusion_Nulos = "??="
Separador = ",,,"
Operador_Apuntador = "->"
Operador_Referencia = "&"
Punto_Entrada = "Main" | "ENTRY"
Tipo_Coleccion = "Dictionary"
Eliminacion_Referencia = "del"
Inclusion_Codigo = "import"
Funcion_Anonima = "lambda"
Verificacion_Condicion = "assert"
Entrada_Datos = "form"
Operacion_Nula = "pass"
Exportacion_Codigo = "export"
Agrupacion_Codigo = "package"
Funcion_Nativa = "native"
Referencia_Clase_Padre = "super"
Parametros_Funcion = "arguments"
Herencia_Clase = "extends"
Implementacion_Interfaz = "implements"
Modificador_Serializacion = "transient"
Evaluacion_Codigo = "eval"
Alineacion_Memoria = "alignas" | "_Alignas"
Metadato_Alineacion = "alignof" | "_Alignof"
Inferencia_Tipo = "auto"
Expresion_Constante = "constexpr"
Optimizacion_Codigo = "inline"
Sugerencia_Almacenamiento = "register"
Modificador_Optimizacion = "restrict"
Modificador_Signo = "signed" | "unsigned"
Verificacion_Compilacion = "static_assert" | "_Static_assert"
Almacenamiento_Hilo = "thread_local" | "_Thread_local"
Definicion_Tipo = "typedef" | "newtype" | "type"
Seleccion_Generica = "_Generic"
Modificador_Funcion = "_Noreturn"
Empaquetado_Estructura = "_packed"
Sino_Fin = "endif"
Macro_Definicion = "define"
Macro_Eliminacion = "undef"
Inclusion_Archivo = "include"
Incrustacion_Recurso = "embed"
Control_Linea = "line"
Error_Compilacion = "error"
Advertencia_Compilacion = "warning"
Directiva_Compilador = "pragma"
Verificacion_Macro = "defined"
Verificacion_Inclusion = "_has_include"
Verificacion_Recurso = "_has_embed"
Control_Iteracion = "redo" | "next"
Bloque_Inicio = "BEGIN" | "begin"
Bloque_Fin = "END"
Garantia_Ejecucion = "ensure"
Verificacion_Existencia = "defined?"
Reintento = "retry"
Definicion_Datos = "data"
Agrupacion_Datos = "data family"
Instancia_Datos = "data instance"
Generacion_Automatica = "deriving"
Instancia_Generada = "deriving instance"
Cuantificador_Universal = "forall"
Bloque_Monadico = "mdo"
Definicion_Operador = "infix" | "infixl" | "infixr"
Exclusion_Importacion = "hiding"
Definicion_Procedimiento = "proc"
Calificacion_Nombre = "qualified"
Recursion = "rec"
Agrupacion_Tipos = "type family"
Instancia_Tipo = "type instance"
Depuracion = "debugger"
Acceso = "ACCESS"
Avanzar = "ADVANCING"
Temporizacion = "AFTER"
Cuantificador = "ALL"
Terminacion_Anormal = "ABEND"
Referencia_Anterior = "PREVIOUS"
Posicionamiento = "POSITION"
Operacion_Limpieza = "ERASE"
Evaluacion = "EVALUATE"
Proceder = "PROCEED"
Gestion_Datos = "RECORDS"
Seleccion_Elemento = "FIRST" | "BOTTOM"
Notificacion = "BELL"
Sustitucion = "REPLACING"
Generacion_Codigo = "GENERATE"
Valor_Vacio = "BLANK"
Tipo_Binario = "BIT" | "BINARY-SHORT" | "BINARY-CHAR"

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
{Pregunta} { 
    Token t = new Token("pregunta", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Sino} { 
    Token t = new Token("sino", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Patron_Coincidencia} { 
    Token t = new Token("patron_coincidencia", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Ciclo} { 
    Token t = new Token("ciclo", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Compuesto} { 
    Token t = new Token("tipo_compuesto", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Enumeracion} { 
    Token t = new Token("tipo_enumeracion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Declaracion_Funcion} { 
    Token t = new Token("declaracion_funcion", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Declaracion_Variable} { 
    Token t = new Token("declaracion_variable", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Numerico} { 
    Token t = new Token("tipo_numerico", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Logico} { 
    Token t = new Token("tipo_logico", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Caracter} { 
    Token t = new Token("tipo_caracter", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Referencia} { 
    Token t = new Token("tipo_referencia", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Referencia} { 
    Token t = new Token("modificador_referencia", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Operador_Modulo} { 
    Token t = new Token("operador_modulo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Constante} { 
    Token t = new Token("modificador_constante", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Alcance} { 
    Token t = new Token("modificador_alcance", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Operador_Aritmetico} { 
    Token t = new Token("operador_aritmetico", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Operador_Comparacion} { 
    Token t = new Token("operador_comparacion", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Operador} { 
    Token t = new Token("operador", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Operador_Diferencia} { 
    Token t = new Token("operador_diferencia", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Operador_Desplazamiento} { 
    Token t = new Token("operador_desplazamiento", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Clase} { 
    Token t = new Token("modificador_clase", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Conversion_Tipo} { 
    Token t = new Token("conversion_tipo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Referencia_Clase_Base} { 
    Token t = new Token("referencia_clase_base", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Miembro_Clase} { 
    Token t = new Token("miembro_clase", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Manejo_Excepciones} { 
    Token t = new Token("manejo_excepciones", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Alto} { 
    Token t = new Token("alto", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Contexto_Verificacion} { 
    Token t = new Token("contexto_verificacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Clase} { 
    Token t = new Token("clase", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Salto} { 
    Token t = new Token("salto", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Valor_Predeterminado} { 
    Token t = new Token("valor_predeterminado", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Unidad_Compilacion} { 
    Token t = new Token("unidad_compilacion", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Conversion_Explicita} { 
    Token t = new Token("conversion_explicita", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Interoperabilidad} { 
    Token t = new Token("interoperabilidad", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Literal_Booleano} { 
    Token t = new Token("literal_booleano", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Anclaje_Memoria} { 
    Token t = new Token("anclaje_memoria", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Ambito_Variable} { 
    Token t = new Token("ambito_variable", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Informacion_Depuracion} { 
    Token t = new Token("informacion_depuracion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Conversion_Implicita} { 
    Token t = new Token("conversion_implicita", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Parametro_Entrada} { 
    Token t = new Token("parametro_entrada", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Acceso} { 
    Token t = new Token("modificador_acceso", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Verificacion_Tipo} { 
    Token t = new Token("verificacion_tipo", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Sincronizacion} { 
    Token t = new Token("sincronizacion", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Agrupacion_Logica} { 
    Token t = new Token("agrupacion_logica", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Instanciacion} { 
    Token t = new Token("instanciacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Literal_Referencia} { 
    Token t = new Token("literal_referencia", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Base} { 
    Token t = new Token("tipo_base", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Sobrecarga_Operador} { 
    Token t = new Token("sobrecarga_operador", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Parametro_Salida} { 
    Token t = new Token("parametro_salida", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Redefinicion_Miembro} { 
    Token t = new Token("redefinicion_miembro", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Parametro_Variable} { 
    Token t = new Token("parametro_variable", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Inmutabilidad} { 
    Token t = new Token("modificador_inmutabilidad", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Excepcion} { 
    Token t = new Token("tipo_excepcion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Retorno} { 
    Token t = new Token("retorno", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Metadato_Tamano} { 
    Token t = new Token("metadato_tamano", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Asignacion_Pila} { 
    Token t = new Token("asignacion_pila", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Excepcion_Argumento} { 
    Token t = new Token("excepcion_argumento", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Cadena} { 
    Token t = new Token("tipo_cadena", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Excepcion_Estado} { 
    Token t = new Token("excepcion_estado", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Referencia_Instancia} { 
    Token t = new Token("referencia_instancia", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Lanzamiento_Excepcion} { 
    Token t = new Token("lanzamiento_excepcion", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Reflexion_Tipo} { 
    Token t = new Token("reflexion_tipo", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Contexto_No_Verificado} { 
    Token t = new Token("contexto_no_verificado", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Contexto_No_Seguro} { 
    Token t = new Token("contexto_no_seguro", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Gestion_Recursos} { 
    Token t = new Token("gestion_recursos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Herencia} { 
    Token t = new Token("modificador_herencia", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Retorno} { 
    Token t = new Token("tipo_retorno", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Hilos} { 
    Token t = new Token("modificador_hilos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Metadato_Nombre} { 
    Token t = new Token("metadato_nombre", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Operador_Agregacion} { 
    Token t = new Token("operador_agregacion", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Permiso} { 
    Token t = new Token("modificador_permiso", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Definicion_Alias} { 
    Token t = new Token("definicion_alias", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Operador_Logico} { 
    Token t = new Token("operador_logico", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Ordenamiento} { 
    Token t = new Token("ordenamiento", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Parametro_Programa} { 
    Token t = new Token("parametro_programa", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Programacion_Asincrona} { 
    Token t = new Token("programacion_asincrona", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Espera_Asincrona} { 
    Token t = new Token("espera_asincrona", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Asincrono} { 
    Token t = new Token("tipo_asincrono", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Dinamico} { 
    Token t = new Token("tipo_dinamico", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Comparacion_Igualdad} { 
    Token t = new Token("comparacion_igualdad", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Origen_Datos} { 
    Token t = new Token("origen_datos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Acceso_Propiedad} { 
    Token t = new Token("acceso_propiedad", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Agrupacion} { 
    Token t = new Token("agrupacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Inicializacion} { 
    Token t = new Token("inicializacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Continuacion} { 
    Token t = new Token("continuacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Combinacion} { 
    Token t = new Token("combinacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Gestion_Hilos} { 
    Token t = new Token("gestion_hilos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Gestion_Memoria} { 
    Token t = new Token("gestion_memoria", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Nativo} { 
    Token t = new Token("tipo_nativo", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Restriccion_Tipo} { 
    Token t = new Token("restriccion_tipo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Condicion_Combinacion} { 
    Token t = new Token("condicion_combinacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Definicion_Parcial} { 
    Token t = new Token("definicion_parcial", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Estructura} { 
    Token t = new Token("tipo_estructura", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Operador_Eliminacion} { 
    Token t = new Token("operador_eliminacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Inicializacion} { 
    Token t = new Token("modificador_inicializacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Vida_Util} { 
    Token t = new Token("modificador_vida_util", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Proyeccion} { 
    Token t = new Token("proyeccion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Asignacion_Propiedad} { 
    Token t = new Token("asignacion_propiedad", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Contexto_Asignacion} { 
    Token t = new Token("contexto_asignacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Inferido} { 
    Token t = new Token("tipo_inferido", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Filtro} { 
    Token t = new Token("filtro", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Operacion_Atomica} { 
    Token t = new Token("operacion_atomica", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Inicializacion_Objeto} { 
    Token t = new Token("inicializacion_objeto", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Generador} { 
    Token t = new Token("generador", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Iteracion_Argumentos} { 
    Token t = new Token("iteracion_argumentos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Igualador} { 
    Token t = new Token("Igualador", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Operador_Nulo} { 
    Token t = new Token("operador_nulo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Acceso_Indexado_Nulable} { 
    Token t = new Token("acceso_indexado_nulable", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Acceso_Miembro_Nulable} { 
    Token t = new Token("acceso_miembro_nulable", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Asignacion_Fusion_Nulos} { 
    Token t = new Token("asignacion_fusion_nulos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Separador} { 
    Token t = new Token("separador", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Operador_Apuntador} { 
    Token t = new Token("operador_apuntador", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Operador_Referencia} { 
    Token t = new Token("operador_referencia", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Punto_Entrada} { 
    Token t = new Token("punto_entrada", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Coleccion} { 
    Token t = new Token("tipo_coleccion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Eliminacion_Referencia} { 
    Token t = new Token("eliminacion_referencia", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Inclusion_Codigo} { 
    Token t = new Token("inclusion_codigo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Funcion_Anonima} { 
    Token t = new Token("funcion_anonima", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Verificacion_Condicion} { 
    Token t = new Token("verificacion_condicion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Entrada_Datos} { 
    Token t = new Token("entrada_datos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Operacion_Nula} { 
    Token t = new Token("operacion_nula", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Exportacion_Codigo} { 
    Token t = new Token("exportacion_codigo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Agrupacion_Codigo} { 
    Token t = new Token("agrupacion_codigo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Funcion_Nativa} { 
    Token t = new Token("funcion_nativa", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Referencia_Clase_Padre} { 
    Token t = new Token("referencia_clase_padre", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Parametros_Funcion} { 
    Token t = new Token("parametros_funcion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Herencia_Clase} { 
    Token t = new Token("herencia_clase", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Implementacion_Interfaz} { 
    Token t = new Token("implementacion_interfaz", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Serializacion} { 
    Token t = new Token("modificador_serializacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Evaluacion_Codigo} { 
    Token t = new Token("evaluacion_codigo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Alineacion_Memoria} { 
    Token t = new Token("alineacion_memoria", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Metadato_Alineacion} { 
    Token t = new Token("metadato_alineacion", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Inferencia_Tipo} { 
    Token t = new Token("inferencia_tipo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Expresion_Constante} { 
    Token t = new Token("expresion_constante", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Optimizacion_Codigo} { 
    Token t = new Token("optimizacion_codigo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Sugerencia_Almacenamiento} { 
    Token t = new Token("sugerencia_almacenamiento", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Optimizacion} { 
    Token t = new Token("modificador_optimizacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Signo} { 
    Token t = new Token("modificador_signo", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Verificacion_Compilacion} { 
    Token t = new Token("verificacion_compilacion", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Almacenamiento_Hilo} { 
    Token t = new Token("almacenamiento_hilo", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Definicion_Tipo} { 
    Token t = new Token("definicion_tipo", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Seleccion_Generica} { 
    Token t = new Token("seleccion_generica", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Modificador_Funcion} { 
    Token t = new Token("modificador_funcion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Empaquetado_Estructura} { 
    Token t = new Token("empaquetado_estructura", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Sino_Fin} { 
    Token t = new Token("sino_fin", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Macro_Definicion} { 
    Token t = new Token("macro_definicion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Macro_Eliminacion} { 
    Token t = new Token("macro_eliminacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Inclusion_Archivo} { 
    Token t = new Token("inclusion_archivo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Incrustacion_Recurso} { 
    Token t = new Token("incrustacion_recurso", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Control_Linea} { 
    Token t = new Token("control_linea", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Error_Compilacion} { 
    Token t = new Token("error_compilacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Advertencia_Compilacion} { 
    Token t = new Token("advertencia_compilacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Directiva_Compilador} { 
    Token t = new Token("directiva_compilador", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Verificacion_Macro} { 
    Token t = new Token("verificacion_macro", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Verificacion_Inclusion} { 
    Token t = new Token("verificacion_inclusion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Verificacion_Recurso} { 
    Token t = new Token("verificacion_recurso", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Control_Iteracion} { 
    Token t = new Token("control_iteracion", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Bloque_Inicio} { 
    Token t = new Token("bloque_inicio", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Bloque_Fin} { 
    Token t = new Token("bloque_fin", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Garantia_Ejecucion} { 
    Token t = new Token("garantia_ejecucion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Verificacion_Existencia} { 
    Token t = new Token("verificacion_existencia", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Reintento} { 
    Token t = new Token("reintento", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Definicion_Datos} { 
    Token t = new Token("definicion_datos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Agrupacion_Datos} { 
    Token t = new Token("agrupacion_datos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Instancia_Datos} { 
    Token t = new Token("instancia_datos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Generacion_Automatica} { 
    Token t = new Token("generacion_automatica", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Instancia_Generada} { 
    Token t = new Token("instancia_generada", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Cuantificador_Universal} { 
    Token t = new Token("cuantificador_universal", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Bloque_Monadico} { 
    Token t = new Token("bloque_monadico", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Definicion_Operador} { 
    Token t = new Token("definicion_operador", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Exclusion_Importacion} { 
    Token t = new Token("exclusion_importacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Definicion_Procedimiento} { 
    Token t = new Token("definicion_procedimiento", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Calificacion_Nombre} { 
    Token t = new Token("calificacion_nombre", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Recursion} { 
    Token t = new Token("recursion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Agrupacion_Tipos} { 
    Token t = new Token("agrupacion_tipos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Instancia_Tipo} { 
    Token t = new Token("instancia_tipo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Depuracion} { 
    Token t = new Token("depuracion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Acceso} { 
    Token t = new Token("acceso", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Avanzar} { 
    Token t = new Token("avanzar", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Temporizacion} { 
    Token t = new Token("temporizacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Cuantificador} { 
    Token t = new Token("cuantificador", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Terminacion_Anormal} { 
    Token t = new Token("terminacion_anormal", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Referencia_Anterior} { 
    Token t = new Token("referencia_anterior", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Posicionamiento} { 
    Token t = new Token("posicionamiento", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Operacion_Limpieza} { 
    Token t = new Token("operacion_limpieza", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Evaluacion} { 
    Token t = new Token("evaluacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Proceder} { 
    Token t = new Token("proceder", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Gestion_Datos} { 
    Token t = new Token("gestion_datos", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Seleccion_Elemento} { 
    Token t = new Token("seleccion_elemento", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}
{Notificacion} { 
    Token t = new Token("notificacion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Sustitucion} { 
    Token t = new Token("sustitucion", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Generacion_Codigo} { 
    Token t = new Token("generacion_codigo", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Valor_Vacio} { 
    Token t = new Token("valor_vacio", yytext(), false); 
    listaDeTokens.add(t);
    return t; 
}
{Tipo_Binario} { 
    Token t = new Token("tipo_binario", yytext(), true); 
    listaDeTokens.add(t);
    return t; 
}

{CorcheteAbierto} { 
    Token t = new Token("CorcheteAbierto", yytext(), false);
    listaDeTokens.add(t);
    return t;
}
{CorcheteCerrado} { 
    Token t = new Token("CorcheteCerrado", yytext(), false);
    listaDeTokens.add(t);
    return t;
}
{LlaveAbierta} { 
    Token t = new Token("LlaveAbierta", yytext(), false);
    listaDeTokens.add(t);
    return t;
}
{LlaveCerrada} { 
    Token t = new Token("LlaveCerrada", yytext(), false);
    listaDeTokens.add(t);
    return t;
}
{ParentesisAbierto} { 
    Token t = new Token("ParentesisAbierto", yytext(), false);
    listaDeTokens.add(t);
    return t;
}
{ParentesisCerrado} { 
    Token t = new Token("ParentesisCerrado", yytext(), false);
    listaDeTokens.add(t);
    return t;
}
{Numerico} { 
    Token t = new Token("Numerico", yytext(), false);
    listaDeTokens.add(t);
    return t;
}
{puntocoma} { 
    Token t = new Token("puntocoma", yytext(), false);
    listaDeTokens.add(t);
    return t;
}
{Punto} { 
    Token t = new Token("Punto", yytext(), false);
    listaDeTokens.add(t);
    return t;
}
{puntodoble} { 
    Token t = new Token("puntodoble", yytext(), false);
    listaDeTokens.add(t);
    return t;
}
{Literal} { 
    Token t = new Token("Literal", yytext(), false);
    listaDeTokens.add(t);
    return t;
}
{Identificador} {
    String text = yytext();
    int numero = identificadores.computeIfAbsent(text, k -> contadorId++);
    Token t = new Token("Identificador", String.valueOf(numero), true);
    listaDeTokens.add(t);
    return t;
}



{Whitespace} { /* ignorar */ }

[^] { 
    Token t = new Token("Error", yytext(), true);
    listaDeTokens.add(t);
    return t;
}
