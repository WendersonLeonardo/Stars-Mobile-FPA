import 'package:flutter/material.dart';

class PagNovo extends StatefulWidget {
  const PagNovo({Key? key}) : super(key: key);

  @override
  State<PagNovo> createState() => EstadoPagNovo();
}

class EstadoPagNovo extends State<PagNovo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.amberAccent,
      child: Column(children: [
        Container(
          height: 80,
        ),
        SizedBox(
          height: 80,
          child: foto(),
        ),
        Container(
          height: 80,
        ),
        SizedBox(
          width: 300,
          child: TextField(
            onChanged: (texto) {},
            keyboardType: TextInputType.number,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'mttf',
                prefixIcon: Icon(
                  Icons.av_timer_outlined,
                  color: Colors.grey,
                  size: 40,
                ),
                border: OutlineInputBorder()),
          ),
        ),
      ]),
    ));
  }
}

Widget foto() {
  return const Icon(
    Icons.settings_input_component_rounded,
    size: 50,
  );
}
