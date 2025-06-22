// lib/api/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/clan_model.dart'; // Importando nosso modelo

class ApiService {
  Future<List<Clan>> fetchClans() async {
    final response = await http.get(Uri.parse('https://dattebayo-api.onrender.com/clans'));
    await Future.delayed(const Duration(seconds: 1));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body)['clans'];
      return body.map((dynamic item) => Clan.fromJson(item)).toList();
    } else {
      throw Exception('Falha ao carregar os clãs');
    }
  }
}