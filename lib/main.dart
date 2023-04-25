import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactsPage(),
    );
  }
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  int numClicados = 0;

  List<Contato> contatos = [
    Contato(name: "gabriel", email:"gabriel@fiap.com.br", clicado: false),
    Contato(name: "beto", email:"beto@fiap.com.br", clicado: false),
    Contato(name: "jorge", email:"jorge@fiap.com.br", clicado: false),
    Contato(name: "jessica", email:"jessica@fiap.com.br", clicado: false),
    Contato(name: "gambeti", email:"gambeti@fiap.com.br", clicado: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Contatos favoritos $numClicados' ),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=$index')),
            title: Text(contatos[index].name),
            subtitle: Text(contatos[index].email),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  if (contatos[index].clicado) {
                    numClicados--;
                  } else {
                    numClicados++;
                  }
                  contatos[index].clicado = !contatos[index].clicado;
                });
              },
              icon: contatos[index].clicado ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}

class Contato {
  String name;
  String email;
  bool clicado;

  Contato({required this.name, required this.email, required this.clicado})
  ;}