import 'package:flutter/material.dart';

// A tela de Cadastro será um StatefulWidget para gerenciar o estado dos campos de texto.
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controladores para os compos de texto de nome, email e senha.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Chave global para o formulário, utilizada para validar os campos.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Função que será chamada quando o botão de cadastro for pressionado.
  void _register() {
    // Valida todos os campos do formulário.
    if (_formKey.currentState!.validate()) {
      // Se a validação for bem-sucedida, podemos processar o cadastro.
      // Por enquanto, apenas imprimiremos os valores no console.
      // Em um app real, aqui você faria o registro de usuário com um backend.
      print('Nome: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Senha: ${_passwordController.text}');

      // Para este exemplo inicial, vamos mostrar um SnackBar de sucesso.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );

      // Opcional: Navegar de volta para a tela de login após o cadastro
      // Navigator.pop(context)
    }
  }

  @override
  void dispose() {
    // É importante descartar os controladores quando o widget for removido da árvore para evitar vazamentos de memória.
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro'), centerTitle: true),
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
                  Icons.person_add, // Um ícone para cadastro
                  size: 100,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 40),

                // Campo de Nome
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                    hintText: 'Digite seu nome',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

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
                  obscureText: true, // Esconde o texto da senha
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Crie sua senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, crie sua senha';
                    }
                    if (value.length < 6) {
                      return 'A senha deve conter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Campo de Confirmar Senha
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true, // Esconde o texto da senha
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    hintText: 'Confirme sua senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.lock_reset),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, confirme sua senha';
                    }
                    if (value != _passwordController.text) {
                      return 'As senhas não coincidem';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // Botão de Cadastro
                ElevatedButton(
                  onPressed:
                      _register, // Chama a função _register ao ser pressionado
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10.0),
                    ),
                    backgroundColor: Theme.of(
                      context,
                    ).primaryColor, // Cor de fundo do botão
                    foregroundColor: Colors.white, // Cor do texto do botão
                  ),
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),

                // Opção para "Já tem uma conta? Faça login"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Já tem uma conta?'),
                    TextButton(
                      onPressed: () {
                        // Opcional: Navegar de volta para a tela de login
                        Navigator.pop(
                          context,
                        ); // Volta para a tela anterior (LoginScreen)
                      },
                      child: const Text(
                        'Faça login',
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
