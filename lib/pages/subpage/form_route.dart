import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/dto/route_form.dart';

class FormRoute extends StatefulWidget {
  const FormRoute({Key? key}) : super(key: key);

  @override
  State<FormRoute> createState() => _FormRoute();
}

class _FormRoute extends State<FormRoute> {

  final _formKey = GlobalKey<FormState>();
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        shadowColor: Colors.black,
        elevation: 4,
        backgroundColor: Colors.blue,
        titleSpacing: 0,
        title: const Text(
          "Cadastro de rota",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _textFieldController,
                decoration: const InputDecoration(
                    labelText: 'Nome da Rota',
                    contentPadding: EdgeInsets.only(top: 1)
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o nome da rota.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 26.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context, RouteForm(_textFieldController.text));
                      }
                    },
                    child: const Text('Iniciar Rota'),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38,
                    ),
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}