/* Inicio */
inicios-> incio inicios | inicio
inicio-> espacios | instrucciones;

instrucciones-> instruccion instrucciones | instruccion
instruccion-> sis | mientras | mientrashacer | porpuro | porcadas | intentos 
| impresiones | escaneos | declaraciones | declaracionarreglos 
| declaracionlistas | lambdas | ternarios | retornos | rompers | asignars 
| funciones | selectors | id_continuacion | enums | estucturas | interfaces 
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

id_continuacion-> OPERADORASIGNAMIENTO lambda PUNTOCOMA 
| OPERADORASIGNAMIENTO condiciones OPERADORTERNIARIO expresiones 
PUNTODOBLE expresiones PUNTOCOMA | OPERADORASIGNAMIENTO valor PUNTOCOMA 
| PUNTOCOMA | operaritmetics

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


