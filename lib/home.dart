import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:teste/pag_login.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _HomeState();
}

class _HomeState extends State<Home1> {
  Future<FirebaseApp> _initializeFireBase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFireBase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const PagLogin();
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
