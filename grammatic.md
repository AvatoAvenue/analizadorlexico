/* inicio */

inicios = inicio iniciosopcional.

iniciosopcional = (inicio iniciosopcional)?.

inicio = espacio.

/* espacios */

```
namespace espacio
{

}
```

espacio = AGRUPACION ID LLAVEABIERTA libreriaopcional 

declaracionesopcional clasesopcional LLAVECERRADA.

claseopcional = clases?.

libreriaopcional = librerias?.

declaracionesopcional = declaraciones?.

/* librerias */

```
using system;
```

librerias = libreria libreriasopcional.

libreriasopcional = (libreria libreriasopcional)?

libreria = GESTIONRECURSOS ID PUNTOCOMA.

/* clases */

```
public class Principal
{

}
```

clases = clase clasesopcional.

clase = modificadoracceso AGRUPACIONSECUNDARIA 

ID LLAVEABIERTA miembrosclase LLAVECERRADA.

modificadoresacceso = MODIFICADORACCESO?.

miembrosclase = (miembroclase miembrosclase)?.

miembroclase = declaracion | enums | funciones | estructuras | interfaces.

/* funciones */

```
public bool function sinretorno(int b, int c)
{
    expresiones;
}
```

funciones = modificadoresacceso tipofuncionopcional 

DECLARACIONFUNCION ID bloqueparametrosopcional LLAVEABIERTA 

expresiones retornoopcional LLAVECERRADA.

retornoopcional = retornos?.

tipofuncionopcional = tipofuncion?.

tipofuncion = TIPONUMERICO | TIPOLOGICO | TIPOCADENA.

retornos = RETORNAR valor PUNTOCOMA.

bloqueexpresiones = LLAVEABIERTA expresiones LLAVECERRADA.

expresiones = expresion expresionesopcional.

expresionesopcional = (expresion expresionesopcional)?.

expresion = sis | mientras | mientrashacer | porpuro | porcadas 

| intentos | impresiones | escaneos | declaracion | declaracionarreglos 

| declaracionlistas | lambdas | ternarios | asignars | selectors | enums.

bloqueparametros = PARENTESISABIERTO parametros PARENTESISCERRADO.

bloqueparametrosopcional = bloqueparametros  

| PARENTESISABIERTO PARENTESISCERRADO.

parametros = parametro parametrolista.

parametrolista = (COMA parametro parametrolista)?.

parametro = tipos ID

/* estructuras */

```
struct c
{
    let int x, y;
}
```

estructuras = AGRUPACIONESTRUCTURA ID bloquedeclaraciones.

/* interfaces */

```
interface p {
    let int x;
}
```

interfaces = AGRUPACIONINTERFAZ ID bloquedeclaraciones.

/* enums */

```
enum dias = {lunes, miercoles, jueves}
```

enums = AGRUPACIONENUMERATOR ID OPERADORASIGNAMIENTO bloquevalores PUNTOCOMA.


/* declaraciones */

```
int x = 0, y;
```

bloquedeclaraciones = LLAVEABIERTA declaraciones LLAVECERRADA.

declaraciones = declaracion declaracionopcional.

declaracionopcional = (declaracion declaracionopcional)?.

declaracion = DEC tipos listadeclarar PUNTOCOMA.

listadeclarar = declarador listadeclararopcional.

listadeclararopcional = (COMA declarador listadeclararopcional)?.

declarador = ID declaradoropcional.

declaradoropcional = (OPERADORASIGNAMIENTO valor)?.

asignars = ID OPERADORASIGNAMIENTO valor PUNTOCOMA.

/* arreglos */

```
int[2] p = {1,2};
```

declaracionarreglos = tipos CORCHETEABIERTO dimensionesopcional 

CORCHETECERRADO ID asignamientovariables PUNTOCOMA.

asignamientovariables = (OPERADORASIGNAMIENTO listabloques)?.

listabloques = bloquevalores | listabloques COMA bloquevalores.

dimensionesopcional = dimensiones?.

dimensiones = NUMERICO dimensionopcional.

dimensionopcional = (COMA NUMERICO dimensionopcional)?.

/* Listas */

```
List[float] venta;

List[int] compra = {frutas,manzanas,naranjas};
```

declaracionlistas = cuerpolista declaracionlista PUNTOCOMA.

declaracionlista = (OPERADOR ASIGNAMIENTO bloquevalores)?.

cuerpolista = LISTA CORCHETEABIERTO tipos CORCHETECERRADO ID.

/* lambdas */

```
cuadrado = (int x) => (x * x);
```

lambdas = ID OPERADORASIGNAMIENTO lambda PUNTOCOMA.

lambda = bloqueparametros OPERADORRESULTADO cuerpolambda.

cuerpolambda = bloqueexpresiones | bloqueoperaritmetics.

bloqueoperaritmetics = PARENTESISABIERTO operaritmetics PARENTESISCERRADO.

operaritmetics = operaritmetic operaritmeticsopcional.

operaritmeticsopcional = (MAS operaritmetic operaritmeticsopcional 

| MENOS operaritmetic operaritmeticsopcional)?

operaritmetic = idnum operaritmeticopcional.

operaritmeticopcional = (MULTI operaritmetic operaritmeticsopcional 

| DIV operaritmetic operaritmeticsopcional)?

idnum = ID | NUMERICO;

/* ternarios */

```
x = (x<y) ? 1 : 2;
```

ternarios = ID OPERADORASIGNAMIENTO bloquecondiciones OPERADORTERNARIO 

valor PUNTODOBLE valor PUNTOCOMA.

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

selectors = selector selectoropcional.

selectoropcional = LLAVEABIERTA casoopcional defectosopcional LLAVECERRADA.

selector = SELECTOR PARENTESISABIERTO valor PARENTESISCERRADO.

casos = caso casosopcional.

casoopcional = casos?.

casosopcional = (caso casosopcional)?.

caso = CASO valor PUNTODOBLE expresiones retornoalto.

defectosopcional = (defectos defectosopcional)?.

defectos = DEFECTO PUNTODOBLE expresiones retornoalto.

retornoalto = retornos | alto.

alto = PARAR PUNTOCOMA.

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

sis = si sinoshacer sinos.

sinos = sino?.

sinoshacer = (sinohacer sinoshacer)?.

si = SI bloquecondiciones bloqueexpresiones.

sinohacer = SINOHACER bloquecondiciones bloqueexpresiones.

sino = SINO bloqueexpresiones.

bloquecondiciones = PARENTESISABIERTO condiciones PARENTESISCERRADO.

condiciones = condicion condicionopcional.

condicionopcional = (OPERADORCONLOGICO condicionopcional)?.

/* While */

```
while (a<b):
    {
        expresiones;
    }
```

mientras = MIENTRAS bloquecondiciones PUNTODOBLE bloqueexpresiones.

/* dowhile */

```
dow (b>c):
{
    expresiones;
}
```

mientrashacer = HACER bloquecondiciones PUNTODOBLE bloqueexpresiones.

/* For */

```
for (let int = 0; i>>; x>i)
    {
        expresiones;
    }
```

porpuro = POR PARENTESISABIERTO declaracion aumentodecremento condiciones 

PARENTESISCERRADO bloqueexpresiones.

aumentodecremento = ID OPERADORDESPLAZAMIENTO PUNTOCOMA.

/* foreach */

```
foreach (int a in b):
    {
        expresiones;
    }
```

porcadas = PORCADA PARENTESISABIERTO tipos ID PARAMETROENTRADA 

ID PARENTESISCERRADO PUNTODOBLE bloqueexpresiones.

tipos = TIPOCADENA | TIPOINFERIDO | TIPONUMERICO | TIPOCARACTER.

/* try */

```
try { expresiones; }
catch { expresiones; }
finally { expresiones; }
```

intentos = INTENTAR bloqueexpresiones atraparterminar.

atraparterminar = terminars | atrapars terminaropcional.

terminaropcional = terminars?

atrapars = atrapar atraparsopcional.

atraparsopcional = (atrapar atraparsopcional)?.

atrapar = ATRAPAR bloqueexpresiones.

terminars = TERMINAR bloqueexpresiones.

/* imprimir */

```
printo("hola" + a + "b");
```

impresiones = IMPRIMIR PARENTESISABIERTO oraciones PARENTESISCERRADO PUNTOCOMA.

oraciones = valor oracionesopcional.

oracionesopcional = (MAS valor oracionesopcional)?.

/* escanear */

```
scani();
```

escaneos = ESCANEAR PARENTESISABIERTO PARENTESISCERRADO puntocoma.
