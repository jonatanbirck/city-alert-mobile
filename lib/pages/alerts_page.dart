import 'package:flutter/material.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({Key? key}) : super(key: key);

  @override
  State<AlertsPage> createState() => _AlertsPage();
}

class _AlertsPage extends State<AlertsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Alerts"),
    );
  }
}
