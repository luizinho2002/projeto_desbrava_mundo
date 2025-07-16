import 'package:flutter/material.dart'; // Importação necesária para tipos como String, etc.

// Esta classe representa a estrutura de um destino de viagem
// Ela é um "modelo" que define quais dados um destino terá
class Destination {
  final String name; // O nome do destino (ex: "Paris", "Toquio")
  final String description; // Uma breve descrição sobre o destino
  final String imageUrl; // A URL da imagem do destino

  // Construtor da classe Destination
  // O 'required' significa que esses campos são obrigatórios ao criar um novo Destination.
  Destination({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}