@echo off
mkdir build\classes 2> nul

echo Generando el lexer...
java -jar lib\jflex-1.9.1.jar --nobak -d src\main\java\com\codigo src\main\base\scanner.flex

echo Generando el parser...
java -jar lib\cup-11b.jar -destdir src\main\java\com\codigo -parser Parser src\main\base\parser.cup

echo Compilando las clases...
javac -cp "lib\cup-11b-runtime.jar" -d build\classes src\main\java\com\codigo\*.java

echo.
echo Build completado. Ejecutar con:
echo java -cp "build\classes;lib\cup-11b-runtime.jar" com.codigo.App ".\build\classes\sintacticocorrecto.txt"
echo.
