import 'dart:convert';

import 'package:city_alert_mobile/controllers/information_controller.dart';
import 'package:flutter/material.dart';

import '../domain/information.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPage();
}

class _InformationPage extends State<InformationPage> {

  late InformationController _informationController;
  Information? _information;

  @override
  void initState() {
    super.initState();
    _informationController = InformationController();
    setInformation();
  }

  setInformation() async {
    final information = await _informationController.findInformation();
    setState(() {
      _information = information;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_information == null) {
      return const Center(child:CircularProgressIndicator());
    } else {
      return ListView(
      children: [ Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Container(
                  width: 30,
                ),
                Text(
                  _information!.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                _information!.imageLink,
                height: 200,
                width: 1000,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  textAlign: TextAlign.justify,
                  _information!.text,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(fontSize: 16,overflow: TextOverflow.fade),
                ),
              ),
            ),
          ),
        ],
      ),
      ],
    );
    }
  }
}
