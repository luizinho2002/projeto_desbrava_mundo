import 'package:flutter/material.dart';
import 'package:desbrava_mundo/screens/destination_list_screen.dart';
import 'package:desbrava_mundo/screens/register_screen.dart';

// A tela de Login será um StatefulWidget para gerenciar o estado dos campos de texto.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores para os campos de texto de email e senha.
  // Eles nos permitem ler e manipular o texto inserido pelo usuário.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Chave global para o formulário, utilizada para validar os campos.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Função que será chamada quando o botão de login for pressionado.
  void _login() {
    // Valida todos os campos do formulário.
    if (_formKey.currentState!.validate()) {
      // Se a validação for bem-sucedida, podemos processar o login.
      // Por enquanto, apenas imprimiremos os valores no console.
      // Em um app real, aqui você faria a autenticação com um backend.
      print('Email: ${_emailController.text}');
      print('Senha: ${_passwordController.text}');

      // Exemplo de como você poderia navegar para outra tela após o login bem-sucedido.
      // Por exemplo, para a tela de lista de destinos.
      // Navaigator.pushReplacemente(
      //  context,
      //  MaterialPageRoute(builder: (context) => DestinationListScreen()),
      // );

      // Para este exemplo inicial, vamos mostrar um SnackBar de sucesso.
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login bem-sucedido!')));

      // Exemplo de como você poderia navegar para a tela de lista de destinos após o login.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DestinationListScreen()),
      );
    }
  }

  @override
  void dispose() {
    // É importante descartar os controladores quando o widget for removido da árvore para evitar vazamentos de memória.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removendo o AppBar para um design mais imersivo na tela de login
      // appBar: AppBar(
      //   title: const Text('Login'),
      //   centerTitle: true,
      // ),
      body: Container(
        // Fundo com gradiente para um visual mais dinâmico
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF64B5F6), // Azul claro
              Color(0xFF42A5F5), // Azul primário
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0), // Aumentando o padding geral
            child: Card(
              // Utilizando Card para agrupar o formulário com estilo
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10, // Sombra mais pronunciada
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(
                  20.0,
                ), // Bordas mais arredondadas
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0), // Padding interno do Card
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // Ocupa o mínimo de espaço vertical
                    children: [
                      // Ícone ou Logo do Aplicativo
                      ClipRRect(
                        // Utilizando ClipRRect para arredondar as bordas da imagem
                        borderRadius: BorderRadiusGeometry.circular(
                          20.0,
                        ), // Ajuste conforme o formato da sua imagem
                        child: Image.asset(
                          'assets/images/icone_app.jpg',
                          height: 150,
                          width: 150,
                          fit: BoxFit
                              .cover, // Para garantir que a imagem preencha o espaço
                        ),
                      ),
                      const SizedBox(height: 30), // Espaçamento

                      Text(
                        'Bem-vindo ao Desbrava Mundo!',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),

                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'seuemail@exemplo.com',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return 'Email inválido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          hintText: '••••••••',
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          if (value.length < 6) {
                            return 'A senha deve conter pelo menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4CAF50), // Verde mais claro
                              Color(0xFF388E3C), // Verde mais escuro
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 4), // Sombra para o botão
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .transparent, // Transparente para mostrar o gradiente
                            shadowColor: Colors
                                .transparent, // Sem sombra padrão do ElevatedButton
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(12.0),
                            ),
                            minimumSize: const Size(
                              double.infinity,
                              50,
                            ), // Ocupa largura total
                          ),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Funcionalidade de recuperação de senha em breve!',
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Não tem uma conta?',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Navegar para a tela de cadastro!',
                                  ),
                                ),
                              );
                              // Navegação para a tela de cadastro
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Cadastre-se',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
