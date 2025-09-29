import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(200),
      child: AppBar(//Appbar de la aplicación
        title: Image.asset('assets/images/rickandmorty.png',height: 50),
        backgroundColor: Colors.black,
      ),
    );
  }
}