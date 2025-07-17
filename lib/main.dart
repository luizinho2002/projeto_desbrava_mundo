import 'package:desbrava_mundo/screens/login_screen.dart';
import 'package:desbrava_mundo/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:desbrava_mundo/models/destination.dart'; // Importa nosso modelo de destino
import 'package:desbrava_mundo/screens/destination_list_screen.dart'; // Importa a tela de lista de destinos

// A função 'main' é o ponto de entrada de todo aplicativo Flutter.
void main() {
  // 'runApp' inicia o aplicativo, recebendo o widget raiz.
  runApp(const MyApp());
}

// 'MyApp' é o widget raiz do nosso aplicativo
// Ele é um 'StatelessWidget' porque não precisa gerenciar estados internos que mudam.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 'MaterialApp' é um widget que implementa o Material Design.
    // Ele fornece a estrutura básica para um aplicativo visualmente rico.
    return MaterialApp(
      title:
          'Meu App de Viagens', // Título que aparece na barra de tarefas do Android, por exemplo
      theme: ThemeData(
        primarySwatch:
            Colors.blue, // Define a cor primária do aplicativo (azul)
        visualDensity: VisualDensity
            .adaptivePlatformDensity, // Ajusta a densidade visual para diferentes plataformas
        fontFamily: 'Inter', // Define a fonte padrão para todo o aplicativo
      ),
      // 'home' define a tela inicial que será exibida quando o aplicativo for iniciado.
      home: LoginScreen(),
      // NOVO: Remove a faixa "DEBUG" no canto superior direito
      debugShowCheckedModeBanner: false,
    );
  }
}
