import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Atribui a chave ao formulário
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Ícone ou Logo do app (opcional)
                Icon(
                  Icons.travel_explore, // Um ícone de viagem
                  size: 100,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 40),

                // Campo de Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Digite seu email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    if (!value.contains('@')) {
                      return 'Email inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Campo de Senha
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.lock),
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

                // Botão de Login
                ElevatedButton(
                  onPressed: _login, // Chama a função _login ao ser pressionado
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Theme.of(
                      context,
                    ).primaryColor, // Cor de fundo do botão
                    foregroundColor: Colors.white, // Cor do texto do botão
                  ),
                  child: const Text('Entrar', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20),

                // Opção para "Esqueceu a senha?" (opcional)
                TextButton(
                  onPressed: () {
                    // Implementar navegação para tela de recuperação de senha
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Funcionalidade de recuperação de senha em breve!',
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                const SizedBox(height: 10),

                // Opção para "Nõo tem uma conta? Cadastre-se"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não tem uma conta?'),
                    TextButton(
                      onPressed: () {
                        // Implementar navegação para tela de cadastro
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Navegar para a tela de cadastro!'),
                          ),
                        );
                      },
                      child: const Text(
                        'Cadastre-se',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
