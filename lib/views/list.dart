import 'package:crud/models/pessoa.dart';
import 'package:crud/views/form.dart';
import 'package:flutter/material.dart';

class ListPessoas extends StatefulWidget {
  final List<Pessoa> _pessoas = [];

  ListPessoas({super.key});

  @override
  State<ListPessoas> createState() => _ListPessoaState();
}

class _ListPessoaState extends State<ListPessoas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            const Text('Listagem de pessoas'),
            const SizedBox(width: 8),
            Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: 'Adicionar pessoa',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const FormPessoa();
                    })).then((pessoa) => {
                          if (pessoa != null)
                            {
                              setState(() {
                                widget._pessoas.add(pessoa);
                              })
                            }
                        });
                  },
                ))
          ],
        )),
        body: ListView.builder(
          itemCount: widget._pessoas.length,
          itemBuilder: (context, index) {
            final pessoa = widget._pessoas[index];
            return CardPessoa(pessoa);
          },
        ));
  }
}

class CardPessoa extends StatelessWidget {
  final Pessoa _pessoa;

  const CardPessoa(this._pessoa, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_pessoa.nome),
        subtitle: Text(_pessoa.sobrenome),
      ),
    );
  }
}
