# Installation instructions (and testing)

## Creating the lexer
java -jar lib\jflex-1.9.1.jar --nobak -d src\main\java\com\codigo src\main\jflex\scanner.flex
> After that, you need to add `package com.codigo;` in Lexer.java

## Compiling the app
javac -d build/classes src/main/java/com/codigo/*.java

## Executing the app (test)
java -cp "build\classes" com.codigo.App ".\build\classes\correcto.txt"
