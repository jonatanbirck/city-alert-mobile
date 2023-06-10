import 'dart:convert';

import 'package:http/http.dart' as http;

import '../domain/information.dart';

class InformationController {

  Future<Information> findInformation() async {
      final response = await http.get(Uri.parse('http://192.168.2.103:8080/api/informations'));

      if (response.statusCode == 200) {
        return Information.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        throw Exception('Falha ao buscar dados da API');
      }
  }

}