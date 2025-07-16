import 'package:flutter/material.dart';
import 'package:desbrava_mundo/models/destination.dart'; // Importa nosso modelo de destino
import 'package:desbrava_mundo/screens/destination_detail_screen.dart'; // Importa a tela de detalhes

// 'DestinationDetailScreen' é um 'StatefulWidget' porque a lista de destinos em si não muda de estado dentro desta tela (os dados são mockados).
class DestinationListScreen extends StatefulWidget {
  const DestinationListScreen({super.key});

  @override
  State<DestinoListScreen> createScreen() => _DestinationListScreenState();
}

class _DestinationListScreenState extends State<DestinationListScreen> {
  // Dados mockados (de exemplo) para os destinos.
  // Em um app real, estes dados viriam de uma API ou banco de dados.
  final List<Destination> destinations = [
    Destination(
      name: 'Paris',
      description:
          'A cidade do amor, com a Torre Eiffel e o Museu do Louvre. Explore a rica história e a cultura vibrante de Paris, desfrutando de sua culinária e arte.',
      imageUrl:
          'https://placehold.co/600x400/FF5733/FFFFFF?text=Paris', // Imagem de placeholder para Paris
    ),
    Destination(
      name: 'Toquio',
      description:
          'Uma metrópole vibrante que mistura tradição e tecnologia. Descubra os templos antigos e os arranha-céus futuristas, além da culinária única.',
      imageUrl:
          'https://placehold.co/600x400/33FF57/FFFFFF?text=Toquio', // Imagem de placeholder para Tóquio
    ),
    Destination(
      name: 'Rio de Janeiro',
      description:
          'Praias deslumbrantes, samba e o Cristo Redentor. Viva a energia contagiante da cidade maravilhosa, com suas paisagens naturais e festas.',
      imageUrl:
          'https://placehold.co/600x400/3357FF/FFFFFF?text=Rio', // Imagem de placeholder para o Rio
    ),
    Destination(
      name: 'Roma',
      description:
          'História milenar, Coliseu e culinária deliciosa. Caminhe pelas ruas que testemunharam impérios e saboreie e autêntica cozinha italiana',
      imageUrl:
          'https://placehold.co/600x400/FFFF33/000000?text=Roma', // Imagem de placeholder para Roma
    ),
    Destination(
      name: 'Nova York',
      description:
          'A cidade que nunca dorme, com a Estátua da Liberdade, Times Square e Central Park. Uma mistura de culturas e oportunidades',
      imageUrl:
          'https://placehold.co/600x400/8A2BE2/FFFFFF?text=Nova+York', // Imagem de placeholder para Nova York
    ),
    Destination(
      name: 'Sydney',
      description:
          'Famosa pela Opera House, Harbour Bridge e suas belas praias. Desfrute do estilo de vida descontraído e da natureza exuberante.',
      imageUrl:
          'https://placehold.co/600x400/FFD700/000000?text=Sydney', // Imagem de placeholder para Sydney
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 'Scaffold' fornece a estrutura visual básica da tela (AppBar, Body, etc.).
      appBar: AppBar(
        title: const Text('Destinos de Viagem'), // Título na barra superior
        centerTitle: true, // Centraliza o título
      ),
      body: ListView.builder(
        // 'ListView' é eficiente para construir listas longas, pois renderiza apenas os itens visíveis na tela.
        itemCount: destinations.length, // O número total de itens na lista
        itemBuilder: (context, index) {
          // 'itemBuilder' é chamado para construir cada item da lista.
          final destination = destinations[index]; // Pega o destino atual

          return Card(
            margin: const EdgeInsets.all(8.0), // Margem externa do card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15.0,
              ), // Bordas arredondadas para o card
            ),
            elevation: 5, // Sombra abaixo do card para dar profundidade
            child: InkWell(
              // 'InkWell' torna o card clicável e adiciona um efeito visual ao toque.
              onTop: () {
                // Quando o card é clicado, navegamos para a tela de detalhos do destino.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DestinationDetailScreen(destination: destination),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ), // Preenchimento interno do card
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Alinha o conteúdo à esquerda
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ), // Bordas arredondadas para a imagem
                      child: Image.network(
                        destination.imageUrl, // Carrega a imagem da URL
                        height: 200, // Altura fixa da imagem
                        width:
                            double.infinity, // Ocupa toda a largura disponível
                        fit: BoxFit
                            .cover, // Garante que a imagem preencha o espaço sem distorção
                        errorBuilder: (context, error, stackTrace) {
                          // 'errorBuilder' é chamado se a imagem não puder ser carregada.
                          // Exibe uma imagem de fallback.
                          return Image.network(
                            'https://placehold.co/600x400/CCCCCC/000000?text=Imagem+Nao+Disponivel',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10), // Espaçamento vertical
                    Text(
                      destination.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold, // Texto em negrito
                      ),
                    ),
                    const SizedBox(height: 5), // Espaçamento vertical
                    Text(
                      destination.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ), // Cor do teto mais clara
                      maxLines: 2, // Limita a descrição a duas linhas
                      overflow: TextOverflow
                          .ellipsis, // Adiciona "..." se o texto for muito longo
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ), //
    );
  }
}
