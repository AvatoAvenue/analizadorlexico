/* Lista de Instrucciones */
1. espacios //funciona
2. librerias //funciona
3. clases //funciona
4. funciones //funciona
5. estructuras //funciona
6. enums //funciona
7. interfaces //funciona
8. declaraciones //funciona
9. sis //funciona
10. mientras //funciona
11. mientrashacer //funciona
12. porpuro //funciona
13. porcadas //funciona
14. intentos //funciona
15. impresiones //funciona
16. escaneos //funciona
17. declaracionarreglos //funciona
18. declaracionlistas //funciona
19. lambdas //funciona
20. ternarios //funciona
21. selectors //funciona



/* Inicio */

inicios-> incio inicios | inicio

inicio-> espacios;

//expresiones
```
{
    expresiones;
}

if (a>b) {printo("hola");
```

bloqueexpresiones-> LLAVEABIERTA expresiones LLAVECERRADA

expresiones-> expresion expresiones | expresion


expresion ::= sis | mientras | mientrashacer | porpuro | porcadas | intentos

                | impresiones | escaneos | declaracion | declaracionarreglos

                | declaracionlistas | lambdas | ternarios | asignars 

                | selectors | enums



//condiciones

```
(a>b)
```

bloquecondiciones-> PARENTESISABIERTO condiciones PARENTESISCERRADO

condiciones-> condicion OPERADORCONLOGICO condiciones | condicion

condicion-> valor OPERADORRELACIONAL valor

//Parametros

```
(int a, int b, int c)

int a, int b, int c
```

bloqueparametros-> PARENTESISABIERTO parametrolista PARENTESISCERRADO

parametros-> parametrolista?

parametroslista-> parametro | parametrolista COMA parametro

parametro-> tipos ID

//valores

```
[{a,b,c}]

{a,b,c}

a,2,0
```

bloquevalores-> CORCHETEABIERTO listabloques CORCHETECERADO 

        | LLAVEABIERTA valores LLAVECERRADA

valores-> valor | valores COMA valor

valor-> LITERAL | NUMERICO | ID | bloqueoperaritmetics

/* espacios */

```
namespace espacio
{
    libreria;
    declaracion;
    clase;
}
```

espacios-> espacio espacios | espacio

espacio-> AGRUPACIONPRINCIPAL ID LLAVEABIERTA libreriasopcional

        declaracionesopcional clasesopcional LLAVECERRADA

clasesopcional-> clases?

libreriasopcional-> librerias?

declaracionesopcional-> declaraciones?

/* librerias */

```
using system;
```

librerias-> libreria librerias | libreria

libreria-> GESTIONRECURSOS ID PUNTOCOMA

/* clase */

```
public class Principal
{
    declaraciones;
    enums;
    funciones;
    estructuras;
    interfaces;
}
```

clases-> clase clases | clase

clase-> modificadoresacceso AGRUPACIONSECUNDARIA ID LLAVEABIERTA miembrosclase* LLAVECERRADA

modificadoresacceso-> MODIFICADORACCESO?

miembrosclase-> (miembroclase miembrosclase)?

miembroclase-> declaracion | enums | funciones | estructuras | interfaces

/* funcion */

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

funciones-> modificadoresacceso tipofuncionopcional DECLARACIONFUNCION ID 

    bloqueparametros LLAVEABIERTA expresiones 

    retornoopcional LLAVECERRADA

retornoopcional-> retornos?

tipofuncionopcional-> tipofuncion?

tipofuncion-> TIPONUMERICO | TIPOLOGICO | TIPOCADENA

retornos-> RETORNAR valor PUNTOCOMA

/* estructura */


```
struct c
{
    declaraciones;
}
```

estructuras-> AGRUPACIONESTRUCTURA ID bloquedeclaraciones

/* enums */

```
enum dias = {lunes, miercoles, jueves}
```

enums-> AGRUPACIONENUMERATOR ID OPERADORASIGNAMIENTO bloquevalores PUNTOCOMA

/* interfaz */

```
interface p {
    declaraciones;
}
```

interfaces-> AGRUPACIONINTERFAZ ID bloquedeclaraciones

/* declaracion */

```
int x;

int y = 0;

int x = 0, y;
```

bloquedeclaraciones-> LLAVEABIERTA declaraciones LLAVECERRADA

declaraciones-> declaracion | declaraciones declaracion

declaracion-> DEC tipos listadeclarar PUNTOCOMA

listadeclarar-> declarador | listadeclarar COMA declarador

declarador-> ID | ID OPERADORASIGNAMIENTO valor

asignars-> ID OPERADORASIGNAMIENTO valor PUNTOCOMA

/* Switch */

```
switch (cerveza)
    {
    case 1:
        expresiones;
        break;
    case 2:
        expresiones;
        return a;
    default:
        expresiones;
        break;
    }
```

selectors-> selector LLAVEABIERTA casos defectos LLAVECERRADA

            | selector LLAVEABIERTA defectos LLAVECERRADA 

            | selector LLAVEABIERTA casos LLAVECERRADA

selector-> SELECTOR PARENTESISABIERTO valor PARENTESISCERRADO

casos-> caso casos | caso

caso-> CASO valor PUNTODOBLE expresiones retornoalto

defectos-> DEFECTO PUNTODOBLE expresiones retornoalto

retornoalto-> retornos | alto

alto-> PARAR PUNTOCOMA

/* If */

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

/* While */

```
while (a<b):
    {
        expresiones;
    }
```

mientras-> MIENTRAS bloquecondiciones PUNTODOBLE bloqueexpresiones

/* dowhile */

```
dow (b>c):
{
    expresiones;
}
```

mientrashacer-> HACER bloquecondiciones PUNTODOBLE bloqueexpresiones

/* For */

```
for (let int = 0; i>>; x>i)
    {
        expresiones;
    }
```

porpuro-> POR PARENTESISABIERTO declaracion 

aumentodecremento condiciones PARENTESISCERRADO bloqueexpresiones

aumentodecremento-> ID OPERADORDESPLAZAMIENTO PUNTOCOMA

/* foreach */

```
foreach (int a in b):
    {
        expresiones;
    }
```

porcadas-> PORCADA PARENTESISABIERTO tipos ID PARAMETROENTRADA ID PARENTESISCERRADO

PUNTODOBLE bloqueexpresiones

tipos-> TIPOCADENA | TIPOINFERIDO | TIPONUMERICO | TIPOCARACTER

/* try */

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

/* imprimir */

```
printo("hola" + a + "b");
```

impresiones-> IMPRIMIR

    PARENTESISABIERTO oraciones PARENTESISCERRADO PUNTOCOMA

oraciones-> valor | oraciones MAS valor

/* escanear */

```
scani();
```

escaneos-> ESCANEAR PARENTESISABIERTO PARENTESISCERRADO PUNTOCOMA

/* arreglo */

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

dimensionesopcional-> dimensiones?

dimensiones-> NUMERICO | dimensiones COMA NUMERICO

/* Lista */

```
List[float] venta;

List[int] compra = {frutas,manzanas,naranjas};
```

declaracionlistas-> cuerpolista PUNTOCOMA | declaracionlista

declaracionlista-> cuerpolista OPERADORASIGNAMIENTO bloquevalores PUNTOCOMA 

cuerpolista-> LISTA CORCHETEABIERTO tipos CORCHETECERRADO ID

/* lambda */

```
cuadrado = (x) => (x * x);

(x) => (x * x);
```

lambdas-> ID OPERADORASIGNAMIENTO lambda PUNTOCOMA | lambda PUNTOCOMA

lambda-> bloqueparametros OPERADORRESULTADO cuerpolambda

cuerpolambda-> bloqueexpresiones | bloqueoperaritmetics

/* ternarios */

```
x = y ? "cierto" : "falso";
```

ternarios-> ID OPERADORASIGNAMIENTO bloquecondiciones 

    OPERADORTERNARIO valor PUNTODOBLE valor PUNTOCOMA

/* operacion aritmetica */

```
(a+b)

a+b

a+b+b

a*c+r

a-b/2
```

bloqueoperaritmetics = PARENTESISABIERTO operaritmetics PARENTESISCERRADO

operaritmetics-> operaritmetics MAS operaritmetic

    | operaritmetics MENOS operaritmetic

    | operaritmetic

operaritmetic-> operaritmetic MULTI idnum | operartimetic DIV idnum | idnum

idnum-> ID | NUMERICO
