import 'package:flutter/material.dart';

import '../../domain/dto/alert_form.dart';

class FormAlert extends StatefulWidget {
  const FormAlert({Key? key}) : super(key: key);

  @override
  State<FormAlert> createState() => _FormAlert();
}

class _FormAlert extends State<FormAlert> {

  final _formKey = GlobalKey<FormState>();
  String selectedType = 'Lixo';
  TextEditingController observationController = TextEditingController();
  List<String> types = ['Lixo', 'Lugar sujo', 'Vidro quebrado', 'Dejetos de animais'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        shadowColor: Colors.black,
        elevation: 4,
        backgroundColor: Colors.indigo,
        titleSpacing: 0,
        title: const Text(
          "Cadastro de alerta",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: selectedType,
                onChanged: (newValue) {
                  setState(() {
                    selectedType = newValue!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Selecione a categoria',
                ),
                items: types.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: observationController,
                decoration: const InputDecoration(
                    labelText: 'Observação',
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
                        Navigator.pop(context, AlertForm(selectedType, observationController.text));
                      }
                    },
                    child: const Text('Registrar alerta'),
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