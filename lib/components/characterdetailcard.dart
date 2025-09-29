import 'package:flutter/material.dart';

class CharacterDetailCard extends StatelessWidget {
  final Map<String, dynamic> character;

  const CharacterDetailCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(character['image'] ?? '', height: 200),
            const SizedBox(height: 16),
            Text(character['name'] ?? 'Unknown', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Status: ${character['status'] ?? 'Unknown'}'),
            Text('Species: ${character['species'] ?? 'Unknown'}'),
            Text('Gender: ${character['gender'] ?? 'Unknown'}'),
            Text('Origin: ${character['origin']?['name'] ?? 'Unknown'}'),
            Text('Location: ${character['location']?['name'] ?? 'Unknown'}'),
          ],
        ),
      ),
    );
  }
}