import 'package:flutter/material.dart';
import 'package:carvel_maquinaria_assesment/details.dart';

class CharacterCard extends StatelessWidget {
  final Map<String, dynamic> character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(character['image']),
          radius: 30,
        ),
        title: Text(character['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CharacterDetailScreen(character: character),
            ),
          );
        }
      ),
    );
  }
}