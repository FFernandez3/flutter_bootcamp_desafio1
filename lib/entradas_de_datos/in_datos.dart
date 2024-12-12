import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mi_primer_app/entradas_de_datos/widgets/my_checkbox_widget.dart';

class InDatos extends StatefulWidget {
  const InDatos({super.key});

  @override
  State<InDatos> createState() => _InDatosState();
}

class _InDatosState extends State<InDatos> {
  bool _checkValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de Datos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // const TextField(
            //   decoration: InputDecoration(
            //     labelText: "Nombre",
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            MyCheckbox(
              onChanged: (bool? value) {
                setState(() {
                  _checkValue = value!;
                });
              },
              checkValue: _checkValue,
            ),
            // Radio<int>(
            //   value: 1,
            //   groupValue: 1,
            //   onChanged: (int? value) {},
            // ),
            // Radio<int>(
            //   value: 2,
            //   groupValue: 1,
            //   onChanged: (int? value) {},
            // ),
            // Switch(
            //   value: true,
            //   onChanged: (bool value) {},
            // ),

            ElevatedButton(
              onPressed: () {
                log(_checkValue.toString());
              },
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
