/* Inicio */
inicios-> incio inicios | inicio
inicio-> espacios | instrucciones;

//instrucciones

```
if (a>b) {printo("hola");}
```

instrucciones-> instruccion instrucciones | instruccion
instruccion-> sis | mientras | mientrashacer | porpuro | porcadas | intentos 
| impresiones | escaneos | declaraciones | declaracionarreglos 
| declaracionlistas | lambdas | ternarios | retornos | rompers | asignars 
| funciones | selectors | enums | estucturas | interfaces 
| LLAVEABIERTA instrucciones LLAVECERRADA | ERRORL PUNTOCOMA

//expresiones

```
if (a>b) {printo("hola");}
```

bloqueexpresiones-> LLAVEABIERTA expresiones LLAVECERRADA
expresiones-> expresion expresiones | expresion
expresion-> sis | mientras | mientrashacer | porpuro | porcadas | intentos 
| impresiones | escaneos | declaracion | declaracionarreglos 
| declaracionlistas | lambdas | ternarios | retornos | rompers 
| asignars | selectors

condiciones-> condicion OPERADORCONLOGICO condiciones | condicion
condicion-> valor OPERADORRELACIONAL valor

//Parametros

```
int a, int b, int c
```

parametros-> parametrolista?
parametroslista-> parametro | parametrolista COMA parametro
parametro-> tipos ID

/* espacios */ //funciona

```
namespace espacio
{
    libreria;
    declaracion;
    clase;
}
```

espacios-> espacio espacios | espacio
espacio-> AGRUPACIONPRINCIPAL ID LLAVEABIERTA libreriasopcional declaracionesopcional clasesopcional LLAVECERRADA
clasesopcional-> clases?
libreriasopcional-> librerias?
declaracionesopcional-> declaraciones?

/* librerias */ //funciona

```
using system;
```

librerias-> libreria librerias | libreria
libreria-> GESTIONRECURSOS ID PUNTOCOMA

/* clase */ //funciona

```
public class Principal
{
    expresiones;
}
```

clases-> clase clases | clase
clase-> modificadoresacceso AGRUPACIONSECUNDARIA ID LLAVEABIERTA miembrosclase LLAVECERRADA
modificadoresacceso-> MODIFICADORACCESO?
miembrosclase-> (declaraciones | enums | funciones | estructuras | interfaces)?

/* funcion */ //pendientecorreccion

```
public function sinretorno()
{
    expresiones;
}

public bool function conretorno(int b, int c)
{
    expresiones;
    return true;
}
```

funciones-> funcion funciones | funcion

funcion-> funcionesnormales | funcionessinretorno

funcionessinretorno-> modificadoresacceso DECLARACIONFUNCION ID 
PARENTESISABIERTO parametros PARENTESISCERRADO bloqueexpresiones

funcionesnormales-> modificadoresacceso tipofuncion DECLARACIONFUNCION ID 
PARENTESISABIERTO parametros PARENTESISCERRADO
LLAVEABIERTA expresiones retornos LLAVECERRADA

tipofuncion-> TIPONUMERICO | TIPOLOGICO | TIPOCADENA
retornos-> RETORNAR valor PUNTOCOMA
valor-> LITERAL | NUMERICO | ID | PARENTESISABIERTO operaritmetics PARENTESISCERRADO

/* estructura */ //

struct c

```
{
    declaraciones;
}
```

estructuras-> AGRUPACIONESTRUCTURA ID bloquedeclaraciones
bloquedeclaraciones-> LLAVEABIERTA declaraciones LLAVECERRADA

/* enums */ //

```
enum dias {lunes, miercoles, jueves}
```

enums-> AGRUPACIONENUMERATOR ID LLAVEABIERTA valores LLAVECERRADA PUNTOCOMA

/* interfaz */ //

```
interface p {
    declaraciones;
}
```

interfaces-> AGRUPACIONINTERFAZ ID bloquedeclaraciones

/* declaracion */ //

```
int x;

int y = 0;
```
declaraciones-> declaracion | declaracion declaraciones
declaracion-> DEC tipos listadeclarar PUNTOCOMA
listadeclarar-> declarador | listadeclarar COMA declarador
declarador-> ID | ID OPERADORASIGNAMIENTO valor
asignars-> ID OPERADORASIGNAMIENTO valor PUNTOCOMA

/* Switch */ //funciona

```
switch (cerveza)
    case 1:
    {
        expresiones;
        break;
    }
    case 2:
    {
        expresiones;
        return a;
    }
    default:
    {
        expresiones;
        break;
    }
```

selectors-> selector casos defectos | selector defectos | selector casos
selector-> SELECTOR PARENTESISABIERTO valor PARENTESISCERRADO
casos-> caso casos | caso
caso-> CASO valor PUNTODOBLE bloqueswitch
defectos-> CASO valor PUNTODOBLE bloqueswitch
retornoalto-> retornos | alto
alto-> PARAR PUNTOCOMA
bloqueswitch-> LLAVEABIERTA expresiones retornoalto LLAVECERRADA

/* If */ //funciona

```
if (a>b)
    {
        expresiones;
    } elif (b==a)
    {
        expresiones;
    } else
    {
        expresiones;
    }
```

sis-> si sinoshacer sinos
sinos-> sino?
sinoshacer-> (sinohacer sinoshacer)?
si-> SI bloquecondiciones bloqueexpresiones
sinohacer-> SINOHACER bloquecondiciones bloqueexpresiones
sino-> SINO bloqueexpresiones

bloquecondiciones-> PARENTESISABIERTO condiciones PARENTESISCERRADO

/* While */ //funciona

```
while (a<b):
    {
        expresiones;
    }
```

mientras-> MIENTRAS bloquecondiciones bloqueexpresiones

/* dowhile */ //funciona

```
dow (b>c):
{
    expresiones;
}
```

mientrashacer-> HACER bloquecondiciones PUNTODOBLE bloqueexpresiones

/* For */ //

```
fur (let int i;)(i = 0;)(i>>;)[a>i]
    {
        expresiones;
    }
```

porpuro-> POR PARENTESISABIERTO declaracion 
aumentodecremento condiciones PARENTESISCERRADO bloqueexpresiones
aumentodecremento-> ID OPERADORDESPLAZAMIENTO PUNTOCOMA

#porpuro ::= POR PARENTESISABIERTO declaracion PARENTESISCERRADO
#       PARENTESISABIERTO asignars PARENTESISCERRADO
#       PARENTESISABIERTO aumentodecremento PARENTESISCERRADO
#       CORCHETEABIERTO condiciones CORCHETECERRADO
#       LLAVEABIERTA expresiones LLAVECERRADA;

/* foreach */ //funciona

```
foreach (int a in b):
    {
        expresiones;
    }
```

porcadas-> PORCADA PARENTESISABIERTO tipos ID PARAMETROENTRADA ID PARENTESISCERRADO
PUNTODOBLE bloqueexpresiones
tipos-> TIPOCADENA | TIPOINFERIDO | TIPONUMERICO | TIPOCARACTER

/* try */ //funciona

```
try { expresiones; }
catch { expresiones; }
finally { expresiones; }
```

intentos-> INTENTAR bloqueexpresiones atraparterminar
atraparterminar-> atrapars terminars | atrapars | terminars
atrapars-> atrapar atrapars | atrapar
atrapar-> ATRAPAR bloqueexpresiones
terminars-> TERMINAR bloqueexpresiones

/* imprimir */ //funciona

```
printo("hola" + a + "b");
```

impresiones-> IMPRIMIR PARENTESISABIERTO oraciones PARENTESISCERRADO PUNTOCOMA
oraciones-> valor | oraciones MAS valor

/* escanear */ //funciona

```
scani();
```

escaneos-> ESCANEAR PARENTESISABIERTO PARENTESISCERRADO PUNTOCOMA

/* arreglo */ //funciona

```
    int[2,3,4] precio;

    int[2,3,4] precio = [
        [
            [
                {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}  
            ],
            [
                {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}
            ],
            [
                {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}
            ]
        ],
        [
            [
                {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}
            ],
            [
                {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}
            ],
            [
                {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}
            ]
        ]
    ];
```

declaracionarreglos-> tipos CORCHETEABIERTO dimensionesopcional CORCHETECERRADO
ID asignamientovariables PUNTOCOMA
asignamientovariables-> (OPERADORASIGNAMIENTO listabloques)?
listabloques-> bloquevalores | listabloques COMA bloquevalores
bloquevalores-> CORCHETEABIERTO listabloques CORCHETECERRADO
| LLAVEABIERTA valores LLAVECERRADA
valores-> valor | valores COMA valor
dimensionesopcional-> dimensiones?
dimensiones-> NUMERICO | dimensiones COMA NUMERICO

/* Lista */ //

```
List[int] compra = {frutas,manzanas,naranjas};
```

declaracionlistas-> cuerpolista PUNTOCOMA | cuerpolista declaracionlista
declaracionlista-> cuerpolista OPERADORASIGNAMIENTO listabloques PUNTOCOMA 
cuerpolista-> LISTA CORCHETEABIERTO tipos CORCHETECERRADO ID
listabloques PUNTOCOMA

/* lambda */ //

```
cuadrado = (x) => (x * x);

(x) => (x * x)
```

lambdas-> lambdaasignar PUNTOCOMA | lambdaexpr PUNTOCOMA
lambdaasignar-> ID OPERADORASIGNAMIENTO lambdaexpr
lambdaexpr-> bloqueparametros OPERADORRESULTADO cuerpolambda
cuerpolambda-> bloqueexpresiones | expresion
bloqueparametros-> PARENTESISABIERTO parametrolista PARENTESISCERRADO

/* ternarios */ //

```
x = y ? "cierto" : "falso";
```

ternarios-> idop condiciones OPERADORTERNARIO valor PUNTODOBLE valor PUNTOCOMA

/* operacion aritmetica */ //funciona

```
a+b

a+b+b

a*c+r

a-b/2
```

operaritmetics-> operaritmetics MAS operaritmetic
| operaritmetics MENOS operaritmetic
| operaritmetic
operaritmetic-> operaritmetic MULTI idnum | operartimetic DIV idnum | idnum
idnum-> ID | NUMERICO
