import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teste/pag_novo.dart';

import 'funcoes.dart';

class PagScroll extends StatefulWidget {
  const PagScroll({Key? key}) : super(key: key);

  @override
  State<PagScroll> createState() => _PagScrollState();
}

class _PagScrollState extends State<PagScroll> {
  bool _isEqpMode = false;

  final Stream<QuerySnapshot> epqStream = FirebaseFirestore.instance
      .collection('usuarios')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('equipamentos')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: epqStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            chamarAviso(context, '', 'Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          if (storedocs.isEmpty) {
            _isEqpMode = true;
          }

          return Scaffold(
              appBar: AppBar(
                title: const Text('Equipamentos'),
                backgroundColor: const Color.fromARGB(255, 69, 170, 121),
              ),
              backgroundColor: const Color.fromARGB(255, 170, 243, 215),
              body: _isEqpMode
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/sad.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Não existem equipamentos cadastrados\n \n Clique no botão + para cadastrar um novo",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : ListView(
                      children: <Widget>[
                        for (var i = 0; i < storedocs.length; i++) ...[
                          linha(
                              context,
                              storedocs[i]['id'],
                              storedocs[i]['nome'],
                              storedocs[i]['tipo'],
                              Colors.greenAccent,
                              const Icon(
                                Icons.settings_input_component_rounded,
                                size: 55,
                              )),
                          /*Card(
                            elevation: 10,
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () {
                                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>InfoTanque( id: storedocs[i]['id'])));

                                /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfoTanque(
                                id: storedocs[i]['id']),
                          ),
                        );*/
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const AspectRatio(
                                      aspectRatio: 20.0 / 11.0,
                                      child: Icon(
                                        Icons.settings_input_component_rounded,
                                        size: 65,
                                      )
                                      //Image.asset('assets/images/tanque.png'),
                                      ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16.0, 0.0, 16.0, 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          storedocs[i]['nome'],
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(storedocs[i]['tipo'])
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),*/
                        ],
                      ],
                    ),
              floatingActionButton: FloatingActionButton(
                  child: const Icon(
                    Icons.add_circle_outline,
                    size: 55,
                    color: Color.fromARGB(255, 170, 243, 215),
                  ),
                  backgroundColor: const Color.fromARGB(255, 69, 170, 121),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PagNovo()));
                  }));
        });
  }
}
