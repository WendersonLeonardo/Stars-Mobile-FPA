import 'package:flutter/material.dart';
import 'package:teste/pag_novo.dart';

import 'funcoes.dart';

class PagScroll extends StatefulWidget {
  const PagScroll({Key? key}) : super(key: key);

  @override
  State<PagScroll> createState() => _PagScrollState();
}

class _PagScrollState extends State<PagScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: SizedBox(
                    child: Image.asset('icone1.jpg'),
                    width: 50,
                    height: 50,
                  ),
                  accountName: const Text('www'),
                  accountEmail: const Text('jklç')),
              const ListTile(
                leading: Icon(Icons.abc),
                title: Text('saaa'),
                subtitle: Text('ssdf'),
              )
            ],
          ),
        ),
        appBar: AppBar(actions: const [Alternador()]),
        body: ListView(
          children: [
            linha(context, 'texto1', 'texto2', Colors.greenAccent,
                const Icon(Icons.castle, size: 50)),
            linha(context, 'saaa', 'ssdf', Colors.redAccent,
                const Icon(Icons.face, size: 50)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add_circle_outline,
              size: 55,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PagNovo()));
            }));
  }
}
