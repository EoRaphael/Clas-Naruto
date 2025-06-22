// lib/screens/clan_list_screen.dart

import 'package:flutter/material.dart';
import '../api/api_service.dart';
import '../models/clan_model.dart';
import '../widgets/error_display.dart'; // Importando nosso widget de erro

class ClanListScreen extends StatefulWidget {
  const ClanListScreen({super.key});

  @override
  ClanListScreenState createState() => ClanListScreenState();
}

class ClanListScreenState extends State<ClanListScreen> {
  late Future<List<Clan>> futureClans;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureClans = apiService.fetchClans();
  }

  void _retryFetch() {
    setState(() {
      futureClans = apiService.fetchClans();
    });
  }

  void _showClanDetails(BuildContext context, Clan clan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(clan.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                _buildDetailRow('ID do Clã', clan.id),
                _buildDetailRow('Total de Personagens', clan.characters.length.toString()),
                _buildDetailRow('IDs dos Personagens', clan.characters.isEmpty ? 'Nenhum' : clan.characters.join(', ')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15),
          children: [
            TextSpan(
              text: '$title: ',
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orangeAccent),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clãs de Naruto', style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<List<Clan>>(
        future: futureClans,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return ErrorDisplay(
              message: 'Não foi possível conectar à API. Verifique sua conexão ou tente novamente mais tarde.',
              onRetry: _retryFetch,
            );
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final clans = snapshot.data!;
            return ListView.builder(
              itemCount: clans.length,
              itemBuilder: (context, index) {
                final clan = clans[index];
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: const Icon(Icons.shield_moon_outlined, color: Colors.orangeAccent, size: 30),
                    title: Text(clan.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${clan.characters.length} personagem(ns)'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => _showClanDetails(context, clan),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('Nenhum clã encontrado.'));
        },
      ),
    );
  }
}