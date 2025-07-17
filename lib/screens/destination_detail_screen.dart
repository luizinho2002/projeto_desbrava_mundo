import 'package:flutter/material.dart';
import 'package:desbrava_mundo/models/destination.dart'; // Importa nosso modelo de destino

// 'DestinationDetailsScreen' é um 'StatelessWidget' porque ela apenas exibe os detalhes de um destino que já foi passado para ela; não há estado interno que mude
class DestinationDetailScreen extends StatelessWidget {
  final Destination destination; // O destino que será exibido nesta tela

  // Construtor que recebe o objeto 'destination' como parâmetro
  const DestinationDetailScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name), // O título do AppBar é o nome do destino
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // 'SingleChildScrollView' permite que o conteúdo seja rolado se for muito longo, evitando que o conteúdo seja cortado em telas menores
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinha o conteúdo a esquerda
          children: [
            Hero(
              // 'Hero' cria uma animação de transição suave para a imagem quando se navega entre telas. A 'tag' deve ser única
              tag: destination.name,
              child: Image.asset(
                destination.imageUrl, // Carrega a imagem do destino
                height: 300, // Altura da imagem
                width: double.infinity, // Ocupa toda a largura disponível
                fit: BoxFit.cover, // Garante que a imagem preencha o espaço
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                16.0,
              ), // Preenchimento ao redor do texto
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent, // Cor de destaque para o nome
                    ),
                  ),
                  const SizedBox(height: 10), // Espaçamento vertical
                  Text(
                    destination.description,
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.5,
                    ), // Tamanho da fonte e altura da linha
                    textAlign: TextAlign
                        .justify, // Justifica o texto para melhorar a leitura
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 5),
                      Text(
                        'Localização: Europa',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text('Avaliação: 4.8', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
