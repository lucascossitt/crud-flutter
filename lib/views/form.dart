import 'package:crud/models/pessoa.dart';
import 'package:flutter/material.dart';

class FormPessoa extends StatefulWidget {
  const FormPessoa({super.key});

  @override
  State<FormPessoa> createState() => _FormPessoaState();
}

class _FormPessoaState extends State<FormPessoa> {
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerSobrenome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir pessoa'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controllerNome,
                decoration:
                    const InputDecoration(labelText: 'Nome', hintText: 'Lucas'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controllerSobrenome,
                decoration: const InputDecoration(
                    labelText: 'Sobrenome', hintText: 'Cossitt'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: IconButton(
                      icon: const Icon(Icons.save),
                      tooltip: 'Inserir',
                      onPressed: () {
                        final String nome = controllerNome.text;
                        final String sobrenome = controllerSobrenome.text;

                        if (nome.isEmpty || sobrenome.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Preencha todos os campos')));
                        } else {
                          final pessoa = Pessoa(nome, sobrenome);
                          Navigator.pop(context, pessoa);
                        }
                      },
                    ))),
          ],
        ),
      ),
    );
  }
}
