package com.codigo;

import java.io.FileReader;
import java.io.IOException;

public class App {
    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Uso: java -cp [ruta-del-jar] com.codigo.App [archivo]");
            return;
        }

        String filePath = args[0];
        
        try (FileReader reader = new FileReader(filePath)) {
            Lexer lexer = new Lexer(reader);
            
            // Procesar todos los tokens
            while (lexer.yylex() != null) {}

            // Imprimir resultados
            for (Lexer.Token token : lexer.getTokens()) {
                System.out.println("Token: " + token.token + " | Valor: " + token.valor);
            }
        } catch (IOException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }
}
