import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/dto/route_form.dart';
import '../../domain/route.dart';

class RouteDetails extends StatefulWidget {
  final RouteApp route;
  const RouteDetails({Key? key, required this.route}) : super(key: key);


  @override
  State<RouteDetails> createState() => _RouteDetails();
}

class _RouteDetails extends State<RouteDetails> {

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
        backgroundColor: Colors.indigo,
        titleSpacing: 0,
        title: Text(
          "Detalhes de ${widget.route.name}",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Text("Name: ${widget.route.name}"),
          Text("AlertsId: ${widget.route.alerts}"),
          Text("Positions: ${widget.route.positions}"),
          Text("StartPosition: ${widget.route.startPosition}"),
          Text("EndPosition: ${widget.route.endPosition}"),
        ],
      ),
    );
  }
}