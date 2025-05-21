# Installation instructions (and testing)
## Windows

## Creating the lexer
java -jar lib\jflex-1.9.1.jar --nobak -d src\main\java\com\codigo src\main\base\scanner.flex

## Creating the parser
java -jar lib\cup-11b.jar -destdir src\main\java\com\codigo -parser Parser src\main\base\parser.cup

### maybe need to expect more

java -jar lib\cup-11b.jar -destdir src\main\java\com\codigo -parser Parser -expect 100 src\main\base\parser.cup

## Compiling the app
javac -cp "lib\cup-11b-runtime.jar" -d build\classes src\main\java\com\codigo\\*.java

## Executing the app (test)
java -cp "build\classes;lib\cup-11b-runtime.jar" com.codigo.App ".\build\classes\sintacticocorrecto.txt"

# Installation instructions (and testing)
## Linux

## Creating the lexer
java -jar lib/jflex-1.9.1.jar --nobak -d src/main/java/com/codigo src/main/base/scanner.flex

## Creating the parser
java -jar lib/cup-11b.jar -destdir src/main/java/com/codigo -parser Parser src/main/base/parser.cup

### maybe need to expect more

java -jar lib/cup-11b.jar -destdir src/main/java/com/codigo -parser Parser -expect 100 src/main/base/parser.cup

## Compiling the app
javac -cp "lib/cup-11b-runtime.jar" -d build/classes src/main/java/com/codigo/*.java

## Executing the app (test)
java -cp "build/classes;lib/cup-11b-runtime.jar" com.codigo.App "./build/classes/sintacticocorrecto.txt"
