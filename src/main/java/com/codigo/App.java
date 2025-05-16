package com.codigo;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class App {
    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Uso: java -cp [ruta-del-jar] com.codigo.App [archivo]");
            return;
        }

        String filePath = args[0];
        File file = new File(filePath);

        // Validar existencia y acceso al archivo
        if (!file.exists() || !file.canRead()) {
            System.err.println("Error: El archivo '" + filePath + "' no existe o no se puede leer.");
            System.exit(1);
        }

        try (FileReader reader = new FileReader(file)) {
            Lexer lexer = new Lexer(reader);
            Parser parser = new Parser(lexer);
            boolean exito = parser.parseCode();

            if (!exito) {
                System.exit(1);
            }

        } catch (Exception e) { // Captura todas las excepciones
            System.err.println("Error procesando '" + filePath + "': " + e.getMessage());
            System.exit(1);
        }
    }
} 