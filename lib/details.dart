import 'package:carvel_maquinaria_assesment/components/header.dart';
import 'package:flutter/material.dart';
import 'package:carvel_maquinaria_assesment/components/characterdetailcard.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Map<String, dynamic> character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character['name'] ?? 'Character Details')),
      backgroundColor: const Color.fromARGB(255, 111, 186, 211),
      body: Column(
        children: [
          const Header(),
          CharacterDetailCard(character: character),
        ],
      ),
    );
  }
}