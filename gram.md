/* Inicio */
inicios-> incio inicios | inicio
inicio-> espacios | instrucciones;

instrucciones-> instruccion instrucciones | instruccion
instruccion-> sis | mientras | mientrashacer | porpuro | porcadas | intentos 
| impresiones | escaneos | declaraciones | declaracionarreglos 
| declaracionlistas | lambdas | ternarios | retornos | rompers | asignars 
| funciones | selectors | enums | estucturas | interfaces 
| LLAVEABIERTA instrucciones LLAVECERRADA | ERRORL PUNTOCOMA

expresiones-> expresion expresiones | expresion
expresion-> sis | mientras | mientrashacer | porpuro | porcadas | intentos 
| impresiones | escaneos | declaraciones | declaracionarreglos 
| declaracionlistas | lambdas | ternarios | retornos | rompers 
| asignars | selectors

condiciones-> condicion OPERADORCONLOGICO condiciones | condicion
condicion-> valor OPERADORRELACIONAL valor

parametros-> parametrolista?
parametroslista-> parametro | parametrolista COMA parametro
parametro-> tipos ID

bloqueexpresiones-> LLAVEABIERTA expresiones LLAVECERRADA

/* espacios */

espacios-> espacio espacios | espacio
espacio-> AGRUPACIONPRINCIPAL ID LLAVEABIERTA libreriasopcional declaracionesopcional clasesopcional LLAVECERRADA
clasesopcional-> clases?
libreriasopcional-> librerias?
declaracionesopcional-> declaraciones?

/* librerias */

librerias-> libreria librerias | libreria
libreria-> GESTIONRECURSOS ID PUNTOCOMA

/* clase */

clases-> clase clases | clase
clase-> modificadoresacceso AGRUPACIONSECUNDARIA ID LLAVEABIERTA miembrosclase LLAVECERRADA
modificadoresacceso-> MODIFICADORACCESO?
miembrosclase-> (declaraciones | enums | funciones | estructuras | interfaces)?

/* funcion */ //pendientecorreccion

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

estructuras-> AGRUPACIONESTRUCTURA ID bloqueestructura
bloqueestructura-> LLAVEABIERTA declaraciones LLAVECERRADA

/* enums */ //

enums-> AGRUPACIONENUMERATOR ID LLAVEABIERTA valores LLAVECERRADA PUNTOCOMA

/* interfaz */ //

interfaces-> AGRUPACIONINTERFAZ ID LLAVEABIERTA declaraciones LLAVECERRADA

/* declaracion */ //

declaraciones-> declaracion declaraciones | declaracion
declaracion-> declarar PUNTOCOMA | declarar asignars
declarar-> DEC tipos ID
asignars-> ID OPERADORASIGNAMIENTO valor PUNTOCOMA

/* Switch */ //funciona

selectors-> selector casos defectos | selector defectos | selector casos
selector-> SELECTOR PARENTESISABIERTO valor PARENTESISCERRADO
casos-> caso casos | caso
caso-> CASO valor PUNTODOBLE bloqueswitch
defectos-> CASO valor PUNTODOBLE bloqueswitch
retornoalto-> retornos | alto
alto-> PARAR PUNTOCOMA
bloqueswitch-> LLAVEABIERTA expresiones retornoalto LLAVECERRADA

/* If */ //funciona

sis-> si sinoshacer sinos
sinos-> sino?
sinoshacer-> (sinohacer sinoshacer)?
si-> SI bloquecondiciones bloqueexpresiones
sinohacer-> SINOHACER bloquecondiciones bloqueexpresiones
sino-> SINO bloqueexpresiones

bloquecondiciones-> PARENTESISABIERTO condiciones PARENTESISCERRADO

/* While */ //funciona

mientras-> MIENTRAS bloquecondiciones bloqueexpresiones

/* For */ //

porpuro-> POR PARENTESISABIERTO declaracion 
aumentodecremento condiciones PARENTESISCERRADO bloqueexpresiones
aumentodecremento-> ID OPERADORDESPLAZAMIENTO PUNTOCOMA

/* foreach */ //funciona

porcadas-> PORCADA PARENTESISABIERTO tipos ID PARAMETROENTRADA ID PARENTESISCERRADO
PUNTODOBLE bloqueexpresiones
tipos-> TIPOCADENA | TIPOINFERIDO | TIPONUMERICO | TIPOCARACTER

/* try */ //funciona

intentos-> INTENTAR bloqueexpresiones atraparterminar
atraparterminar-> atrapars terminars | atrapars | terminars
atrapars-> atrapar atrapars | atrapar
atrapar-> ATRAPAR bloqueexpresiones
terminars-> TERMINAR bloqueexpresiones

/* imprimir */ //funciona

impresiones-> IMPRIMIR PARENTESISABIERTO oraciones PARENTESISCERRADO PUNTOCOMA
oraciones-> valor | oraciones MAS valor

/* escanear */ //funciona

escaneos-> ESCANEAR PARENTESISABIERTO PARENTESISCERRADO PUNTOCOMA

/* arreglo */ //funciona


