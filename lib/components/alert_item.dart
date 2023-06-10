import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../pages/subpage/route_details.dart';

class AlertItem extends StatelessWidget {
  final AlertDetailItemData alert;

  const AlertItem({Key? key, required this.alert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Decodifica a imagem a partir da string base64
    Uint8List imageBytes = base64.decode(alert.photo);
    // Cria uma instância de Image a partir dos bytes da imagem
    Image image = Image.memory(imageBytes);

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          width: 120,
          height: 120,
          child: image,
        ),
      ),
      title: Text(alert.address),
      subtitle: Text(alert.observation),
    );
  }
}